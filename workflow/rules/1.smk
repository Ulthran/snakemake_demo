# Basics
# snakemake all1 --dag | dot -Tpdf > dag1.pdf
# snakemake -c 1 all1

rule all1:
    input:
        expand("results/fasta/{sample}.fasta", sample=SAMPLES)

rule intake:
    input:
        "data/{sample}.fastq"
    output:
        "results/fastq/{sample}.fastq"
    shell:
        "cp {input} {output}"

rule fastq_to_fasta:
    input:
        "results/fastq/{sample}.fastq"
    output:
        "results/fasta/{sample}.fasta"
    shell:
        "seqtk seq -A {input} > {output}"