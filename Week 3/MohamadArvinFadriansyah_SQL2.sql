--soal 1
select nama, email, bulan_lahir, tanggal_registrasi
from rakamin_customer
where (email like '%yahoo%' or email like '%roket%')
and (tanggal_registrasi BETWEEN '2012-01-01' and '2012-03-31')
and (bulan_lahir in ('Januari','Februari', 'Maret'));

--soal 2
select
    id_order,
    id_pelanggan,
    harga,
    harga + (harga*ppn) as harga_setelah_ppn,
    (case
        when harga + (harga*ppn) <= 20000 then 'LOW'
        when harga + (harga*ppn) <= 50000 then 'MEDIUM'
    else
        'HIGH'
    end) spending_bucket
from rakamin_order
order by harga_setelah_ppn desc;

--soal 3
select
    id_merchant,
    count(id_merchant) as jumlah_order,
    sum(harga) as jumlah_pendapatan
from rakamin_order
group by id_merchant
order by jumlah_pendapatan desc;

--soal 4
select metode_bayar,count(metode_bayar) as frekuensi_penggunaan
from rakamin_order
group by  metode_bayar
having  count(metode_bayar) > 10
order by frekuensi_penggunaan desc, metode_bayar;

--soal 5
WITH populasi_kota AS (
    SELECT kota, COUNT(kota) AS total_populasi
    FROM rakamin_customer_address
    GROUP BY kota
)

SELECT
    kota, total_populasi
FROM
    populasi_kota
WHERE
    total_populasi in (SELECT MIN(total_populasi) FROM populasi_kota)
    OR
    total_populasi in (SELECT MAX(total_populasi) FROM populasi_kota)
order by total_populasi asc, kota;

--soal 6
select
    rm.id_merchant,
    rm.nama_merchant,
    ro.metode_bayar,
    count(ro.metode_bayar) as frekuensi_tipe_pembayaran
from rakamin_merchant rm
join rakamin_order ro
on rm.id_merchant= ro.id_merchant
group by  rm.id_merchant, rm.nama_merchant,ro.metode_bayar
order by rm.nama_merchant,ro.metode_bayar;

--soal 7
with total_kuantitas_pelanggan_di_atas_5 as
(
select id_pelanggan, sum(kuantitas) as total_kuantitas
from rakamin_order
group by id_pelanggan
having sum(kuantitas)>5
)

SELECT rc.id_pelanggan, tk.total_kuantitas, rc.nama, rc.email
FROM rakamin_customer rc
join total_kuantitas_pelanggan_di_atas_5 tk
on rc.id_pelanggan = tk.id_pelanggan
order by id_pelanggan;

set search path to rakafood;