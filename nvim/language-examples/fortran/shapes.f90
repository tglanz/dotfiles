module shapes
    implicit none

    ! go to definition on `shape_t` or `circle_t` in main.f90 jumps here
    ! hover on any type shows its components

    type, abstract :: shape_t
    contains
        ! go to definition on `area` call in main.f90 jumps here
        procedure(area_interface), deferred :: area
    end type

    abstract interface
        function area_interface(self) result(a)
            import shape_t
            class(shape_t), intent(in) :: self
            real :: a
        end function
    end interface

    type, extends(shape_t) :: circle_t
        real :: radius
    contains
        ! find references on `area` shows all implementations and call sites
        procedure :: area => circle_area
    end type

    type, extends(shape_t) :: rectangle_t
        real :: width, height
    contains
        procedure :: area => rectangle_area
    end type

contains

    function circle_area(self) result(a)
        class(circle_t), intent(in) :: self
        real :: a
        a = 3.14159265 * self%radius ** 2
    end function

    function rectangle_area(self) result(a)
        class(rectangle_t), intent(in) :: self
        real :: a
        a = self%width * self%height
    end function

    integer function add(a, b)
        integer, intent(in) :: a, b
        add = a + b
    end function

end module shapes
