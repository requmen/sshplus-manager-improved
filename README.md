# SSHPlus Manager - Geliştirilmiş Versiyon 🚀

![SSHPlus Manager](https://github.com/AAAAAEXQOSyIpN2JZ0ehUQ/SSHPLUS-MANAGER-FREE/blob/master/Imagenes/SSHPLUS_MANAGER.png)

## 📋 Proje Hakkında

Bu proje, orijinal **SSHPlus Manager** (v38) scriptinin geliştirilmiş ve modernize edilmiş versiyonudur. Linux sunucularında SSH ve VPN yönetimini kolaylaştırmak için tasarlanmış kapsamlı bir araç setidir.

### 🎯 Temel Özellikler

- **SSH Bağlantı Yönetimi**: SSH bağlantılarını yapılandırma ve yönetme
- **VPN Desteği**: Dropbear, SSLTunnel4, OpenVPN ve diğer VPN protokolleri
- **Kullanıcı Yönetimi**: Kullanıcı oluşturma, silme ve yönetme
- **Bağlantı İzleme**: Aktif bağlantıları gerçek zamanlı izleme
- **Sistem Detayları**: Detaylı sistem ve kullanıcı bilgileri
- **Güvenlik Araçları**: Tarama ve güvenlik analiz araçları
- **Sistem Optimizasyonu**: Otomatik sistem optimizasyonu ve temizlik

## 🆕 Geliştirmeler

Bu versiyonda yapılan iyileştirmeler:

### ✨ Kod İyileştirmeleri
- Daha temiz ve okunabilir kod yapısı
- Geliştirilmiş hata yönetimi
- Modüler mimari
- Güncellenmiş bağımlılıklar

### 🔒 Güvenlik
- Geliştirilmiş güvenlik kontrolleri
- Güncel güvenlik standartları
- Daha iyi şifre yönetimi

### 🎨 Kullanıcı Deneyimi
- Geliştirilmiş arayüz
- Daha iyi hata mesajları
- Türkçe dil desteği eklendi
- Detaylı dokümantasyon

### ⚡ Performans
- Optimize edilmiş scriptler
- Daha hızlı kurulum
- Azaltılmış kaynak kullanımı

## 💻 Kurulum

### Hızlı Kurulum (Tek Satır)

```bash
wget https://raw.githubusercontent.com/requmen/sshplus-manager-improved/master/Plus && chmod +x Plus && ./Plus
```

### Detaylı Kurulum

```bash
# Sistem güncellemesi
apt-get update -y && apt-get upgrade -y

# Script indirme
wget https://raw.githubusercontent.com/requmen/sshplus-manager-improved/master/Plus

# Çalıştırma izni verme
chmod +x Plus

# Kurulumu başlatma
./Plus
```

## 🚀 Kullanım

Kurulumdan sonra scripti çalıştırmak için terminalde şu komutu yazın:

```bash
menu
```

## 📦 Sistem Gereksinimleri

- **İşletim Sistemi**: Ubuntu 18.04/20.04/22.04 veya Debian 9/10/11
- **Mimari**: x86_64
- **RAM**: Minimum 512MB (1GB önerilir)
- **Disk**: Minimum 1GB boş alan
- **Root Erişimi**: Gerekli

## 📁 Proje Yapısı

```
sshplus-manager-improved/
├── Imagenes/          # Görseller
├── Install/           # Kurulum scriptleri
│   ├── Panel_Web/     # Web panel dosyaları
│   ├── Skin_Plus/     # Tema dosyaları
│   ├── Sources_list/  # APT kaynakları
│   └── TCP-Speed/     # TCP optimizasyon araçları
├── Modulos/           # Ana modüller
├── Proyectos/         # Alt projeler
│   ├── Adminplus/     # Yönetim menüsü
│   ├── Panel_v20/     # Web panel v20
│   └── SSHPlus_Keygen/# Anahtar üretici
├── Versiones/         # Versiyon geçmişi
├── Plus               # Ana kurulum scripti
├── README.md          # Bu dosya
└── credits            # Katkıda bulunanlar
```

## 🔧 Modüller

### Ana Modüller
- `menu` - Ana menü
- `criarusuario` - Kullanıcı oluşturma
- `remover` - Kullanıcı silme
- `alterarsenha` - Şifre değiştirme
- `sshmonitor` - SSH bağlantı izleme
- `conexao` - Bağlantı yönetimi
- `detalhes` - Sistem detayları
- `otimizar` - Sistem optimizasyonu
- `speedtest` - Hız testi
- `banner` - Banner yönetimi
- `botssh` - Telegram bot
- `slow_dns` - SlowDNS kurulumu

### Yardımcı Araçlar
- `addhost` - Host ekleme
- `badvpn` - BadVPN kurulumu
- `blockt` - Torrent engelleme
- `limiter` - Bağlantı sınırlayıcı
- `userbackup` - Kullanıcı yedekleme

## 🛠️ Ek Projeler

### AdminPlus - Yönetim Menüsü
```bash
wget -qO /bin/adminplus https://raw.githubusercontent.com/requmen/sshplus-manager-improved/master/Proyectos/Adminplus/adminplus
chmod +x /bin/adminplus
adminplus
```

## 📝 Değişiklik Günlüğü

### v39 (Geliştirilmiş Versiyon)
- Kod yapısı iyileştirildi
- Türkçe dil desteği eklendi
- Güvenlik güncellemeleri
- Performans optimizasyonları
- Dokümantasyon güncellendi
- Hata düzeltmeleri

### v38 (Orijinal Son Versiyon)
- Son resmi versiyon (09/08/2021)
- Orijinal geliştirici: @crazy_vpn

## 🤝 Katkıda Bulunma

Projeye katkıda bulunmak isterseniz:

1. Bu repository'yi fork edin
2. Yeni bir branch oluşturun (`git checkout -b feature/yeniOzellik`)
3. Değişikliklerinizi commit edin (`git commit -am 'Yeni özellik eklendi'`)
4. Branch'inizi push edin (`git push origin feature/yeniOzellik`)
5. Pull Request oluşturun

## ⚠️ Uyarılar

- Bu script root yetkisi gerektirir
- Üretim sunucularında kullanmadan önce test ortamında deneyin
- Kurulum öncesi sistem yedeği almanız önerilir
- Bazı özellikler belirli VPS sağlayıcılarında çalışmayabilir

## 📄 Lisans

Bu proje açık kaynak kodludur ve eğitim amaçlıdır. Ticari kullanım öncesi gerekli izinleri alınız.

## 👥 Katkıda Bulunanlar

- **Orijinal Geliştirici**: [@crazy_vpn](https://t.me/crazy_vpn)
- **Orijinal Repo**: [SSHPLUS-MANAGER-FREE](https://github.com/AAAAAEXQOSyIpN2JZ0ehUQ/SSHPLUS-MANAGER-FREE)
- **Geliştirme ve İyileştirme**: [@requmen](https://github.com/requmen)

## 📞 İletişim

- **GitHub Issues**: Sorunları bildirmek için
- **Pull Requests**: Katkılarınız için

## 🌟 Teşekkürler

Bu proje, orijinal SSHPlus Manager'ın geliştirilmiş versiyonudur. Orijinal geliştiricilere ve topluluğa teşekkürler.

---

**Not**: Bu proje eğitim ve araştırma amaçlıdır. Kullanımdan doğacak sorumluluk kullanıcıya aittir.
