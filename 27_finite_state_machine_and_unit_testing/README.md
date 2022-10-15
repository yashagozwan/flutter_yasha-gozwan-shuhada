# Finite State Machine & Unit Testing

## Summary

Di materi ini saya belajar tentang Finite State & Unit Test:

- IDDLE, RUNNING, dan ERROR adalah suatu keadaan ketika kita ingin meminta sebuah data, dan data itu dari internet ada keadaan dimana data itu sukses atau gagal maka Finite State ini sangat penting ketika kita ingin memberitau ketika sebuah request itu berhasil atau gagal.
- Test case adalah function untuk menjalankan method atau function apa yang ingin kita test. Contoh nya kita ingin membuat test untuk method getUsers dari api. kita bisa menguji nya di test case.
- Group adalah function untuk mengelompokan test case - test case yang sudah kita buat menjadi satu kesatuan. Contoh nya kita membuat class ContactApi maka dalam group tersebut hanya test case nya hanya bersangkutan dengan ContactApi.
- Mocking adalah metode test yang tidak ada sangkut pautnya dengan ekternal, contoh nya kita membuat test case dengan mocking kita tidak perlu menggunakan internet karena mocking akan membuat function/method kita berjalan sesuai dengan method yang kita buat, Mocking sangat berguna ketika kita ingin membuat test case yang tidak ketergantunan dengan pihak luar.
