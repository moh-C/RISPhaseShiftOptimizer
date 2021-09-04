# RISPhaseShiftOptimizer

This is the souce code for <a href="#">Optimization of Quantized Phase Shifts for
Reconfigurable Smart Surfaces Assisted
Communications</a>

To run the optimizer, you need to clone this repository and after changing the workspace to the cloned repository directory, run <a href='https://github.com/moh-C/RISPhaseShiftOptimizer/blob/main/Driver.m'>Driver.m</a>.
In Driver.m, we generate a channel and then start to optimize the phase shifts to maximize the throughput. While generating the channel, <strong>dSR</strong>, distance of Source to to RIS, and <strong>dRD</strong>, distance of RIS to Destination can be chosen. Other parameters such as <strong>N</strong> or <strong>Subcarriers</strong> depend on your specific channel.

## Workspace

The optimizer was developed in MATLAB 2021a.
