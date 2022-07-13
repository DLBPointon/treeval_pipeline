process testing {
    input:
    val (id)

    output:
    stdout, emit: clade

    shell:
    """
    python /nfs/team135/dp24/treeval_pipeline/scripts/alignment_data_check.py $id
    """
}