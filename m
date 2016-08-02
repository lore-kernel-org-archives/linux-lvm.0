Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u72Mnkf4029791
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Tue, 2 Aug 2016 18:49:46 -0400
Received: from mail-qk0-f181.google.com (mail-qk0-f181.google.com
	[209.85.220.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E497361E46
	for <linux-lvm@redhat.com>; Tue,  2 Aug 2016 22:49:45 +0000 (UTC)
Received: by mail-qk0-f181.google.com with SMTP id v123so56200923qkh.3
	for <linux-lvm@redhat.com>; Tue, 02 Aug 2016 15:49:45 -0700 (PDT)
MIME-Version: 1.0
From: Steve Dainard <sdainard@spd1.com>
Date: Tue, 2 Aug 2016 15:49:44 -0700
Message-ID: <CAEMJtDsvR-70bVC2E=aMGoA1nR_ReqW-jVELTjmJyQDY+xzXnw@mail.gmail.com>
Content-Type: multipart/alternative; boundary=94eb2c063b7a7922ce05391e8847
Subject: [linux-lvm] lvm2 raid volumes
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com

--94eb2c063b7a7922ce05391e8847
Content-Type: text/plain; charset=UTF-8

Hello,

What are the methods for checking/monitoring a RAID LV?

The Cpy%Sync field seems promising here:

# lvs
  LV    VG           Attr       LSize   Pool Origin Data%  Meta%  Move Log
Cpy%Sync Convert
  raid1 test         rwi-aor--- 100.00m
 100.00
  raid6 test         rwi-aor--- 108.00m
 100.00

# pvs
  PV         VG           Fmt  Attr PSize    PFree
  /dev/vdb   test         lvm2 a--  1020.00m 876.00m
  /dev/vdc   test         lvm2 a--  1020.00m 876.00m
  /dev/vdd   test         lvm2 a--  1020.00m 980.00m
  /dev/vde   test         lvm2 a--  1020.00m 980.00m
  /dev/vdf   test         lvm2 a--  1020.00m 980.00m

But testing in a VM by removing a disk does not change the output of lvs:

# pvs
  WARNING: Device for PV S5xFZ7-mLaH-GNQP-ujWh-Zbkt-Ww3u-J0aKUJ not found
or rejected by a filter.
  PV             VG           Fmt  Attr PSize    PFree
  /dev/vdb       test         lvm2 a--  1020.00m 876.00m
  /dev/vdc       test         lvm2 a--  1020.00m 876.00m
  /dev/vdd       test         lvm2 a--  1020.00m 980.00m
  /dev/vde       test         lvm2 a--  1020.00m 980.00m
  unknown device test         lvm2 a-m  1020.00m 980.00m

# lvs
  WARNING: Device for PV S5xFZ7-mLaH-GNQP-ujWh-Zbkt-Ww3u-J0aKUJ not found
or rejected by a filter.
  LV    VG           Attr       LSize   Pool Origin Data%  Meta%  Move Log
Cpy%Sync Convert
  raid1 test         rwi-aor--- 100.00m
 100.00
  raid6 test         rwi-aor-p- 108.00m
 100.00


My end goal is to write a nagios check to monitor for disk failures.

Thanks,
Steve

--94eb2c063b7a7922ce05391e8847
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+SGVsbG8sPGRpdj48YnI+PC9kaXY+PGRpdj5XaGF0IGFyZSB0aGUgbWV0
aG9kcyBmb3IgY2hlY2tpbmcvbW9uaXRvcmluZyBhIFJBSUQgTFY/PC9kaXY+PGRpdj48YnI+PC9k
aXY+PGRpdj5UaGUgQ3B5JVN5bmMgZmllbGQgc2VlbXMgcHJvbWlzaW5nIGhlcmU6PC9kaXY+PGRp
dj48YnI+PC9kaXY+PGRpdj48ZGl2PiMgbHZzPC9kaXY+PGRpdj7CoCBMViDCoCDCoFZHIMKgIMKg
IMKgIMKgIMKgIEF0dHIgwqAgwqAgwqAgTFNpemUgwqAgUG9vbCBPcmlnaW4gRGF0YSUgwqBNZXRh
JSDCoE1vdmUgTG9nIENweSVTeW5jIENvbnZlcnQ8L2Rpdj48ZGl2PsKgIHJhaWQxIHRlc3QgwqAg
wqAgwqAgwqAgcndpLWFvci0tLSAxMDAuMDBtIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgMTAwLjAwIMKgIMKgIMKgIMKgIMKgPGJyPjwvZGl2Pjxk
aXY+wqAgcmFpZDYgdGVzdCDCoCDCoCDCoCDCoCByd2ktYW9yLS0tIDEwOC4wMG0gwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAxMDAuMDAgwqAgwqAg
wqAgwqAgwqA8L2Rpdj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PjxkaXY+IyBwdnM8L2Rpdj48
ZGl2PsKgIFBWIMKgIMKgIMKgIMKgIFZHIMKgIMKgIMKgIMKgIMKgIEZtdCDCoEF0dHIgUFNpemUg
wqAgwqBQRnJlZSDCoDwvZGl2PjxkaXY+wqAgL2Rldi92ZGIgwqAgdGVzdCDCoCDCoCDCoCDCoCBs
dm0yIGEtLSDCoDEwMjAuMDBtIDg3Ni4wMG08YnI+PC9kaXY+PGRpdj7CoCAvZGV2L3ZkYyDCoCB0
ZXN0IMKgIMKgIMKgIMKgIGx2bTIgYS0tIMKgMTAyMC4wMG0gODc2LjAwbTwvZGl2PjxkaXY+wqAg
L2Rldi92ZGQgwqAgdGVzdCDCoCDCoCDCoCDCoCBsdm0yIGEtLSDCoDEwMjAuMDBtIDk4MC4wMG08
L2Rpdj48ZGl2PsKgIC9kZXYvdmRlIMKgIHRlc3QgwqAgwqAgwqAgwqAgbHZtMiBhLS0gwqAxMDIw
LjAwbSA5ODAuMDBtPC9kaXY+PGRpdj7CoCAvZGV2L3ZkZiDCoCB0ZXN0IMKgIMKgIMKgIMKgIGx2
bTIgYS0tIMKgMTAyMC4wMG0gOTgwLjAwbTwvZGl2PjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+
QnV0IHRlc3RpbmcgaW4gYSBWTSBieSByZW1vdmluZyBhIGRpc2sgZG9lcyBub3QgY2hhbmdlIHRo
ZSBvdXRwdXQgb2YgbHZzOjwvZGl2PjxkaXY+PGRpdj48YnI+PC9kaXY+PGRpdj4jIHB2czwvZGl2
PjxkaXY+wqAgV0FSTklORzogRGV2aWNlIGZvciBQViBTNXhGWjctbUxhSC1HTlFQLXVqV2gtWmJr
dC1XdzN1LUowYUtVSiBub3QgZm91bmQgb3IgcmVqZWN0ZWQgYnkgYSBmaWx0ZXIuPC9kaXY+PGRp
dj7CoCBQViDCoCDCoCDCoCDCoCDCoCDCoCBWRyDCoCDCoCDCoCDCoCDCoCBGbXQgwqBBdHRyIFBT
aXplIMKgIMKgUEZyZWUgwqA8L2Rpdj48ZGl2PsKgIC9kZXYvdmRiIMKgIMKgIMKgIHRlc3QgwqAg
wqAgwqAgwqAgbHZtMiBhLS0gwqAxMDIwLjAwbSA4NzYuMDBtPGJyPjwvZGl2PjxkaXY+wqAgL2Rl
di92ZGMgwqAgwqAgwqAgdGVzdCDCoCDCoCDCoCDCoCBsdm0yIGEtLSDCoDEwMjAuMDBtIDg3Ni4w
MG08L2Rpdj48ZGl2PsKgIC9kZXYvdmRkIMKgIMKgIMKgIHRlc3QgwqAgwqAgwqAgwqAgbHZtMiBh
LS0gwqAxMDIwLjAwbSA5ODAuMDBtPC9kaXY+PGRpdj7CoCAvZGV2L3ZkZSDCoCDCoCDCoCB0ZXN0
IMKgIMKgIMKgIMKgIGx2bTIgYS0tIMKgMTAyMC4wMG0gOTgwLjAwbTwvZGl2PjxkaXY+wqAgdW5r
bm93biBkZXZpY2UgdGVzdCDCoCDCoCDCoCDCoCBsdm0yIGEtbSDCoDEwMjAuMDBtIDk4MC4wMG08
L2Rpdj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PjxkaXY+IyBsdnM8L2Rpdj48ZGl2PsKgIFdB
Uk5JTkc6IERldmljZSBmb3IgUFYgUzV4Rlo3LW1MYUgtR05RUC11aldoLVpia3QtV3czdS1KMGFL
VUogbm90IGZvdW5kIG9yIHJlamVjdGVkIGJ5IGEgZmlsdGVyLjwvZGl2PjxkaXY+wqAgTFYgwqAg
wqBWRyDCoCDCoCDCoCDCoCDCoCBBdHRyIMKgIMKgIMKgIExTaXplIMKgIFBvb2wgT3JpZ2luIERh
dGElIMKgTWV0YSUgwqBNb3ZlIExvZyBDcHklU3luYyBDb252ZXJ0PC9kaXY+PGRpdj7CoCByYWlk
MSB0ZXN0IMKgIMKgIMKgIMKgIHJ3aS1hb3ItLS0gMTAwLjAwbSDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoDEwMC4wMCDCoCDCoCDCoCDCoCDCoDwv
ZGl2PjxkaXY+wqAgcmFpZDYgdGVzdCDCoCDCoCDCoCDCoCByd2ktYW9yLXAtIDEwOC4wMG0gwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAxMDAuMDAg
wqAgwqAgwqAgwqAgwqA8L2Rpdj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48
ZGl2Pk15IGVuZCBnb2FsIGlzIHRvIHdyaXRlIGEgbmFnaW9zIGNoZWNrIHRvIG1vbml0b3IgZm9y
IGRpc2sgZmFpbHVyZXMuPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5UaGFua3MsPC9kaXY+PGRp
dj5TdGV2ZTwvZGl2PjwvZGl2Pg0K
--94eb2c063b7a7922ce05391e8847--
