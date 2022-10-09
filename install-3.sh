#!/bin/bash
###################################################################################################
#
#       AUTOR :         François DOSSOU
#       DATE :          7/10/2022
#       DESCRIPTION :   install software and update of mac os
#
##################################################################################################
#   
#       Description     : This script is meant to be used on a factory config Mac
#       Usage           : Execute this script on admin session and change links for a news version
#
###################################################################################################

#link of download
WhatsApp_link="https://scontent-cdt1-1.xx.fbcdn.net/v/t39.16592-6/10000000_536568911610931_7579402166813793009_n.dmg/files-WhatsApp.dmg?_nc_cat=101&ccb=1-7&_nc_sid=ab91e1&_nc_ohc=AxxhJSAFK_gAX9nrUW-&_nc_ht=scontent-cdt1-1.xx&oh=00_AT-W0cDNOtTCmAeNid-faTMlCEy5PhzQIxUOsI6EaUMi_g&oe=6344AD92"
Aircall_link="https://download-electron.aircall.io/Aircall-2.26.3.dmg"
Telegram_link="https://telegram.org/dl/macos"
krisp_link=""
Chrome_link="https://dl.google.com/chrome/mac/universal/stable/GGRO/googlechrome.dmg"
Slack_link="https://downloads.slack-edge.com/releases/macos/4.28.184/prod/universal/Slack-4.28.184-macOS.dmg"
# all function

function install_chrome(){
    echo "Chrome is installing"


    curl -s -L -o Chrome.dmg $Chrome_link
    hdiutil attach Chrome.dmg
    ditto -rsrc "/Volumes/Google Chrome/Google Chrome.app" "/Applications/Google Chrome.app"
    hdiutil detach "/Volumes/Google Chrome"
    rm Chrome.dmg
    echo "Chrome installed"
    
}

function install_telegram(){
    echo "telegram is installing"


    curl -s -L -o telegram.dmg $Telegram_link
    hdiutil attach telegram.dmg
    ditto -rsrc "/Volumes/Telegram/Telegram.app" "/Applications/Telegram.app"
    hdiutil detach "/Volumes/Telegram"
    rm telegram.dmg
    echo "telegram installed"
    
}

function install_Slack(){
    echo "Slack is installing"


    curl -s -L -o Slack.dmg $Slack_link
    hdiutil attach Slack.dmg
    ditto -rsrc "/Volumes/Slack/Slack.app" "/Applications/Slack.app"
    hdiutil detach "/Volumes/Slack"
    rm Slack.dmg
    echo "Slack installed"
    
}

function install_Aircall(){
    echo "Aircall is installing"


    curl -s -L -o Aircall.dmg $Aircall_link
    hdiutil attach Aircall.dmg
    ditto -rsrc "/Volumes/Aircall/Aircall.app" "/Applications/Aircall.app"
    hdiutil detach "/Volumes/Aircall"
    rm Aircall.dmg
    echo "Aircall installed"
    
}

function install_Whatsapp(){
    echo "Whatsapp is installing"


    curl -s -L -o Whatsapp.dmg $WhatsApp_link
    hdiutil attach Whatsapp.dmg
    ditto -rsrc "/Volumes/Whatsapp/Whatsapp.app" "/Applications/Whatsapp.app"
    hdiutil detach "/Volumes/Whatsapp"
    rm Whatsapp.dmg
    echo "Whatsapp installed"
    
}

function install_krisp(){
    # function not ready
    echo "krisp is installing"


    curl -s -L -o krisp.dmg $krisp_link
    installer -pkg krisp_1.39.5.pkg -target /Applications/
    echo "krisp installed"
    
}

function rename_device(){
    Serial_tag=$(system_profiler SPHardwareDataType | grep Serial | awk '{print $4}')
    Name= "LTMA-$Serial_tag"
    
    sudo scutil --set ComputerName $Name
    sudo scutil --set LocalHostName $Name
    sudo scutil --set HostName $Name && echo -e "[Success] Mac's name is modified: $Name \n " || echo -e "[Erreur] Mac's name was not modified\n"
}

function add_printer(){
    # Adding XEROX printers via IPP
    printer_name= "XEROX_OPENSPACE"
    ip_printer  = "172.32.6.132"
    lpadmin -p $printer_name -D "printer - openspace" -E -v ipp://ip_printer/ipp -m everywhere && echo -e "[Success] Printer $printer_name is added\n" || echo -e "[Erreur] Printer Ricoh 1 was not added\n"
}




