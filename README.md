# Swaps and Swaptions Analysis

A comprehensive analysis of interest rate swaps and swaptions valuation using market data.

## Overview

This project examines the pricing and risk management of interest rate derivatives, specifically:
- Plain-vanilla interest rate swaps
- European payer swaptions
- Volatility analysis using the ICE BofA MOVE Index
- Historical backtest (2018-2025)

## Contents

- `FinalCods626_ultimate.ipynb` - Complete analysis notebook with:
  - Yield curve construction from Federal Reserve data
  - Bachelier and Black-76 pricing models
  - Greeks calculation and sensitivity analysis
  - Time-series regression analysis

## Methodology

The analysis uses:
- **Yield Curve**: Federal Reserve SVENY nominal zero-coupon yield curve
- **Volatility Proxy**: ICE BofA MOVE Index
- **Pricing Models**: Normal (Bachelier) and Lognormal (Black-76) frameworks
- **Data Period**: 2018-2025

## Key Results

- ATM payer swaption premium averaging ~$16.4k per $1M notional
- High sensitivity to volatility (vega risk)
- Weak predictive relationship between MOVE and realized volatility

## Requirements

```python
pandas
numpy
matplotlib
scipy
statsmodels
```

## Author

Ali Almazrouei

## License

MIT License
