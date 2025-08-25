# Good DAG image
# snakemake report --dag | dot -Tpdf > dag.pdf

rule preprocess:
    input:
        "data/{sample}.fastq"
    output:
        "results/preprocessed/{sample}.fastq"
    shell:
        "cp {input} {output}"

#rule process:
#    input:
#        "results/preprocessed/{sample}.fastq"
#    output:
#        "results/processed/{sample}.fastq"
#    shell:
#        "cp {input} {output}"

rule transform:
    input:
        "results/preprocessed/{sample}.fastq"
    output:
        "results/transformed/{sample}.fastq"
    shell:
        "cp {input} {output}"

rule report:
    input:
        expand("results/transformed/{sample}.fastq", sample=SAMPLES)
    output:
        "results/report.txt"
    shell:
        "echo 'Report generated' > {output}"