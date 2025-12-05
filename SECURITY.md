# Güvenlik Rehberi

## 🔒 Güvenlik Önlemleri

Bu dokümanda SSHPlus Manager kullanırken uygulanması gereken güvenlik önlemleri açıklanmaktadır.

## Kurulum Öncesi Güvenlik

### Sistem Güncellemeleri

Kurulum öncesinde sisteminizin güncel olduğundan emin olun:

```bash
apt-get update && apt-get upgrade -y
apt-get dist-upgrade -y
```

### Güvenlik Duvarı Yapılandırması

UFW (Uncomplicated Firewall) kullanarak temel güvenlik duvarı kuralları:

```bash
# UFW kurulumu
apt-get install ufw -y

# Varsayılan politikalar
ufw default deny incoming
ufw default allow outgoing

# SSH portunu açma (varsayılan port değiştirilmişse onu kullanın)
ufw allow 22/tcp

# HTTP/HTTPS
ufw allow 80/tcp
ufw allow 443/tcp

# Güvenlik duvarını etkinleştirme
ufw enable
```

## SSH Güvenliği

### 1. SSH Port Değiştirme

Varsayılan SSH portunu (22) değiştirerek otomatik tarama saldırılarını azaltın:

```bash
# /etc/ssh/sshd_config dosyasını düzenleyin
nano /etc/ssh/sshd_config

# Port satırını bulun ve değiştirin
Port 2222  # Örnek port numarası

# SSH servisini yeniden başlatın
systemctl restart sshd
```

### 2. Root Login Devre Dışı Bırakma

Root kullanıcısı ile doğrudan SSH girişini engelleyin:

```bash
# /etc/ssh/sshd_config dosyasında
PermitRootLogin no

# Değişikliği uygulayın
systemctl restart sshd
```

### 3. Şifre Tabanlı Girişi Devre Dışı Bırakma

SSH key kullanımını zorunlu kılın:

```bash
# Önce SSH key oluşturun ve sunucuya ekleyin
# Sonra /etc/ssh/sshd_config dosyasında:
PasswordAuthentication no
PubkeyAuthentication yes

# Değişikliği uygulayın
systemctl restart sshd
```

### 4. Fail2Ban Kurulumu

Başarısız giriş denemelerini engelleyin:

```bash
# Fail2Ban kurulumu
apt-get install fail2ban -y

# Yapılandırma dosyası oluşturma
cat > /etc/fail2ban/jail.local << EOF
[DEFAULT]
bantime = 3600
findtime = 600
maxretry = 5

[sshd]
enabled = true
port = ssh
logpath = /var/log/auth.log
EOF

# Servisi başlatma
systemctl enable fail2ban
systemctl start fail2ban
```

## Kullanıcı Güvenliği

### Güçlü Şifre Politikası

```bash
# libpam-pwquality kurulumu
apt-get install libpam-pwquality -y

# /etc/pam.d/common-password dosyasını düzenleyin
# Minimum şifre uzunluğu: 12 karakter
# En az 1 büyük harf, 1 küçük harf, 1 rakam, 1 özel karakter
```

### Kullanıcı İzinleri

Kullanıcılara sadece gerekli izinleri verin:

```bash
# Sudo yetkisi verme (dikkatli kullanın)
usermod -aG sudo kullanici_adi

# Belirli komutlar için sudo izni
visudo
# Örnek: kullanici_adi ALL=(ALL) /usr/bin/systemctl restart nginx
```

## VPN Güvenliği

### OpenVPN Güvenliği

```bash
# Güçlü şifreleme kullanın
cipher AES-256-CBC
auth SHA256

# TLS authentication ekleyin
tls-auth ta.key 0

# Minimum TLS versiyonu
tls-version-min 1.2
```

### Bağlantı Limitleri

Her kullanıcı için bağlantı sayısını sınırlayın:

```bash
# SSHPlus Manager'da kullanıcı oluştururken
# Maksimum eşzamanlı bağlantı sayısını belirleyin
```

## Sistem Güvenliği

### 1. Otomatik Güvenlik Güncellemeleri

```bash
# unattended-upgrades kurulumu
apt-get install unattended-upgrades -y

# Yapılandırma
dpkg-reconfigure --priority=low unattended-upgrades
```

### 2. Gereksiz Servisleri Kapatma

```bash
# Çalışan servisleri listele
systemctl list-units --type=service --state=running

# Gereksiz servisi durdur ve devre dışı bırak
systemctl stop servis_adi
systemctl disable servis_adi
```

