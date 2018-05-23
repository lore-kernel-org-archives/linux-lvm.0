Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5DAF3608E0
	for <linux-lvm@redhat.com>; Wed, 23 May 2018 12:31:45 +0000 (UTC)
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D841114419C
	for <linux-lvm@redhat.com>; Wed, 23 May 2018 12:31:33 +0000 (UTC)
Received: by mail-io0-f177.google.com with SMTP id z4-v6so22535777iof.5
	for <linux-lvm@redhat.com>; Wed, 23 May 2018 05:31:33 -0700 (PDT)
MIME-Version: 1.0
From: kAja Ziegler <ziegleka@gmail.com>
Date: Wed, 23 May 2018 14:31:32 +0200
Message-ID: <CAMuNeAvGqc3Hdt3bk1i1YuW7Y0SRd-ckJGKryfcSUW8EEQQzhw@mail.gmail.com>
Content-Type: multipart/alternative; boundary="00000000000005ce53056cdeb7e0"
Subject: [linux-lvm] Move LV with GFS to new LUN (pvmove) in the cluster
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

--00000000000005ce53056cdeb7e0
Content-Type: text/plain; charset="UTF-8"

Hi all,

 I want to ask if it is possible and safe to move online the clustered LV
with GFS on the one PV (multipathed LUN from the old storage) to an other
one (multipathed LUN on the new storage)?

I found these articles in Red Hat knowledgebase:

- Can I perform a pvmove on a clustered logical volume? -
https://access.redhat.com/solutions/39894
- How to migrate SAN LUNs which has Clustered LVM configured on it? -
https://access.redhat.com/solutions/466533

With regard to the mentioned articles it can be done, it is only needed to
install and run the cmirror service. Should I expect any problems or other
prerequisites?


My clustered environment:

- 8 nodes - CentOS 6.9
- LVM version:     2.02.143(2)-RHEL6 (2016-12-13)
  Library version: 1.02.117-RHEL6 (2016-12-13)
  Driver version:  4.33.1
- 7 clustered VGs overall
- 1 LV with GFS mounted on all nodes


- 1 clustered VG with 1 PV and 1 LV on which it is GFS:

[root@...]# pvdisplay /dev/mapper/35001b4d01b1da512
  --- Physical volume ---
  PV Name               /dev/mapper/35001b4d01b1da512
  VG Name               vg_1
  PV Size               4.55 TiB / not usable 2.00 MiB
  Allocatable           yes
  PE Size               4.00 MiB
  Total PE              1192092
  Free PE               1115292
  Allocated PE          76800
  PV UUID               jH1ubM-ElJv-632D-NG8x-jzgJ-mwtA-pxxL90

[root@...]# lvdisplay vg_1/lv_gfs
  --- Logical volume ---
  LV Path                /dev/vg_1/lv_gfs
  LV Name                lv_gfs
  VG Name                vg_1
  LV UUID                OsJ8hM-sH9k-KNs1-B1UD-3qe2-6vja-hLsrYY
  LV Write Access        read/write
  LV Creation host, time ,
  LV Status              available
  # open                 1
  LV Size                300.00 GiB
  Current LE             76800
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     256
  Block device           253:418

[root@...]# vgdisplay vg_1
  --- Volume group ---
  VG Name               vg_1
  System ID
  Format                lvm2
  Metadata Areas        1
  Metadata Sequence No  3898
  VG Access             read/write
  VG Status             resizable
  Clustered             yes
  Shared                no
  MAX LV                0
  Cur LV                1
  Open LV               1
  Max PV                0
  Cur PV                1
  Act PV                1
  VG Size               4.55 TiB
  PE Size               4.00 MiB
  Total PE              1192092
  Alloc PE / Size       76800 / 300.00 GiB
  Free  PE / Size       1115292 / 4.25 TiB
  VG UUID               PtMo7F-XIbC-YSA0-rCQQ-R1oE-g8B7-PiAeIR


- IO activity on the PV (LUN) is very low - from iostat and average per
node: 2.5 tps , 20.03 Blk_read/s and 0 Blk_wrtn/s in 1 minute.


Thank you for your opinions and experience.

Have a great day and with best regards,
-- 
Karel Ziegler

