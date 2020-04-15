# Hit-And-Run
This repo contains MATLAB implementations of a "Hit And Run" Markov Chain Monte Carlo (MCMC) method. The code provided samples a uniform distribution over a circular body. However, it is guaranteed to work over any convex body, and only the intersection function would have to be modified in order to change the convex body. The sampled distribution can also be modified, of course.


Running the algorithm for 10 steps yields the following:

![](./pictures/animation.gif)



Over a large number of steps, this sampling method should approach the distribution.

![](./pictures/1k_steps_uniform.png)


# <b>The Hit And Run Algorithm</b>

First, some definitions:
If f is the distribution we are sampling from, and S is the convex body we are sampling over, then:
<img src="https://render.githubusercontent.com/render/math?math=\mu_{\ell,f} = \int_{p%2Btu \in S}\! f(p%2Btu) \, \mathrm{d}t"> is the measure induced by f on <img src="https://render.githubusercontent.com/render/math?math=\ell">, where p is any point on <img src="https://render.githubusercontent.com/render/math?math=\ell">, and u is a unit vector parallel to <img src="https://render.githubusercontent.com/render/math?math=\ell">.

<img src="https://render.githubusercontent.com/render/math?math=\pi_{\ell}(S) = \frac{\mu_{\ell,f}(S)}{\mu_{\ell,f}}"> is the restriction of f to <img src="https://render.githubusercontent.com/render/math?math=\ell">.

This algorithm iterates over the following two steps:
  1) Pick a uniformly distributed random line <img src="https://render.githubusercontent.com/render/math?math=\ell"> through the current point
  2) Move to a random point along l chosen from the distribution <img src="https://render.githubusercontent.com/render/math?math=\pi_{\ell}"> [[1]](#1).

## References
<a id="1">[1]</a> 
Laszlo Lovasz, Santosh Vempala (2003). 
Hit-and-Run is Fast and Fun.
Technical Report MSR-TR-2003-05
