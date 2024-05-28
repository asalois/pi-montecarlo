using Printf, Random

# inputs
inSeed = parse(Int64, ARGS[1])
trials = 1_000_000_000

function throw(rng)
  x = rand(rng)
  y = rand(rng)
  r = x^2 + y^2
  if r <= 1
    return true
  else
    return false
  end
end


function runSim(throws, seed)
  hits = 0
  rng = Xoshiro(seed)

  Threads.@threads for i = 1:throws
    didHit = throw(rng)
    if didHit 
      hits += 1
    end
  end
  
  myPi = 4 * hits / throws
  error = (pi - myPi) / pi
  return myPi, error
end

#@time sim(trials, inSeed)
sim = @timed runSim(trials, inSeed)
#@printf("Throws per Second = %g\n", trials / s.time)
#print("myPi,logerror,time,log(trials),seed,tps\n")
@printf("%1.10f,%2.9f,%f,%d,%d,%g\n",
        sim.value[1], abs(log10(abs(sim.value[2]))), sim.time,
        log10(trials), inSeed, trials / sim.time)
#@timev sim(trials, inSeed)
#sim(trials, inSeed)
