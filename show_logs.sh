#!/bin/bash
# -*- coding: utf8
# Auteur: Cagliostro <atfield2501@gmail.com>
# Script de visualisation des differents fichier log du systeme.

ROUGE="\\033[1;31m"
JAUNE="\\033[1;33m"
VERT="\\033[1;32m"

Fonction_Version(){
   echo -e "$VERT""  *****************  "
   echo -e "$VERT""  *  Show_logs    *  "
   echo -e "$VERT""  *****************  "
   echo -e "$VERT""  **   (;,,;)    **  "
   echo -e "$VERT""  *****************  "
   echo -e "$VERT""  *    V  1.O     *  "
   echo -e "$VERT""  *****************  "
   echo -e "$JAUNE""----------------------"
   exit
}




Fonction_Aide(){                                 
   echo -e "$VERT" "Script de visualisation des differents fichier log du systeme\n"
   echo -e "$VERT" "usage:\n"
   echo -e "$VERT" "Show_logs // Appelé sans option, renvois tous les logs confondus"
   echo -e "$VERT" "Show_logs -v //pour le numéro de version\n"
   echo -e "$VERT" "Show_logs -A // (Acces) Pour les tentatives de ce connexion au serveur (/var/log/auth.log)\n"
   echo -e "$VERT" "Show_logs -B //(Bug) Pour les messages d'erreurs, les bugs et autres alertes (/var/log/message & /var/log/syslog) \n"
   echo -e "$VERT" "Show_logs -rkhunter // Pour le résultat filtré des logs de rkhunter"
   echo -e "$VERT" "Show_logs -tor // Pour les logs de tor"
   exit
}


echo -e "$JAUNE""----------------------"             # DEBUT DU PROGRAMME//////////////////////////////////////////
echo -e "$VERT""  $0              "
echo -e "$VERT""    PID="$$"          "
echo -e "$JAUNE""----------------------";echo -e "$VERT""\n"



if [ $# = 0 ]                                        # Tous les logs.
then
    cat /var/log/auth.log 
    cat /var/log/fail2ban.log
    cat /var/log/fail2ban.log | grep authentication"\ "failure
    echo -e "$JAUNE""----------------------";echo -e "$VERT""\n"

elif [ $1 = -v ]                                     # Pour appel de numéro de version.
then
    Fonction_Version
    echo -e "$JAUNE""----------------------";echo -e "$VERT""\n"

elif [ $1 = -h ]                                     # Pour l'appel du parametre -h (aide/help)
then
    Fonction_Aide
    echo -e "$JAUNE""----------------------";echo -e "$VERT""\n"

elif [ $1 = -A ]                                     # Uniquement les tentaives d'acces.
then
    cat /var/log/auth.log | grep authentication"\ "failure 
    echo -e "$JAUNE""----------------------";echo -e "$VERT""\n"

elif [ $1 = -B ]                                     # Pour les pb et message d'alerte du syteme.
then
    cat /var/log/message & cat /var/log/syslog
    echo -e "$JAUNE""----------------------";echo -e "$VERT""\n"


elif [ $1 = -tor ]                                     # Pour les pb et message d'alerte du syteme.
then
    cat /var/log/tor/log
    echo -e "$JAUNE""----------------------";echo -e "$VERT""\n"


elif [ $1 = -rkhunter ]                                     # Pour les log rkhunter.
then
    sudo /var/log/message & cat /var/log/syslog
    echo -e "$JAUNE""----------------------";echo -e "$VERT""\n"

else
    echo -e "$ROUGE""  Erreur...";echo -e "$VERT""\n"
    Fonction_Aide
fi
