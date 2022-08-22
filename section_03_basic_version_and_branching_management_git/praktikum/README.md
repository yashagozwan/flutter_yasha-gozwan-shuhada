Membuat repository di github
![alt](../screenshot/part_01.png)
![alt](../screenshot/part_02.png)

Menginisialisasi project kita menjadi git repository
```Bash
git init
```
![alt](../screenshot/part_03.png)

Membuat branch development dan pindah langsung ke development
```Bash
git checkout -b development
```
![alt](../screenshot/part_04.png)

Membuat branch featureA dan pindah lansung
```Bash
git checkout -b featureA
```
![alt](../screenshot/part_05.png)

Membuat file di folder praktikum yang bernama task.dart selanjut nya menambahkan satu variable name di file tersebut.
```dart
void main() {
  String name = 'Yasha Gozwan Shuhada';
}
```

Mengirimkan perubahan yang berada di local kita ke remote origin Github
```Bash
git add .
git commit -m "Menambahkan variable name"
git push origin featureA
```

Membuat branch baru dari development dengan nama branch featureB kita synchronize dengan branch featureA dengan menggunakan perintal pull
```Bash
  git checkout -b featureB
  git pull origin featureA
```
![alt](../screenshot/part_06.png)

Menambahkan variable age
```dart
void main() {
  String name = 'Yasha Gozwan Shuhada';
  int age = 26;
}

```