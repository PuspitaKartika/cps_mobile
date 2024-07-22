# cps_mobile

CPS Mobile adalah aplikasi resource data user Accurate yang dapat menampilkan daftar pengguna, mencari user yang diinginkan, mengurutkan user berdasarkan nama, memfilter user berdasarkan kota dan menambahkan user.

https://github.com/user-attachments/assets/2bb7d01c-3318-4684-940a-518dcc84d769


## Cara penggunaan aplikasi
Pertama kali menggunakan aplikasi, pengguna akan masuk ke halaman utama yang menampilkan daftar user. adapun fitur pada halaman utama :  
1. Terdapat filter kota yang digunakan untuk mencari user berdasarkan kota. 
2. Terdapat tombol untuk mengurutkan user berdasarkan nama secara ascending (A-Z) ataupun descending (Z-A).
3. Terdapat search yang bisa digunakan user untuk mencari data user yang diinginkan secara cepat. 
4. Terdapat tombol (+) di pojok kanan bawah yang berfungsi untuk menambahkan data baru. 

Pada halaman "Tambah user" pengguna diminta untuk menginputkan data pada form. Data tersebut meliputi nama, alamat, email, nomor hp, dan kota. Tombol simpan akan disable ketika inputan kurang lengkap. Dan akan menampilkan SnackBar ketika berhasil ataupun gagal.


## Teknologi yang digunakan 
1. Dart
2. Flutter
3. Dio
4. BLoC
5. Equatable
6. GetX
7. Logger

## Penjelasan tampilan
Tampilan aplikasi ini dibuat seminimalis mungkin untuk memudahkan pengguna. Berikut poin-poin utama : 
1. Desain minimalis
Warna yang digunakan sederhana dan konsisten  untuk menciptakan tampilan yang bersih. 
2. Tipografi 
Font yang digunakan jelas dan mudah dibaca.
3. Navigasi mudah 
Semua fitur aplikasi tersedia di halaman utama, sehingga pengguna dapat menemukan dan menggunakan fitur yang mereka butuhkan dengan cepat. 
4. Interaksi pengguna yang efisien
Setiap field input dilengkapi dengan validasi yang jelas, memastikan pengguna mengisi informasi dengan benar sebelum menyimpan data. Setelah berhasil atau gagal menambahkan data, pengguna diberikan umpan balik langsung melalui notifikasi yang informatif.

## Nice to have (All Implemented)
1. Implementasi SOLID principle
2. Implementasi Clean architecture
3. Implementasi BloC sebagai state management
4. Implementasi GetX sebagai navigation
5. Implementasi Get_it sebagai dependency injection

## Steps to run the application
1. Clone the Repository 
```markdown
https://github.com/PuspitaKartika/cps_mobile.git
```
2. Open folder cps-mobile with VSCode or Android Studio
3. Install Dependencies
```markdown
flutter pub get
```
4. Run Application
```markdown
flutter run
```


