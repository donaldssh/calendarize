#!/bin/bash

# DOWNLOAD THE CURRENT WEEK CALENDAR 
# ICT FOR INTERNET AND MULTIMEDIA: CYBERSYSTEMS + TELECOMMUNICATIONS
# FIRST SEMESTER 2020/2021
# select true for the course you follow

today=`date +'%d-%m-%Y'`

_3D_AUGMENTED_REALITY=true
_5G_SYSTEMS=false
CONVEX_OPTIMIZATION=false
CRYPTOGRAPHY=false
DIGITAL_SIGNAL_PROCESSING=false
FIBER_OPTICS=false
FOUNDATIONS_OF_DATABASES=false
GAME_THEORY=false
HIGH_LEVEL_PROGRAMMING=true
INFORMATION_SECURITY=false
INTERNET=false
LIFE_DATA_EPIDEMIOLOGY=false
Lab_di_Internet=false
MACHINE_LEARNING=false
MULTIMEDIA_CODING=true
NETWORK_SCIENCE=false
NEURAL_NETWORKS_AND_DEEP_LEARNING=true
OPTICAL_AND_QUANTUM_COMMUNICATIONS=false
PROGRAMMABLE_HARDWARE_DEVICES=false
PROGRAMMING_FOR_TELECOMMUNICATIONS=true
PROJECT_MANAGEMENT=false
PUBLIC_SPEAKING_LAB=false
WIRELESS_NETWORKS=false


exams_codes="ar_codes_=EC587381|EC587396|EC588184|EC587403|EC587420|EC587411|EC587373|EC587390|EC587117|EC570414|EC587399|ECDEI-LabInternet|EC587404|EC587398|EC587127|EC587371|EC587372|EC587126|EC587410|EC587423|EC587393|EC587388|EC587394|EC588182|EC587447|EC588186|EC587400|EC588189|EC587406|EC587424&"

exams_flags="ar_select_=${CRYPTOGRAPHY}|${HIGH_LEVEL_PROGRAMMING}|${LIFE_DATA_EPIDEMIOLOGY}|${MACHINE_LEARNING}|false|${PROGRAMMABLE_HARDWARE_DEVICES}|${_3D_AUGMENTED_REALITY}|${_5G_SYSTEMS}|${GAME_THEORY}|${INFORMATION_SECURITY}|${INTERNET}|${Lab_di_Internet}|${MULTIMEDIA_CODING}|${NETWORK_SCIENCE}|${PROGRAMMING_FOR_TELECOMMUNICATIONS}|false|${PROJECT_MANAGEMENT}|${PUBLIC_SPEAKING_LAB}|false|${CONVEX_OPTIMIZATION}|${DIGITAL_SIGNAL_PROCESSING}|false|false|${FIBER_OPTICS}|${FOUNDATIONS_OF_DATABASES}|false|false|${NEURAL_NETWORKS_AND_DEEP_LEARNING}|${OPTICAL_AND_QUANTUM_COMMUNICATIONS}|${WIRELESS_NETWORKS}"

url_download="http://agendastudentiunipd.easystaff.it/ec_download_ical_grid.php?view=easycourse&form-type=corso&include=corso&txtcurr=1+anno+-+CYBERSYSTEMS%2C1+anno+-+TELECOMMUNICATIONS&anno=2020&scuola=&corso=IN2371&anno2%5B%5D=002PD%7C1&anno2%5B%5D=001PD%7C1&visualizzazione_orario=cal&date=${today}&periodo_didattico=&_lang=en&list=0&week_grid_type=-1&ar_codes_=&ar_select_=&col_cells=0&empty_box=0&only_grid=0&highlighted_date=0&all_events=0&faculty_group=0&_lang=en&${exams_codes}${exams_flags}&txtaa=2020/2021&txtcorso=IN2371%20-%20ICT%20FOR%20INTERNET%20AND%20MULTIMEDIA%20-%20INGEGNERIA%20PER%20LE%20COMUNICAZIONI%20MULTIMEDIALI%20E%20INTERNET&txtanno=&docente=&attivita=&txtdocente=&txtattivita="


curl $url_download --output ~/.calendarize/calendar.ics

# remove all the commas, since they are not backslashed as stated by RFC5545 Specification for an .ics file
cat ~/.calendarize/calendar.ics|tr -d , > ~/.calendarize/calendar_without_commas.ics

calcurse -i ~/.calendarize/calendar_without_commas.ics
