#!/bin/bash

#=============================================================================
# SSHPlus Manager - Hızlı Kurulum Scripti
# Geliştirici: @requmen
# Ubuntu 22.04+ Optimize
# Tarih: 2025-12-05
# Versiyon: v39
#=============================================================================

# Renkler
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
CYAN='\033[1;36m'
WHITE='\033[1;37m'
RESET='\033[0m'

# Root kontrolü
if [[ "$(whoami)" != "root" ]]; then
    echo -e "${RED}[HATA]${RESET} Bu script root yetkisi ile çalıştırılmalıdır!"
    echo -e "${YELLOW}Lütfen 'sudo' kullanın veya root kullanıcısına geçin.${RESET}"
    exit 1
fi

# Banner
clear
echo -e "${BLUE}╔════════════════════════════════════════════════════╗${RESET}"
echo -e "${BLUE}║${WHITE}                                                    ${BLUE}║${RESET}"
echo -e "${BLUE}║${GREEN}        SSHPLUS MANAGER - HIZLI KURULUM            ${BLUE}║${RESET}"
echo -e "${BLUE}║${WHITE}                  by @requmen                       ${BLUE}║${RESET}"
echo -e "${BLUE}║${YELLOW}                 Versiyon: v39                      ${BLUE}║${RESET}"
echo -e "${BLUE}║${WHITE}                                                    ${BLUE}║${RESET}"
echo -e "${BLUE}╚════════════════════════════════════════════════════╝${RESET}"
echo ""

# Ubuntu versiyon kontrolü
if [[ -f /etc/os-release ]]; then
    source /etc/os-release
    if [[ "$ID" == "ubuntu" ]]; then
        version=$(echo $VERSION_ID | cut -d. -f1)
        if [[ $version -lt 22 ]]; then
            echo -e "${YELLOW}[UYARI]${RESET} Bu script Ubuntu 22.04+ için optimize edilmiştir."
            echo -e "${YELLOW}Mevcut versiyon: Ubuntu $VERSION_ID${RESET}"
            echo -e "${CYAN}Devam etmek istiyor musunuz? [e/H]:${RESET} "
            read -r response
            if [[ ! "$response" =~ ^[Ee]$ ]]; then
                echo -e "${RED}Kurulum iptal edildi.${RESET}"
                exit 0
            fi
        else
            echo -e "${GREEN}✓ Ubuntu $VERSION_ID tespit edildi${RESET}"
        fi
    elif [[ "$ID" == "debian" ]]; then
        echo -e "${GREEN}✓ Debian $VERSION_ID tespit edildi${RESET}"
    else
        echo -e "${YELLOW}[UYARI]${RESET} Desteklenmeyen işletim sistemi: $PRETTY_NAME"
        echo -e "${CYAN}Devam etmek istiyor musunuz? [e/H]:${RESET} "
        read -r response
        if [[ ! "$response" =~ ^[Ee]$ ]]; then
            echo -e "${RED}Kurulum iptal edildi.${RESET}"
            exit 0
        fi
    fi
fi

echo ""
echo -e "${CYAN}Bu script şunları yapacak:${RESET}"
echo -e "${WHITE}  • Sistem güncellemesi${RESET}"
echo -e "${WHITE}  • Gerekli paketlerin kurulumu${RESET}"
echo -e "${WHITE}  • SSHPlus Manager modüllerinin kurulumu${RESET}"
echo -e "${WHITE}  • Firewall yapılandırması${RESET}"
echo -e "${WHITE}  • Otomatik başlatma ayarları${RESET}"
echo ""
echo -e "${YELLOW}Kurulum yaklaşık 5-10 dakika sürecektir.${RESET}"
echo ""
echo -e "${CYAN}Kuruluma başlamak istiyor musunuz? [E/h]:${RESET} "
read -e -i E response

if [[ ! "$response" =~ ^[Ee]$ ]]; then
    echo -e "${RED}Kurulum iptal edildi.${RESET}"
    rm -f "$0"
    exit 0
fi

# Log dosyası
LOG_FILE="/var/log/sshplus-install.log"
mkdir -p "$(dirname "$LOG_FILE")"
echo "=== SSHPlus Manager Kurulum Başladı: $(date) ===" > "$LOG_FILE"

# İlerleme fonksiyonu
show_progress() {
    local message="$1"
    echo -ne "${CYAN}${message}...${RESET} "
}

show_success() {
    echo -e "${GREEN}✓${RESET}"
}

show_error() {
    echo -e "${RED}✗${RESET}"
}

# Sistem güncelleme
show_progress "Sistem güncelleniyor"
apt-get update -y >> "$LOG_FILE" 2>&1 && show_success || show_error

# Temel paketler
show_progress "Temel paketler kuruluyor"
apt-get install -y wget curl git >> "$LOG_FILE" 2>&1 && show_success || show_error

# Python 3 ve pip
show_progress "Python 3 kuruluyor"
apt-get install -y python3 python3-pip >> "$LOG_FILE" 2>&1 && show_success || show_error

# Gerekli araçlar
show_progress "Sistem araçları kuruluyor"
packages=(
    "bc" "screen" "nano" "vim" "unzip" "lsof" "net-tools"
    "dos2unix" "nload" "jq" "figlet" "htop" "iftop"
)

for pkg in "${packages[@]}"; do
    apt-get install -y "$pkg" >> "$LOG_FILE" 2>&1
done
show_success

# Python paketleri
show_progress "Python paketleri kuruluyor"
pip3 install speedtest-cli >> "$LOG_FILE" 2>&1 && show_success || show_error

