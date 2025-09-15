import random
import math

ndarts = 8192  # number of darts to per throw
nthrows = 10_000  # number of throws
nsamples = nthrows * ndarts  # total number of darts thrown

def monte_carlo_pi():
    hits = 0  # start with no hits
    rand = random.random
    for i in range(nsamples):
        x = rand()
        y = rand()
        if (x*x + y*y) < 1.0:  # if the dart is in the circle
            hits += 1
    return 4.0 * hits / nsamples  # pi is 4 time the ratio


my_pi = monte_carlo_pi()
diff = math.pi - my_pi
print(
    "Samples= {0:.1f}, my_pi= {1:2.10f}, diff={2:2.10f}".format(nsamples, my_pi, diff)
)
print()
