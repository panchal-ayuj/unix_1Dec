#!/bin/bash
while IFS="," read -r rec_column1 rec_column2 rec_column3 rec_column4
do
  echo "$rec_column3" >> Issuing_bank.txt
done < 100_CC_Records.csv

while IFS="," read -r rec_column1
do 
    mkdir "$rec_column1"
done < Issuing_bank.txt

while IFS="," read -r rec_column1 rec_column2 rec_column3 rec_column4
do
    mkdir "$rec_column3"/"$rec_column2"
done < 100_CC_Records.csv

rm -r "Issuing Bank"

while IFS="," read -r rec_column1 rec_column2 rec_column3 rec_column4 rec_column5 rec_column6 rec_column7 rec_column8 rec_column9 rec_column10 rec_column11
do
    date1="12/2023"

    date2=$(echo $date1 | cut -d '/' -f 1)
    date3=$(echo $date1 | cut -d '/' -f 2)

    date4=$(echo $rec_column8 | cut -d '/' -f 1)
    date5=$(echo $rec_column8 | cut -d '/' -f 2)
    if [ "$date3" -lt "$date5" ];
    then
        echo "Card Type Code: "$rec_column1"" >> "$rec_column4".active
        echo "Card Type Full Name: "$rec_column2""  >> "$rec_column4".active
        echo "Issuing Bank: "$rec_column3"" >> "$rec_column4".active
        echo "Card Number: "$rec_column4"" >> "$rec_column4".active
        echo "Card Holder's Name: "$rec_column5"" >> "$rec_column4".active
        echo "CVV/CVV2: "$rec_column6"" >> "$rec_column4".active
        echo "Issue Date: "$rec_column7"" >> "$rec_column4".active
        echo "Expiry Date: "$rec_column8"" >> "$rec_column4".active
        echo "Billing Date: "$rec_column9"" >> "$rec_column4".active
        echo "Card Pin: "$rec_column10"" >> "$rec_column4".active
        echo "Credit Limit: "$rec_column11"" >> "$rec_column4".active
        mv "$rec_column4".active "$rec_column3"/"$rec_column2"
    elif [ "$date3" -eq "$date5" ] && [ "$date2" -le "$date4" ];
    then
        echo "Card Type Code: "$rec_column1"" >> "$rec_column4".active
        echo "Card Type Full Name: "$rec_column2""  >> "$rec_column4".active
        echo "Issuing Bank: "$rec_column3"" >> "$rec_column4".active
        echo "Card Number: "$rec_column4"" >> "$rec_column4".active
        echo "Card Holder's Name: "$rec_column5"" >> "$rec_column4".active
        echo "CVV/CVV2: "$rec_column6"" >> "$rec_column4".active
        echo "Issue Date: "$rec_column7"" >> "$rec_column4".active
        echo "Expiry Date: "$rec_column8"" >> "$rec_column4".active
        echo "Billing Date: "$rec_column9"" >> "$rec_column4".active
        echo "Card Pin: "$rec_column10"" >> "$rec_column4".active
        echo "Credit Limit: "$rec_column11"" >> "$rec_column4".active
        mv "$rec_column4".active "$rec_column3"/"$rec_column2"
    else
        echo "Card Type Code: "$rec_column1"" >> "$rec_column4".expired
        echo "Card Type Full Name: "$rec_column2""  >> "$rec_column4".expired
        echo "Issuing Bank: "$rec_column3"" >> "$rec_column4".expired
        echo "Card Number: "$rec_column4"" >> "$rec_column4".expired
        echo "Card Holder's Name: "$rec_column5"" >> "$rec_column4".expired
        echo "CVV/CVV2: "$rec_column6"" >> "$rec_column4".expired
        echo "Issue Date: "$rec_column7"" >> "$rec_column4".expired
        echo "Expiry Date: "$rec_column8"" >> "$rec_column4".expired
        echo "Billing Date: "$rec_column9"" >> "$rec_column4".expired
        echo "Card Pin: "$rec_column10"" >> "$rec_column4".expired
        echo "Credit Limit: "$rec_column11"" >> "$rec_column4".expired
        mv "$rec_column4".expired "$rec_column3"/"$rec_column2"
    fi
done < 100_CC_Records.csv

rm Card\ Number*
rm Issuing_bank.txt