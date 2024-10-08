#!bin/bash

RED="$(printf '\033[31m')"
GREEN="$(printf '\033[32m')"
ORANGE="$(printf '\033[33m')"
BLUE="$(printf '\033[34m')"
PINK="$(printf '\033[35m')"
CYAN="$(printf '\033[36m')"
RESET="$(printf '\e[0m')"

clear

function intro() {
    cat << EOF
${RED}
Use: $0 [options]

Options:
  --help        More info.
  --netscan     Nmap scan, Host Discovery.
  --creator     Info from the creator

${RESET}
EOF
exit 0
}

  echo -e "${GREEN}                                                       "
  echo -e " __    _  _______  _______  _______  _______  _______  __   __ "
  echo -e "|  |  | ||       ||       ||  _    ||   _   ||       ||  | |  |"
  echo -e "|   |_| ||    ___||_     _|| |_|   ||  |_|  ||  _____||  |_|  |"
  echo -e "|       ||   |___   |   |  |       ||       || |_____ |       |"
  echo -e "|  _    ||    ___|  |   |  |  _   | |       ||_____  ||       |"
  echo -e "| | |   ||   |___   |   |  | |_|   ||   _   | _____| ||   _   |"
  echo -e "|_|  |__||_______|  |___|  |_______||__| |__||_______||__| |__|"
  echo -e "${RESET}                                                   "

  echo -e "${PINK}~Version 1.3~${RESET}"  "${CYAN}~By Pylon~${RESET}" 

#Ctrl + c 

function ctrl+c() {
  echo ""
  echo -e "\n${RED}[!] EXIT...${RESET}\n"
  exit 1
}

trap ctrl+c INT

