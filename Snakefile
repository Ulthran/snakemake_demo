SAMPLES = ["sample1", "sample2", "sample3"]

rule all:
    input:
        expand("results/qc/{sample}.txt", sample=SAMPLES),
        expand("results/fasta/{sample}.fasta", sample=SAMPLES)

rule qc:
    input:
        "data/{sample}.fastq"
    output:
        "results/qc/{sample}.txt"
    shell:
        "seqtk fqchk {input} > {output}"

rule fastq_to_fasta:
    input:
        "data/{sample}.fastq"
    output:
        "results/fasta/{sample}.fasta"
    shell:
        "seqtk seq -A {input} > {output}"
