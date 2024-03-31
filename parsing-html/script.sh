#!/bin/sh
if ["$1" == ""]
then
        echo "How to use: $0 example.com"
else

cat << "EOF"
***************************************************************************************
*                                                                                     *
*                                                                                     *
*  88""Yb    db    88""Yb .dP"Y8 88 88b 88  dP""b8     88  88 888888 8b    d8 88      *
*  88__dP   dPYb   88__dP `Ybo." 88 88Yb88 dP   `"     88  88   88   88b  d88 88      *
*  88"""   dP__Yb  88"Yb  o.`Y8b 88 88 Y88 Yb  "88     888888   88   88YbdP88 88  .o  *
*  88     dP""""Yb 88  Yb 8bodP' 88 88  Y8  YboodP     88  88   88   88 YY 88 88ood8  *
*                                                                                     *
*                                                                                     *
***************************************************************************************
EOF
        echo "\n\n"

        wget -q  $1
        grep href index.html | cut -d "/" -f 3 | grep "\." | cut -d '"' -f 1 | grep -v "<l" > lista.txt

        echo "Resolving Hosts .......\n"

        for url in $(cat lista.txt);
        do
                host $url | grep "has address";
        done
        rm lista.txt 
        rm index.html
fi
