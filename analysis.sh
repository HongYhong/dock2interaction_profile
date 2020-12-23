
######################################################################
#
#   a script to use plip to batch analysis protein-ligand interaction
#
#######################################################################

#author : yanhong hong



resultdir='$PWD/results'
receptordir='$PWD/receptor'
analysisdir='$PWD/analysis'
process_num=8




for result in ${resultdir}/*
do
    result=`basename $result`
    receptorname=${result%_*_*} #extract the receptor name.In my case,e.g. A0A1D8AVC9_addH_DON --> A0A1D8AVC9
    mkdir ${analysisdir}/${result}
    mkdir ${analysisdir}/${result}/receptor
    mkdir ${analysisdir}/${result}/complex
    cp ${receptordir}/${receptorname}/*.pdbqt ${analysisdir}/${result}/receptor
    cp ${resultdir}/${result}/*ligand*.pdbqt ${analysisdir}/${result}     # make sure that the result file name has ligand(e.g. A0A1D8AVC9_addH_DON_ligand_01.pdbqt) which is the default output of vina_split. 
    cd ${analysisdir}/${result}
    babel -ipdbqt receptor/${receptorname}*.pdbqt -opdb receptor/${receptorname}.pdb
    #convert ligand file format.
    for ligand in *.pdbqt
    do
        echo "babel -ipdbqt ${ligand} -opdb "`basename $ligand .pdbqt`".pdb"
    done | xargs -n 1 -I {} -P ${process_num} bash -c "{}" 
    #combine receptor and ligand.
    for ligandpdb in *.pdb
    do
        echo "babel -j "${ligandpdb}" receptor/"${receptorname}".pdb -opdb complex/complex_"${ligandpdb}
    done | xargs -n 1 -I {} -P ${process_num} bash -c "{}"
done


for result in ${resultdir}/*
do
    result=`basename $result`
    for complex in ${analysisdir}/${result}/complex/*.pdb
    do
        complex_base=`basename ${complex} .pdb`
        mkdir ${analysisdir}/${result}/complex/${complex_base}
        mv ${complex} ${analysisdir}/${result}/complex/${complex_base}
    done

    for complexdir in ${analysisdir}/${result}/complex/*
    do
        cd $complexdir
        echo -e ${complexdir}"\n sudo docker run   -v "${PWD}":/results     -w /results     -u $(id -u "${USER}"):$(id -g "${USER}")  pharmai/plip:latest  -f *.pdb -xtyp"
        cd ${analysisdir}/..
    done | xargs -n 2  -P ${process_num}  -d'\n'  bash -c 'cd $0; $1'
done