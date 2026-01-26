# 🚀 Prophet Forecast App
## **Democratizing Advanced Forecasting for Finance**

---

### **The Problem We're Solving**

Finance teams need accurate forecasts, but traditional tools require:
- ❌ Deep technical expertise (Databricks, Python, SQL)
- ❌ Weeks of back-and-forth with data engineering teams
- ❌ Complex infrastructure setup
- ❌ Tools built by engineers, not finance professionals

**Result:** Forecasting becomes a bottleneck, not an enabler.

---

### **The Solution**

**Prophet Forecast App** — A powerful, user-friendly forecasting tool **built by finance, for finance**.

✅ **No coding required** — Upload your CSV and get forecasts in minutes  
✅ **Built-in business intelligence** — Designed with finance workflows in mind  
✅ **Self-service** — No need to wait for technical teams  
✅ **Enterprise-grade** — Powered by Facebook's Prophet algorithm (used by Meta, Uber, and more)

---

### **Who It's For**

🎯 **Finance Analysts & Managers**  
   - Need quick forecasts without Databricks expertise
   - Want to iterate on models independently
   - Value speed and simplicity

🎯 **Business Leaders**  
   - Need "quick and dirty" forecasts for decision-making
   - Want to explore scenarios without technical overhead
   - Require professional, presentation-ready outputs

🎯 **FP&A Teams**  
   - Building budgets and forecasts
   - Analyzing trends and seasonality
   - Communicating insights to stakeholders

---

### **Why This Is Different**

| Traditional Tools | Prophet Forecast App |
|------------------|---------------------|
| Built by engineers | **Built by finance professionals** |
| Technical complexity | **Business-focused simplicity** |
| Weeks to implement | **Minutes to results** |
| Requires coding skills | **Point-and-click interface** |
| Generic forecasting | **Finance-aware features** |

**Built with business sense** — We understand what matters in finance workflows, not just what's technically possible.

---

### **Key Features**

📊 **Intuitive Interface**  
   - Clean, web-based UI — no installation needed
   - Drag-and-drop CSV upload
   - Real-time visualizations

⚙️ **Flexible Configuration**  
   - Customize seasonality (daily, weekly, yearly)
   - Add holiday effects (US holidays or custom calendars)
   - Adjust forecast horizons and frequencies

📈 **Professional Outputs**  
   - Interactive charts and visualizations
   - Component analysis (trend, seasonality, holidays)
   - Exportable forecast data (CSV)

🔒 **Secure & Reliable**  
   - Runs locally or on secure cloud infrastructure
   - Your data stays private
   - No external dependencies on other teams

---

### **How It Works**

1. **Upload** your CSV file (date column + value column)
2. **Configure** forecast settings (seasonality, holidays, horizon)
3. **Generate** professional forecasts in seconds
4. **Export** results for presentations and analysis

**That's it.** No Databricks. No Python. No waiting.

---

### **Real-World Use Cases**

💼 **Revenue Forecasting**  
   Forecast monthly revenue with weekly seasonality and holiday impacts

📅 **Budget Planning**  
   Generate quarterly forecasts with custom fiscal year calendars

📊 **Demand Planning**  
   Predict future demand with daily patterns and promotional effects

💰 **Expense Forecasting**  
   Model expense trends with monthly seasonality

---

### **Built by Finance, Trusted by Finance**

This tool was created by finance professionals who understand:
- The need for quick, actionable insights
- The importance of presentation-ready outputs
- The reality of tight deadlines and limited technical resources
- What actually matters in financial forecasting workflows

**Not just technically sound — business-smart.**

---

### **Get Started Today**

🌐 **Access the App:** [Your Streamlit Cloud URL]  
📦 **Download Package:** Extract and double-click to run locally  
📚 **Documentation:** See README.md for detailed instructions

**Questions?** Reach out to [Your Contact Information]

---

### **Technical Details** (For the Curious)

- **Algorithm:** Facebook Prophet (time series forecasting)
- **Platform:** Streamlit web application
- **Deployment:** Cloud-hosted or local installation
- **Requirements:** Python 3.8+ (handled automatically)

---

**🎯 Bottom Line:** Advanced forecasting capabilities, zero technical barriers. Built for finance teams who need results, not complexity.

---

## 📋 Detailed User Guide

### **CSV File Format & Usage**

#### **Required CSV Format**

Your CSV file must contain exactly two columns with specific names:

| Column Name | Description | Format | Example |
|------------|-------------|--------|---------|
| **ds** | Date column (required) | Any date format | `2023-01-01`, `1/1/2023`, `2023-01-01 00:00:00` |
| **y** | Value column (required) | Numeric values only | `1000`, `1250.50`, `-500` |

