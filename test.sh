#!/bin/bash
# date1="12/2023"

# date2=$(echo $date1 | cut -d '/' -f 1)
# date3=$(echo $date1 | cut -d '/' -f 2)

# rec_column8="09/2023"
# date4=$(echo $rec_column8 | cut -d '/' -f 1)
# date5=$(echo $rec_column8 | cut -d '/' -f 2)


# VAR1="Linuxize"
# VAR2="Ubuntu"

# if [ "$date3" -ge "$date5" ]; then
#     echo "${VAR1} is lexicographically greater then ${VAR2}."
# elif [[ "$VAR1" < "$VAR2" ]]; then
#     echo "${VAR2} is lexicographically greater than ${VAR1}."
# else
#     echo "Strings are equal"
# fi
now=$(date)
echo "$now"
