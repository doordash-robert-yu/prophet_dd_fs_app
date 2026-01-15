"""
Prophet Forecast Web Application
A user-friendly web interface for generating Prophet forecasts from CSV files.
"""

import streamlit as st
import pandas as pd
import numpy as np
from datetime import datetime
import io

# Check if Prophet is installed
try:
    from prophet import Prophet
    from prophet.plot import plot_plotly, plot_components_plotly
    PROPHET_AVAILABLE = True
except ImportError:
    PROPHET_AVAILABLE = False
    st.error("""
    ❌ **Prophet is not installed!**
    
    Please install Prophet and its dependencies:
    ```bash
    pip install prophet cmdstanpy
    ```
    
    For more information, see the README_prophet_app.md file.
    """)
    st.stop()

import plotly.graph_objects as go

# Page configuration
st.set_page_config(
    page_title="Prophet Forecast Generator",
    page_icon="📈",
    layout="wide",
    initial_sidebar_state="expanded"
)

# Title and description
st.title("📈 Prophet Forecast Generator")
st.markdown("""
Upload your CSV file with date and value columns to generate Prophet forecasts.
Your CSV should have two columns: **ds** (date) and **y** (value).
""")

# Sidebar for configuration
st.sidebar.header("⚙️ Model Configuration")

# File upload
uploaded_file = st.file_uploader(
    "Upload your CSV file",
    type=['csv'],
    help="CSV file must contain 'ds' (date) and 'y' (value) columns"
)

# Initialize session state
if 'forecast_df' not in st.session_state:
    st.session_state.forecast_df = None
if 'model' not in st.session_state:
    st.session_state.model = None
if 'data_df' not in st.session_state:
    st.session_state.data_df = None

def validate_csv(df):
    """Validate that CSV has required columns."""
    required_cols = ['ds', 'y']
    missing_cols = [col for col in required_cols if col not in df.columns]
    if missing_cols:
        return False, f"Missing required columns: {', '.join(missing_cols)}"
    
    # Check if ds is datetime-like
    try:
        pd.to_datetime(df['ds'])
    except:
        return False, "Column 'ds' must contain valid dates"
    
    # Check if y is numeric
    if not pd.api.types.is_numeric_dtype(df['y']):
        return False, "Column 'y' must contain numeric values"
    
    return True, "Valid"

def prepare_data(df):
    """Prepare data for Prophet."""
    df = df.copy()
    df['ds'] = pd.to_datetime(df['ds'])
    df = df[['ds', 'y']].dropna()
    df = df.sort_values('ds').reset_index(drop=True)
    return df

