use
casestudy;
-- task 2;
select ma_nhan_vien, ho_ten
from nhan_vien
where (ho_ten like 'h%' or ho_ten like 'k%' or ho_ten like 't%')
  and length(ho_ten) < 15;
-- task 3;
select *
from khach_hang
where (18 <= timestampdiff(year,ngay_sinh, now())
    and timestampdiff(year,ngay_sinh, now()) <= 50)
  and (dia_chi like '%Đà Nẵng' or dia_chi like '%Quảng Trị');
-- task 4;
select kh.ma_khach_hang, ho_ten, count(kh.ma_khach_hang) as so_luong
from khach_hang kh
         inner join hop_dong hd on kh.ma_khach_hang = hd.ma_khach_hang
         inner join loai_khach lk on kh.ma_loai_khach = lk.ma_loai_khach
where lk.ten_loai_khach = 'Diamond'
group by kh.ma_khach_hang
order by kh.ma_khach_hang;

select kh.ma_khach_hang, ho_ten, count(kh.ma_khach_hang) as so_luong
from khach_hang kh
         inner join hop_dong hd on kh.ma_khach_hang = hd.ma_khach_hang
where kh.ma_loai_khach in (select kh.ma_loai_khach
                           from loai_khach
                                    inner join khach_hang on loai_khach.ma_loai_khach = khach_hang.ma_loai_khach);
-- task 5;
set
sql_mode='';
SET
GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
select kh.ma_khach_hang,
       kh.ho_ten,
       lk.ten_loai_khach,
       hd.ma_hop_dong,
       dv.ten_dich_vu,
       hd.ngay_lam_hop_dong,
       hd.ngay_ket_thuc,
       (ifnull(dv.chi_phi_thue, 0) + sum(ifnull(hdct.so_luong, 0) * ifnull(dvdk.gia, 0))) as tong_tien
from (((khach_hang kh left join loai_khach lk on kh.ma_loai_khach = lk.ma_loai_khach)
    left join hop_dong hd on kh.ma_khach_hang = hd.ma_khach_hang)
    left join dich_vu dv on hd.ma_dich_vu = dv.ma_dich_vu)
         left join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
         left join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
group by hd.ma_hop_dong, kh.ma_khach_hang
order by kh.ma_khach_hang, kh.ma_khach_hang;

-- task 6;
select dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.chi_phi_thue, ten_loai_dich_vu
from dich_vu dv
         inner join loai_dich_vu ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
where ma_dich_vu not in (select ma_dich_vu
                         from hop_dong
                         where (month(ngay_lam_hop_dong) between 1 and 3) and year (ngay_lam_hop_dong) = 2021 );

select dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.chi_phi_thue, ten_loai_dich_vu
from dich_vu dv
         inner join loai_dich_vu ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
where not exists(select ma_dich_vu
                 from hop_dong
                 where (((month(ngay_lam_hop_dong) between 1 and 3) and year ( ngay_lam_hop_dong) = 2021)) and dv.ma_dich_vu = hop_dong.ma_dich_vu
group by ma_dich_vu);

-- exists
-- task 7;
select ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu
from dich_vu dv
         inner join loai_dich_vu ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
where ma_dich_vu not in (select ma_dich_vu from hop_dong where year (ngay_lam_hop_dong) = 2021);

-- task 8;
select distinct ho_ten
from khach_hang
order by ho_ten;

-- task 9;
select month (ngay_lam_hop_dong) thang, count (month (ngay_lam_hop_dong)) so_luong
from hop_dong
where year (ngay_lam_hop_dong) =2021
group by month (ngay_lam_hop_dong)
order by month (ngay_lam_hop_dong);

-- task 10.	Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm. 
-- Kết quả hiển thị bao gồm ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, 
-- tien_dat_coc, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).
select hd.ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, sum(hdct.so_luong) so_luong_dich_vu
from hop_dong hd
         left join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
group by hd.ma_hop_dong
order by hd.ma_hop_dong;

-- task 11.	Hiển thị thông tin các dịch vụ đi kèm 
-- đã được sử dụng bởi những khách hàng
-- có ten_loai_khach là “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.
select dvdk.ma_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem
from (hop_dong hd
    inner join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong)
         inner join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
where hdct.ma_hop_dong in (select ma_hop_dong
                           from (khach_hang kh
                               inner join loai_khach lk on kh.ma_loai_khach = lk.ma_loai_khach)
                                    inner join hop_dong hd on hd.ma_khach_hang = kh.ma_khach_hang
                           where ten_loai_khach = 'Diamond'
                             and (kh.dia_chi like '%Vinh' or kh.dia_chi like '%Quảng Ngãi'));


-- task 12.	Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), so_dien_thoai (khách hàng), ten_dich_vu, 
-- so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem), tien_dat_coc 
-- của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 2020 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021;
select hd.ma_hop_dong,
       nv.ho_ten                     ho_ten_nv,
       kh.ho_ten                     ho_ten_kh,
       kh.so_dien_thoai,
       hd.ma_dich_vu,
       dv.ten_dich_vu,
       ifnull(sum(hdct.so_luong), 0) so_luong,
       tien_dat_coc
