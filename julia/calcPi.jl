using Printf
using Random

# inputs
seed = parse(Int64, ARGS[1])
throws = 100_000_000
hits = 0

rng = Xoshiro(seed)
for i = 1:throws
  x = rand(rng)
  y = rand(rng)
  r = x^2 + y^2
  if r <= 1
    global hits += 1
  end
end

myPi = 4 * hits / throws
error = (pi - myPi) / pi

@printf("Throws = %d \n", throws)
@printf("myPi = %f \n", myPi)
@printf("Error = %f \n", error)
@printf("%f,%f,%d,%d\n", abs(error), myPi, throws, seed)


