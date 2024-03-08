program calc
  implicit none
  integer :: i
  integer :: hits
  integer :: trials
  real :: mypi
  real :: r
  real :: x
  real :: y
  real :: realpi
  real :: darts

  realpi = 3.1415927
  trials = 1000000
  hits = 0

  do i = 1, trials
    call random_number(x)
    call random_number(y)
    r = x**2 + y**2
    if (r <= 1) then
      hits = hits + 1
    end if
  end do

  mypi = 4 * real(hits) / real(trials)
  
  print *, 'Pi= ', mypi

end program calc