from hop_dong hd
         inner join nhan_vien nv on hd.ma_nhan_vien = nv.ma_nhan_vien
         left join khach_hang kh on kh.ma_khach_hang = hd.ma_khach_hang
         left join dich_vu dv on dv.ma_dich_vu = hd.ma_dich_vu
         left join hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong
         left join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
where hd.ma_dich_vu in (select hd.ma_dich_vu
                        from hop_dong hd
                        where month (
    hd.ngay_lam_hop_dong) between 10
  and 12
  and year (hd.ngay_lam_hop_dong)=2020
  and hd.ma_dich_vu not in (
select hd.ma_dich_vu
from hop_dong hd
where month (hd.ngay_lam_hop_dong) between 1 and 6 and year (hd.ngay_lam_hop_dong)=2021))
group by hd.ma_hop_dong;


-- task 13.	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng. 
-- (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).
select dvdk.ma_dich_vu_di_kem, ten_dich_vu_di_kem, gia, don_vi, trang_thai, sum(so_luong) tong
from hop_dong_chi_tiet hdct
         inner join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
group by dvdk.ma_dich_vu_di_kem
having tong = (select sum(so_luong) tong
               from hop_dong_chi_tiet hdct
                        inner join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
               group by dvdk.ma_dich_vu_di_kem
               order by tong desc
    limit 1);


-- task 14. 
select hd.ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, count(hdct.ma_dich_vu_di_kem) so_lan_su_dung
from loai_dich_vu ldv
         inner join dich_vu dv on ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu
         inner join hop_dong hd on hd.ma_dich_vu = dv.ma_dich_vu
         inner join hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong
         inner join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
group by hdct.ma_dich_vu_di_kem
having so_lan_su_dung = 1
order by ma_hop_dong;


-- task 15;
select nv.ma_nhan_vien, nv.ho_ten, td.ten_trinh_do, bp.ten_bo_phan, nv.so_dien_thoai, nv.dia_chi
from nhan_vien nv
         inner join trinh_do td on nv.ma_trinh_do = td.ma_trinh_do
         inner join bo_phan bp on bp.ma_bo_phan = nv.ma_bo_phan
         inner join hop_dong hd on hd.ma_nhan_vien = nv.ma_nhan_vien
where year (hd.ngay_lam_hop_dong) between 2020 and 2021
group by ma_nhan_vien
having count (hd.ma_nhan_vien) <=3
order by ma_nhan_vien;


-- task 16;
SET
SQL_SAFE_UPDATES = 0;
delete
from nhan_vien
where nhan_vien.ma_nhan_vien not in (select ma_nhan_vien
                                     from hop_dong
                                     where year (
    ngay_lam_hop_dong) between 2019
  and 2021
group by ma_nhan_vien);


-- task 17;
create view ma_tong_tien
as
select (ifnull(dv.chi_phi_thue, 0) + sum(ifnull(hdct.so_luong, 0) * ifnull(dvdk.gia, 0))) tong_tien,
       lk.ma_loai_khach
from (((khach_hang kh left join loai_khach lk on kh.ma_loai_khach = lk.ma_loai_khach)
    left join hop_dong hd on kh.ma_khach_hang = hd.ma_khach_hang)
    left join dich_vu dv on hd.ma_dich_vu = dv.ma_dich_vu)
         left join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
         left join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
where
        year (ngay_lam_hop_dong) = 2021
        group by hd.ma_hop_dong, kh.ma_khach_hang
        having tong_tien > 10000000
        order by kh.ma_khach_hang, kh.ma_khach_hang;

update khach_hang
set ma_loai_khach = 1
where ma_loai_khach = 2
  and ma_loai_khach in (select ma_loai_khach from ma_tong_tien);

-- task 18;
set
foreign_key_checks = 0;
delete
from khach_hang
where exists(select* from hop_dong where hop_dong.ma_khach_hang = khach_hang.ma_khach_hang);

-- task 19;
update dich_vu_di_kem
set gia = gia * 2
where ma_dich_vu_di_kem in
      (select dich_vu_di_kem.ma_dich_vu_di_kem
       from hop_dong_chi_tiet
                inner join hop_dong on hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
       where year (ngay_lam_hop_dong) = 2020
group by dich_vu_di_kem.ma_dich_vu_di_kem
having sum (so_luong) > 10);

-- task 20;
select ma_nhan_vien as id, nv.ho_ten, nv.email, nv.so_dien_thoai, nv.ngay_sinh, nv.dia_chi
from nhan_vien nv
union all
select ma_khach_hang, kh.ho_ten, kh.email, kh.so_dien_thoai, kh.ngay_sinh, kh.dia_chi
from khach_hang kh;

