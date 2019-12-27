#!/bin/sh

export ulx3s_url=https://github.com/alpin3/ulx3s/releases/download/v2019.12.26/ulx3s-2019.12.26-linux-x86_64.tar.gz
export ulx3s_dist=/dist/

 yum update -y ; \
 yum install -y python3 zip unzip make git && \
 curl -L $ulx3s_url | tar -xvz -C /opt -f - && \
 ln -sf /opt/ulx3s-* /opt/ulx3s && \
 mkdir -p /mt/scratch/tmp/openfpga/prjtrellis/libtrellis/ && \
 cd /opt/ulx3s/bin && \
 for i in ecp*; do ln -sf `pwd`/$i /mt/scratch/tmp/openfpga/prjtrellis/libtrellis/$i; done && \
 cd $HOME && \
 git clone https://github.com/emard/Next186.git && \
 cd Next186 && \
 unzip Next186_SoC_Diamond_Project.zip  && \
 cd proj/ulx3s/ && \
 for size in 25 45 85; do make clean; make FPGA_SIZE=${size} ulx3s_${size}f_next186.bit; make FPGA_SIZE=${size} ulx3s_${size}f_next186.bit; cp -a project/project_project.bit $ulx3s_dist/ulx3s_${size}f_next186.bit; done && \
 /opt/ulx3s/bin/ecpunpack --input $ulx3s_dist/ulx3s_25f_next186.bit --textcfg /tmp/ulx3s_12f_next186.config --idcode 0x41111043 && \
 /opt/ulx3s/bin/ecppack --input /tmp/ulx3s_12f_next186.config --bit $ulx3s_dist/ulx3s_12f_next186.bit --compress --idcode 0x21111043 && \
 echo "[Success]"
