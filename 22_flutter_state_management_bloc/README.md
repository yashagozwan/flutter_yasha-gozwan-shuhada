# 21 Flutter State Management (BLoC)

## Summary

Di materi ini saya belajar tentang BLoC:

- State class ini adalah class untuk menyimpan semua data yang kita butuhkan.
- Event class ini adalah class untuk mengatur perilaku dari State, contoh ketika kita ingin menambah data dan mengapus data, Kita harus membuat DataCreate dan DataRemove yang meng-extends dari DataEvent agar kedua class tersebut bisa digunakan.
- Bloc class ini adalah class yang menjadi core agar Event dan State bisa bekerja sama dengan baik.
- BlocProvider adalah class untuk mendaftarkan Bloc yang telah kita buat agar bisa digunakan oleh semua widgets.
- BlocBuilder adalah class untuk menggunakan semua class Event dan class State yang telah kita buat agar data State nya bisa berubah sesuai dengan keinginan kita dan data State nya dapat ditampilkan ke UI.
