# 📡 UART TX Modülü (FSM Tabanlı VHDL Tasarım)

Bu proje, **VHDL dili** ile geliştirilmiş **FSM (Finite State Machine) tabanlı UART Transmitter (TX)** modülünü içermektedir. Tasarım **Xilinx Vivado** kullanılarak FPGA ortamında oluşturulmuştur.

---

## 📌 Proje Açıklaması

Bu UART TX modülü, 8-bit paralel veriyi (`din_i`) UART protokolüne uygun şekilde seri veri çıkışına (`tx_o`) dönüştürür. Veri iletimi FSM yapısı ve baud rate tabanlı zamanlama ile kontrol edilir.

---

## 📡 UART Veri Çerçevesi (Frame Yapısı)

UART iletişimi asenkron seri haberleşmeye dayanır. Veri iletimi aşağıdaki çerçeveye göre gerçekleşir:

<img width="945" height="110" alt="image" src="https://github.com/user-attachments/assets/f6ef0333-cb67-4c3b-8de5-382048a99eea"/> 

---

## 📌 Veri Akış Sırası
IDLE → START → DATA (0-7) → STOP → IDLE

---

## 🧾 Bit Açıklamaları

- **IDLE:** Hat boşta (logic 1)
- **START:** İletişim başlangıcı (logic 0)
- **DATA 0–7:** 8-bit veri LSB first olacak şekilde gönderilir
- **STOP:** İletişim bitişi (logic 1)

---

## ⚙️ Modül Özellikleri

- FSM tabanlı UART TX tasarımı
- 8-bit paralel → seri veri dönüşümü
- Ayarlanabilir sistem clock frekansı (`c_clkfreq`)
- Ayarlanabilir baud rate (`c_baudrate`)
- Ayarlanabilir stop bit sayısı (`c_stopbit`)
- Baud rate zamanlama kontrolü (timer tabanlı)
- Veri gönderim tamamlandı sinyali (`tx_done_tick_o`)

---

## 🔄 FSM Durumları

- **S_IDLE:** Veri gönderimi beklenir  
- **S_START:** Start bit gönderilir  
- **S_DATA:** 8-bit veri seri olarak iletilir  
- **S_STOP:** Stop bit(ler) gönderilir ve işlem tamamlanır  

---

##  UART Hakkında

UART (Universal Asynchronous Receiver Transmitter), **clock sinyali olmadan çalışan asenkron bir seri haberleşme protokolüdür**. Gönderici ve alıcı arasında senkronizasyon, sadece **baud rate uyumu** ile sağlanır.

---

## ⏱️ Baud Rate Zamanlaması

Bit süresi aşağıdaki formül ile belirlenir:
c_bittimer_limit = c_clkfreq / c_baudrate

Her bit bu süre boyunca sabit tutulur.

---

## 📥 Port Tanımları

### Girişler:
- `clk` : Sistem clock sinyali  
- `din_i` : 8-bit paralel veri girişi  
- `tx_start_i` : Veri gönderim başlatma sinyali  

### Çıkışlar:
- `tx_o` : UART seri veri çıkışı  
- `tx_done_tick_o` : Veri gönderim tamamlandı sinyali  

---

## 🛠️ Kullanılan Teknolojiler

- VHDL (IEEE STD_LOGIC_1164, NUMERIC_STD)
- Xilinx Vivado
- FPGA tabanlı tasarım

---

## 🎯 Projenin Amacı

Bu proje, FPGA tabanlı sistemlerde **basit, modüler ve FSM tabanlı UART TX tasarımı** geliştirmeyi ve dijital haberleşme mantığını göstermeyi amaçlamaktadır.

