# Netfabb Tools
Tools for working with data from Autodesk Netfabb in Python

## Description of files
- [ensight.py](ensight.py) - Read .geo and .ens files in EnSight Fortran Binary format
- [extract-netfabb-data-binary.py](extract-netfabb-data-binary.py) - Input a directory with Netfabb (binary) results. Outputs .npz files with vertex coordinates, edge connectivities, and all nodal quantities at the final time step.
- [extract-netfabb-data-ascii.py](extract-netfabb-data-ascii.py) - Same as above, but for ASCII result files.

## Provided examples
2 Netfabb result files are included, both from shapes in the [Fusion360 Gallery Dataset](https://github.com/AutodeskAILab/Fusion360GalleryDataset)
- [ASCII Example](example-result-files/ascii)
- [Fortran Binary Example](example-result-files/binary)

## Data Generation
The ability to run a Netfabb simulation for a large number of parts is made possible using the `pan` command for batch simulation. The procedure is listed below:  

- 1. Edit the paths and other variables as needed in the [batch script](data-gen/run.bat) and the [Python script](data-gen/batch-simulate.py), etc.
- 2. Populate the 'train' and 'test' fields of the [json file](data-gen/simple_train_test.json) with the names of stl files to simulate. Currently it contains the parts from the Fusion360 Gallery segmentation dataset.
- 3. Replace the (input files)[data-gen/input], ensuring each file refers to the correct input file names
- 4. Edit the [indices to simulate](data-gen/start-stop-indices.txt). E.g. `0 2500` will simulate parts 0 to 2499 from the json
- 5. Run run.bat


## Useful links
- [Netfabb Output Files](https://help.autodesk.com/view/NETF/2024/ENU/?guid=GUID-FFA9FD93-2501-42A7-9272-1CB462FBC077) - 
Explanations of what each output file contains

- [Netfabb User Manual PDF Download](https://www.autodesk.com/akn-aknsite-article-attachments/ae612cb3-8d78-4bad-a6b5-26104ffbd63d.pdf) - 
Generally useful user manual for Netfabb

- [Netfabb Examples Manual](https://damassets.autodesk.net/content/dam/autodesk/external-assets/support-articles/sample-files-and-offline-documents-for-netfabb/examples_2024_0.pdf) - 
Contains examples of Netfabb output for different types of simulations

- [EnSight User Manual](https://dav.lbl.gov/archive/NERSC/Software/ensight/doc/Manuals/UserManual.pdf) - 
Documents the binary and ASCII EnSight file formats, which Netfabb uses for its simulation results


## Notes about output files
- For .geo element connectivity information, see page 402 of the EnSight manual linked above.
- For the mechanical simulation, there are 2 mechanical output file indices for every 1 .geo file index -- and then an extra .geo file with index 0. Time step information is in the .case file. 
  - The highest mechanical output file index corresponds to the highest .geo file index. This .geo contains the part only and not the build plate.