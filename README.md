# dock2interaction_profile

  This is a simple script to use [plip](https://github.com/pharmai/plip) to **batch analysis** of interactions between proteins and ligands that are results of smina (vina) docking.

  Note that you should change the directory settings in the script, you can also change the process number in the script.

  The script can combine the ligands and receptors automatically, just prepare the receptor directory and results directory.



## dependence

```
plip
openbabel
```

how to obtain plip:

```shell
docker pull pharmai/plip:latest
```



## Usage

Your work directory should look like this:

```shell
.
├── analysis.sh
├── dock2interaction_profile.md
├── receptor
│   ├── receptor1
│   │   ├── A0A1D8AVC9.pdb
│   │   ├── A0A1D8AVC9_addH.pdbqt
│   │   └── A0A1D8AVC9_fix.pdb
│   └── receptor2
│       ├── A0A1J5S7S8.pdb
│       ├── A0A1J5S7S8_addH.pdb
│       ├── A0A1J5S7S8_addH.pdbqt
│       └── A0A1J5S7S8_fix.pdb
└── results
    ├── receptor1_ligand1
    │   ├── receptor1_ligand1.pdbqt
    │   ├── receptor1_ligand1_01.pdbqt
    │   ├── receptor1_ligand1_02.pdbqt
    │   ├── receptor1_ligand1_03.pdbqt
    │   ├── receptor1_ligand1_04.pdbqt
    │   ├── receptor1_ligand1_05.pdbqt
    │   ├── receptor1_ligand1_06.pdbqt
    │   ├── receptor1_ligand1_07.pdbqt
    │   ├── receptor1_ligand1_08.pdbqt
    │   ├── receptor1_ligand1_09.pdbqt
    │   ├── receptor1_ligand1_10.pdbqt
    │   ├── receptor1_ligand1_11.pdbqt
    │   ├── receptor1_ligand1_12.pdbqt
    │   ├── receptor1_ligand1_13.pdbqt
    │   ├── receptor1_ligand1_14.pdbqt
    │   ├── receptor1_ligand1_15.pdbqt
    │   ├── receptor1_ligand1_16.pdbqt
    │   ├── receptor1_ligand1_17.pdbqt
    │   ├── receptor1_ligand1_18.pdbqt
    │   ├── receptor1_ligand1_19.pdbqt
    │   ├── receptor1_ligand1_20.pdbqt
    │   ├── receptor1_ligand1_21.pdbqt
    │   ├── receptor1_ligand1_22.pdbqt
    │   ├── receptor1_ligand1_23.pdbqt
    │   ├── receptor1_ligand1_24.pdbqt
    │   ├── receptor1_ligand1_25.pdbqt
    │   ├── receptor1_ligand1_26.pdbqt
    │   ├── receptor1_ligand1_27.pdbqt
    │   ├── receptor1_ligand1_28.pdbqt
    │   ├── receptor1_ligand1_29.pdbqt
    │   ├── receptor1_ligand1_30.pdbqt
    │   ├── receptor1_ligand1_31.pdbqt
    │   ├── receptor1_ligand1_32.pdbqt
    │   ├── receptor1_ligand1_33.pdbqt
    │   ├── receptor1_ligand1_34.pdbqt
    │   ├── receptor1_ligand1_35.pdbqt
    │   ├── receptor1_ligand1_36.pdbqt
    │   ├── receptor1_ligand1_37.pdbqt
    │   ├── receptor1_ligand1_38.pdbqt
    │   ├── receptor1_ligand1_39.pdbqt
    │   └── receptor1_ligand1_40.pdbqt
    └── receptor2_ligand1
        ├── receptor1_ligand11.pdbqt
        ├── receptor1_ligand1_01.pdbqt
        ├── receptor1_ligand1_02.pdbqt
        ├── receptor1_ligand1_03.pdbqt
        ├── receptor1_ligand1_04.pdbqt
        ├── receptor1_ligand1_05.pdbqt
        ├── receptor1_ligand1_06.pdbqt
        ├── receptor1_ligand1_07.pdbqt
        ├── receptor1_ligand1_08.pdbqt
        ├── receptor1_ligand1_09.pdbqt
        ├── receptor1_ligand1_10.pdbqt
        ├── receptor1_ligand1_11.pdbqt
        ├── receptor1_ligand1_12.pdbqt
        ├── receptor1_ligand1_13.pdbqt
        ├── receptor1_ligand1_14.pdbqt
        ├── receptor1_ligand1_15.pdbqt
        ├── receptor1_ligand1_16.pdbqt
        ├── receptor1_ligand1_17.pdbqt
        ├── receptor1_ligand1_18.pdbqt
        ├── receptor1_ligand1_19.pdbqt
        ├── receptor1_ligand1_20.pdbqt
        ├── receptor1_ligand1_21.pdbqt
        ├── receptor1_ligand1_22.pdbqt
        ├── receptor1_ligand1_23.pdbqt
        ├── receptor1_ligand1_24.pdbqt
        ├── receptor1_ligand1_25.pdbqt
        ├── receptor1_ligand1_26.pdbqt
        ├── receptor1_ligand1_27.pdbqt
        ├── receptor1_ligand1_28.pdbqt
        ├── receptor1_ligand1_29.pdbqt
        ├── receptor1_ligand1_30.pdbqt
        ├── receptor1_ligand1_31.pdbqt
        ├── receptor1_ligand1_32.pdbqt
        ├── receptor1_ligand1_33.pdbqt
        ├── receptor1_ligand1_34.pdbqt
        ├── receptor1_ligand1_35.pdbqt
        ├── receptor1_ligand1_36.pdbqt
        ├── receptor1_ligand1_37.pdbqt
        ├── receptor1_ligand1_38.pdbqt
        ├── receptor1_ligand1_39.pdbqt
        └── receptor1_ligand1_40.pdbqt

6 directories, 91 files
```



one command to run analysis:

```shell
bash analysis.sh
```