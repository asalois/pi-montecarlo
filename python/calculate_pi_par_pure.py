import random
import math
from multiprocessing import Pool

procs = 5  # number of cpus
ndarts = 8192  # number of darts
nthrows = 100_000  # number of throws
nsamples = nthrows * ndarts  # total

def throw_darts(run):
    hits = 0  # start with no hits
    rand = random.random
    for i in range(int(ndarts)):
        x = rand()
        y = rand()
        if (x*x + y*y) < 1.0:  # if the dart is in the circle
            hits += 1
    return hits

def monte_carlo_pi_pool():
    hits = 0
    with Pool(procs) as p:  # throw many darts at once
        a = p.map(throw_darts, range(nthrows))  # returns a list of hits
    hits = sum(a)  # sum up all hits
    return 4.0 * hits / nsamples


my_pi = monte_carlo_pi_pool()
diff = math.pi - my_pi
print(
    "Samples= {0:.1f}, my_pi= {1:2.10f}, diff={2:2.10f}".format(nsamples, my_pi, diff)
)
print()
