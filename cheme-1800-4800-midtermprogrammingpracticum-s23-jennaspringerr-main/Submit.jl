# include the include -
include("Include.jl")

# load (and parse) the reaction file -
path_to_json_file = joinpath(_PATH_TO_DATA,"e_coli_core.json");
data = readreactionfile(path_to_json_file);

# build the compounds array -
model = build(_build_bounds_array,data);

# build the A matrix model -
model = build(MyChemicalCompoundModel,data);

# build the stochiometric matrix model -
model = build(MyStoichiometricNetworkModel,data);

# Compute Δ = transpose(A)*S
# ...