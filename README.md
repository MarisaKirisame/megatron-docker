# Megatron Artifact

This repository contains scripts for setting up environments and reproducing results presented in the PLDI 2025 paper <Spineless Traversal for Web Layout Invalidation>. If you wish to access the core implementation, please refer to the source repository: <github.com/MarisaKirisame/megatron>.

## Setup Environment (Est. Time: 30mins)
The artifact contained a docker image which should run on a Ubuntu version 22 or higher.
The docker image should be push button so there is only a few steps:

### Pull Docker Image from docker hub (Est. Time: 10mins)
The image had already been uploaded to the docker hub, which should be the easiest method to reproduce.
It could be obtained via
```bash
docker image pull marisalambda/megatron:latest
docker tag marisalambda/megatron:latest megatron
```

### Build Docker Image From Source (Est. Time: 20mins)
Alternative, you can build the docker image from scratch via ```bash docker build -t megatron .```

### Entering the image
```bash docker run -p 8080:8080 -it megatron``` will enter the image, opening a bash shell at the directory containing 
both the source code of megatron, as well as the source code for evaluation.

The source code for megatron is at the bin/ directory (entrypoint), lib/ directory (compiler), and include/ directory (runtime).  

The source code for evaluation is at run.py (entry point), generate.py (prepare the input), and docker_report.py (report the output).

Additionally, there is a all-in-one script, entrypoint.sh, which run the evaluation, generate the report and serve it to the 8080 port.

### Quick Test (Est. Time: 5mins)
To make sure everything is ok, run ```bash bash entrypoint.sh small-ae``` for a evaluation on a tiny part of the input.

It should run much quicker, but the served web page should be in the same format as the full evaluation.

Once done running, the script will serve the result to localhost:8080. The result webpage can be accessed by entering the url into a web browser.

## Evaluation Reproduction (Est. Time: 6 hours)
Below are the scripts to reproduce experiments in the paper.

We provide scripts for reproducing all results of Section 6.2 -  **Figure 10**, **Figure 11**, **Figure 12**, and **Figure 13**, alongside result numbers scattered throughout Section 6.2, which are also displayed at abstract.

### Figures
The first two images correspond to Figure 10, and the next 3 image correspond to Figure 11, 12 and 13, in this order.

### Numbers
The out.tex link at the top of the web page should contain latex commands which correspond to all evaluation numbers in section 6.2
- "In total, the 50 websites generate traces with 2216 frames in total" -> generated by "TotalTraceCount" and "TotalDiffCount"
- "The geometric mean is a 3.23× speedup from Spineless Traversal, with only 21.8% of frames rendered slower" -> generated by "DBPQoverhead" and "DBPQoverheadpctslowdown"
- "On this latency-critical subset, which contains more than half of frames, the geometric mean speedup is larger, at 5.85×" -> generated by "DBPQsmalloverhead"

As the numbers is dependent on the machine, we expect a 10% variation from what is in the paper.
