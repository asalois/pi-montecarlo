program calc
  implicit none
  ! declare variables
  integer :: i
  integer :: hits
  integer :: trials
  real :: mypi
  real :: r
  real :: x
  real :: y
  real :: realpi
  real :: darts

  ! set some variables
  realpi = 3.14159265358979323846264338327950288419939937
  trials = 1000000000
  hits = 0

  ! throw one dart at the board per trial
  do i = 1, trials
    call random_number(x)
    call random_number(y)
    r = x**2 + y**2

    ! if the dart hit the board then add one to hits
    if (r <= 1) then
      hits = hits + 1
    end if
  end do

  ! calc pi by 4 times the ratio of hits to trials 
  mypi = 4.0 * real(hits) / real(trials)
  
  print *, 'Pi= ', mypi

end program calc
