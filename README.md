# SSHPlus Manager - Geliştirilmiş Versiyon 🚀

![SSHPlus Manager](https://github.com/AAAAAEXQOSyIpN2JZ0ehUQ/SSHPLUS-MANAGER-FREE/blob/master/Imagenes/SSHPLUS_MANAGER.png)

## 📋 Proje Hakkında

**SSHPlus Manager**, Linux sunucularında SSH ve VPN yönetimini kolaylaştırmak için geliştirilmiş kapsamlı bir araç setidir. Bu proje, orijinal SSHPlus Manager (v38) scriptinin **tamamen Türkçeleştirilmiş**, **Ubuntu 22.04+ için optimize edilmiş** ve **modernize edilmiş** versiyonudur.

**Geliştirici:** [@requmen](https://github.com/requmen)  
**Versiyon:** v39  
**Durum:** Aktif Geliştirme 🚀

---

## 🎉 v39 Yenilikleri

### ✨ Tam Türkçe Arayüz
- Tüm menüler Türkçe
- Kullanıcı dostu ifadeler
- Türkçe hata mesajları
- Türkçe dokümantasyon

### 🔧 Ubuntu 22.04+ Optimizasyonu
- Python 3 tam uyumluluk
- Modern paket yönetimi
- Güncel güvenlik standartları
- Test edilmiş ve stabil

### 🎨 @requmen Markası
- Tüm scriptler güncellendi
- Profesyonel görünüm
- Tutarlı marka kimliği

---

## 🎯 Temel Özellikler

### SSH Yönetimi
- SSH bağlantı yapılandırması
- Port yönetimi
- Güvenlik ayarları
- Bağlantı izleme

### VPN Desteği
- **Dropbear** - Hafif SSH sunucusu
- **SSLTunnel4** - SSL tünelleme
- **OpenVPN** - Güvenli VPN
- **BadVPN** - UDP VPN

### Kullanıcı Yönetimi
- Kullanıcı oluşturma/silme
- Şifre yönetimi
- Bağlantı limitleri
- Test kullanıcıları
- Kullanıcı veritabanı
- Otomatik süre dolumu kontrolü

### Monitoring ve İstatistikler
- Gerçek zamanlı bağlantı izleme
- Sistem kaynak kullanımı
- Kullanıcı aktiviteleri
- Hız testi
- Trafik izleme

### Sistem Araçları
- Sistem optimizasyonu
- Banner yönetimi
- Telegram bot entegrasyonu
- Otomatik yedekleme
- Firewall yapılandırması

---

## 💻 Kurulum

### Hızlı Kurulum (Önerilen)

```bash
wget https://raw.githubusercontent.com/requmen/sshplus-manager-improved/master/install.sh && chmod +x install.sh && ./install.sh
```

### Geliştirilmiş Kurulum

```bash
wget https://raw.githubusercontent.com/requmen/sshplus-manager-improved/master/Plus_improved && chmod +x Plus_improved && ./Plus_improved
```

### Klasik Kurulum

```bash
wget https://raw.githubusercontent.com/requmen/sshplus-manager-improved/master/Plus && chmod +x Plus && ./Plus
```

---

## 🚀 Kullanım

Kurulumdan sonra menüyü açmak için:

```bash
menu
```

### Ana Menü

```
╔════════════════════════════════════════════════════╗
║               ⇱ SSHPLUS MANAGER ⇲                ║
╚════════════════════════════════════════════════════╝

[01] • KULLANICI OLUŞTUR          [11] • HIZ TESTİ
[02] • TEST KULLANICISI OLUŞTUR   [12] • BANNER
[03] • KULLANICI SİL              [13] • TRAFİK
[04] • ÇEVRİMİÇİ İZLEME           [14] • OPTİMİZE ET
[05] • TARİH DEĞİŞTİR             [15] • YEDEKLEME
[06] • LİMİT DEĞİŞTİR             [16] • LİMİTER
[07] • ŞİFRE DEĞİŞTİR             [17] • BAD VPN
[08] • SÜRESİ DOLMUŞLARI SİL      [18] • VPS BİLGİSİ
[09] • KULLANICI RAPORU           [19] • DAHA FAZLA >>>
[10] • BAĞLANTI MODU              [00] • ÇIKIŞ <<<

Geliştirici: @requmen | Versiyon: v39
```

---

## 📦 Sistem Gereksinimleri

### Minimum Gereksinimler

- **İşletim Sistemi:** Ubuntu 18.04+ veya Debian 9+
- **Mimari:** x86_64 (64-bit)
- **RAM:** 512 MB (1 GB önerilir)
- **Disk Alanı:** 1 GB boş alan
- **Root Erişimi:** Gerekli

### Önerilen Sistem

- **İşletim Sistemi:** Ubuntu 22.04 LTS
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

---

## 📁 Proje Yapısı

```
sshplus-manager-improved/
├── Imagenes/              # Görseller
├── Install/               # Kurulum bileşenleri
│   ├── Panel_Web/         # Web panel dosyaları
│   ├── Skin_Plus/         # Tema dosyaları
│   └── TCP-Speed/         # TCP optimizasyon
├── Modulos/               # Ana modüller (40+)
│   ├── menu               # Ana menü (Türkçe)
│   ├── criarusuario       # Kullanıcı oluşturma
│   ├── sshmonitor         # SSH izleme
│   └── ...
├── Proyectos/             # Alt projeler
├── install.sh             # Hızlı kurulum
├── Plus_improved          # Geliştirilmiş kurulum
├── Plus                   # Klasik kurulum
├── README.md              # Bu dosya
├── INSTALL.md             # Detaylı kurulum rehberi
├── SECURITY.md            # Güvenlik rehberi
├── GUNCELLEMELER.md       # Güncelleme notları
└── ...
```

---

## 🔒 Güvenlik

### Güvenlik Önlemleri

- SSH port değiştirme
- Root login devre dışı bırakma
- Fail2Ban entegrasyonu
- Firewall yapılandırması
- Güçlü şifre politikası
- Otomatik güvenlik güncellemeleri

### Güvenlik Rehberi

Detaylı güvenlik bilgileri için [SECURITY.md](SECURITY.md) dosyasını okuyun.

---

## 📚 Dokümantasyon

### Mevcut Dokümantasyon

- **[README.md](README.md)** - Ana dokümantasyon (bu dosya)
- **[INSTALL.md](INSTALL.md)** - Detaylı kurulum rehberi
- **[SECURITY.md](SECURITY.md)** - Güvenlik en iyi pratikleri
- **[CONTRIBUTING.md](CONTRIBUTING.md)** - Katkıda bulunma rehberi
- **[DEVELOPMENT_PLAN.md](DEVELOPMENT_PLAN.md)** - Geliştirme planı
- **[CHANGELOG.md](CHANGELOG.md)** - Değişiklik günlüğü
- **[GUNCELLEMELER.md](GUNCELLEMELER.md)** - v39 Güncellemeleri
- **[PROJECT_SUMMARY.md](PROJECT_SUMMARY.md)** - Proje özeti

---

## 🎓 Kullanım Örnekleri

### Kullanıcı Oluşturma

```bash
# Menüden [01] seçin
# Kullanıcı adı, şifre ve süre girin
```

### SSH Bağlantı İzleme

```bash
# Menüden [04] seçin
# Aktif bağlantıları görün
```

### Sistem Optimizasyonu

```bash
# Menüden [14] seçin
# Otomatik optimizasyon başlar
```

### Hız Testi

```bash
# Menüden [11] seçin
# Sunucu hızı test edilir
```

---

## 🤝 Katkıda Bulunma

Projeye katkıda bulunmak isterseniz:

1. Bu repository'yi fork edin
2. Yeni bir branch oluşturun (`git checkout -b feature/yeniOzellik`)
3. Değişikliklerinizi commit edin (`git commit -am 'Yeni özellik eklendi'`)
4. Branch'inizi push edin (`git push origin feature/yeniOzellik`)
5. Pull Request oluşturun

Detaylı bilgi için [CONTRIBUTING.md](CONTRIBUTING.md) dosyasını okuyun.

---

## 🐛 Sorun Bildirme

Sorun bildirmek için [GitHub Issues](https://github.com/requmen/sshplus-manager-improved/issues) kullanın.

---

## 📈 Gelecek Planları

### Kısa Vadeli (1-3 Ay)

- [ ] Web panel Türkçeleştirme
- [ ] Telegram bot Türkçe desteği
- [ ] Otomatik testler
- [ ] CI/CD pipeline
- [ ] Docker desteği

### Orta Vadeli (3-6 Ay)

- [ ] REST API
- [ ] Monitoring dashboard
- [ ] Cloud entegrasyonu
- [ ] Mobile uygulama

### Uzun Vadeli (6-12 Ay)

- [ ] Multi-server yönetimi
- [ ] Advanced analytics
- [ ] AI destekli optimizasyon
- [ ] Kurumsal özellikler

---

## ⚠️ Uyarılar

- Bu script root yetkisi gerektirir
- Üretim sunucularında kullanmadan önce test ortamında deneyin
- Kurulum öncesi sistem yedeği almanız önerilir
- Güvenlik ayarlarını mutlaka yapın

---

## 📄 Lisans

Bu proje açık kaynak kodludur ve eğitim amaçlıdır. Ticari kullanım öncesi gerekli izinleri alınız.

---

## 👥 Katkıda Bulunanlar

- **Orijinal Geliştirici:** [@crazy_vpn](https://t.me/crazy_vpn)
- **Orijinal Repo:** [SSHPLUS-MANAGER-FREE](https://github.com/AAAAAEXQOSyIpN2JZ0ehUQ/SSHPLUS-MANAGER-FREE)
- **Geliştirme ve İyileştirme:** [@requmen](https://github.com/requmen)

---

## 📞 İletişim

- **GitHub:** https://github.com/requmen/sshplus-manager-improved
- **Issues:** https://github.com/requmen/sshplus-manager-improved/issues
- **Twitter/X:** @requmen

---

## 🌟 Teşekkürler

Bu proje, orijinal SSHPlus Manager'ın geliştirilmiş versiyonudur. Orijinal geliştiricilere ve topluluğa teşekkürler.

---

## 📊 İstatistikler

- **Toplam Dosya:** 240+
- **Bash Script:** 40+
- **Python Script:** 6
- **Markdown Dosyası:** 13
- **Toplam Satır:** ~50,000+
- **Commit Sayısı:** 5+

---

## 🚀 Hızlı Başlangıç

```bash
# 1. Kurulum
wget https://raw.githubusercontent.com/requmen/sshplus-manager-improved/master/install.sh
chmod +x install.sh
./install.sh

# 2. Menüyü aç
menu

# 3. Kullanıcı oluştur
# Menüden [01] seçin

# 4. Bağlantıları izle
# Menüden [04] seçin
```

---

**Not:** Bu proje eğitim ve araştırma amaçlıdır. Kullanımdan doğacak sorumluluk kullanıcıya aittir.

**Son Güncelleme:** 5 Aralık 2025  
**Versiyon:** v39  
**Geliştirici:** @requmen  
**Durum:** Aktif Geliştirme 🚀
