Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.12])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o84LuF6J022308
	for <linux-lvm@redhat.com>; Sat, 4 Sep 2010 17:56:15 -0400
Received: from mail-yw0-f46.google.com (mail-yw0-f46.google.com
	[209.85.213.46])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o84Lu6gm021669
	for <linux-lvm@redhat.com>; Sat, 4 Sep 2010 17:56:06 -0400
Received: by ywh1 with SMTP id 1so1503477ywh.33
	for <linux-lvm@redhat.com>; Sat, 04 Sep 2010 14:56:06 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <Pine.LNX.4.64.1009041714390.7372@bmsred.bmsi.com>
References: <4c8249ae.07c1640a.2f38.ffff91c3@mx.google.com>
	<Pine.LNX.4.64.1009041714390.7372@bmsred.bmsi.com>
From: Misc Things <formisc@gmail.com>
Date: Sat, 4 Sep 2010 17:55:46 -0400
Message-ID: <AANLkTinxqBWPyyumji=Sz8xCw+KaipbzyEUy63wLx2Zb@mail.gmail.com>
Content-Type: multipart/alternative; boundary=000e0cd6aeb43bde79048f761d00
Subject: Re: [linux-lvm] Important diretories are missing after adding space.
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
To: LVM general discussion and development <linux-lvm@redhat.com>

--000e0cd6aeb43bde79048f761d00
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 4, 2010 at 5:18 PM, Stuart D. Gathman <stuart@bmsi.com> wrote:

> > # pvs
> > =EF=BF=BD PV=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=
=BF=BD=EF=BF=BD VG=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=
=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD Fmt=EF=BF=BD Attr PSize=EF=BF=BD=EF=BF=BD=
 PFree=EF=BF=BD
> > =EF=BF=BD /dev/hdc1=EF=BF=BD VG_Storage00 lvm2 a-=EF=BF=BD=EF=BF=BD=EF=
=BF=BD 74.53G=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD 0
> > =EF=BF=BD /dev/hdc2=EF=BF=BD VG_backup=EF=BF=BD=EF=BF=BD=EF=BF=BD lvm2 =
a-=EF=BF=BD=EF=BF=BD=EF=BF=BD 74.52G=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=
=BF=BD 0
> > =EF=BF=BD /dev/hdd1=EF=BF=BD VG_Storage00 lvm2 a-=EF=BF=BD=EF=BF=BD=EF=
=BF=BD 74.53G=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD 0
> > =EF=BF=BD /dev/hdd2=EF=BF=BD VG_backup=EF=BF=BD=EF=BF=BD=EF=BF=BD lvm2 =
a-=EF=BF=BD=EF=BF=BD=EF=BF=BD 74.52G=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=
=BF=BD 0
> > =EF=BF=BD /dev/hdd3=EF=BF=BD VG_backup=EF=BF=BD=EF=BF=BD=EF=BF=BD lvm2 =
a-=EF=BF=BD=EF=BF=BD=EF=BF=BD 83.83G=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=
=BF=BD 0
> > =EF=BF=BD /dev/sda2=EF=BF=BD VG_SYS=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=
=EF=BF=BD=EF=BF=BD lvm2 a-=EF=BF=BD=EF=BF=BD 148.95G=EF=BF=BD=EF=BF=BD=EF=
=BF=BD=EF=BF=BD=EF=BF=BD 0
> > =EF=BF=BD /dev/sdb1=EF=BF=BD VG_Storage=EF=BF=BD=EF=BF=BD lvm2 a-=EF=BF=
=BD=EF=BF=BD 465.67G=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD 0
> > =EF=BF=BD /dev/sdb5=EF=BF=BD VG_Storage=EF=BF=BD=EF=BF=BD lvm2 a-=EF=BF=
=BD=EF=BF=BD 465.67G=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD 0
> > =EF=BF=BD /dev/sdb6=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=
=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=
 lvm2 --=EF=BF=BD=EF=BF=BD 465.93G 465.93G
>
> There are several things I am suspicious about, but I would like to see
> the output of "sfdisk -l /dev/sdb".  sdb1 wouldn't by any chance, be
> an extended partition?
>
> --
>              Stuart D. Gathman <stuart@bmsi.com>
>    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-615=
4
> "Confutatis maledictis, flammis acribus addictis" - background song for
> a Microsoft sponsored "Where do you want to go from here?" commercial.
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

Stuart,
 thank you for your reply. Here is the output:

[root@server storage]# fdisk -l /dev/sdb