### 3. Dosya İzinleri

Hassas dosyaların izinlerini kontrol edin:

```bash
# SSH yapılandırma dosyaları
chmod 600 /etc/ssh/sshd_config
chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys

# Kullanıcı veritabanı
chmod 600 /root/usuarios.db
```

## Monitoring ve Loglama

### Log Dosyalarını İzleme

```bash
# SSH giriş denemelerini izleme
tail -f /var/log/auth.log

# Sistem loglarını izleme
tail -f /var/log/syslog

# SSHPlus Manager logları
tail -f /var/log/sshplus-install.log
```

### Logwatch Kurulumu

```bash
# Logwatch kurulumu
apt-get install logwatch -y

# Günlük rapor için cron job
echo "0 0 * * * /usr/sbin/logwatch --output mail --mailto admin@example.com --detail high" | crontab -
```

## Yedekleme Güvenliği

### Şifrelenmiş Yedekleme

```bash
# GPG ile şifreleme
tar czf - /root/usuarios.db | gpg -c > backup.tar.gz.gpg

# Şifreli yedeği açma
gpg -d backup.tar.gz.gpg | tar xzf -
```

### Uzak Yedekleme

```bash
# rsync ile güvenli yedekleme
rsync -avz -e "ssh -p 2222" /root/usuarios.db user@backup-server:/backups/

# Otomatik yedekleme için cron
0 2 * * * rsync -avz -e "ssh -p 2222" /root/usuarios.db user@backup-server:/backups/
```

## Güvenlik Kontrol Listesi

### Kurulum Sonrası

- [ ] SSH portu değiştirildi
- [ ] Root login devre dışı bırakıldı
- [ ] Fail2Ban kuruldu ve yapılandırıldı
- [ ] Güvenlik duvarı yapılandırıldı
- [ ] Güçlü şifre politikası uygulandı
- [ ] Otomatik güvenlik güncellemeleri aktif
- [ ] Gereksiz servisler kapatıldı
- [ ] Log monitoring kuruldu
- [ ] Yedekleme sistemi çalışıyor

### Düzenli Kontroller

- [ ] Sistem güncellemelerini kontrol et (haftalık)
- [ ] Log dosyalarını incele (günlük)
- [ ] Kullanıcı hesaplarını gözden geçir (haftalık)
- [ ] Yedekleri test et (aylık)
- [ ] Güvenlik taraması yap (aylık)

## Güvenlik Araçları

### ClamAV (Antivirüs)

```bash
# ClamAV kurulumu
apt-get install clamav clamav-daemon -y

# Virüs tanımlarını güncelleme
freshclam

# Tarama
clamscan -r /home
```

### RKHunter (Rootkit Tarayıcı)

```bash
# RKHunter kurulumu
apt-get install rkhunter -y

# Veritabanını güncelleme
rkhunter --update

# Tarama
rkhunter --check
```

### Lynis (Güvenlik Denetimi)

```bash
# Lynis kurulumu
apt-get install lynis -y

# Güvenlik denetimi
lynis audit system
```

## Acil Durum Prosedürleri

### Şüpheli Aktivite Tespit Edildiğinde

1. **Bağlantıları Kontrol Edin**
   ```bash
   netstat -tulpn
   ss -tulpn
   ```

2. **Aktif Kullanıcıları Görüntüleyin**
   ```bash
   who
   w
   last
   ```

3. **Şüpheli Kullanıcıyı Engelleyin**
   ```bash
   usermod -L kullanici_adi
   pkill -u kullanici_adi
   ```

4. **IP Adresini Engelleyin**
   ```bash
   ufw deny from IP_ADRESI
   ```

### Sistem Güvenliği İhlali Durumunda

1. Sistemi izole edin (network bağlantısını kesin)
2. Tüm kullanıcı şifrelerini değiştirin
3. Log dosyalarını yedekleyin
4. Sistemi temiz bir yedekten geri yükleyin
5. Güvenlik açıklarını kapatın
6. Sistemi tekrar devreye alın

## İletişim

Güvenlik açığı bildirmek için:
- GitHub Issues: https://github.com/requmen/sshplus-manager-improved/issues
- Email: security@example.com (güvenlik konularında)

**Not:** Güvenlik açıklarını lütfen önce özel olarak bildirin, genel olarak paylaşmayın.
