#!/bin/sh

export ulx3s_dist=/dist/

 git clone https://github.com/emard/Next186.git && \
 cd Next186 && \
 unzip Next186_SoC_Diamond_Project.zip  && \
 mkdir -p proj/ulx3s/clocks && \
 cd proj/ulx3s/ && \
 for size in 25 45 85; do make clean; make FPGA_SIZE=${size} ulx3s_${size}f_next186.bit; make FPGA_SIZE=${size} ulx3s_${size}f_next186.bit; cp -a project/project_project.bit $ulx3s_dist/ulx3s_${size}f_next186.bit; done && \
 /opt/ulx3s/bin/ecpunpack --input $ulx3s_dist/ulx3s_25f_next186.bit --textcfg /tmp/ulx3s_12f_next186.config --idcode 0x41111043 && \
 /opt/ulx3s/bin/ecppack --input /tmp/ulx3s_12f_next186.config --bit $ulx3s_dist/ulx3s_12f_next186.bit --compress --idcode 0x21111043 && \
 echo "[Success]"
