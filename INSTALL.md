# Kurulum Rehberi

## 📋 Sistem Gereksinimleri

### Minimum Gereksinimler

- **İşletim Sistemi:** Ubuntu 18.04+ veya Debian 9+
- **Mimari:** x86_64 (64-bit)
- **RAM:** 512 MB (1 GB önerilir)
- **Disk Alanı:** 1 GB boş alan
- **İnternet:** Aktif internet bağlantısı
- **Yetki:** Root erişimi

### Önerilen Gereksinimler

- **İşletim Sistemi:** Ubuntu 22.04 LTS veya Debian 11
- **RAM:** 2 GB veya üzeri
- **Disk Alanı:** 5 GB boş alan
- **CPU:** 2 core veya üzeri

### Desteklenen İşletim Sistemleri

| İşletim Sistemi | Versiyon | Durum |
|-----------------|----------|-------|
| Ubuntu | 22.04 LTS | ✅ Tam Destek |
| Ubuntu | 20.04 LTS | ✅ Tam Destek |
| Ubuntu | 18.04 LTS | ✅ Tam Destek |
| Debian | 11 (Bullseye) | ✅ Tam Destek |
| Debian | 10 (Buster) | ✅ Tam Destek |
| Debian | 9 (Stretch) | ⚠️ Sınırlı Destek |

## 🚀 Hızlı Kurulum

### Yöntem 1: Geliştirilmiş Script (Önerilen)

```bash
wget https://raw.githubusercontent.com/requmen/sshplus-manager-improved/master/Plus_improved && chmod +x Plus_improved && ./Plus_improved
```

### Yöntem 2: Orijinal Script

```bash
wget https://raw.githubusercontent.com/requmen/sshplus-manager-improved/master/Plus && chmod +x Plus && ./Plus
```

## 📝 Detaylı Kurulum Adımları

### 1. Sistem Hazırlığı

#### Root Kullanıcısına Geçiş

```bash
sudo su
```

veya her komut için `sudo` kullanın.

#### Sistem Güncellemesi

```bash
apt-get update -y
apt-get upgrade -y
```

#### Temel Araçların Kurulumu

```bash
apt-get install wget curl -y
```

### 2. Script İndirme

#### Geliştirilmiş Versiyon

```bash
cd /root
wget https://raw.githubusercontent.com/requmen/sshplus-manager-improved/master/Plus_improved
```

#### Orijinal Versiyon

```bash
cd /root
wget https://raw.githubusercontent.com/requmen/sshplus-manager-improved/master/Plus
```

### 3. İzin Verme

```bash
chmod +x Plus_improved
# veya
chmod +x Plus
```

### 4. Kurulumu Başlatma

```bash
./Plus_improved
# veya
./Plus
```

### 5. Kurulum Sırasında

Kurulum sırasında size bazı sorular sorulacaktır:

1. **Devam etmek istiyor musunuz?**
   - `E` (Evet) veya `H` (Hayır) seçin

2. **Mevcut kullanıcı veritabanı bulundu**
   - `1` - Mevcut veritabanını koru
   - `2` - Yeni veritabanı oluştur

### 6. Kurulum Tamamlandı

Kurulum tamamlandığında şu mesajı göreceksiniz:

```
KURULUM BAŞARIYLA TAMAMLANDI!

Ana menüyü açmak için şu komutu kullanın:
  menu
```

## 🎯 Kurulum Sonrası

### İlk Yapılandırma

#### 1. Ana Menüyü Açma

```bash
menu
```

#### 2. SSH Yapılandırması

SSH yapılandırmanızı kontrol edin:

```bash
nano /etc/ssh/sshd_config
```

Önerilen ayarlar:
```
Port 22                          # Güvenlik için değiştirin (örn: 2222)
PermitRootLogin no              # Root girişini devre dışı bırakın
PasswordAuthentication yes      # Key kullanımı için 'no' yapın
```

Değişiklikleri uygulayın:
```bash
systemctl restart sshd
```

#### 3. Firewall Yapılandırması

```bash
# UFW durumunu kontrol edin
ufw status

# Gerekirse etkinleştirin
ufw enable
```

#### 4. İlk Kullanıcı Oluşturma

Ana menüden:
1. `Kullanıcı Yönetimi` seçin
2. `Yeni Kullanıcı Oluştur` seçin
3. Gerekli bilgileri girin

### Güvenlik Yapılandırması

Güvenlik için [SECURITY.md](SECURITY.md) dosyasını okuyun ve önerilen adımları uygulayın.

## 🔧 Sorun Giderme

### Kurulum Hataları

#### Hata: "İnternet bağlantısı bulunamadı"

**Çözüm:**
```bash
# DNS ayarlarını kontrol edin
cat /etc/resolv.conf

# Google DNS ekleyin
echo "nameserver 8.8.8.8" >> /etc/resolv.conf
echo "nameserver 8.8.4.4" >> /etc/resolv.conf

# Bağlantıyı test edin
ping -c 4 google.com
```

#### Hata: "Yetersiz disk alanı"