Disk /dev/sdb: 1500.3 GB, 1500301910016 bytes
255 heads, 63 sectors/track, 182401 cylinders
Units =3D cylinders of 16065 * 512 =3D 8225280 bytes

   Device Boot      Start         End      Blocks   Id  System
/dev/sdb1               1       60789   488287611   83  Linux
/dev/sdb2           60790      182401   976848390    5  Extended
/dev/sdb5           60790      121578   488287611   83  Linux
/dev/sdb6          121579      182401   488560716   83  Linux
[root@server storage]# fdisk -l /dev/sda

Disk /dev/sda: 160.0 GB, 160041885696 bytes
255 heads, 63 sectors/track, 19457 cylinders
Units =3D cylinders of 16065 * 512 =3D 8225280 bytes

   Device Boot      Start         End      Blocks   Id  System
/dev/sda1   *           1          13      104391   83  Linux
/dev/sda2              14       19457   156183930   8e  Linux LVM
[root@server storage]# fdisk -l /dev/hdc

Disk /dev/hdc: 160.0 GB, 160041885696 bytes
255 heads, 63 sectors/track, 19457 cylinders
Units =3D cylinders of 16065 * 512 =3D 8225280 bytes

   Device Boot      Start         End      Blocks   Id  System
/dev/hdc1   *           1        9729    78148161   83  Linux
/dev/hdc2            9730       19457    78140160   83  Linux

--000e0cd6aeb43bde79048f761d00
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: base64