**Example CSV:**
```csv
ds,y
2023-01-01,1000
2023-01-02,1200
2023-01-03,1100
2023-01-04,1350
2023-01-05,1400
```

#### **CSV Requirements & Best Practices**

✅ **Do:**
- Use column names exactly as shown: `ds` and `y` (lowercase)
- Ensure dates are in chronological order
- Include at least 2-3 months of historical data (more is better)
- Use consistent date formats throughout the file
- Include numeric values only in the `y` column

❌ **Don't:**
- Use different column names (e.g., "Date", "date", "value")
- Include missing dates in the middle of your time series
- Mix date formats within the same file
- Include text or special characters in the `y` column
- Skip dates randomly (missing values are OK, but gaps should be intentional)

#### **How to Use Your CSV**

1. **Prepare Your Data:**
   - Export your time series data from Excel, SQL, or any data source
   - Ensure you have two columns: dates and values
   - Rename columns to `ds` and `y` if needed
   - Save as CSV format

2. **Upload:**
   - Click "Browse files" or drag-and-drop your CSV into the upload area
   - The app will automatically validate your file format
   - Preview your data to confirm it loaded correctly

3. **Verify:**
   - Check the data preview table shows your dates and values correctly
   - Confirm the total row count matches your expectations
   - Look for any validation errors or warnings

---

### **Configurable Settings & What They Do**

#### **1. Seasonality Settings**

**Seasonality Mode** (Additive vs. Multiplicative)
- **Additive** (Default): Seasonal effects remain constant over time
  - Best for: Data where seasonal patterns don't change with overall level
  - Example: A restaurant that always sees +20% traffic on Fridays, regardless of overall volume
  - Use when: Your seasonal fluctuations are roughly the same size throughout the time series

- **Multiplicative**: Seasonal effects scale proportionally with the trend
  - Best for: Data where seasonal patterns grow/shrink with overall level
  - Example: A business where weekend spikes are 2x the weekday average (whether average is 100 or 1000)
  - Use when: Your seasonal fluctuations grow as your overall values increase

**Daily Seasonality**
- **What it does:** Captures hour-of-day patterns (e.g., 9am spike, 5pm peak, midnight dip)
- **When to use:** Only for hourly or sub-daily data (data with timestamps)
- **Default:** Off (disabled)
- **⚠️ Warning:** Enabling this for daily or weekly data will not improve your forecast and may cause errors

**Weekly Seasonality**
- **What it does:** Captures day-of-week patterns (e.g., Monday vs. Sunday behavior, weekend effects)
- **When to use:** For daily or hourly data where you expect different patterns by day of week
- **Default:** On (enabled)
- **Example:** Retail sales that spike on weekends, or B2B metrics that drop on weekends

**Yearly Seasonality**
- **What it does:** Captures annual patterns (e.g., Q4 holiday spikes, summer dips, quarterly cycles)
- **When to use:** For any data that spans multiple years or shows annual patterns
- **Default:** On (enabled)
- **Example:** Revenue that spikes in Q4, or demand that peaks during summer months

---

#### **2. Holidays Configuration**

