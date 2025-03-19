This repository contains scripts for setting up environments and reproducing results presented in the PLDI 2025 paper <Spineless Traversal for Web Layout Invalidation>. If you wish to access the core implementation, please refer to github.com/MarisaKirisame/megatron. 

Getting Started Guide:
The artifact contained a docker image which should run on a Ubuntu version 22 or higher.
The docker image should be push button so there is only a few steps:
- install docker on ubuntu by "sudo apt-get install ubuntu".
- obtain the docker image by "docker image pull marisalambda/megatron:latest && docker tag marisalambda/megatron:latest megatron"
- alternatively, one can attempt to build the docer image from scratch by "docker build -t megatron .". this should take about 15 minutes.
- enter the docker image by "docker run -p 8080:8080 -it megatron".
- run a small experiment by "bash entrypoint.sh small-ae", to make sure everything is correct.
- the above experiment should generate and serve a web page at localhost:8080 - typing this url into a web browser will show a web page.

Step by Step Instructions:
- after entering the docker image, the whole experiment can be run via "bash entrypoint.sh ae".
- what you should see is a generated html files.
- the generated web pages should contain multiple plots and numbers which correspond to the result in the paper:
-- it should start with a out.tex hyperlink at the top, followed by multiple lines of irrelvant hyperlink:
--- the out.tex define latex command corresponding to paper numbers:
---- TotalDiffCount, DBPQoverheadpctspeedup, DBPQoverhead should corresnd to the 2216, 78.2%, and 3.23x in the paper abstract.
---- DBPQoverheadpctslowdown should correspond to 21.8% which is the first percentage number in section 6.2 ("with only 21.8% frames being slower")
---- DBPQsmalloverhead should correspond to 5.85x, the last 'x' number in section 6.2 ("the geometric mean speedup is larger, at 5.85×")
-- it should then have three lines with similar content: a scatter plot, a cdf plot, and three tables
--- the two plot at the first line is fig 10 and 11
-- after that, it should have a plot with overlapping histogram of green and red colors. it is fig 12
-- it should then have three lines with similar content again. the first line contain 2 plot which make up fig 13.