PGRpdiBjbGFzcz0iZ21haWxfcXVvdGUiPk9uIFNhdCwgU2VwIDQsIDIwMTAgYXQgNToxOCBQTSwg
U3R1YXJ0IEQuIEdhdGhtYW4gPHNwYW4gZGlyPSJsdHIiPiZsdDs8YSBocmVmPSJtYWlsdG86c3R1
YXJ0QGJtc2kuY29tIj5zdHVhcnRAYm1zaS5jb208L2E+Jmd0Ozwvc3Bhbj4gd3JvdGU6PGJyPjxi
bG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdpbjogMHB0IDBwdCAwcHQg
MC44ZXg7IGJvcmRlci1sZWZ0OiAxcHggc29saWQgcmdiKDIwNCwgMjA0LCAyMDQpOyBwYWRkaW5n
LWxlZnQ6IDFleDsiPgoKPGRpdiBjbGFzcz0iaW0iPiZndDsgIyBwdnM8YnI+CiZndDsg77+9IFBW
77+977+977+977+977+977+977+977+9IFZH77+977+977+977+977+977+977+977+977+977+9
IEZtdO+/vSBBdHRyIFBTaXpl77+977+9IFBGcmVl77+9PGJyPgomZ3Q7IO+/vSAvZGV2L2hkYzHv
v70gVkdfU3RvcmFnZTAwIGx2bTIgYS3vv73vv73vv70gNzQuNTNH77+977+977+977+977+9IDA8
YnI+CiZndDsg77+9IC9kZXYvaGRjMu+/vSBWR19iYWNrdXDvv73vv73vv70gbHZtMiBhLe+/ve+/
ve+/vSA3NC41Mkfvv73vv73vv73vv73vv70gMDxicj4KJmd0OyDvv70gL2Rldi9oZGQx77+9IFZH
X1N0b3JhZ2UwMCBsdm0yIGEt77+977+977+9IDc0LjUzR++/ve+/ve+/ve+/ve+/vSAwPGJyPgom
Z3Q7IO+/vSAvZGV2L2hkZDLvv70gVkdfYmFja3Vw77+977+977+9IGx2bTIgYS3vv73vv73vv70g
NzQuNTJH77+977+977+977+977+9IDA8YnI+CiZndDsg77+9IC9kZXYvaGRkM++/vSBWR19iYWNr
dXDvv73vv73vv70gbHZtMiBhLe+/ve+/ve+/vSA4My44M0fvv73vv73vv73vv73vv70gMDxicj4K
Jmd0OyDvv70gL2Rldi9zZGEy77+9IFZHX1NZU++/ve+/ve+/ve+/ve+/ve+/vSBsdm0yIGEt77+9
77+9IDE0OC45NUfvv73vv73vv73vv73vv70gMDxicj4KJmd0OyDvv70gL2Rldi9zZGIx77+9IFZH
X1N0b3JhZ2Xvv73vv70gbHZtMiBhLe+/ve+/vSA0NjUuNjdH77+977+977+977+977+9IDA8YnI+
CiZndDsg77+9IC9kZXYvc2RiNe+/vSBWR19TdG9yYWdl77+977+9IGx2bTIgYS3vv73vv70gNDY1
LjY3R++/ve+/ve+/ve+/ve+/vSAwPGJyPgomZ3Q7IO+/vSAvZGV2L3NkYjbvv73vv73vv73vv73v
v73vv73vv73vv73vv73vv73vv73vv73vv73vv70gbHZtMiAtLe+/ve+/vSA0NjUuOTNHIDQ2NS45
M0c8YnI+Cjxicj4KPC9kaXY+VGhlcmUgYXJlIHNldmVyYWwgdGhpbmdzIEkgYW0gc3VzcGljaW91
cyBhYm91dCwgYnV0IEkgd291bGQgbGlrZSB0byBzZWU8YnI+CnRoZSBvdXRwdXQgb2YgJnF1b3Q7
c2ZkaXNrIC1sIC9kZXYvc2RiJnF1b3Q7LiDCoHNkYjEgd291bGRuJiMzOTt0IGJ5IGFueSBjaGFu
Y2UsIGJlPGJyPgphbiBleHRlbmRlZCBwYXJ0aXRpb24/PGJyPgo8Zm9udCBjb2xvcj0iIzg4ODg4
OCI+PGJyPgotLTxicj4KIMKgIMKgIMKgIMKgIMKgIMKgIMKgU3R1YXJ0IEQuIEdhdGhtYW4gJmx0
OzxhIGhyZWY9Im1haWx0bzpzdHVhcnRAYm1zaS5jb20iPnN0dWFydEBibXNpLmNvbTwvYT4mZ3Q7
PGJyPgogwqAgwqBCdXNpbmVzcyBNYW5hZ2VtZW50IFN5c3RlbXMgSW5jLiDCoFBob25lOiA3MDMg
NTkxLTA5MTEgRmF4OiA3MDMgNTkxLTYxNTQ8YnI+CiZxdW90O0NvbmZ1dGF0aXMgbWFsZWRpY3Rp
cywgZmxhbW1pcyBhY3JpYnVzIGFkZGljdGlzJnF1b3Q7IC0gYmFja2dyb3VuZCBzb25nIGZvcjxi
cj4KYSBNaWNyb3NvZnQgc3BvbnNvcmVkICZxdW90O1doZXJlIGRvIHlvdSB3YW50IHRvIGdvIGZy
b20gaGVyZT8mcXVvdDsgY29tbWVyY2lhbC48L2ZvbnQ+PGJyPl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fPGJyPgpsaW51eC1sdm0gbWFpbGluZyBsaXN0PGJy
Pgo8YSBocmVmPSJtYWlsdG86bGludXgtbHZtQHJlZGhhdC5jb20iPmxpbnV4LWx2bUByZWRoYXQu
Y29tPC9hPjxicj4KPGEgaHJlZj0iaHR0cHM6Ly93d3cucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LWx2bSIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vd3d3LnJlZGhhdC5jb20vbWFp
bG1hbi9saXN0aW5mby9saW51eC1sdm08L2E+PGJyPgpyZWFkIHRoZSBMVk0gSE9XLVRPIGF0IDxh
IGhyZWY9Imh0dHA6Ly90bGRwLm9yZy9IT1dUTy9MVk0tSE9XVE8vIiB0YXJnZXQ9Il9ibGFuayI+
aHR0cDovL3RsZHAub3JnL0hPV1RPL0xWTS1IT1dUTy88L2E+PGJyPjwvYmxvY2txdW90ZT48L2Rp
dj48YnI+U3R1YXJ0LDxicj7CoHRoYW5rIHlvdSBmb3IgeW91ciByZXBseS4gSGVyZSBpcyB0aGUg
b3V0cHV0Ojxicj48YnI+W3Jvb3RAc2VydmVyIHN0b3JhZ2VdIyBmZGlzayAtbCAvZGV2L3NkYjxi
cj4KCjxicj5EaXNrIC9kZXYvc2RiOiAxNTAwLjMgR0IsIDE1MDAzMDE5MTAwMTYgYnl0ZXM8YnI+
MjU1IGhlYWRzLCA2MyBzZWN0b3JzL3RyYWNrLCAxODI0MDEgY3lsaW5kZXJzPGJyPlVuaXRzID0g
Y3lsaW5kZXJzIG9mIDE2MDY1ICogNTEyID0gODIyNTI4MCBieXRlczxicj48YnI+wqDCoCBEZXZp
Y2UgQm9vdMKgwqDCoMKgwqAgU3RhcnTCoMKgwqDCoMKgwqDCoMKgIEVuZMKgwqDCoMKgwqAgQmxv
Y2tzwqDCoCBJZMKgIFN5c3RlbTxicj4KCi9kZXYvc2RiMcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgMcKgwqDCoMKgwqDCoCA2MDc4OcKgwqAgNDg4Mjg3NjExwqDCoCA4M8KgIExpbnV4PGJy
Pi9kZXYvc2RiMsKgwqDCoMKgwqDCoMKgwqDCoMKgIDYwNzkwwqDCoMKgwqDCoCAxODI0MDHCoMKg
IDk3Njg0ODM5MMKgwqDCoCA1wqAgRXh0ZW5kZWQ8YnI+L2Rldi9zZGI1wqDCoMKgwqDCoMKgwqDC
oMKgwqAgNjA3OTDCoMKgwqDCoMKgIDEyMTU3OMKgwqAgNDg4Mjg3NjExwqDCoCA4M8KgIExpbnV4
PGJyPi9kZXYvc2RiNsKgwqDCoMKgwqDCoMKgwqDCoCAxMjE1NznCoMKgwqDCoMKgIDE4MjQwMcKg
wqAgNDg4NTYwNzE2wqDCoCA4M8KgIExpbnV4PGJyPgoKW3Jvb3RAc2VydmVyIHN0b3JhZ2VdIyBm
ZGlzayAtbCAvZGV2L3NkYTxicj48YnI+RGlzayAvZGV2L3NkYTogMTYwLjAgR0IsIDE2MDA0MTg4
NTY5NiBieXRlczxicj4yNTUgaGVhZHMsIDYzIHNlY3RvcnMvdHJhY2ssIDE5NDU3IGN5bGluZGVy
czxicj5Vbml0cyA9IGN5bGluZGVycyBvZiAxNjA2NSAqIDUxMiA9IDgyMjUyODAgYnl0ZXM8YnI+
PGJyPsKgwqAgRGV2aWNlIEJvb3TCoMKgwqDCoMKgIFN0YXJ0wqDCoMKgwqDCoMKgwqDCoCBFbmTC
oMKgwqDCoMKgIEJsb2Nrc8KgwqAgSWTCoCBTeXN0ZW08YnI+CgovZGV2L3NkYTHCoMKgICrCoMKg
wqDCoMKgwqDCoMKgwqDCoCAxwqDCoMKgwqDCoMKgwqDCoMKgIDEzwqDCoMKgwqDCoCAxMDQzOTHC
oMKgIDgzwqAgTGludXg8YnI+L2Rldi9zZGEywqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMTTC
oMKgwqDCoMKgwqAgMTk0NTfCoMKgIDE1NjE4MzkzMMKgwqAgOGXCoCBMaW51eCBMVk08YnI+W3Jv
b3RAc2VydmVyIHN0b3JhZ2VdIyBmZGlzayAtbCAvZGV2L2hkYzxicj48YnI+RGlzayAvZGV2L2hk
YzogMTYwLjAgR0IsIDE2MDA0MTg4NTY5NiBieXRlczxicj4KCjI1NSBoZWFkcywgNjMgc2VjdG9y
cy90cmFjaywgMTk0NTcgY3lsaW5kZXJzPGJyPlVuaXRzID0gY3lsaW5kZXJzIG9mIDE2MDY1ICog
NTEyID0gODIyNTI4MCBieXRlczxicj48YnI+wqDCoCBEZXZpY2UgQm9vdMKgwqDCoMKgwqAgU3Rh
cnTCoMKgwqDCoMKgwqDCoMKgIEVuZMKgwqDCoMKgwqAgQmxvY2tzwqDCoCBJZMKgIFN5c3RlbTxi
cj4vZGV2L2hkYzHCoMKgICrCoMKgwqDCoMKgwqDCoMKgwqDCoCAxwqDCoMKgwqDCoMKgwqAgOTcy
OcKgwqDCoCA3ODE0ODE2McKgwqAgODPCoCBMaW51eDxicj4KCi9kZXYvaGRjMsKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgOTczMMKgwqDCoMKgwqDCoCAxOTQ1N8KgwqDCoCA3ODE0MDE2MMKgwqAgODPC
oCBMaW51eCA8YnI+PGJyPjxicj48YnI+PGJyPgo=
--000e0cd6aeb43bde79048f761d00--
