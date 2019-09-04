# Autogenerated wrapper script for MPFR_jll for powerpc64le-linux-gnu
export libmpfr

using GMP_jll
## Global variables
const PATH_list = String[]
const LIBPATH_list = String[]
PATH = ""
LIBPATH = ""
LIBPATH_env = "LD_LIBRARY_PATH"

# Relative path to `libmpfr`
const libmpfr_splitpath = ["lib", "libmpfr.so"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libmpfr_path = ""

# libmpfr-specific global declaration
# This will be filled out by __init__()
libmpfr_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libmpfr = "libmpfr.so.6"


"""
Open all libraries
"""
function __init__()
    global prefix = abspath(joinpath(@__DIR__, ".."))

    # Initialize PATH and LIBPATH environment variable listings
    global PATH_list, LIBPATH_list

    append!(PATH_list, GMP_jll.PATH_list)
    append!(LIBPATH_list, GMP_jll.LIBPATH_list)
    global libmpfr_path = abspath(joinpath(artifact"MPFR", libmpfr_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libmpfr_handle = dlopen(libmpfr_path)
    push!(LIBPATH_list, dirname(libmpfr_path))

    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ':')
    global LIBPATH = join(LIBPATH_list, ':')

    # Add each element of LIBPATH to our DL_LOAD_PATH (necessary on platforms
    # that don't honor our "already opened" trick)
    #for lp in LIBPATH_list
    #    push!(DL_LOAD_PATH, lp)
    #end
end  # __init__()

