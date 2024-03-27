using Printf
using Random

# inputs
inSeed = parse(Int64, ARGS[1])
trials = 1_000_000_000


function sim(throws, seed)
  hits = 0
  rng = Xoshiro(seed)

  for i = 1:throws
    x = rand(rng)
    y = rand(rng)
    r = x^2 + y^2
    if r <= 1
      hits += 1
    end
  end
  
  myPi = 4 * hits / throws
  error = 100 * (pi - myPi) / pi
  return myPi, error
end

#@time sim(trials, inSeed)
s myPi error = @timed sim(trials, inSeed)
@printf("Throws per Second = %4.5g", trials / s.time)
@printf("%1.10f,%g,%d,%d", myPi, error, log(trials), inSeed)
#@timev sim(trials, inSeed)
#sim(trials, inSeed)
