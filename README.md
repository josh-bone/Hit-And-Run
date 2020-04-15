# Hit-And-Run
MATLAB implementations of a "Hit And Run" Markov Chain Monte Carlo (MCMC) method. The code provided samples a uniform distribution over a circular body. However, it is guaranteed to work over any convex body, and only the intersection function would have to be modified in order to change the convex body. The sampled distribution can also be modified, of course.

Running the algorithm for 10 steps yields the following:
![](./pictures/animation.gif)

Over a large number of steps, this sampling method should approach the distribution.
![](./pictures/1k_steps_uniform.png)
