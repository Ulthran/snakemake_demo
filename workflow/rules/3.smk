# Environments
# snakemake all3 --dag | dot -Tpdf > dag3.pdf
# snakemake -c 1 all3 --use-conda

rule all3:
    input:
        expand("results/qc/{sample}.txt", sample=SAMPLES),
        expand("results/fasta_trimmed/{sample}.fasta", sample=SAMPLES)

rule qc:
    input:
        "results/fastq/{sample}.fastq"
    output:
        "results/qc/{sample}.txt"
    conda:
        "../envs/seqtk.yaml"
    container:
        "staphb/seqtk:latest"
    shell:
        "seqtk fqchk {input} > {output}"

rule trim:
    input:
        "results/fastq/{sample}.fastq"
    output:
        "results/trimmed/{sample}_trimmed.fastq"
    conda:
        "../envs/seqtk.yaml"
    container:
        "staphb/seqtk:latest"
    shell:
        "seqtk trimfq {input} > {output}"

rule fastq_to_fasta_trimmed:
    input:
        "results/trimmed/{sample}_trimmed.fastq"
    output:
        "results/fasta_trimmed/{sample}.fasta"
    conda:
        "../envs/seqtk.yaml"
    container:
        "staphb/seqtk:latest"
    shell:
        "seqtk seq -A {input} > {output}"