# Design and Implementation of 64-point Fast Fourier Transform (FFT/IFFT) Chip for OFDM-based 802.11a WLAN
ET4067 VLSI for Digital Communication System (VHDL RTL Implementation)  
EE382M VLSI-I (Verilog RTL Implementation + Physical Implementation + Timing Signoff)  
EE382M Verification of Digital System (Formal Verification + Logical Equivalence Checking + Universal Verification Method)  

(C) 2014 Bagus Hanindhito  
(C) 2019 Bagus Hanindhito, Reshma Rajarama Nayak, Shvetha Senthil Kumar  
(C) 2020 Bagus Hanindhito, Ashen Ekanayake, Tosin Jemilehin  


## Introduction
### Brief Overview
This is the RTL implementation, physical implementation, and verification of 64-point FFT/IFFT processor based on the design proposed in the papers listed below.  
[1] K. Maharatna, E. Grass and U. Jagdhold, "A 64-point Fourier transform chip for high-speed wireless LAN application using OFDM," in IEEE Journal of Solid-State Circuits, vol. 39, no. 3, pp. 484-493, March 2004, doi: 10.1109/JSSC.2003.822776.

### Related Courses
This repository contains the project files that were used for project related to the courses listed below.  
* ET4067 VLSI for Digital Communication System (Fall 2014), Institut Teknologi Bandung, Indonesia (Lecturer: Achmad Fuad Mas'ud)
```
The initial RTL implementation of the circuit was done in VHDL as a part of the course project of ET4067 taught by Achmad Fuad Mas'ud. As an addition, simulation-based verification was done using Altera Quartus II 9.1sp2 and ModelSim-Altera 6.5b. The verification was done manually against the Matlab code provided in this repository. The carry-lookahead adder is used throughout the design. There are two known bugs in this design: the adder itself (the synthesizer couldn't synthesize correct adder, instead it synthesizes ripple-carry-adder) and the master control states. These bugs were fixed on the later project.

The deliverables of this project are listed below.
* RTL implementation in VHDL
* Matlab script as the testbench (Matlab R2014a)
* Simulation-based verification (Altera Quartus II 9.1sp2 and ModelSim-Altera 6.5b)
* Project Report in Indonesian
```
* EE382M VLSI-I (Fall 2019), The University of Texas at Austin, United States (Lecturer: Jacob Abraham)
```
The RTL implementation was done in Verilog. The adder was changed into kogge-stone adder (https://github.com/jeremytregunna/ksa) to improve the performance of the custom chips. The previous bugs were also fixed and new feature to overlap FFT/IFFT computation was also introduced in the form of next_data signal. Verification 
```

As an addition, this code can also simulate one-level branch predictor using the branch history table as a comparison to the two-level one. All of the code are implemented in C++11 and are written on Ubuntu on Windows Subsystem Linux with GCC 5.4.0.

## Getting Started
You can get the code, compile them, and run them very easily by following these steps.

## Contributing and Citing
If you are interested to use or modify the code for your next project, please cite accordingly. I will be very grateful for any contribution on this code.
```
@misc{bagus_hanindhito_2020_3834733,
    author       = {Bagus Hanindhito},
    title        = {{Two Level Branch Predictor Simulator}},
    month        = May,
    year         = 2020,
    doi          = {10.5281/zenodo.3834733},
    version      = {1.0.0},
    publisher    = {Zenodo},
    url          = {https://doi.org/10.5281/zenodo.3834733}
    }
```

## Authors
Bagus Hanindhito
Undergraduate Student at Department of Electrical Engineering
Institut Teknologi Bandung
Graduate Student at Department of Electrical and Computer Engineering  
The University of Texas at Austin  

## License
The code is licensed under GNU Affero General Public License v3.0. Please see LICENSE file included in the source code.

## Acknowledgments
ET4067 VLSI for Digital Communication System, Fall 2014
* Achmad Fuad Mas'ud (Lecturer)

EE382M VLSI-I, Fall 2019 (https://www.cerc.utexas.edu/~jaa/vlsi/)
* Jacob Abraham (Lecturer)
* Ling Lin (TA)
* Hyunsu Chae (TA)
* Sunny Bhagia (TA)
* Reshma Rajarama Nayak (Team Member)
* Shvetha Senthil Kumar (Team Member)

EE382M Verification of Digital System, Spring 2020 (https://www.cerc.utexas.edu/~jaa/verification/)
* Jacob Abraham (Lecturer)
* Ling Lin (TA)
* Hyunsu Chae (TA)
* Ashen Ekanayake (Team Member)
* Tosin Jemilehin (Team Member)