--00000000000005ce53056cdeb7e0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGRpdj5IaSBhbGwsPGJyPjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+
wqBJIHdhbnQgdG8gYXNrIGlmIGl0IGlzIHBvc3NpYmxlIGFuZCBzYWZlIHRvIG1vdmUgb25saW5l
IHRoZSBjbHVzdGVyZWQgTFYgd2l0aCBHRlMgb24gdGhlIG9uZSBQViAobXVsdGlwYXRoZWQgTFVO
IGZyb20gdGhlIG9sZCBzdG9yYWdlKSB0byBhbiBvdGhlciBvbmUgKG11bHRpcGF0aGVkIExVTiBv
biB0aGUgbmV3IHN0b3JhZ2UpPzwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+SSBmb3VuZCB0aGVz
ZSBhcnRpY2xlcyBpbiBSZWQgSGF0IGtub3dsZWRnZWJhc2U6PC9kaXY+PGJyPi0gQ2FuIEkgcGVy
Zm9ybSBhIHB2bW92ZSBvbiBhIGNsdXN0ZXJlZCBsb2dpY2FsIHZvbHVtZT8gLSA8YSBocmVmPSJo
dHRwczovL2FjY2Vzcy5yZWRoYXQuY29tL3NvbHV0aW9ucy8zOTg5NCI+aHR0cHM6Ly9hY2Nlc3Mu
cmVkaGF0LmNvbS9zb2x1dGlvbnMvMzk4OTQ8L2E+PGJyPi0gSG93IHRvIG1pZ3JhdGUgU0FOIExV
TnMgd2hpY2ggaGFzIENsdXN0ZXJlZCBMVk0gY29uZmlndXJlZCBvbiBpdD8gLSA8YSBocmVmPSJo
dHRwczovL2FjY2Vzcy5yZWRoYXQuY29tL3NvbHV0aW9ucy80NjY1MzMiPmh0dHBzOi8vYWNjZXNz
LnJlZGhhdC5jb20vc29sdXRpb25zLzQ2NjUzMzwvYT48YnI+PGRpdj48YnI+PC9kaXY+PGRpdj5X
aXRoIHJlZ2FyZCB0byB0aGUgbWVudGlvbmVkIGFydGljbGVzIGl0IGNhbiBiZSBkb25lLCBpPHNw
YW4gaWQ9ImdtYWlsLXJlc3VsdF9ib3giIGNsYXNzPSJnbWFpbC0iIGxhbmc9ImVuIj48c3BhbiBj
bGFzcz0iZ21haWwtIj50IGlzIG9ubHkgbmVlZGVkIHRvIGluc3RhbGwgYW5kIHJ1biB0aGUgY21p
cnJvciBzZXJ2aWNlLiBTaG91bGQgSSBleHBlY3QgYW55IHByb2JsZW1zIG9yIG90aGVyIHByZXJl
cXVpc2l0ZXM/PGJyPjwvc3Bhbj48L3NwYW4+PC9kaXY+PGRpdj48c3BhbiBpZD0iZ21haWwtcmVz
dWx0X2JveCIgY2xhc3M9ImdtYWlsLSIgbGFuZz0iZW4iPjxzcGFuIGNsYXNzPSJnbWFpbC0iPjxi
cj48L3NwYW4+PC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4gaWQ9ImdtYWlsLXJlc3VsdF9ib3giIGNs
YXNzPSJnbWFpbC0iIGxhbmc9ImVuIj48c3BhbiBjbGFzcz0iZ21haWwtIj48YnI+PC9zcGFuPjwv
c3Bhbj48L2Rpdj48ZGl2PjxzcGFuIGlkPSJnbWFpbC1yZXN1bHRfYm94IiBjbGFzcz0iZ21haWwt
IiBsYW5nPSJlbiI+PHNwYW4gY2xhc3M9ImdtYWlsLSI+TXkgY2x1c3RlcmVkIGVudmlyb25tZW50
Ojwvc3Bhbj48L3NwYW4+PC9kaXY+PGRpdj48c3BhbiBpZD0iZ21haWwtcmVzdWx0X2JveCIgY2xh
c3M9ImdtYWlsLSIgbGFuZz0iZW4iPjxzcGFuIGNsYXNzPSJnbWFpbC0iPjxicj48L3NwYW4+PC9z
cGFuPjwvZGl2PjxkaXY+PHNwYW4gaWQ9ImdtYWlsLXJlc3VsdF9ib3giIGNsYXNzPSJnbWFpbC0i
IGxhbmc9ImVuIj48c3BhbiBjbGFzcz0iZ21haWwtIj4tIDggbm9kZXMgLSBDZW50T1MgNi45PC9z
cGFuPjwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuIGlkPSJnbWFpbC1yZXN1bHRfYm94IiBjbGFzcz0i
Z21haWwtIiBsYW5nPSJlbiI+PHNwYW4gY2xhc3M9ImdtYWlsLSI+LSA8L3NwYW4+PC9zcGFuPjxz
cGFuIGlkPSJnbWFpbC1yZXN1bHRfYm94IiBjbGFzcz0iZ21haWwtIiBsYW5nPSJlbiI+PHNwYW4g
Y2xhc3M9ImdtYWlsLSI+TFZNIHZlcnNpb246wqDCoMKgwqAgMi4wMi4xNDMoMiktUkhFTDYgKDIw
MTYtMTItMTMpPGJyPsKgIExpYnJhcnkgdmVyc2lvbjogMS4wMi4xMTctUkhFTDYgKDIwMTYtMTIt
MTMpPC9zcGFuPjwvc3Bhbj48YnI+PC9kaXY+PGRpdj7CoCBEcml2ZXIgdmVyc2lvbjogwqA0LjMz
LjE8YnI+LSA3IGNsdXN0ZXJlZCBWR3Mgb3ZlcmFsbDxicj48L2Rpdj48ZGl2Pi0gMSBMViB3aXRo
IEdGUyBtb3VudGVkIG9uIGFsbCBub2Rlczxicj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2Pjxi
cj48L2Rpdj48ZGl2PjxzcGFuIGlkPSJnbWFpbC1yZXN1bHRfYm94IiBjbGFzcz0iZ21haWwtIiBs
YW5nPSJlbiI+PHNwYW4gY2xhc3M9ImdtYWlsLSI+LSAxIGNsdXN0ZXJlZCBWRyB3aXRoIDEgUFYg
YW5kIDEgTFYgb24gd2hpY2ggaXQgaXMgR0ZTOjwvc3Bhbj48L3NwYW4+PC9kaXY+PGRpdj48c3Bh
biBpZD0iZ21haWwtcmVzdWx0X2JveCIgY2xhc3M9ImdtYWlsLSIgbGFuZz0iZW4iPjxzcGFuIGNs
YXNzPSJnbWFpbC0iPjxicj48L3NwYW4+PC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4gaWQ9ImdtYWls
LXJlc3VsdF9ib3giIGNsYXNzPSJnbWFpbC0iIGxhbmc9ImVuIj48c3BhbiBjbGFzcz0iZ21haWwt
Ij5bcm9vdEAuLi5dIyBwdmRpc3BsYXkgL2Rldi9tYXBwZXIvMzUwMDFiNGQwMWIxZGE1MTI8YnI+
wqAgLS0tIFBoeXNpY2FsIHZvbHVtZSAtLS08YnI+wqAgUFYgTmFtZcKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgL2Rldi9tYXBwZXIvMzUwMDFiNGQwMWIxZGE1MTI8YnI+wqAgVkcgTmFtZcKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdmdfMTxicj7CoCBQViBTaXplwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCA0LjU1IFRpQiAvIG5vdCB1c2FibGUgMi4wMCBNaUI8YnI+wqAgQWxs
b2NhdGFibGXCoMKgwqDCoMKgwqDCoMKgwqDCoCB5ZXM8YnI+wqAgUEUgU2l6ZcKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgNC4wMCBNaUI8YnI+wqAgVG90YWwgUEXCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAxMTkyMDkyPGJyPsKgIEZyZWUgUEXCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIDExMTUyOTI8YnI+wqAgQWxsb2NhdGVkIFBFwqDCoMKgwqDCoMKgwqDCoMKgIDc2ODAwPGJy
PsKgIFBWIFVVSUTCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGpIMXViTS1FbEp2LTYzMkQt
Tkc4eC1qemdKLW13dEEtcHh4TDkwPGJyPjwvc3Bhbj48L3NwYW4+PC9kaXY+PGRpdj48c3BhbiBp
ZD0iZ21haWwtcmVzdWx0X2JveCIgY2xhc3M9ImdtYWlsLSIgbGFuZz0iZW4iPjxzcGFuIGNsYXNz
PSJnbWFpbC0iPjxicj48L3NwYW4+PC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4gaWQ9ImdtYWlsLXJl
c3VsdF9ib3giIGNsYXNzPSJnbWFpbC0iIGxhbmc9ImVuIj48c3BhbiBjbGFzcz0iZ21haWwtIj5b
cm9vdEAuLi5dIyBsdmRpc3BsYXkgdmdfMS9sdl9nZnM8YnI+wqAgLS0tIExvZ2ljYWwgdm9sdW1l
IC0tLTxicj7CoCBMViBQYXRowqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC9kZXYvdmdf
MS9sdl9nZnM8YnI+wqAgTFYgTmFtZcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBsdl9n
ZnM8YnI+wqAgVkcgTmFtZcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB2Z18xPGJyPsKg
IExWIFVVSUTCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgT3NKOGhNLXNIOWstS05zMS1C
MVVELTNxZTItNnZqYS1oTHNyWVk8YnI+wqAgTFYgV3JpdGUgQWNjZXNzwqDCoMKgwqDCoMKgwqAg
cmVhZC93cml0ZTxicj7CoCBMViBDcmVhdGlvbiBob3N0LCB0aW1lICw8YnI+wqAgTFYgU3RhdHVz
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYXZhaWxhYmxlPGJyPsKgICMgb3BlbsKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDE8YnI+wqAgTFYgU2l6ZcKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAzMDAuMDAgR2lCPGJyPsKgIEN1cnJlbnQgTEXCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgNzY4MDA8YnI+wqAgU2VnbWVudHPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IDE8YnI+wqAgQWxsb2NhdGlvbsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpbmhlcml0PGJyPsKg
IFJlYWQgYWhlYWQgc2VjdG9yc8KgwqDCoMKgIGF1dG88YnI+wqAgLSBjdXJyZW50bHkgc2V0IHRv
wqDCoMKgwqAgMjU2PGJyPsKgIEJsb2NrIGRldmljZcKgwqDCoMKgwqDCoMKgwqDCoMKgIDI1Mzo0
MTg8YnI+PC9zcGFuPjwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuIGlkPSJnbWFpbC1yZXN1bHRfYm94
IiBjbGFzcz0iZ21haWwtIiBsYW5nPSJlbiI+PHNwYW4gY2xhc3M9ImdtYWlsLSI+PGJyPjwvc3Bh
bj48L3NwYW4+PC9kaXY+PGRpdj48c3BhbiBpZD0iZ21haWwtcmVzdWx0X2JveCIgY2xhc3M9Imdt
YWlsLSIgbGFuZz0iZW4iPjxzcGFuIGNsYXNzPSJnbWFpbC0iPltyb290QC4uLl0jIHZnZGlzcGxh
eSB2Z18xPGJyPsKgIC0tLSBWb2x1bWUgZ3JvdXAgLS0tPGJyPsKgIFZHIE5hbWXCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHZnXzE8YnI+wqAgU3lzdGVtIElEPGJyPsKgIEZvcm1hdMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBsdm0yPGJyPsKgIE1ldGFkYXRhIEFyZWFzwqDCoMKg
wqDCoMKgwqAgMTxicj7CoCBNZXRhZGF0YSBTZXF1ZW5jZSBOb8KgIDM4OTg8YnI+wqAgVkcgQWNj
ZXNzwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJlYWQvd3JpdGU8YnI+wqAgVkcgU3RhdHVzwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJlc2l6YWJsZTxicj7CoCBDbHVzdGVyZWTCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgeWVzPGJyPsKgIFNoYXJlZMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBubzxicj7CoCBNQVggTFbCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMDxicj7C
oCBDdXIgTFbCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMTxicj7CoCBPcGVuIExWwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAxPGJyPsKgIE1heCBQVsKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAwPGJyPsKgIEN1ciBQVsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCAxPGJyPsKgIEFjdCBQVsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAxPGJyPsKgIFZH
IFNpemXCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDQuNTUgVGlCPGJyPsKgIFBFIFNpemXC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDQuMDAgTWlCPGJyPsKgIFRvdGFsIFBFwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgMTE5MjA5Mjxicj7CoCBBbGxvYyBQRSAvIFNpemXCoMKgwqDC
oMKgwqAgNzY4MDAgLyAzMDAuMDAgR2lCPGJyPsKgIEZyZWXCoCBQRSAvIFNpemXCoMKgwqDCoMKg
wqAgMTExNTI5MiAvIDQuMjUgVGlCPGJyPsKgIFZHIFVVSUTCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIFB0TW83Ri1YSWJDLVlTQTAtckNRUS1SMW9FLWc4QjctUGlBZUlSPGJyPjwvc3Bhbj48
L3NwYW4+PC9kaXY+PGRpdj48c3BhbiBpZD0iZ21haWwtcmVzdWx0X2JveCIgY2xhc3M9ImdtYWls
LSIgbGFuZz0iZW4iPjxzcGFuIGNsYXNzPSJnbWFpbC0iPjxzcGFuIGlkPSJnbWFpbC1yZXN1bHRf
Ym94IiBjbGFzcz0iZ21haWwtIiBsYW5nPSJlbiI+PHNwYW4gY2xhc3M9ImdtYWlsLSI+PC9zcGFu
Pjwvc3Bhbj48YnI+PC9zcGFuPjwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuIGlkPSJnbWFpbC1yZXN1
bHRfYm94IiBjbGFzcz0iZ21haWwtIiBsYW5nPSJlbiI+PHNwYW4gY2xhc3M9ImdtYWlsLSI+PGJy
Pjwvc3Bhbj48L3NwYW4+PC9kaXY+PGRpdj4tIElPIGFjdGl2aXR5IG9uIHRoZSBQViAoTFVOKSBp
cyB2ZXJ5IGxvdyAtIGZyb20gaW9zdGF0IGFuZCBhdmVyYWdlIHBlciBub2RlOiAyLjUgdHBzICwg
MjAuMDMgQmxrX3JlYWQvcyBhbmQgMCBCbGtfd3J0bi9zIGluIDEgbWludXRlLjxicj48L2Rpdj48
ZGl2Pjxicj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PjxzcGFuIGlkPSJnbWFpbC1yZXN1bHRf
Ym94IiBjbGFzcz0iZ21haWwtc2hvcnRfdGV4dCIgbGFuZz0iZW4iPjxzcGFuIGNsYXNzPSJnbWFp
bC0iPlRoYW5rIHlvdSBmb3IgeW91ciBvcGluaW9ucyBhbmQgZXhwZXJpZW5jZS48L3NwYW4+PC9z
cGFuPjwvZGl2PjxkaXY+PHNwYW4gaWQ9ImdtYWlsLXJlc3VsdF9ib3giIGNsYXNzPSJnbWFpbC1z
aG9ydF90ZXh0IiBsYW5nPSJlbiI+PHNwYW4gY2xhc3M9ImdtYWlsLSI+PGJyPjwvc3Bhbj48L3Nw
YW4+PC9kaXY+PGRpdj48c3BhbiBpZD0iZ21haWwtcmVzdWx0X2JveCIgY2xhc3M9ImdtYWlsLXNo
b3J0X3RleHQiIGxhbmc9ImVuIj48c3BhbiBjbGFzcz0iZ21haWwtIj5IYXZlIGEgZ3JlYXQgZGF5
IGFuZCB3aXRoIGJlc3QgcmVnYXJkcyw8L3NwYW4+PC9zcGFuPjxicj48L2Rpdj48ZGl2PjxkaXY+
PGRpdj48ZGl2IGNsYXNzPSJnbWFpbC1tXzU2ODQ1ODY4NzUzNDEzMzIxMjZnbWFpbF9zaWduYXR1
cmUiPi0tIDxicj5LYXJlbCBaaWVnbGVyPGJyPjxicj48L2Rpdj48L2Rpdj4NCjwvZGl2PjwvZGl2
PjwvZGl2Pg0K
--00000000000005ce53056cdeb7e0--
