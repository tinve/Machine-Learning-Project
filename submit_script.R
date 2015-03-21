# Run the algorithm, produce list of 20 characters (A, B, C, D or E),
# create a directory for output file, set it to be a working directory.
# Source this script and run pml_write_files(answer) on answer list.
# Check that the txt file is right, sumbit.args

pml_write_files = function(x){
    n = length(x)
    for(i in 1:n){
        filename = paste0("problem_id_",i,".txt")
        write.table(x[i],file=filename,quote=FALSE,row.names=FALSE,col.names=FALSE)
    }
}