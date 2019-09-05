# apss2bids
Convert APSS file data structure to BIDS standard

### Setting up the new dataset folder
In the same folder where the original dataset is located, create a new dataset 
folder, e.g. APSS-BIDS. In the new dataset folder, create then three subfolders:
code, input and derivatives. In the folder code, clone this repository.
```
mkdir APSS-BIDS
cd APSS-BIDS
mkdir code input derivatives
cd code
git clone https://github.com/FBK-NILab/apss2bids.git 
```

### Execute the conversion to BIDS
Run the script apss2bids.sh for the subject of interest, specifying a tag. The list
of possible subjects is contained in subject_list.txt. E.g., to run the conversion
on the subject Subject_20_FeMa and tag APSS, type:
```
cd apss2bids
./apss2bids.sh Subject_20_FeMa APSS
```

### Directory tree proposal
```
APSS-BIDS \
    code
    input \
        dwi
        anat
    derivatives \
        tractography_APSS
        clinical_dissection_APSS
```
