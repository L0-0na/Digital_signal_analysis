# FIR and IIR Digital Filter Design Project

## 📌 Overview

This project demonstrates the design, analysis, and simulation of FIR and IIR digital filters using MATLAB. It builds on theoretical derivations and practical implementations discussed in the accompanying report.

## ⚙️ FIR Filter Design

* **Filter Type:** Band-stop FIR filter using window method

* **Specifications:**

  * Filter order: N = 61
  * Stopband frequencies: w1 = 2π/5, w2 = π/2
  * Window: Hamming

* **Process:**

  * Compute ideal band-stop impulse response `h_BP`
  * Apply Hamming window to obtain `h_Pbp`
  * Plot impulse response and frequency response (using `freqz`)

* **Signal Testing:**

  * Test sine signals at π/5, 9π/20, and π/10
  * Convolve signals with FIR filter and plot results
  * Compute group delay using `grpdelay`

## ⚙️ IIR Filter Design

* **Analog Filter:**

  * Type: Low-pass Butterworth filter
  * Transfer function: `H(s) = 0.189119 / ((s+0.574)*(s^2 + 0.574s + 0.32947741))`

* **Digital Filter:**

  * Convert analog to digital via bilinear transform
  * Compute poles/zeros and transfer function using `buttord`, `buttap`, `lp2lp`, `bilinear`

* **Comparison:**

  * Compare theoretical and practical analog filter designs (Bode plots)
  * Compare digital filter designs (magnitude response using `freqz`)

## 🛠️ How to Run

1. Open the provided MATLAB script in MATLAB or GNU Octave.
2. Execute section by section:

   * FIR design and testing
   * IIR design and comparison

## 🚀 Results

* FIR filter meets specifications and properly attenuates stopband frequencies.
* IIR filter design through practical and theoretical approaches are consistent, with minor variations in cutoff frequencies.

## 📄 Notes

* Ensure Signal Processing Toolbox is available for functions like `freqz`, `grpdelay`, `buttord`, `bilinear`.
* Plots illustrate both the time-domain and frequency-domain behavior of the filters.

## 🔗 Reference

This README complements the report detailing filter theory, design choices, and validation results.
