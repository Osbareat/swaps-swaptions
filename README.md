# Swaps & Swaptions Analysis — MOVE Index, Volatility & Pricing

This project is a full end-to-end analysis of interest rate swaps, swaptions, and Treasury market volatility, built to answer one focused research question using real market mechanics and time-series-safe modeling.

The project builds swaps and swaptions from first principles and evaluates volatility relationships using time-series-appropriate methods.

---

## Core Research Question

**How can a short-dated ATM payer swaption be priced and risk-managed using observable market inputs for the yield curve and interest-rate volatility?**

As an extension, the project also tests whether the MOVE Index contains predictive information about future realized volatility.

---

## What This Project Does

I build everything from the ground up:

- Construct a zero-coupon yield curve from Federal Reserve SVENY data
- Price a 10Y par interest rate swap with semiannual fixed payments
- Price 1-month ATM payer swaptions using the Bachelier (normal) model
- Use the ICE BofA MOVE Index as a proxy for Treasury implied volatility
- Test whether MOVE contains predictive power for future realized volatility
- Apply time-series-safe modeling with overlapping targets and HAC inference

The analysis spans **2018–2025**, covering low-rate, crisis, and tightening regimes.

---

## Notebook Structure

All work is contained in:

**`FinalCods626_ultimate.ipynb`**

The notebook is organized as follows:

### Section A — Data Pipeline
- Yield curve construction (SVENY, cubic spline interpolation)
- Discount factors and annuity calculation
- 10Y par swap rate construction
- MOVE Index ingestion (with robust fallback)
- ATM swaption pricing (Bachelier + Black-76 comparison)

### Section B — Data Quality
- Missingness diagnostics
- Explicit handling decisions (documented, not hidden)

### Section C — Exploratory Data Analysis
- Summary statistics
- Time-series plots
- Scatter plots and correlations

### Section D — Outliers & Transformations
- IQR and MAD outlier detection
- Winsorization and log transforms
- Feature engineering using past-only data

### Section E — Modeling (Time-Series Safe)
- Forward-looking realized volatility target (21-day horizon)
- Chronological train / validation / test split
- Naive rolling-mean benchmark
- OLS with HAC / Newey-West standard errors
- Robust regression (Huber)
- Random Forest (non-linear benchmark)
- Multicollinearity diagnostics (VIF)

### Sections F–H — Results & Final Write-Up
- Model comparison
- Diagnostics
- Interpretation and conclusions

---

## Methodology Highlights

### Yield Curve & Swap Construction

**Source:** Federal Reserve SVENY nominal zero-coupon curve
- Continuous compounding, yields kept in percent until discounting
- Cubic spline interpolation to a 0.5-year grid
- 10Y par swap rate:

```
S_t = (1 - P(0,10)) / A_t
```

with semiannual fixed-leg payments.

### Swaption Pricing

**Instrument:** 1-month ATM payer swaption on 10Y swap

**Model:** Bachelier (normal)

**Volatility proxy:**
```
σ_N = MOVE / 10,000
```

**Greeks computed explicitly:** delta, vega, gamma

**Black-76 included for comparison only**

---

## Target Variable (No Look-Ahead Bias)

The main modeling target is **forward-looking realized volatility**:

```
realized_vol_t = √252 · std(ΔS_{t+1}, ..., ΔS_{t+21})
```

### Key implications:
- Targets overlap heavily (20/21 days shared)
- Random shuffling would cause leakage
- HAC / Newey-West standard errors (lag = 21) are required

---

## Key Results

### Swaption Pricing
- **Average ATM payer swaption premium:** ~$16.4k per $1MM notional
- Pricing is highly sensitive to volatility (vega dominates)

### MOVE vs Realized Volatility
- **Correlation between MOVE and forward realized vol is weak**
- MOVE explains swaption prices mechanically, but does not reliably predict future realized volatility

### Model Performance
- Naive rolling-mean benchmark outperforms all models
- Linear, robust, and non-linear models fail to beat baseline out-of-sample
- Even with HAC inference, MOVE coefficients are not statistically strong

### Conclusion
**MOVE is useful as a pricing input, not as a forecasting signal.**

---

## Outputs

The notebook generates:

- Clean tables (`outputs/tables/`)
- Diagnostic plots (`outputs/plots/`)
- Saved regression summaries
- Feature importance files

---

## Requirements

```
Python 3.10+
pandas
numpy
scipy
statsmodels
scikit-learn
matplotlib
yfinance
```

Install dependencies:
```bash
pip install pandas numpy scipy statsmodels scikit-learn matplotlib yfinance
```

---

## Usage

1. Clone the repository
2. Install dependencies
3. Open `FinalCods626_ultimate.ipynb`
4. Run all cells sequentially

The notebook is self-contained and will fetch all required data.

---

## Author

**Ali Almazrouei**

---

## License

MIT License

---

## Disclaimer

This project is for **educational and research purposes only**.

It is not investment advice and should not be used for trading decisions.
