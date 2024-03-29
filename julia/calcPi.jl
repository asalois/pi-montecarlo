using Printf, Random

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
s = @timed sim(trials, inSeed)
#@printf("Throws per Second = %g\n", trials / s.time)
print("myPi,%error,time,log(trials),seed,tps\n")
@printf("%1.10f,%1.10f,%f,%d,%d,%g\n", s.value[1], s.value[2], s.time, log(trials), inSeed, trials / s.time)
#@timev sim(trials, inSeed)
#sim(trials, inSeed)