**Çözüm:**
```bash
# Disk kullanımını kontrol edin
df -h

# Gereksiz dosyaları temizleyin
apt-get autoremove -y
apt-get clean
```

#### Hata: "Root yetkisi gerekli"

**Çözüm:**
```bash
# Root kullanıcısına geçin
sudo su

# veya sudo ile çalıştırın
sudo ./Plus_improved
```

### Paket Kurulum Hataları

#### Hata: "Unable to locate package"

**Çözüm:**
```bash
# Repository listesini güncelleyin
apt-get update

# Universe repository'yi ekleyin (Ubuntu için)
add-apt-repository universe
apt-get update
```

#### Hata: "Could not get lock"

**Çözüm:**
```bash
# Diğer apt işlemlerini bekleyin veya
# Kilidi kaldırın (dikkatli kullanın)
rm /var/lib/dpkg/lock-frontend
rm /var/lib/dpkg/lock
dpkg --configure -a
apt-get update
```

### Çalışma Zamanı Hataları

#### Menü açılmıyor

**Çözüm:**
```bash
# Menu scriptinin varlığını kontrol edin
ls -la /bin/menu

# Yoksa tekrar indirin
wget -qO /bin/menu https://raw.githubusercontent.com/requmen/sshplus-manager-improved/master/Modulos/menu
chmod +x /bin/menu
```

#### Modüller çalışmıyor

**Çözüm:**
```bash
# Tüm modülleri tekrar indirin
cd /tmp
wget https://raw.githubusercontent.com/requmen/sshplus-manager-improved/master/reinstall_modules.sh
chmod +x reinstall_modules.sh
./reinstall_modules.sh
```

## 🔄 Güncelleme

### Manuel Güncelleme

```bash
# Kurulum scriptini tekrar çalıştırın
cd /root
wget https://raw.githubusercontent.com/requmen/sshplus-manager-improved/master/Plus_improved
chmod +x Plus_improved
./Plus_improved
```

### Otomatik Güncelleme

Ana menüden `Sistem Yönetimi` > `Script Güncelle` seçeneğini kullanın.

## 🗑️ Kaldırma

### Tam Kaldırma

```bash
# Kaldırma scriptini çalıştırın
delscript
```

### Manuel Kaldırma

```bash
# Kurulu dosyaları silin
rm -rf /etc/SSHPlus
rm -rf /etc/bot
rm -f /bin/menu*
rm -f /bin/ssh*
rm -f /bin/criar*
rm -f /bin/remover
rm -f /bin/alterar*
rm -f /bin/detalhes
rm -f /bin/otimizar
rm -f /bin/speedtest
rm -f /bin/banner
rm -f /bin/botssh
rm -f /bin/slow_dns
rm -f /bin/addhost
rm -f /bin/delhost
rm -f /bin/badvpn
rm -f /bin/blockt
rm -f /bin/limiter
rm -f /bin/userbackup

# Kullanıcı veritabanını silin (isteğe bağlı)
rm -f /root/usuarios.db
```

## 📚 Ek Kaynaklar

- [README.md](README.md) - Genel proje bilgileri
- [SECURITY.md](SECURITY.md) - Güvenlik rehberi
- [DEVELOPMENT_PLAN.md](DEVELOPMENT_PLAN.md) - Geliştirme planı
- [CHANGELOG.md](CHANGELOG.md) - Değişiklik günlüğü

## 💬 Destek

Sorun yaşıyorsanız:

1. [GitHub Issues](https://github.com/requmen/sshplus-manager-improved/issues) üzerinden sorun bildirin
2. Log dosyalarını kontrol edin: `/var/log/sshplus-install.log`
3. Topluluk forumlarına başvurun

## ⚠️ Önemli Notlar

- **Yedekleme:** Kurulum öncesi önemli verilerinizi yedekleyin
- **Test Ortamı:** Üretim sunucusunda kullanmadan önce test ortamında deneyin
- **Güvenlik:** Kurulum sonrası mutlaka güvenlik ayarlarını yapın
- **Güncellemeler:** Düzenli olarak sistem ve script güncellemelerini kontrol edin

## 📋 Kurulum Kontrol Listesi

Kurulum öncesi ve sonrası kontrol listesi:

### Kurulum Öncesi
- [ ] Sistem gereksinimleri karşılanıyor
- [ ] Root erişimi mevcut
- [ ] İnternet bağlantısı aktif
- [ ] Yeterli disk alanı var
- [ ] Önemli veriler yedeklendi

### Kurulum Sonrası
- [ ] Menu komutu çalışıyor
- [ ] SSH bağlantısı yapılabiliyor
- [ ] Firewall yapılandırıldı
- [ ] İlk kullanıcı oluşturuldu
- [ ] Güvenlik ayarları yapıldı
- [ ] Yedekleme sistemi kuruldu

## 🎓 Video Eğitimler

Yakında video eğitim materyalleri eklenecektir.

---

**Son Güncelleme:** 2025-12-05
**Versiyon:** 39