**US Holidays**
- **What it does:** Automatically includes all US federal holidays (New Year's Day, Independence Day, Thanksgiving, Christmas, etc.)
- **When to use:** For US-based businesses or metrics affected by US holidays
- **Default:** On (enabled)
- **Impact:** Model accounts for holiday effects on your forecast

**Custom Holidays CSV**
- **What it does:** Allows you to upload your own holiday calendar (company events, promotions, industry-specific dates)
- **When to use:** 
  - You have company-specific events (product launches, sales events)
  - You operate in non-US markets
  - You want to model promotional periods (Black Friday, Prime Day, etc.)
- **Format:** CSV with columns: `holiday`, `ds`, `lower_window`, `upper_window`

**Custom Holidays CSV Format:**
```csv
holiday,ds,lower_window,upper_window
Super Bowl,2/12/23,0,0
Black Friday,11/24/23,0,3
Easter,4/9/23,-2,0
```

**Column Definitions:**
- **holiday**: Name of the holiday/event (required)
- **ds**: Date of the holiday in M/D/YY or YYYY-MM-DD format (required)
- **lower_window**: Days before the holiday to include (optional, default: 0)
  - Negative values = days before (e.g., -2 = 2 days before)
  - Example: `-2` means the effect starts 2 days before the holiday
- **upper_window**: Days after the holiday to include (optional, default: 0)
  - Positive values = days after (e.g., 3 = 3 days after)
  - Example: `3` means the effect lasts 3 days after the holiday

**Window Examples:**
- `Black Friday, 11/24/23, 0, 3` → Affects Black Friday + 3 days after (entire shopping weekend)
- `Easter, 4/9/23, -2, 0` → Affects 2 days before Easter + Easter day
- `Super Bowl, 2/12/23, 0, 0` → Affects only the day itself

---

#### **3. Forecast Settings**

**Forecast Periods**
- **What it does:** Number of periods to forecast into the future
- **Range:** 1 to 3,650 periods
- **Default:** 365 (1 year for daily data)
- **Guidance:**
  - Daily data: 365 = 1 year, 90 = 1 quarter, 30 = 1 month
  - Weekly data: 52 = 1 year, 13 = 1 quarter
  - Monthly data: 12 = 1 year, 3 = 1 quarter
- **Best Practice:** Forecast only as far as you have confidence (typically 1-2x your historical data length)

**Forecast Frequency**
- **What it does:** Determines the granularity of your forecast output
- **Options:**
  - **D** (Daily): Forecast for each day
  - **W** (Weekly): Forecast for each week
  - **M** (Monthly): Forecast for each month
  - **Q** (Quarterly): Forecast for each quarter
  - **Y** (Yearly): Forecast for each year
- **Default:** D (Daily)
- **Guidance:** Match your input data frequency, or aggregate to the level you need for planning

---

#### **4. Advanced Options**

**Changepoint Prior Scale**
- **What it does:** Controls how flexible the trend can be (how much the trend can change direction)
- **Range:** 0.001 to 0.5
- **Default:** 0.05
- **Lower values (0.001-0.01):** More rigid trend, fewer direction changes
  - Use when: You expect a stable, consistent trend
  - Good for: Long-term forecasts, stable businesses
- **Higher values (0.1-0.5):** More flexible trend, allows more direction changes
  - Use when: Your data has many trend shifts or you expect future changes
  - Good for: Volatile markets, businesses with frequent strategy changes
- **Impact:** Higher values = model adapts more to recent changes, but may overfit to noise

**Seasonality Prior Scale**
- **What it does:** Controls how strong seasonal effects can be
- **Range:** 0.01 to 10.0
- **Default:** 10.0 (maximum strength)
- **Lower values (0.01-1.0):** Weaker seasonal effects
  - Use when: Seasonality is subtle or you want to dampen seasonal swings
- **Higher values (5.0-10.0):** Stronger seasonal effects
  - Use when: Seasonality is a major driver of your data
  - Default: 10.0 (assumes seasonality is important)
- **Impact:** Lower values = smoother forecasts, less seasonal variation

**Holidays Prior Scale**
- **What it does:** Controls how strong holiday effects can be
- **Range:** 0.01 to 10.0
- **Default:** 10.0 (maximum strength)
- **Lower values (0.01-1.0):** Weaker holiday effects
  - Use when: Holidays have minimal impact on your metric
- **Higher values (5.0-10.0):** Stronger holiday effects
  - Use when: Holidays significantly impact your business (retail, food delivery, etc.)
  - Default: 10.0 (assumes holidays matter)
- **Impact:** Lower values = holidays have less influence on forecast

---

### **Understanding Your Forecast Output**

**Forecast Columns:**
- **ds**: Date of the forecast
- **yhat**: Predicted value (your forecast)
- **yhat_lower**: Lower bound of uncertainty interval (typically 80% confidence)
- **yhat_upper**: Upper bound of uncertainty interval (typically 80% confidence)
- **trend**: Underlying trend component (without seasonality/holidays)
- **seasonal_components**: Breakdown of weekly/yearly patterns

**Component Analysis:**
- **Trend**: Shows the overall direction of your metric over time
- **Weekly**: Shows day-of-week patterns (if weekly seasonality enabled)
- **Yearly**: Shows annual patterns (if yearly seasonality enabled)
- **Holidays**: Shows the impact of holidays on your forecast

**Download Options:**
- Download includes only future forecast periods (not historical data)
- Includes `run_date` column showing when forecast was generated
- CSV format ready for Excel, Tableau, or other tools

---

### **Quick Reference: Settings by Use Case**

**Revenue Forecasting (Monthly):**
- Seasonality Mode: Multiplicative
- Weekly Seasonality: Off
- Yearly Seasonality: On
- US Holidays: On
- Forecast Periods: 12 (1 year)
- Forecast Frequency: M (Monthly)

**Daily Demand Planning:**
- Seasonality Mode: Additive
- Weekly Seasonality: On
- Yearly Seasonality: On
- US Holidays: On
- Custom Holidays: Add promotional periods
- Forecast Periods: 90 (1 quarter)
- Forecast Frequency: D (Daily)

**Hourly Traffic Forecasting:**
- Seasonality Mode: Additive
- Daily Seasonality: On (hourly data)
- Weekly Seasonality: On
- Yearly Seasonality: On
- Forecast Periods: 168 (1 week of hours)
- Forecast Frequency: D (or match your data frequency)

---

*Prophet Forecast App — Where Finance Meets Forecasting*