function loading_dots() {
    local pid=$1
    local delay=0.5
    local spin='./'
    while ps -p $pid > /dev/null; do
        for ((i = 0; i < ${#spin}; i++)); do
            printf "\r%s" "${spin:$i:1}"
            sleep $delay
        done
    done
    printf "\r${GREEN}INSTALLED!${RESET}      \n" 
}


function netscan() { 

clear

echo -e "${GREEN}  _   _ ______ _______ _____  _____          _   _ ${RESET}"
echo -e "${GREEN} | \\ | |  ____|__   __/ ____|/ ____|   /\\   | \\ | |${RESET}"
echo -e "${GREEN} |  \\| | |__     | | | (___ | |       /  \\  |  \\| |${RESET}"
echo -e "${GREEN} | . \` |  __|    | |  \\___ \\| |      / /\\ \\ | . \` |${RESET}"
echo -e "${GREEN} | |\\  | |____   | |  ____) | |____ / ____ \\| |\\  |${RESET}"
echo -e "${GREEN} |_| \\_|______|  |_| |_____/ \\_____/ /    \\_\\_| \\_|${RESET}"
echo -e "${GREEN}                                                    ${RESET}"

if [ "$(whoami)" != "root" ]; then
    echo -e "\n${ORANGE}[!]${RESET}${RED} YOU ${RESET}${RED}NEED${RESET} ${RED}TO BE${RESET} ${ORANGE}ROOT${RESET} ${RED}TO USE ${GREEN}NETSCAN${RESET}"
    exit 1
fi

echo -e "\n${ORANGE}[1]Simple scan ${RESET}"
echo -e "\n${ORANGE}[2]Scan Services+Versions(Need Ports)${RESET}"
echo -e "\n${ORANGE}[3]Full Nmap Scan (Recommended) ${RESET}"
echo -e "\n${ORANGE}[4]Host Discovery (arp-scan) ${RESET}"
echo -e "\n${ORANGE}[5]Options ${RESET}"
echo -e "\n${ORANGE}[6]Exit${RESET}\n"

read -p "${BLUE}How do you want the scan?: ${RESET}" option param
echo 

  if [ "$option" == "1" ]; then
    if ! command -v nmap &> /dev/null; then
      echo -e "${RED}[!]${RESET}${BLUE} NMAP NOT INSTALLED${RESET}"
      sudo apt install -y nmap &>/dev/null & INSTALL_PID=$!
      loading_dots $!
    fi
    if [ "$param" == "--save" ]; then
      read -p "${RED}[${RESET}${ORANGE}!${RESET}${RED}]${RESET}${BLUE} Enter the target IP: ${RESET}" IP
      echo -e "${GREEN}Scanning ...${RESET}"
      sudo nmap -p- --open -n -Pn -sS --min-rate 5000 -vvv $IP -oN nmap_$IP.txt 
      echo -e "\n ${GREEN}[+] Scan saved in ${RESET}${ORANGE}nmap_$IP.txt${RESET}"
      exit 0
    fi

    read -p "${RED}[${RESET}${ORANGE}!${RESET}${RED}]${RESET}${BLUE} Enter the target IP: ${RESET}" IP
    echo -e "${GREEN}Scanning ...${RESET}"
    sudo nmap -p- --open -n -Pn -sS --min-rate 5000 -vvv $IP
    exit 0
  fi

  if [ "$option" == "2" ]; then
    if ! command -v nmap &> /dev/null; then
      echo -e "${RED}[!]${RESET}${BLUE} NMAP NOT INSTALLED${RESET}"
      sudo apt install -y nmap &>/dev/null & INSTALL_PID=$!
      loading_dots $!
    fi

    if [ "$param" == "--save" ]; then
      read -p "${RED}[${RESET}${ORANGE}!${RESET}${RED}]${RESET}${BLUE} Enter the target IP: ${RESET}" IP
      echo -e ""
      read -p "${PINK}[!]${RESET}${BLUE} SET PORTS: ${RESET}" ports
      echo -e "\n${GREEN}[+] Scanning ...${RESET}"
      sudo nmap -p$ports -sCV $IP -oN nmap_service_scan_$IP.txt
      echo -e "\n ${GREEN}[+] Scan saved in ${RESET}${ORANGE}nmap_service_scan_$IP.txt${RESET}"
      exit 0
    fi

    read -p "${RED}[${RESET}${ORANGE}!${RESET}${RED}]${RESET}${BLUE} Enter the target IP: ${RESET}" IP
    echo -e ""
    read -p "${PINK}[!]${RESET}${BLUE} SET PORTS: ${RESET}" ports
    echo -e "\n${GREEN}[+] Scanning ...${RESET}"
    sudo nmap -p$ports -sCV $IP
    exit 0
  fi

  if [ "$option" == "3" ]; then
    if ! command -v nmap &> /dev/null; then
      echo -e "${RED}[!]${RESET}${BLUE} NMAP NOT INSTALLED${RESET}"
      sudo apt install -y nmap &>/dev/null & INSTALL_PID=$!
      loading_dots $!
    fi

    if [ "$param" == "--save" ]; then
     read -p "${RED}[${RESET}${ORANGE}!${RESET}${RED}]${RESET}${BLUE} Enter the target IP: ${RESET}" IP
     echo ""
     echo -e "${GREEN}[+] Scanning ...${RESET}"
     sudo nmap -p- --open -sCVS --min-rate 5000 -n -vvv -Pn $IP -oN nmap_fullscan_$IP.txt
     echo -e "\n ${GREEN}[+] Scan saved in ${RESET}${ORANGE}nmap_fullscan_$IP.txt${RESET}"
     exit 0 
   fi

    read -p "${RED}[${RESET}${ORANGE}!${RESET}${RED}]${RESET}${BLUE} Enter the target IP: ${RESET}" IP
    echo ""
    echo -e "${GREEN}[+] Scanning ...${RESET}"
    sudo nmap -p- --open -sCVS --min-rate 5000 -n -vvv -Pn $IP 
    exit 0 
  fi

  if [ "$option" == "4" ]; then
    if ! command -v arp-scan &> /dev/null; then
      echo -e "${RED}[!]${RESET}${BLUE} ARP-SCAN NOT INSTALLED${RESET}"
      sudo apt install -y arp-scan &>/dev/null & INSTALL_PID=$!
      loading_dots $!
    fi   
    echo ""
    read -p "${PINK}[!]${RESET}${BLUE} NETWORK INTERFACE: ${RESET}" interface
    echo -e "\n${GREEN}[+] Discovering ...${RESET}\n"
    sudo arp-scan -I $interface --localnet
    exit 0
  fi

  function options() {
    clear
    echo -e "${GREEN}   ____  _____ _______ _____ ____  _   _  _____ ${RESET}"
    echo -e "${GREEN}  / __ \|  __ \__   __|_   _/ __ \| \ | |/ ____|${RESET}"
    echo -e "${GREEN} | |  | | |__) | | |    | || |  | |  \| | (___  ${RESET}"
    echo -e "${GREEN} | |  | |  ___/  | |    | || |  | | . \` |\\___ \ ${RESET}"
    echo -e "${GREEN} | |__| | |      | |   _| || |__| | |\  |____) |${RESET}"
    echo -e "${GREEN}  \____/|_|      |_|  |_____\____/|_| \_|_____/ ${RESET}"
    echo -e "${GREEN}                                                ${RESET}"
    cat << EOF
  ${BLUE}
    Use: number [options]

    Options:
        --save (only aviable in nmap scans):     Save in a .txt file the scan.
    
              Example:
              How do you want the scan?: 3 --save

  ${RESET}
EOF
read -p "${ORANGE} Back? (Yes/No): " input

  if [ "$input" == "Yes" ]; then
    netscan
  else 
    options
  fi
}

if [ "$option" == "5" ]; then
  options
fi

  if [ "$option" == "6" ]; then
    echo -e "\n${RED}[!] EXIT...${RESET}\n"
    exit 1
  fi 

}

function help() {
    cat << EOF
${RED}
Use: $0 [options]

Options:
  --help        More info.
  --netscan:     Nmap scan, Host Discovery. ${RESET}
${ORANGE}

${RESET}
EOF
exit 0
}


function creator() {
echo ""
    cat << EOF
${BLUE}Youtube:${RESET}${ORANGE} https://www.youtube.com/@Pylonet${RESET}
${BLUE}Blog:${RESET}${ORANGE} https://pylonet.pages.dev/${RESET}

${PINK}Ty for using ${GREEN}Netbash${RESET} <3${RESET}
EOF
exit 0
}

while [[ $# -gt 0 ]]; do
    case "$1" in
        --netscan)
            netscan
            shift
            ;;
        --help)
            help
            shift
            ;;
        --creator)
            creator
            shift
            ;;
            
    esac
done

if [ $# -eq 0 ]; then
  intro
  exit 0
fi

