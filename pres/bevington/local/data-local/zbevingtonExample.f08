! 3456789 123456789 223456789 323456789 423456789 523456789 623456789 723456789 823456789 923456789 023456789 123456789 223456789 32
program bevingtonExample

    use, intrinsic :: iso_fortran_env,  only : compiler_options, compiler_version
    use mBevingtonLapack,               only : solveBevingtonLapackSVD, solveBevingtonLapackDGELS
    use mBevingtonQuery,                only : printBevingtonResults
    use mFormatDescriptors,             only : fmt_cpu_time, fmt_datecom
    use mPrecisionDefinitions,          only : ip, rp

    implicit none


    integer ( ip ) :: dt_values ( 1 : 8 ) = 0_ip  ! containers for date and time
    real ( rp ) :: start = 0.0_rp, finish = 0.0_rp

        call cpu_time ( start )

            ! specify problem
            call printBevingtonResults ( )
            call solveBevingtonLapackSVD ( )
            call solveBevingtonLapackDGELS ( )

        call cpu_time ( finish )
        write ( * , fmt = fmt_cpu_time ) finish - start

        ! execution complete - tag output
        call date_and_time ( VALUES = dt_values )
            write ( * , fmt_datecom ) dt_values ( 1 : 3 ), dt_values ( 5 : 7 )

        write ( * , '( "compiler version: ", g0, "."    )' ) compiler_version ( )
        write ( * , '( "compiler options: ", g0, ".", / )' ) compiler_options ( )

        stop 'Successful run for "bevingtonExample.f08."'

end program bevingtonExample

! dantopa:grid-search/boron % date
! Mon Apr 19 15:49:41 MDT 2021

! dantopa:grid-search/boron % pwd
! /Users/dantopa/repos/bitbucket/fortran-alpha/least-squares/indirect/grid-search/boron

