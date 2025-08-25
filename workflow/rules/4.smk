# Logging
# snakemake all4 --dag | dot -Tpdf > dag4.pdf
# snakemake -c 1 all4

rule all4:
    input:
        expand("results/compare/{sample}_diff.txt", sample=SAMPLES),
        expand("results/compare/{sample}_diff_bad.txt", sample=SAMPLES)

rule compare_bad:
    input:
        rev="results/rev/{sample}.fasta",
        trim="results/fasta_trimmed/{sample}.fasta"
    output:
        "results/compare/{sample}_diff_bad.txt"
    log:
        "logs/compare_{sample}_bad.log"
    shell:
        """
        set +e
        diff {input.rev} {input.trim} > {output} 2> {log}
        echo "Exit code: $?" >> {log}
        set -e
        """

rule compare_good:
    input:
        rev="results/rev_rev/{sample}.fasta",
        trim="results/fasta_trimmed/{sample}.fasta"
    output:
        "results/compare/{sample}_diff.txt"
    log:
        "logs/compare_{sample}.log"
    shell:
        """
        set +e
        diff {input.rev} {input.trim} > {output} 2> {log}
        echo "Exit code: $?" >> {log}
        set -e
        """