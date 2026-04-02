program main
    use shapes
    ! go to definition on `shapes`, `circle_t`, `add` jumps to shapes.f90
    ! hover on any symbol from the module shows its declaration

    implicit none

    class(shape_t), allocatable :: s
    ! hover on `s` shows type: class(shape_t)

    type(circle_t) :: c
    type(rectangle_t) :: r
    integer :: result

    c%radius = 5.0
    ! go to definition on `circle_t` jumps to shapes.f90
    ! hover on `c%radius` shows type: real

    r%width  = 3.0
    r%height = 4.0

    result = add(3, 4)
    ! go to definition on `add` jumps to shapes.f90
    ! rename on `result` renames all uses in this scope

    allocate(s, source=c)
    print *, "circle area:   ", s%area()
    ! go to definition on `area` jumps to the deferred procedure in shapes.f90
    ! find references on `area` shows all implementations

    deallocate(s)
    allocate(s, source=r)
    print *, "rectangle area:", s%area()
    print *, "sum:", result

end program main