if uploaded_file is not None:
    # Read CSV
    try:
        data_df = pd.read_csv(uploaded_file)
        st.session_state.data_df = data_df
        
        # Show data preview
        st.subheader("📊 Data Preview")
        st.dataframe(data_df.head(10), use_container_width=True)
        st.info(f"Total rows: {len(data_df)}")
        
        # Validate data
        is_valid, message = validate_csv(data_df)
        if not is_valid:
            st.error(f"❌ {message}")
            st.stop()
        else:
            st.success(f"✅ {message}")
        
        # Prepare data
        prepared_df = prepare_data(data_df)
        
        # Model configuration in sidebar
        st.sidebar.subheader("Seasonality Settings")
        seasonality_mode = st.sidebar.selectbox(
            "Seasonality Mode",
            ['additive', 'multiplicative'],
            help="Additive: constant seasonal fluctuations. Multiplicative: seasonal fluctuations grow with level."
        )
        
        daily_seasonality = st.sidebar.checkbox("Daily Seasonality", value=False)
        weekly_seasonality = st.sidebar.checkbox("Weekly Seasonality", value=True)
        yearly_seasonality = st.sidebar.checkbox("Yearly Seasonality", value=True)
        
        # Holidays configuration
        st.sidebar.subheader("Holidays")
        use_us_holidays = st.sidebar.checkbox("Include US Holidays", value=True)
        
        use_custom_holidays = st.sidebar.checkbox("Upload Custom Holidays CSV", value=False)
        custom_holidays_file = None
        if use_custom_holidays:
            custom_holidays_file = st.sidebar.file_uploader(
                "Upload Holidays CSV",
                type=['csv'],
                help="CSV with 'ds' (date) and optionally 'holiday' (name) columns"
            )
        
        # Forecast settings
        st.sidebar.subheader("Forecast Settings")
        forecast_periods = st.sidebar.number_input(
            "Forecast Periods",
            min_value=1,
            max_value=3650,
            value=365,
            help="Number of periods to forecast"
        )
        
        forecast_freq = st.sidebar.selectbox(
            "Forecast Frequency",
            ['D', 'W', 'M', 'Q', 'Y'],
            index=0,
            help="D=daily, W=weekly, M=monthly, Q=quarterly, Y=yearly"
        )
        
        # Advanced options (collapsible)
        with st.sidebar.expander("Advanced Options"):
            changepoint_prior_scale = st.slider(
                "Changepoint Prior Scale",
                min_value=0.001,
                max_value=0.5,
                value=0.05,
                step=0.001,
                help="Flexibility of trend changes"
            )
            
            seasonality_prior_scale = st.slider(
                "Seasonality Prior Scale",
                min_value=0.01,
                max_value=10.0,
                value=10.0,
                step=0.1,
                help="Strength of seasonality"
            )
            
            holidays_prior_scale = st.slider(
                "Holidays Prior Scale",
                min_value=0.01,
                value=10.0,
                max_value=10.0,
                step=0.1,
                help="Strength of holiday effects"
            )
        
        # Generate forecast button
        if st.button("🚀 Generate Forecast", type="primary", use_container_width=True):
            with st.spinner("Training Prophet model and generating forecast..."):
                try:
                    # Initialize Prophet model
                    m = Prophet(
                        seasonality_mode=seasonality_mode,
                        daily_seasonality=daily_seasonality,
                        weekly_seasonality=weekly_seasonality,
                        yearly_seasonality=yearly_seasonality,
                        changepoint_prior_scale=changepoint_prior_scale,
                        seasonality_prior_scale=seasonality_prior_scale,
                        holidays_prior_scale=holidays_prior_scale
                    )
                    
                    # Add US holidays if selected
                    if use_us_holidays:
                        m.add_country_holidays(country_name='US')
                    
                    # Add custom holidays if provided
                    if use_custom_holidays and custom_holidays_file is not None:
                        try:
                            holidays_df = pd.read_csv(custom_holidays_file)
                            holidays_df['ds'] = pd.to_datetime(holidays_df['ds'])
                            m.holidays = holidays_df
                            st.sidebar.success(f"✅ Loaded {len(holidays_df)} custom holidays")
                        except Exception as e:
                            st.sidebar.warning(f"⚠️ Could not load custom holidays: {str(e)}")
                    
                    # Fit model
                    m.fit(prepared_df)
                    
                    # Create future dataframe
                    future = m.make_future_dataframe(periods=forecast_periods, freq=forecast_freq)
                    
                    # Generate forecast
                    forecast = m.predict(future)
                    
                    # Store in session state
                    st.session_state.forecast_df = forecast
                    st.session_state.model = m
                    
                    st.success("✅ Forecast generated successfully!")
                    
                except Exception as e:
                    st.error(f"❌ Error generating forecast: {str(e)}")
                    st.exception(e)
        
        # Display results if forecast exists
        if st.session_state.forecast_df is not None:
            forecast = st.session_state.forecast_df
            model = st.session_state.model
            
            st.header("📈 Forecast Results")
            
            # Create tabs for different views
            tab1, tab2, tab3, tab4 = st.tabs(["📊 Forecast Plot", "🔍 Components", "📋 Data Table", "💾 Download"])
            
            with tab1:
                st.subheader("Forecast Visualization")
                
                # Create interactive plot
                fig = plot_plotly(model, forecast)
                fig.update_layout(
                    title="Prophet Forecast",
                    xaxis_title="Date",
                    yaxis_title="Value",
                    height=600
                )
                st.plotly_chart(fig, use_container_width=True)
                
                # Show forecast summary
                col1, col2, col3 = st.columns(3)
                with col1:
                    st.metric("Historical Data Points", len(prepared_df))
                with col2:
                    st.metric("Forecast Periods", forecast_periods)
                with col3:
                    latest_forecast = forecast[forecast['ds'] > prepared_df['ds'].max()].iloc[-1]
                    st.metric("Latest Forecast Value", f"{latest_forecast['yhat']:,.2f}")
            
            with tab2:
                st.subheader("Forecast Components")
                
                # Plot components
                fig_components = plot_components_plotly(model, forecast)
                st.plotly_chart(fig_components, use_container_width=True)
            
            with tab3:
                st.subheader("Forecast Data")
                
                # Filter options
                col1, col2 = st.columns(2)
                with col1:
                    show_only_forecast = st.checkbox("Show only forecast period", value=False)
                with col2:
                    min_date_filter = st.date_input(
                        "Min Date",
                        value=prepared_df['ds'].min().date(),
                        min_value=prepared_df['ds'].min().date()
                    )
                
                # Filter dataframe
                display_df = forecast.copy()
                if show_only_forecast:
                    display_df = display_df[display_df['ds'] > prepared_df['ds'].max()]
                else:
                    display_df = display_df[display_df['ds'] >= pd.to_datetime(min_date_filter)]
                
                # Select columns to display
                columns_to_show = st.multiselect(
                    "Select columns to display",
                    options=forecast.columns.tolist(),
                    default=['ds', 'yhat', 'yhat_lower', 'yhat_upper', 'trend']
                )
                
                if columns_to_show:
                    display_df = display_df[columns_to_show]
                    st.dataframe(display_df, use_container_width=True)
                    
                    # Summary statistics
                    if 'yhat' in columns_to_show:
                        st.subheader("Summary Statistics")
                        st.dataframe(display_df['yhat'].describe(), use_container_width=True)
            
            with tab4:
                st.subheader("Download Forecast Results")
                
                # Add run date column
                forecast_download = forecast.copy()
                forecast_download['run_date'] = datetime.now().strftime('%Y-%m-%d')
                
                # Filter future dates only
                forecast_future = forecast_download[forecast_download['ds'] > prepared_df['ds'].max()].copy()
                
                # Convert to CSV
                csv_buffer = io.StringIO()
                forecast_future.to_csv(csv_buffer, index=False)
                csv_string = csv_buffer.getvalue()
                
                st.download_button(
                    label="📥 Download Forecast CSV",
                    data=csv_string,
                    file_name=f"prophet_forecast_{datetime.now().strftime('%Y%m%d_%H%M%S')}.csv",
                    mime="text/csv",
                    use_container_width=True
                )
                
                st.info(f"💡 The download includes {len(forecast_future)} forecast periods starting from {forecast_future['ds'].min().date()}")
                
                # Show preview of download
                st.subheader("Download Preview (Future Periods Only)")
                st.dataframe(forecast_future.head(20), use_container_width=True)
    
    except Exception as e:
        st.error(f"❌ Error reading CSV file: {str(e)}")
        st.exception(e)
        st.info("Please check that your CSV file is properly formatted and try again.")
    
