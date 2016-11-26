
<b><h1>VMware Scann & Exploit</h1></b>

<p align="center">
<img src ="http://cyberjunior.org/sslscanner/cjlogo.png" />
</p>
## SSL HEARTBEAT NEDİR ? 
Heartbleed, şifreleme protokollerinden OpenSSL’de meydana gelen güvenlik açığına verilen isimdir. Google Secure ekibinden Neel MEHTA ve Codenomicon şirketi Heartbleed Bug’ın ortadan kaldırılması için büyük online servis sağlayıcıları ile birlikte çalışmaktadır. Bu güvenlik açığı internetin %65’inden fazlasını ilgilendirmektedir ve bu oran gerçekten çok yüksek bir seviyedir. Çünkü Apache ve Nginx’İn çok büyük çoğunluğu açık kaynak olduğu için OpenSSL’i kullanmaktadır.

OpenSSL 1.0.1′den 1.0.1f sürümüne kadar olan tüm versiyonları etkileyen Heartbleed SSL/TLS ile şifrelenen her tür verinin, uzaktan ve herhangi bir iz bırakmadan okunabilmesini sağlayan bir güvenlik açığı. TLS içinde bulunan bir hatadan kaynaklanan bu açık internet üzerindeki herhangi birisi, söz konusu OpenSSL sürümünü kullanan herhangi bir sistemden şifreli tüm bilgiyi 64 KB’lik bölümler halinde sızdırabiliyor.Bu yöntemin tanımlı olduğu yazılımın kütüphanesinde keşfedilen bir zafiyet üzerinden, sunucu ya da istemci fark etmeksizin bu yazılımı kullanan bütün sistemlerin hafıza (RAM) bilgisinin belli bir kısmı sızdırılabiliyor.

Bu sızan bilgilerde, Web oturum bilgileri, parolalar, önemli şifreleme anahtarları gibi kritik bilgiler yer alıyor olma ihtimali bulunuyor.Medyada yanlış bir bilgilendirme ile bu açıklığın bir virüs gibi kendi kendine yayılan ve diğer bütün sistemleri ele geçirmek için kontrolsüz ilerleyen bir tehdit gibi gösterilmesi, tamamen bilgi eksikliğinden kaynaklanıyor.

## KURULUM

```sh
$ apt-get install git
$ git clone https://github.com/serhatgksu/vmwarescanner.git
$ cd vmwarescanner
$ sudo chmod +x scanner.sh & sudo chmod +x heartbeat.py
$ ./scanner.sh
```
## TOOL KULLANIMI
Verilen IP yada IP aralığında ki VMware sunucuları tarayarak bulunan sunucular üzerinde SSL HEARTBEAT zafiyetinin kontolünü yaptıktan sonra zafiyetli makinalara SSL HEARTBEAT exploiti uygular.

## NOT
BU TOOL SADECE EĞİTİM VE TEST AMAÇLI KULLANIMLAR İÇİN YAZILMIŞTIR. AKSİNE KULLANIMLARDAN KİŞİNİN KENDİSİ SORUMLUDUR.
