#!/bin/bash
text="Dobry:den:zdravi:Vás:Pepa:Novák"
echo $text | awk -F ":" '{print $2}'
echo $text | awk -F ":" '{print $4}'
echo $text | awk -F ":" '{print $6}'
