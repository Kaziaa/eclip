#!/usr/bin/env cwltool

cwlVersion: v1.0

class: CommandLineTool

requirements:
  - class: ResourceRequirement
    coresMin: 1
    ramMin: 8000
    #tmpdirMin: 4000
    #outdirMin: 4000



# samtools executable in bin folder is v 0.1.18-dev (r982:313)

baseCommand: [samtools, merge]

#$namespaces:
#  ex: http://example.com/

#hints:
#  - class: ex:ScriptRequirement
#    scriptlines:
#      - "#!/bin/bash"

inputs:

  output_bam:
    type: string
    format: http://edamontology.org/format_2572
    inputBinding:
      position: 1
    label: ""
    doc: "output merged bam file name"

  input_bam_files:
    type: File[]
    format: http://edamontology.org/format_2572
    inputBinding:
      position: 2
    label: ""
    doc: "input unmerged bam files"

outputs:

  output_bam_file:
    type: File
    format: http://edamontology.org/format_3327
    outputBinding:
      glob: $(inputs.output_bam)
    label: ""
    doc: "output merged bam file"
