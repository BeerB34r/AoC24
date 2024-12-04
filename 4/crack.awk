BEGIN { FS="" }
{
    for (i=1;i<=NF;i++) {
        a[NR,i]=$i
    }
    numCols = (NF>numCols?NF:numCols)
    numRows = NR
}
END {
    rowNr=1
    for (colNr=1;colNr<=numCols;colNr++) {
        for (;rowNr<=numRows;rowNr++) {
            printf "%*s", colNr-1, ""
            for (delta=0;delta<rowNr;delta++) {
                printf "%s%s", a[rowNr-delta,colNr+delta], (delta<(rowNr-1)?FS:RS)
            }
        }
        rowNr=numRows
    }
}