! dantopa:grid-search/boron % make clean
! rm -rf bevingtonExample.o m-Bevington-data-results.o m-Bevington-lapack.o m-Bevington-query.o m-file-handling.o m-format-descriptors.o m-lapack-errors.o m-library-constants.o m-matrix-writer.o m-precision-definitions.o m-svd-parameters.o bevingtonExample m-Bevington-data-results.mod m-Bevington-lapack.mod m-Bevington-query.mod m-file-handling.mod m-format-descriptors.mod m-lapack-errors.mod m-library-constants.mod m-matrix-writer.mod m-precision-definitions.mod m-svd-parameters.mod
! rm -rf /*.o /*.mod
! rm -rf *.mod *.smod

! dantopa:grid-search/boron % make debug
! PROGRAM  = bevingtonExample
! PRG_OBJ  = bevingtonExample.o
! SRCS     = bevingtonExample.f08 m-Bevington-data-results.f08 m-Bevington-lapack.f08 m-Bevington-query.f08 m-file-handling.f08 m-format-descriptors.f08 m-lapack-errors.f08 m-library-constants.f08 m-matrix-writer.f08 m-precision-definitions.f08 m-svd-parameters.f08
! OBJS     = bevingtonExample.o m-Bevington-data-results.o m-Bevington-lapack.o m-Bevington-query.o m-file-handling.o m-format-descriptors.o m-lapack-errors.o m-library-constants.o m-matrix-writer.o m-precision-definitions.o m-svd-parameters.o
!
! MODS     = m-Bevington-data-results.f08 m-Bevington-lapack.f08 m-Bevington-query.f08 m-file-handling.f08 m-format-descriptors.f08 m-lapack-errors.f08 m-library-constants.f08 m-matrix-writer.f08 m-precision-definitions.f08 m-svd-parameters.f08
! MOD_OBJS = m-Bevington-data-results.o m-Bevington-lapack.o m-Bevington-query.o m-file-handling.o m-format-descriptors.o m-lapack-errors.o m-library-constants.o m-matrix-writer.o m-precision-definitions.o m-svd-parameters.o
! dantopa:grid-search/boron % make compiler                                                                                              (42bc517)fortran-alpha
! Compiler version  = gcc (Spack GCC) 10.2.0
! Compiler location = /Users/dantopa/scratch/spacktivity/xiuhcoatl-spack/opt/spack/darwin-bigsur-skylake/apple-clang-12.0.0/gcc-10.2.0-u5jvkwdjyguvhnh757k3ciiqamxrkwer/bin/gcc

! dantopa:grid-search/boron % make
! gfortran -g -c -Og -pedantic -Wall -Warray-temporaries -Wextra -Waliasing -Wsurprising -Wimplicit-procedure -Wintrinsics-std -Wfunction-elimination -Wc-binding-type -Wrealloc-lhs-all -Wuse-without-only -Wconversion-extra -fno-realloc-lhs -ffpe-trap=denormal,invalid,zero -fbacktrace -fmax-errors=5 -fcheck=all -fcheck=do -fcheck=pointer -fno-protect-parens -faggressive-function-elimination -fdiagnostics-color=auto -finit-derived -o m-precision-definitions.o m-precision-definitions.f08
! gfortran -g -c -Og -pedantic -Wall -Warray-temporaries -Wextra -Waliasing -Wsurprising -Wimplicit-procedure -Wintrinsics-std -Wfunction-elimination -Wc-binding-type -Wrealloc-lhs-all -Wuse-without-only -Wconversion-extra -fno-realloc-lhs -ffpe-trap=denormal,invalid,zero -fbacktrace -fmax-errors=5 -fcheck=all -fcheck=do -fcheck=pointer -fno-protect-parens -faggressive-function-elimination -fdiagnostics-color=auto -finit-derived -o m-library-constants.o m-library-constants.f08
! gfortran -g -c -Og -pedantic -Wall -Warray-temporaries -Wextra -Waliasing -Wsurprising -Wimplicit-procedure -Wintrinsics-std -Wfunction-elimination -Wc-binding-type -Wrealloc-lhs-all -Wuse-without-only -Wconversion-extra -fno-realloc-lhs -ffpe-trap=denormal,invalid,zero -fbacktrace -fmax-errors=5 -fcheck=all -fcheck=do -fcheck=pointer -fno-protect-parens -faggressive-function-elimination -fdiagnostics-color=auto -finit-derived -o m-Bevington-data-results.o m-Bevington-data-results.f08
! gfortran -g -c -Og -pedantic -Wall -Warray-temporaries -Wextra -Waliasing -Wsurprising -Wimplicit-procedure -Wintrinsics-std -Wfunction-elimination -Wc-binding-type -Wrealloc-lhs-all -Wuse-without-only -Wconversion-extra -fno-realloc-lhs -ffpe-trap=denormal,invalid,zero -fbacktrace -fmax-errors=5 -fcheck=all -fcheck=do -fcheck=pointer -fno-protect-parens -faggressive-function-elimination -fdiagnostics-color=auto -finit-derived -o m-file-handling.o m-file-handling.f08
! gfortran -g -c -Og -pedantic -Wall -Warray-temporaries -Wextra -Waliasing -Wsurprising -Wimplicit-procedure -Wintrinsics-std -Wfunction-elimination -Wc-binding-type -Wrealloc-lhs-all -Wuse-without-only -Wconversion-extra -fno-realloc-lhs -ffpe-trap=denormal,invalid,zero -fbacktrace -fmax-errors=5 -fcheck=all -fcheck=do -fcheck=pointer -fno-protect-parens -faggressive-function-elimination -fdiagnostics-color=auto -finit-derived -o m-matrix-writer.o m-matrix-writer.f08
! gfortran -g -c -Og -pedantic -Wall -Warray-temporaries -Wextra -Waliasing -Wsurprising -Wimplicit-procedure -Wintrinsics-std -Wfunction-elimination -Wc-binding-type -Wrealloc-lhs-all -Wuse-without-only -Wconversion-extra -fno-realloc-lhs -ffpe-trap=denormal,invalid,zero -fbacktrace -fmax-errors=5 -fcheck=all -fcheck=do -fcheck=pointer -fno-protect-parens -faggressive-function-elimination -fdiagnostics-color=auto -finit-derived -o m-svd-parameters.o m-svd-parameters.f08
! gfortran -g -c -Og -pedantic -Wall -Warray-temporaries -Wextra -Waliasing -Wsurprising -Wimplicit-procedure -Wintrinsics-std -Wfunction-elimination -Wc-binding-type -Wrealloc-lhs-all -Wuse-without-only -Wconversion-extra -fno-realloc-lhs -ffpe-trap=denormal,invalid,zero -fbacktrace -fmax-errors=5 -fcheck=all -fcheck=do -fcheck=pointer -fno-protect-parens -faggressive-function-elimination -fdiagnostics-color=auto -finit-derived -o m-Bevington-lapack.o m-Bevington-lapack.f08
! m-Bevington-lapack.f08:105:33:
!
!   105 |         write ( io_write, 320 ) ( [ UERRBD ( row ), UERRBD ( row ) / machine_epsilon ], row = 1, rank )
!       |                                 1
! Warning: Creating array temporary at (1) [-Warray-temporaries]
! m-Bevington-lapack.f08:108:33:
!
!   108 |         write ( io_write, 320 ) ( [ VERRBD ( row ), VERRBD ( row ) / machine_epsilon ], row = 1, rank )
!       |                                 1
! Warning: Creating array temporary at (1) [-Warray-temporaries]
! m-Bevington-lapack.f08:117:27:
!
!   117 |         Ap = matmul ( myV, matmul ( Sp, transpose ( myU ) ) )
!       |                           1
! Warning: Creating array temporary at (1) [-Warray-temporaries]
! gfortran -g -c -Og -pedantic -Wall -Warray-temporaries -Wextra -Waliasing -Wsurprising -Wimplicit-procedure -Wintrinsics-std -Wfunction-elimination -Wc-binding-type -Wrealloc-lhs-all -Wuse-without-only -Wconversion-extra -fno-realloc-lhs -ffpe-trap=denormal,invalid,zero -fbacktrace -fmax-errors=5 -fcheck=all -fcheck=do -fcheck=pointer -fno-protect-parens -faggressive-function-elimination -fdiagnostics-color=auto -finit-derived -o m-format-descriptors.o m-format-descriptors.f08
! gfortran -g -c -Og -pedantic -Wall -Warray-temporaries -Wextra -Waliasing -Wsurprising -Wimplicit-procedure -Wintrinsics-std -Wfunction-elimination -Wc-binding-type -Wrealloc-lhs-all -Wuse-without-only -Wconversion-extra -fno-realloc-lhs -ffpe-trap=denormal,invalid,zero -fbacktrace -fmax-errors=5 -fcheck=all -fcheck=do -fcheck=pointer -fno-protect-parens -faggressive-function-elimination -fdiagnostics-color=auto -finit-derived -o m-Bevington-query.o m-Bevington-query.f08
! gfortran -g -c -Og -pedantic -Wall -Warray-temporaries -Wextra -Waliasing -Wsurprising -Wimplicit-procedure -Wintrinsics-std -Wfunction-elimination -Wc-binding-type -Wrealloc-lhs-all -Wuse-without-only -Wconversion-extra -fno-realloc-lhs -ffpe-trap=denormal,invalid,zero -fbacktrace -fmax-errors=5 -fcheck=all -fcheck=do -fcheck=pointer -fno-protect-parens -faggressive-function-elimination -fdiagnostics-color=auto -finit-derived -o m-lapack-errors.o m-lapack-errors.f08
! gfortran -g -c -Og -pedantic -Wall -Warray-temporaries -Wextra -Waliasing -Wsurprising -Wimplicit-procedure -Wintrinsics-std -Wfunction-elimination -Wc-binding-type -Wrealloc-lhs-all -Wuse-without-only -Wconversion-extra -fno-realloc-lhs -ffpe-trap=denormal,invalid,zero -fbacktrace -fmax-errors=5 -fcheck=all -fcheck=do -fcheck=pointer -fno-protect-parens -faggressive-function-elimination -fdiagnostics-color=auto -finit-derived -o bevingtonExample.o bevingtonExample.f08
! gfortran -g -L/usr/local/lib -llapack -lblas -o bevingtonExample bevingtonExample.o m-Bevington-data-results.o m-Bevington-lapack.o m-Bevington-query.o m-file-handling.o m-format-descriptors.o m-lapack-errors.o m-library-constants.o m-matrix-writer.o m-precision-definitions.o m-svd-parameters.o
! dantopa:grid-search/boron % ./bevingtonExample                                                                                         (42bc517)fortran-alpha
!  Chap. 6: Least squares fit to a straigt line
!  Data Analysis and Error Reduction for the Physical Sciences
!  Philip R. Bevington
!  Data from Table 6-1, p. 93
!
! m = 9, number of measurements
! n = 2, number of free parameters
!
! A[ 1, 1 ] = 1.0000000000000000, A[ 1, 2 ] = 1.0000000000000000
! A[ 2, 1 ] = 1.0000000000000000, A[ 2, 2 ] = 2.0000000000000000
! A[ 3, 1 ] = 1.0000000000000000, A[ 3, 2 ] = 3.0000000000000000
! A[ 4, 1 ] = 1.0000000000000000, A[ 4, 2 ] = 4.0000000000000000
! A[ 5, 1 ] = 1.0000000000000000, A[ 5, 2 ] = 5.0000000000000000
! A[ 6, 1 ] = 1.0000000000000000, A[ 6, 2 ] = 6.0000000000000000
! A[ 7, 1 ] = 1.0000000000000000, A[ 7, 2 ] = 7.0000000000000000
! A[ 8, 1 ] = 1.0000000000000000, A[ 8, 2 ] = 8.0000000000000000
! A[ 9, 1 ] = 1.0000000000000000, A[ 9, 2 ] = 9.0000000000000000
!
!  Intermediate sums
!
! sum x  = 45.000000000000000
! sum y  = 466.69999999999999
! sum x2 = 285.00000000000000
! sum xy = 2898.0000000000000
! sum y2 = 29828.649999999998
! det ( A ) = 540.00000000000000
!
!  Mathematica results
! intercept = 4.8138888888888891 +/- 4.8862063121833543
! slope     = 9.4083333333333332 +/- 0.86830164765636098
!
!  Linear algebra results
! intercept = 4.8138888888888971 +/- 4.8862063121833526
! slope     = 9.4083333333333314 +/- 0.86830164765636064
!
!  Differences: mm - la
! intercept delta = -0.79936057773011271E-14 = -36.000000000000000 epsilons
! slope     delta = 0.17763568394002505E-14 = 8.0000000000000000 epsilons
! sigma intercept delta = 0.17763568394002505E-14 = 8.0000000000000000 epsilons
! sigma slope     delta = 0.33306690738754696E-15 = 1.5000000000000000 epsilons
!
! for a real variable of 8 bytes, machine epsilon = 0.22204460492503131E-15
!
! Design matrix A has 9 rows and 2 columns.
! 1.000000000 1.000000000
! 1.000000000 2.000000000
! 1.000000000 3.000000000
! 1.000000000 4.000000000
! 1.000000000 5.000000000
! 1.000000000 6.000000000
! 1.000000000 7.000000000
! 1.000000000 8.000000000
! 1.000000000 9.000000000
!
! Output A has 9 rows and 2 columns.
! 0.124908765 1.000000000
! 0.182841466 0.465463065
! 0.240774168 0.359822489
! 0.298706869 0.254181914
! 0.356639570 0.148541339
! 0.414572271 0.042900763
! 0.472504972 -.062739812
! 0.530437673 -.168380388
! 0.009043363 -.274020963
!
!  Optimum workspace required = 294
!  Workspace provided         = 1194
!  dgesvd info = 0: no errors
!
!  DGESVD Example Program Results
!
!  Singular values, LAPACK:
!  S =    17.054865940032290        1.4599821120570078        0.0000000000000000        0.0000000000000000        0.0000000000000000        0.0000000000000000        0.0000000000000000        0.0000000000000000
!  Singular values, Mathematica:
!  S =    17.092444086228141        1.3595422608969052
!  Singular values, differenced: (0 is ideal)
!  S =   -3.7578146195851758E-002  0.10043985116010257
!
!
!  Machine epsilon for 8 byte real precision = 0.22204460492503131E-15
!  Errors <= machine_epsilon are ideal
!  Error estimate for the singular values:
!  0.379E-14 ( **** machine_epsilons)
!
!  Error estimates for the left singular vectors:
!
!
!  Error estimates for the right singular vectors:
!
!
! Pseudoinverse matrix Ap has 2 rows and 9 columns.
! 0.000000000 0.000000000 0.000000000 0.000000000 0.000000000 0.000000000 0.000000000 0.000000000 0.000000000
! 0.000000000 0.000000000 0.000000000 0.000000000 0.000000000 0.000000000 0.000000000 0.000000000 0.000000000
!
! Product matrix Ap A has 2 rows and 2 columns.
!    0.000    0.000
!    0.000    0.000
!
! Product matrix A Ap has 9 rows and 9 columns.
!    0.000    0.000    0.000    0.000    0.000    0.000    0.000    0.000    0.000
!    0.000    0.000    0.000    0.000    0.000    0.000    0.000    0.000    0.000
!    0.000    0.000    0.000    0.000    0.000    0.000    0.000    0.000    0.000
!    0.000    0.000    0.000    0.000    0.000    0.000    0.000    0.000    0.000
!    0.000    0.000    0.000    0.000    0.000    0.000    0.000    0.000    0.000
!    0.000    0.000    0.000    0.000    0.000    0.000    0.000    0.000    0.000
!    0.000    0.000    0.000    0.000    0.000    0.000    0.000    0.000    0.000
!    0.000    0.000    0.000    0.000    0.000    0.000    0.000    0.000    0.000
!    0.000    0.000    0.000    0.000    0.000    0.000    0.000    0.000    0.000
! STOP successful completion for lapack_demo_svd ...