# Dizinleri oluştur
show_progress "Dizinler oluşturuluyor"
mkdir -p /etc/SSHPlus/{senha,userteste,.tmp}
mkdir -p /etc/bot/{info-users,arquivos,revenda,suspensos}
touch /etc/SSHPlus/Exp
touch /etc/bot/{lista_ativos,lista_suspensos}
show_success

# Modülleri indir
show_progress "Modüller indiriliyor"
GITHUB_USER="requmen"
GITHUB_REPO="sshplus-manager-improved"
BASE_URL="https://raw.githubusercontent.com/${GITHUB_USER}/${GITHUB_REPO}/master"

modules=(
    "menu" "criarusuario" "remover" "alterarsenha" "sshmonitor"
    "conexao" "detalhes" "otimizar" "speedtest" "banner"
    "botssh" "slow_dns" "addhost" "delhost" "badvpn"
    "blockt" "limiter" "userbackup" "alterarlimite" "ajuda"
    "criarteste" "droplimiter" "expcleaner" "infousers"
    "instsqd" "mudardata" "reiniciarservicos" "reiniciarsistema"
    "attscript" "delscript" "verifatt" "uexpired" "senharoot"
    "verifbot"
)

failed_modules=()
for module in "${modules[@]}"; do
    if wget -qO "/bin/${module}" "${BASE_URL}/Modulos/${module}" >> "$LOG_FILE" 2>&1; then
        chmod +x "/bin/${module}"
    else
        failed_modules+=("$module")
    fi
done

if [ ${#failed_modules[@]} -eq 0 ]; then
    show_success
else
    show_error
    echo -e "${YELLOW}Başarısız modüller: ${failed_modules[*]}${RESET}"
fi

# SSH yapılandırması yedekle
show_progress "SSH yapılandırması yedekleniyor"
if [ -f /etc/ssh/sshd_config ]; then
    cp /etc/ssh/sshd_config "/etc/ssh/sshd_backup_$(date +%Y%m%d_%H%M%S).conf" >> "$LOG_FILE" 2>&1
    show_success
else
    show_error
fi

# Firewall yapılandır
if command -v ufw &> /dev/null; then
    show_progress "Firewall yapılandırılıyor"
    ufw allow 22/tcp >> "$LOG_FILE" 2>&1
    ufw allow 80/tcp >> "$LOG_FILE" 2>&1
    ufw allow 443/tcp >> "$LOG_FILE" 2>&1
    ufw allow 3128/tcp >> "$LOG_FILE" 2>&1
    ufw allow 8080/tcp >> "$LOG_FILE" 2>&1
    ufw allow 8799/tcp >> "$LOG_FILE" 2>&1
    show_success
fi

# IP adresini kaydet
show_progress "IP adresi tespit ediliyor"
IP=$(wget -qO- https://ipv4.icanhazip.com/ 2>/dev/null || wget -qO- http://whatismyip.akamai.com/ 2>/dev/null || echo "Bilinmiyor")
echo "$IP" > /etc/IP
show_success

# Kullanıcı veritabanı
show_progress "Kullanıcı veritabanı oluşturuluyor"
if [ ! -f /root/usuarios.db ]; then
    awk -F: '$3>=1000 {print $1 " 1"}' /etc/passwd | grep -v '^nobody' > /root/usuarios.db
    show_success
else
    echo -e "${YELLOW}Mevcut veritabanı korundu${RESET}"
fi

# Lisans dosyası
echo "SSHPlus Manager by @requmen" > /usr/lib/sshplus

# Otomatik başlatma
show_progress "Otomatik başlatma yapılandırılıyor"
cat > /etc/autostart << 'EOF'
#!/bin/bash
clear
# SSHPlus Manager Otomatik Başlatma
# Geliştirici: @requmen
EOF
chmod +x /etc/autostart
show_success

# Cron işleri
show_progress "Zamanlanmış görevler ayarlanıyor"
(
    crontab -l 2>/dev/null | grep -v "verifatt" | grep -v "autostart" | grep -v "uexpired"
    echo "@daily /bin/verifatt"
    echo "@reboot /etc/autostart"
    echo "* * * * * /etc/autostart"
    echo "0 */6 * * * /bin/uexpired"
) | crontab - >> "$LOG_FILE" 2>&1
show_success

# Versiyon kaydet
echo "39" > /bin/versao
echo "39" > /home/sshplus

echo ""
echo -e "${GREEN}╔════════════════════════════════════════════════════╗${RESET}"
echo -e "${GREEN}║${WHITE}                                                    ${GREEN}║${RESET}"
echo -e "${GREEN}║${WHITE}         KURULUM BAŞARIYLA TAMAMLANDI!             ${GREEN}║${RESET}"
echo -e "${GREEN}║${WHITE}                                                    ${GREEN}║${RESET}"
echo -e "${GREEN}╚════════════════════════════════════════════════════╝${RESET}"
echo ""
echo -e "${CYAN}Ana menüyü açmak için:${RESET}"
echo -e "${GREEN}  menu${RESET}"
echo ""
echo -e "${CYAN}Daha fazla bilgi:${RESET}"
echo -e "${WHITE}  GitHub: https://github.com/${GITHUB_USER}/${GITHUB_REPO}${RESET}"
echo -e "${WHITE}  Twitter/X: @requmen${RESET}"
echo ""
echo -e "${YELLOW}Kurulum log dosyası: ${WHITE}${LOG_FILE}${RESET}"
echo ""
echo -e "${CYAN}Güvenlik için SECURITY.md dosyasını okuyun!${RESET}"
echo ""

# Temizlik
rm -f "$0"

echo -e "${GREEN}Kurulum tamamlandı! Menüyü açmak için 'menu' yazın.${RESET}"
