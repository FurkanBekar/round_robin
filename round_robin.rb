# Author : Furkan BEKAR
# Date : May 2020
#İNFO : Bu algoritma bir zamanlama algoritmasıdır.
#       Genellikle işletim sistemlerinde ve networklerde kullanılır.
#       Algortitmadaki temel amaç ise işlemcideki processlere en kısa bekleme süresinde cevap verip
#       ortalama bekleme süresini azaltmak ve mümkün olduğunca işlemlere hızlı cevap vermektir.
# --------------- Round Robin Algorithm -----------------


# Bu kısımda gerekli olan verileri kullanıcıdan alıyoruz. process name, quadrant time vb değerleri
islem = []
islem_suresi = []
islem_gelme = []
a = ""

while a != "q"
puts("Lütfen process adını giriniz :")
islem.append(gets.chomp)

puts("Lütfen işlemin gerçekleşme süresini giriniz: ")
islem_suresi.append(gets.to_i)

puts("Lütfen processin işlemciye gelme zamanını giriniz: ")
islem_gelme.append(gets.to_i)

puts("Lütfen gerçekleştirmek istediğiniz işlemler bittiyse q tuşuna basınız.")
a = gets.chomp
end

puts("Lütfen time quadrant değerini giriniz :")
time_quadrant = gets.to_i


# Bu kısımda ise algoritmamızın bize vereceği cevapları kullanıcıya gösterebilmek için gerekli değişkenleri tanımlıyotuz
islem_tekrar = [] # Bu değer bize bir işlemin bekleme süresinde kaç defa çağrıldığını ifade eder.
response_time = []
i = 0

while i<islem.length
  islem_tekrar.append(0)
  response_time.append(0)
  i = i + 1
end

islem_sırası = [] # Gun chartı oluşturmak için gerekli olan dizimiz
context_switch = 0
time = 0
bekleme_suresi = []
top = 0
for z in islem_suresi
  top = top +z
end
l = 0
while l< islem.length
  bekleme_suresi.append(top)
  l = l + 1
end

kalan_islem = 0
for x in islem_suresi
  kalan_islem = kalan_islem + x
end

# İşte asıl olarak algoritmamızın çözümü burada başlıyor.
while kalan_islem != 0
  j = 0
  while j < islem.length

    if islem_suresi[j] != 0
      islem_suresi[j] = islem_suresi[j] - time_quadrant
      islem_sırası.append(islem[j])

      if islem_tekrar[j] == 0
        response_time[j] = time - islem_gelme[j]
      end

      islem_tekrar[j] = islem_tekrar[j] + 1

      bekleme_suresi[j] = bekleme_suresi[j] - time_quadrant

      context_switch = context_switch + 1
      time = time + time_quadrant
      kalan_islem = kalan_islem - time_quadrant

      if kalan_islem < 0
        kalan_islem = 0
      end


    end
    j = j + 1

  end
end

# Bu kısımda ise gerekli olan matematiksel hesapları yapıyoruz.
toplam = 0
for n in bekleme_suresi
  toplam = toplam + n
end

response = 0
for t in response_time
  response = response + t
end

ort_wait_time = toplam/islem.length.to_f

ort_response_time = response/islem.length.to_f

context_switch = context_switch - 2

# Artık burada algoritmamızın cevaplamış olduğu soruları consol ekranına yazdırıyoruz
puts("Gun chart :")
for m in islem_sırası
  print(m + ",")
end
puts("-----------------------------------------")
puts(" ")

puts("Bekleme süreleri :")
d = 0
while d < islem.length
  puts(islem[d] + " işleminin bekleme süresi: " + bekleme_suresi[d].to_s)
  d = d + 1
end
puts("-----------------------------------------")
puts("Response süreleri :")
f = 0
while f < islem.length
  puts(islem[f] + " işleminin response süresi: " + response_time[f].to_s)
  f = f + 1
end
puts("-----------------------------------------")
puts("Ortalama bekleme süresi = " + ort_wait_time.to_s)
puts("-----------------------------------------")
puts("Ortalama response süresi = " + ort_response_time.to_s)
puts("-----------------------------------------")
puts("Context switch sayısı = " + context_switch.to_s)

gets.chomp








