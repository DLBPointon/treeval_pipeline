nextflow.enable.dsl=2

workflow test {
    ch_tolid = Channel.value( 'nxOsc' )
    
    println params.reference
    println params.assembly.class
    println params.alignment.data_dir

    ch_data = Channel
        .from(params.alignment.geneset.toString())
        .splitCsv()
        .flatten()
    
    process gen_tuple {
        input:
        val(org)
        val(clade)
        path(data_dir)

        output:
        tuple val("$org"), path("$data_dir/$clade/csv_folder/$org*data.csv") emit: tupes

        shell:
        """
        echo $data_dir/$clade/csv_folder/$org*data.csv
        """
    }

    gen_tuple ( ch_data, params.assembly.class, params.alignment.data_dir)
    gen_tuple.out.ch_data.view()

}