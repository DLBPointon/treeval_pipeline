
In the test_script folder, as long as your environment is set up as per prior instructions, use this to run the pipeline.
```
bsub -e error -o out -n 1 -q small -M1500 -R'select[mem>1500] rusage[mem=1500] span[hosts=1]' 'nextflow run test.nf -entry test -params-file treeval.yaml'
```