else:
    # Show instructions when no file is uploaded
    st.info("👆 Please upload a CSV file to get started.")
    
    # Example format
    with st.expander("📝 CSV Format Requirements"):
        st.markdown("""
        Your CSV file should have the following format:
        
        | ds | y |
        |---|---|
        | 2023-01-01 | 1000 |
        | 2023-01-02 | 1200 |
        | 2023-01-03 | 1100 |
        | ... | ... |
        
        **Column Requirements:**
        - **ds**: Date column (can be in various date formats)
        - **y**: Numeric value column (the metric you want to forecast)
        
        **Tips:**
        - Dates should be in chronological order
        - Missing values will be automatically removed
        - Ensure your data has enough historical points (at least 2-3 months recommended)
        """)
        
        # Create sample CSV
        sample_data = pd.DataFrame({
            'ds': pd.date_range('2023-01-01', periods=30, freq='D'),
            'y': np.random.randint(1000, 2000, 30)
        })
        sample_csv = sample_data.to_csv(index=False)
        st.download_button(
            label="📥 Download Sample CSV",
            data=sample_csv,
            file_name="sample_prophet_data.csv",
            mime="text/csv"
        )

# Footer
st.markdown("---")
st.markdown("""
<div style='text-align: center; color: gray;'>
    <small>Prophet Forecast Generator | Built with Streamlit</small>
</div>
""", unsafe_allow_html=True)
