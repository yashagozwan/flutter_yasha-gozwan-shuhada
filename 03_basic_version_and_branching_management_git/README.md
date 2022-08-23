# Section 3 Basic Version and Branch Management (Git)

1.	Github Repository
Github Repository adalah suatu penyimpanan folder di dalam platform Github itu sendiri, Dimana kita dapat menyimpan file project kita secara Global di dalam internet dan dapat di akses oleh banyak orang.
Untuk penyimpanan folder kita ke dalam Github di sebut dengan Github Repository, folder yang terdapat di dalam penyimpanan komputer kita di sebut dengan penyimpana Local, sedangkan Ketika kita ingin menyimpan ke dalam Github Repository itu disebut dengan penyimpanan Remote.
Untuk konfigurasi penyimpanan Local ke dalam penyimpanan Remote, kita menggunakan Tools yang dapat di instal pada komputer kita baik windows, Ios, dan Linux disebut dengan “Git”.
Perlu di ketahui bahwa Github Repository dapat di simpan secara global dinamakan “Public” atau tidak secara Global dinamakan “Private”

2.	Git add & Git Commit
Pada dasar nya saat kita sudah melakukan konfigurasi terhadap penyimpanan local dan remote (terhubung).
Ketika kita melakukan perubahan kode terhdap penyimpanan local , maka perubahan kode tersebut akan tersimpan di dalam yang Namanya “Working Directory” . Di dalam Working Directory ini Kode kita belum sama dengan penyimpanan di dalam remote(Github Repository) ada tahapan yang harus di lakukan agar kita bisa membuat penyimpanan remote kita sama dengan penyimapan local.
Pertama kita melakukan “Git add” para perubahan kode  kita yang terdapat pada Working Directory, setelah kita melakukan Git add maka perubahan code tersebut akan masuk kedalam yang Namanya “Staging Area”.
Kedua Ketika perubahan kode kita sudah masuk di dalam Staging Area , maka kita melakukan sebuah yang Namanya “Git Commit” supaya perubahan kode kita dapat di teruskan sebelum masuk ke dalam penyimpanan remote.
Git Commit sendiri biasanya memasukan sebuah “Komentar” untuk mengetahui perubahan kode kita yang bertujuan memberikan petunjuk maksud dari perubahan kode tersebut.

3.	Git Push
Git push adalah sebuah sintaks di dalam Git, jika kita sudah melakukan Git Commit. Proses nya dari Staging Area setelah melakukan Git Push maka penyimpana Remote sudah di perbarui dengan komentar yang sudah di lakukan pada Git Commit.
Setelah itu sistem melakukan yang Namanya Git Push untuk mendorong penyimpanan Local yang sudah memiliki perubahan kode pada sebelumnya agar penyimpanan Remote berubah dan sama dengan penyimpanan Local yang sekarang.