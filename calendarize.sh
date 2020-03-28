#!/bin/bash

# DOWNLOAD THE CURRENT WEEK CALENDAR
# ICT FOR INTERNET AND MULTIMEDIA - CYBERSYSTEMS
# select true for the course you follow

graph_theory=false                      
human_data_analytics=true         
optimization=false                     
digital_forensics=true
network_analysis_and_simulation=false
network_coding=false                     
web_application=true                
big_data_computing_2=false              
big_data_computing_1=false              
computer_vision=true                
databases=true                       
stochastic_processis=false              

today=`date +'%d-%m-%Y'`

exams_codes="ar_codes_=|EC553837|EC553814|EC553840|EC553831|EC553800|EC553818|EC553637|EC553827|EC553828|EC554452|EC553830|EC554493&"

exams_flags="ar_select_=|${graph_theory}|${human_data_analytics}|${optimization}|${digital_forensics}|${network_analysis_and_simulation}|${network_coding}|${web_application}|${big_data_computing_2}|${big_data_computing_1}|${computer_vision}|${databases}|${stochastic_processis}"

url_download="agendastudentiunipd.easystaff.it/ec_download_ical_grid.php?view=easycourse&form-type=corso&include=corso&anno=2019&scuola=&corso=IN2371&anno2%5B%5D=002PD%7C1&visualizzazione_orario=cal&date=${today}&periodo_didattico=&_lang=en&list=0&week_grid_type=-1&ar_codes_=&ar_select_=&col_cells=0&empty_box=0&only_grid=0&highlighted_date=0&faculty_group=0&_lang=en&${exams_codes}${exams_flags}&txtaa=2019/2020&txtcorso=IN2371%20-%20ICT%20FOR%20INTERNET%20AND%20MULTIMEDIA%20-%20INGEGNERIA%20PER%20LE%20COMUNICAZIONI%20MULTIMEDIALI%20E%20INTERNET%20(Laurea%20Magistrale)&txtanno=&docente=&attivita=&txtdocente=&txtattivita="

curl $url_download --output ~/.calendarize/calendar.ics

calcurse -i ~/.calendarize/calendar.ics
