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
  
  @printf("Throws = %d \n", throws)
  @printf("myPi = %f \n", myPi)
  @printf("Error = %f \n", error)
  @printf("%f,%f,%d,%d\n", abs(error), myPi, log(throws), seed)
end

@time sim(trials, inSeed)
sim(trials, inSeed)
