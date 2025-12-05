# Katkıda Bulunma Rehberi

SSHPlus Manager projesine katkıda bulunmayı düşündüğünüz için teşekkür ederiz! Bu dokümanda katkıda bulunma sürecini ve kurallarını bulabilirsiniz.

## 🤝 Katkı Türleri

Projeye farklı şekillerde katkıda bulunabilirsiniz:

### Kod Katkıları
- Yeni özellikler eklemek
- Hata düzeltmeleri yapmak
- Performans iyileştirmeleri
- Kod refactoring

### Dokümantasyon
- README ve diğer dokümantasyonu iyileştirmek
- Örnek kullanım senaryoları eklemek
- Çeviri yapmak
- Video eğitimler hazırlamak

### Test ve Raporlama
- Hata raporları göndermek
- Özellik önerileri sunmak
- Test senaryoları yazmak
- Farklı sistemlerde test etmek

### Topluluk Desteği
- Diğer kullanıcılara yardım etmek
- Soruları cevaplamak
- Topluluk etkinlikleri düzenlemek

## 🚀 Başlarken

### 1. Repository'yi Fork Edin

GitHub'da projeyi fork edin:
```
https://github.com/requmen/sshplus-manager-improved
```

### 2. Yerel Kopya Oluşturun

```bash
git clone https://github.com/KULLANICI_ADINIZ/sshplus-manager-improved.git
cd sshplus-manager-improved
```

### 3. Upstream Repository Ekleyin

```bash
git remote add upstream https://github.com/requmen/sshplus-manager-improved.git
```

### 4. Yeni Branch Oluşturun

```bash
git checkout -b feature/yeni-ozellik
# veya
git checkout -b fix/hata-duzeltmesi
```

## 📝 Geliştirme Süreci

### Branch İsimlendirme

Branch isimlerinde şu formatı kullanın:

- `feature/ozellik-adi` - Yeni özellikler için
- `fix/hata-adi` - Hata düzeltmeleri için
- `docs/dokuman-adi` - Dokümantasyon için
- `refactor/kod-adi` - Kod refactoring için
- `test/test-adi` - Test eklemeleri için

**Örnekler:**
```bash
git checkout -b feature/telegram-bot-integration
git checkout -b fix/ssh-connection-timeout
git checkout -b docs/installation-guide
```

### Commit Mesajları

