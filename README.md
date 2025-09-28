# Option Pricing with Monte Carlo Methods

This repository contains MATLAB functions for pricing European and Asian options using Monte Carlo simulation methods, including models with stochastic interest rates.

##  File Structure and Functions

###  European Options with Stochastic Interest Rate

#### `price_stoch_option.m`
**Main pricing function for European call options with stochastic interest rate**
- **Input**: `S0` (initial stock price), `r0` (initial interest rate)
- **Output**: Option price using Monte Carlo simulation
- **Model**: Implements Vasicek model for interest rate dynamics with correlated stock price movements
- **Parameters**:
  - Strike price K = 10
  - Time to maturity T = 0.5 years
  - 100 time steps, 1000 Monte Carlo simulations
  - Interest rate: κ = 0.7 (mean reversion), θ = 0.05 (long-term level), σᵣ = 0.02
  - Stock volatility σₛ = 0.4
  - Correlation ρ = -0.3 between stock and interest rate

#### `Graph_stoch_option.m`
**Visualization functions for stochastic interest rate option pricing**
- **2D Plot**: Price vs initial stock price S₀ (fixed r₀ = 0.1)
- **3D Surface**: Price as function of both S₀ and r₀
- **Contour Plot**: Price level curves in (S₀, r₀) space
- Includes payoff comparison for European vanilla call

###  Asian Options

#### `Price_asian.m`
**Pricing function for Asian call options**
- **Input**: `S0` (initial stock price)
- **Output**: Asian option price
- **Method**: Monte Carlo with 10,000 simulations
- **Payoff**: Based on arithmetic average of stock prices over the option life

#### `Payoff_Asian.m`
**Payoff calculation for Asian options**
- **Fixed Strike Asian Call**: max(Ā - K, 0) where Ā is the arithmetic average
- **Floating Strike Asian Call**: max(Ā - S_T, 0) (commented alternative)
- Simulates stock price path using geometric Brownian motion

#### `Graph_asian.m`
**Visualization for Asian option pricing**
- Compares Asian option price with European call price and payoff
- Plots price vs initial stock price S₀

###  Asian Options at Intermediate Times

#### `Price_Asian_t.m`
**Pricing Asian options at time t < T**
- **Input**: Current time `t`, current stock price `St`, accumulated average `At`
- **Output**: Option price from time t to maturity
- Uses conditional Monte Carlo simulation

#### `Payoff_Asian_t.m`
**Payoff calculation for Asian options starting from time t**
- Continues accumulating the average from a given point in time
- Accounts for already accumulated average `At` up to time `t`

#### `Surface_asian_t.m`
**3D surface visualization for Asian options at time t**
- Creates surface plot showing option price as function of current stock price (St) and accumulated average (At)
- Fixed time t = 2T/3 (two-thirds through the option life)

##  Model Parameters

### Common Parameters
- **Strike Price (K)**: 10
- **Risk-free rate (r)**: 0.4 (for Asian options)
- **Stock volatility (σ)**: 0.5 (for Asian options), 0.4 (for stochastic rate model)
- **Time to maturity (T)**: 0.5 years
- **Time steps**: 100
- **Monte Carlo simulations**: 1,000-10,000

### Stochastic Interest Rate Model (Vasicek)
- **Mean reversion speed (κ)**: 0.7
- **Long-term mean (θ)**: 0.05
- **Interest rate volatility (σᵣ)**: 0.02
- **Correlation (ρ)**: -0.3

##  Usage Examples

```matlab
% Price European call with stochastic rates
price = price_stoch_option(10, 0.05);

% Create 3D surface plot for stochastic rate option
Graph_stoch_option();

% Price Asian call option
asian_price = Price_asian(10);

% Compare Asian vs European pricing
Graph_asian();

% Create Asian option surface at time t
Surface_asian_t();
```



*Each function includes detailed parameter specifications and can be easily modified for different strike prices, volatilities, or correlation structures.*
