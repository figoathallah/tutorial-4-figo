Figo Athallah</br>
2006533571</br>
Tutorial 4 Game Development</br>

<h1>Latihan Mandiri: Membuat Level Baru Dengan Tile Map & Obstacle Berbeda</h1>

Untuk latihan mandiri ini, saya membuat level 2 yang merupakan lanjutan setelah menamatkan Level 1. Dalam level ini, tekstur _Tile Map_ yang digunakan untuk permukaan dan platform yang bisa dilangkahi pemain berupa asset Kenney yang bernama “Planet”. Selain itu, terdapat obstacle jurang seperti Level 1, serta obstacle baru berupa _saw blade_, dimana terdapat 2 tipe musuh tersebut: _saw blade_ yang jatuh dari langit dan muncul melalui sebuah **Spawner** seperti ikan di Level 1 dan _saw blade_ yang bergerak bolak-balik secara horizontal di atas tanah.

Mekanisme pergerakan _saw blade_ agar bisa secara terus menerus bergerak ibarat berpatroli dari satu sisi ke sisi lain serta balik ke posisi awal memanfaatkan sebuah fitur Godot yang saya pelajari secara mandiri, yaitu **Tween**.

<h2>Apa itu Tween?</h2>

Berdasarkan Godot Docs, **Tween** adalah sebuah objek _lightweight_ yang berfungsi untuk melakukan animasi pada properti sebuah node dengan cara menginterpolasi titik awal dan titik akhir dari properti tersebut. Kata “tween” berasal dari teknik animasi bernama “in-betweening”, dimana _keyframe_ yang sebelumnya kita tentukan akan menginterpolasi _frames_ yang muncul di antara titik awal dan akhir _keyframe_ tersebut secara dinamis oleh komputer.

<h2>Cara Kerja Tween untuk Objek Saw</h2>

Untuk mewujudkan pergerakan _saw blade_, kita pertama membuat GDScript yang akan di-attach ke objek itu. Dalam script tersebut, kita menginisiasi variabel _start_ dan _end_ objek tersebut sebagai vektor yang kosong. Variabel tersebut menentukan jalur yang akan ia lewati secara bolak-balik. Kemudian ditambahkan variabel jarak yang menentukan berapa jauh objek tersebut akan jalan, variabel yang menentukan durasi pergerakan tersebut, serta boolean _reverse_ untuk meng-handle pergerakan dari titik akhir kembali ke titik awal.

Agar obstacle bisa di-_reuse_ untuk membuat _saw blade_ lainnya, variabel _start_ diisi dengan global position, atau letak kita menaruh objek tersebut di Viewport. Variabel _end_ mengikuti posisi global _start_, namun posisi x-axis nya akan diselisih dengan jarak yang kita tentukan.

Setelah semua variabel tersebut diinisialisasikan, kita cukup membuat objek Tween dan menginterpolasi _saw blade_ tersebut dengan metode bawaan _interpolate_property_-nya. Lalu agar objek tersebut kembali ke titik awal, kita menghubungkan signal _tween_completed_ kepada metode yang akan mengubah flag boolean _reverse_, sehingga target posisi akhir yang ingin dituju menjadi posisi _start_ kembali. Signal tersebut akan dieksekusi setelah gerakan pertama selesai.