Commit mesajlarında [Conventional Commits](https://www.conventionalcommits.org/) standardını kullanın:

**Format:**
```
<tip>(<kapsam>): <kısa açıklama>

<detaylı açıklama (isteğe bağlı)>

<footer (isteğe bağlı)>
```

**Tipler:**
- `feat` - Yeni özellik
- `fix` - Hata düzeltmesi
- `docs` - Dokümantasyon değişikliği
- `style` - Kod formatı (kod davranışını değiştirmeyen)
- `refactor` - Kod refactoring
- `test` - Test eklemeleri
- `chore` - Bakım işleri

**Örnekler:**
```bash
git commit -m "feat(user): kullanıcı oluşturma modülüne email doğrulama eklendi"

git commit -m "fix(ssh): bağlantı timeout sorunu düzeltildi"

git commit -m "docs(readme): kurulum adımları güncellendi"
```

### Kod Standartları

#### Bash Script Standartları

```bash
#!/bin/bash

# Dosya başlığı
#=============================================================================
# Script Adı: script_adi.sh
# Açıklama: Script açıklaması
# Yazar: İsim
# Tarih: YYYY-MM-DD
#=============================================================================

# Sabit değişkenler büyük harfle
readonly CONSTANT_VALUE="değer"

# Normal değişkenler küçük harfle
local_variable="değer"

# Fonksiyon isimleri snake_case
function_name() {
    local param1="$1"
    local param2="$2"
    
    # Kod...
}

# Hata kontrolü
if [[ $? -ne 0 ]]; then
    echo "Hata oluştu" >&2
    exit 1
fi

# Değişken kullanımında tırnak kullanın
echo "${variable}"

# Komut çıktısı kontrolü
if command -v program &> /dev/null; then
    echo "Program bulundu"
fi
```

#### Python Script Standartları

```python
#!/usr/bin/env python3
"""
Module docstring.
"""

import os
import sys

# Sabitler büyük harfle
CONSTANT_VALUE = "değer"

# Sınıf isimleri PascalCase
class ClassName:
    """Class docstring."""
    
    def __init__(self):
        """Constructor docstring."""
        self.variable = None
    
    def method_name(self, param):
        """Method docstring."""
        pass

# Fonksiyon isimleri snake_case
def function_name(param1, param2):
    """Function docstring."""
    return result
```

### Test Etme

Değişikliklerinizi test edin:

```bash
# Syntax kontrolü
bash -n script.sh

# ShellCheck ile kontrol
shellcheck script.sh

# Test ortamında çalıştırma
./script.sh --test
```

### Dokümantasyon

Kod değişiklikleri için dokümantasyon ekleyin:

- Fonksiyonlar için docstring
- Karmaşık kod blokları için yorum satırları
- README güncellemeleri
- Changelog girişi

## 📤 Pull Request Süreci

### 1. Değişikliklerinizi Commit Edin

```bash
git add .
git commit -m "feat: yeni özellik eklendi"
```

### 2. Branch'inizi Push Edin

```bash
git push origin feature/yeni-ozellik
```

### 3. Pull Request Oluşturun

GitHub'da Pull Request oluşturun:

1. Repository sayfanıza gidin
2. "Pull requests" sekmesine tıklayın
3. "New pull request" butonuna tıklayın
4. Branch'inizi seçin
5. Detaylı açıklama yazın

### Pull Request Şablonu

```markdown
## Değişiklik Türü
- [ ] Yeni özellik
- [ ] Hata düzeltmesi
- [ ] Dokümantasyon
- [ ] Refactoring
- [ ] Test

## Açıklama
Değişikliklerinizi detaylı açıklayın.

## İlgili Issue
Closes #123

## Test Edildi mi?
- [ ] Evet
- [ ] Hayır

## Test Ortamı
- İşletim Sistemi: Ubuntu 22.04
- Versiyon: v39

## Ekran Görüntüleri (varsa)
Ekran görüntülerini ekleyin.

## Checklist
- [ ] Kod standartlarına uygun
- [ ] Testler yazıldı
- [ ] Dokümantasyon güncellendi
- [ ] Changelog güncellendi
```

### Code Review Süreci

Pull request'iniz incelenecektir:

1. **Otomatik Kontroller:** CI/CD testleri çalışır
2. **Kod İncelemesi:** Maintainer'lar kodu inceler
3. **Değişiklik İstekleri:** Gerekirse değişiklik istenir
4. **Onay:** Onaylandıktan sonra merge edilir

## 🐛 Hata Raporlama

### Hata Raporu Şablonu

```markdown
## Hata Açıklaması
Hatayı kısaca açıklayın.

## Adımlar
1. İlk adım
2. İkinci adım
3. ...

## Beklenen Davranış
Ne olmasını bekliyordunuz?

## Gerçek Davranış
Ne oldu?

## Ekran Görüntüleri
Varsa ekran görüntüleri ekleyin.

## Ortam Bilgileri
- İşletim Sistemi: Ubuntu 22.04
- SSHPlus Versiyonu: v39
- Shell: bash 5.1

## Ek Bilgiler
Log dosyaları veya ek bilgiler.
```

## 💡 Özellik Önerisi

### Özellik Önerisi Şablonu

```markdown
## Özellik Açıklaması
Özelliği detaylı açıklayın.

## Motivasyon
Bu özellik neden gerekli?

## Kullanım Senaryosu
Nasıl kullanılacak?

## Alternatifler
Başka çözümler düşündünüz mü?

## Ek Bilgiler
Eklemek istediğiniz başka bilgiler.
```

## 📋 Checklist

Pull request göndermeden önce:

- [ ] Kod standartlarına uygun
- [ ] Testler yazıldı ve geçiyor
- [ ] Dokümantasyon güncellendi
- [ ] Commit mesajları standartlara uygun
- [ ] Branch güncel (upstream ile merge edildi)
- [ ] Değişiklikler test edildi
- [ ] CHANGELOG.md güncellendi

## 🎯 Öncelikli Alanlar

Şu alanlarda katkıya özellikle ihtiyaç var:

1. **Güvenlik İyileştirmeleri**
   - Şifreleme mekanizmaları
   - Güvenlik testleri
   - Penetrasyon testleri

2. **Performans Optimizasyonları**
   - Kod optimizasyonu
   - Bellek kullanımı
   - Hız iyileştirmeleri

3. **Dokümantasyon**
   - Türkçe dokümantasyon
   - Video eğitimler
   - Kullanım örnekleri

4. **Test Coverage**
   - Unit testler
   - Integration testler
   - End-to-end testler

5. **Çoklu Dil Desteği**
   - İngilizce çeviri
   - Diğer diller

## 🌍 Topluluk

### İletişim Kanalları

- **GitHub Issues:** Hata raporları ve özellik önerileri
- **GitHub Discussions:** Genel tartışmalar
- **Pull Requests:** Kod incelemeleri

### Davranış Kuralları

Topluluğumuzda herkes saygılı ve yapıcı olmalıdır:

- ✅ Saygılı ve yapıcı eleştiri
- ✅ Farklı görüşlere açık olma
- ✅ Yardımsever tutum
- ❌ Hakaret ve aşağılama
- ❌ Spam ve reklam
- ❌ Kişisel saldırılar

## 📜 Lisans

Katkılarınız projenin lisansı altında yayınlanacaktır. Katkıda bulunarak bunu kabul etmiş olursunuz.

## 🙏 Teşekkürler

Projeye katkıda bulunan herkese teşekkür ederiz! Katkılarınız projenin gelişmesine büyük katkı sağlamaktadır.

## 📞 İletişim

Sorularınız için:
- GitHub Issues açın
- Pull Request'te yorum yapın

---

**Mutlu kodlamalar!** 🚀
