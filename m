Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s8RKZQnI015031
	for <linux-lvm@redhat.com>; Sat, 27 Sep 2014 16:35:26 -0400
Received: from mail-ig0-f181.google.com (mail-ig0-f181.google.com
	[209.85.213.181])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s8RKZOBc012584
	(version=TLSv1/SSLv3 cipher=RC4-SHA bits=128 verify=FAIL)
	for <linux-lvm@redhat.com>; Sat, 27 Sep 2014 16:35:25 -0400
Received: by mail-ig0-f181.google.com with SMTP id h18so1352559igc.8
	for <linux-lvm@redhat.com>; Sat, 27 Sep 2014 13:35:24 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1411839754687039500@businessgrade.com>
References: <1411839754687039500@businessgrade.com>
Date: Sun, 28 Sep 2014 01:35:24 +0500
Message-ID: <CAKAA-nmnZHXQBMcfh-tzs8qO5rf6tfrM3wTf8qg3R_11MGkupw@mail.gmail.com>
From: Micky <mickylmartin@gmail.com>
Content-Type: multipart/alternative; boundary=047d7b10ce5122bcfc050411f901
Subject: Re: [linux-lvm] Why is my LVM Mirror performance so bad?
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
To: eneal@businessgrade.com, LVM general discussion and development <linux-lvm@redhat.com>

--047d7b10ce5122bcfc050411f901
Content-Type: text/plain; charset=UTF-8

Because it is LVM! :)

On Sat, Sep 27, 2014 at 10:42 PM, Errol Neal <eneal@businessgrade.com>
wrote:

> Hi There. Hoping to get some clarity on some performance woes in a little
> testing environment that I've setup.
>
> I am experimenting with LVM mirrors on a CentOS 6.5 cluster.
>
> I have two VMs running on ESX5.5 that are sharing two RDM luns from an SRP
> target server running SCST.
>
> Performance however seems to take a huge hit compared to a vanilla volume
>
>
> [root@scst1 ~]# vgs
>   VG       #PV #LV #SN Attr   VSize   VFree
>   hadata     2   5   0 wz--nc 999.99g 149.99g
>   vg_scst1   1   2   0 wz--n-  39.51g      0
>
> [root@scst1 ~]# lvs -a -o +devices
>   LV                 VG       Attr       LSize   Pool Origin Data%  Move
> Log Cpy%Sync Convert Devices
>   mirror1            hadata   mwi-a-m--- 100.00g
>      100.00         mirror1_mimage_0(0),mirror1_mimage_1(0)
>   [mirror1_mimage_0] hadata   iwi-aom--- 100.00g
>                     /dev/sdb1(0)
>   [mirror1_mimage_1] hadata   iwi-aom--- 100.00g
>                     /dev/sdc1(0)
>   mirror2            hadata   mwi-a-m--- 100.00g
>      100.00         mirror2_mimage_0(0),mirror2_mimage_1(0)
>   [mirror2_mimage_0] hadata   iwi-aom--- 100.00g
>                     /dev/sdb1(25600)
>   [mirror2_mimage_1] hadata   iwi-aom--- 100.00g
>                     /dev/sdc1(25600)
>   mirror3            hadata   mwi-a-m--- 100.00g
>      100.00         mirror3_mimage_0(0),mirror3_mimage_1(0)
>   [mirror3_mimage_0] hadata   iwi-aom--- 100.00g
>                     /dev/sdb1(51200)
>   [mirror3_mimage_1] hadata   iwi-aom--- 100.00g
>                     /dev/sdc1(51200)
>   mirror4            hadata   mwi-a-m--- 100.00g
>      100.00         mirror4_mimage_0(0),mirror4_mimage_1(0)
>   [mirror4_mimage_0] hadata   iwi-aom--- 100.00g
>                     /dev/sdb1(76800)
>   [mirror4_mimage_1] hadata   iwi-aom--- 100.00g
>                     /dev/sdc1(76800)
>   test               hadata   -wi-a-----  50.00g
>                     /dev/sdb1(102400)
>   lv_root            vg_scst1 -wi-ao----  31.65g
>                     /dev/sda2(0)
>   lv_swap            vg_scst1 -wi-ao----   7.86g
>                     /dev/sda2(8102)
>
> [root@scst1 ~]# dd if=/dev/sdb1 of=/dev/null bs=1M count=20000
> 20000+0 records in
> 20000+0 records out
> 20971520000 bytes (21 GB) copied, 41.0031 s, 511 MB/s
>
> [root@scst1 ~]# dd if=/dev/hadata/test of=/dev/null bs=1M count=20000
> 20000+0 records in
> 20000+0 records out
> 20971520000 bytes (21 GB) copied, 44.344 s, 473 MB/s
>
> [root@scst1 ~]# dd if=/dev/hadata/mirror1 of=/dev/null bs=1M count=20000
> 20000+0 records in
> 20000+0 records out
> 20971520000 bytes (21 GB) copied, 365.685 s, 57.3 MB/s
>
>
> Is this just the life of a LVM mirror and the performance here is about as
> good as it gets?
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

--047d7b10ce5122bcfc050411f901
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+QmVjYXVzZSBpdCBpcyBMVk0hIDopwqA8L2Rpdj48ZGl2IGNsYXNzPSJn
bWFpbF9leHRyYSI+PGJyPjxkaXYgY2xhc3M9ImdtYWlsX3F1b3RlIj5PbiBTYXQsIFNlcCAyNywg
MjAxNCBhdCAxMDo0MiBQTSwgRXJyb2wgTmVhbCA8c3BhbiBkaXI9Imx0ciI+Jmx0OzxhIGhyZWY9
Im1haWx0bzplbmVhbEBidXNpbmVzc2dyYWRlLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmVuZWFsQGJ1
c2luZXNzZ3JhZGUuY29tPC9hPiZndDs8L3NwYW4+IHdyb3RlOjxicj48YmxvY2txdW90ZSBjbGFz
cz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MCAwIDAgLjhleDtib3JkZXItbGVmdDoxcHgg
I2NjYyBzb2xpZDtwYWRkaW5nLWxlZnQ6MWV4Ij5IaSBUaGVyZS4gSG9waW5nIHRvIGdldCBzb21l
IGNsYXJpdHkgb24gc29tZSBwZXJmb3JtYW5jZSB3b2VzIGluIGEgbGl0dGxlIHRlc3RpbmcgZW52
aXJvbm1lbnQgdGhhdCBJJiMzOTt2ZSBzZXR1cC48YnI+DQo8YnI+DQpJIGFtIGV4cGVyaW1lbnRp
bmcgd2l0aCBMVk0gbWlycm9ycyBvbiBhIENlbnRPUyA2LjUgY2x1c3Rlci48YnI+DQo8YnI+DQpJ
IGhhdmUgdHdvIFZNcyBydW5uaW5nIG9uIEVTWDUuNSB0aGF0IGFyZSBzaGFyaW5nIHR3byBSRE0g
bHVucyBmcm9tIGFuIFNSUCB0YXJnZXQgc2VydmVyIHJ1bm5pbmcgU0NTVC48YnI+DQo8YnI+DQpQ
ZXJmb3JtYW5jZSBob3dldmVyIHNlZW1zIHRvIHRha2UgYSBodWdlIGhpdCBjb21wYXJlZCB0byBh
IHZhbmlsbGEgdm9sdW1lPGJyPg0KPGJyPg0KPGJyPg0KW3Jvb3RAc2NzdDEgfl0jIHZnczxicj4N
CsKgIFZHwqAgwqAgwqAgwqAjUFYgI0xWICNTTiBBdHRywqAgwqBWU2l6ZcKgIMKgVkZyZWU8YnI+
DQrCoCBoYWRhdGHCoCDCoCDCoDLCoCDCoDXCoCDCoDAgd3otLW5jIDk5OS45OWcgMTQ5Ljk5Zzxi
cj4NCsKgIHZnX3Njc3QxwqAgwqAxwqAgwqAywqAgwqAwIHd6LS1uLcKgIDM5LjUxZ8KgIMKgIMKg
IDA8YnI+DQo8YnI+DQpbcm9vdEBzY3N0MSB+XSMgbHZzIC1hIC1vICtkZXZpY2VzPGJyPg0KwqAg
TFbCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoFZHwqAgwqAgwqAgwqBBdHRywqAgwqAgwqAgwqBM
U2l6ZcKgIMKgUG9vbCBPcmlnaW4gRGF0YSXCoCBNb3ZlIExvZyBDcHklU3luYyBDb252ZXJ0IERl
dmljZXM8YnI+DQrCoCBtaXJyb3IxwqAgwqAgwqAgwqAgwqAgwqAgaGFkYXRhwqAgwqBtd2ktYS1t
LS0tIDEwMC4wMGfCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oDEwMC4wMMKgIMKgIMKgIMKgIMKgbWlycm9yMV9taW1hZ2VfMCgwKSxtaXJyb3IxX21pbWFnZV8x
KDApPGJyPg0KwqAgW21pcnJvcjFfbWltYWdlXzBdIGhhZGF0YcKgIMKgaXdpLWFvbS0tLSAxMDAu
MDBnwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgL2Rldi9zZGIxKDApPGJyPg0KwqAgW21pcnJvcjFfbWltYWdlXzFdIGhh
ZGF0YcKgIMKgaXdpLWFvbS0tLSAxMDAuMDBnwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgL2Rldi9zZGMxKDApPGJyPg0K
wqAgbWlycm9yMsKgIMKgIMKgIMKgIMKgIMKgIGhhZGF0YcKgIMKgbXdpLWEtbS0tLSAxMDAuMDBn
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAxMDAuMDDCoCDC
oCDCoCDCoCDCoG1pcnJvcjJfbWltYWdlXzAoMCksbWlycm9yMl9taW1hZ2VfMSgwKTxicj4NCsKg
IFttaXJyb3IyX21pbWFnZV8wXSBoYWRhdGHCoCDCoGl3aS1hb20tLS0gMTAwLjAwZ8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIC9kZXYvc2RiMSgyNTYwMCk8YnI+DQrCoCBbbWlycm9yMl9taW1hZ2VfMV0gaGFkYXRhwqAg
wqBpd2ktYW9tLS0tIDEwMC4wMGfCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAvZGV2L3NkYzEoMjU2MDApPGJyPg0KwqAg
bWlycm9yM8KgIMKgIMKgIMKgIMKgIMKgIGhhZGF0YcKgIMKgbXdpLWEtbS0tLSAxMDAuMDBnwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAxMDAuMDDCoCDCoCDC
oCDCoCDCoG1pcnJvcjNfbWltYWdlXzAoMCksbWlycm9yM19taW1hZ2VfMSgwKTxicj4NCsKgIFtt
aXJyb3IzX21pbWFnZV8wXSBoYWRhdGHCoCDCoGl3aS1hb20tLS0gMTAwLjAwZ8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IC9kZXYvc2RiMSg1MTIwMCk8YnI+DQrCoCBbbWlycm9yM19taW1hZ2VfMV0gaGFkYXRhwqAgwqBp
d2ktYW9tLS0tIDEwMC4wMGfCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAvZGV2L3NkYzEoNTEyMDApPGJyPg0KwqAgbWly
cm9yNMKgIMKgIMKgIMKgIMKgIMKgIGhhZGF0YcKgIMKgbXdpLWEtbS0tLSAxMDAuMDBnwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAxMDAuMDDCoCDCoCDCoCDC
oCDCoG1pcnJvcjRfbWltYWdlXzAoMCksbWlycm9yNF9taW1hZ2VfMSgwKTxicj4NCsKgIFttaXJy
b3I0X21pbWFnZV8wXSBoYWRhdGHCoCDCoGl3aS1hb20tLS0gMTAwLjAwZ8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIC9k
ZXYvc2RiMSg3NjgwMCk8YnI+DQrCoCBbbWlycm9yNF9taW1hZ2VfMV0gaGFkYXRhwqAgwqBpd2kt
YW9tLS0tIDEwMC4wMGfCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAvZGV2L3NkYzEoNzY4MDApPGJyPg0KwqAgdGVzdMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgaGFkYXRhwqAgwqAtd2ktYS0tLS0twqAgNTAuMDBnwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgL2Rldi9zZGIxKDEwMjQwMCk8YnI+DQrCoCBsdl9yb290wqAgwqAgwqAgwqAgwqAgwqAg
dmdfc2NzdDEgLXdpLWFvLS0tLcKgIDMxLjY1Z8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIC9kZXYvc2RhMigwKTxicj4N
CsKgIGx2X3N3YXDCoCDCoCDCoCDCoCDCoCDCoCB2Z19zY3N0MSAtd2ktYW8tLS0twqAgwqA3Ljg2
Z8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIC9kZXYvc2RhMig4MTAyKTxicj4NCjxicj4NCltyb290QHNjc3QxIH5dIyBk
ZCBpZj0vZGV2L3NkYjEgb2Y9L2Rldi9udWxsIGJzPTFNIGNvdW50PTIwMDAwPGJyPg0KMjAwMDAr
MCByZWNvcmRzIGluPGJyPg0KMjAwMDArMCByZWNvcmRzIG91dDxicj4NCjIwOTcxNTIwMDAwIGJ5
dGVzICgyMSBHQikgY29waWVkLCA0MS4wMDMxIHMsIDUxMSBNQi9zPGJyPg0KPGJyPg0KW3Jvb3RA
c2NzdDEgfl0jIGRkIGlmPS9kZXYvaGFkYXRhL3Rlc3Qgb2Y9L2Rldi9udWxsIGJzPTFNIGNvdW50
PTIwMDAwPGJyPg0KMjAwMDArMCByZWNvcmRzIGluPGJyPg0KMjAwMDArMCByZWNvcmRzIG91dDxi
cj4NCjIwOTcxNTIwMDAwIGJ5dGVzICgyMSBHQikgY29waWVkLCA0NC4zNDQgcywgNDczIE1CL3M8
YnI+DQo8YnI+DQpbcm9vdEBzY3N0MSB+XSMgZGQgaWY9L2Rldi9oYWRhdGEvbWlycm9yMSBvZj0v
ZGV2L251bGwgYnM9MU0gY291bnQ9MjAwMDA8YnI+DQoyMDAwMCswIHJlY29yZHMgaW48YnI+DQoy
MDAwMCswIHJlY29yZHMgb3V0PGJyPg0KMjA5NzE1MjAwMDAgYnl0ZXMgKDIxIEdCKSBjb3BpZWQs
IDM2NS42ODUgcywgNTcuMyBNQi9zPGJyPg0KPGJyPg0KPGJyPg0KSXMgdGhpcyBqdXN0IHRoZSBs
aWZlIG9mIGEgTFZNIG1pcnJvciBhbmQgdGhlIHBlcmZvcm1hbmNlIGhlcmUgaXMgYWJvdXQgYXMg
Z29vZCBhcyBpdCBnZXRzPzxicj4NCjxicj4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fPGJyPg0KbGludXgtbHZtIG1haWxpbmcgbGlzdDxicj4NCjxhIGhy
ZWY9Im1haWx0bzpsaW51eC1sdm1AcmVkaGF0LmNvbSI+bGludXgtbHZtQHJlZGhhdC5jb208L2E+
PGJyPg0KPGEgaHJlZj0iaHR0cHM6Ly93d3cucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LWx2bSIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vd3d3LnJlZGhhdC5jb20vbWFpbG1hbi9s
aXN0aW5mby9saW51eC1sdm08L2E+PGJyPg0KcmVhZCB0aGUgTFZNIEhPVy1UTyBhdCA8YSBocmVm
PSJodHRwOi8vdGxkcC5vcmcvSE9XVE8vTFZNLUhPV1RPLyIgdGFyZ2V0PSJfYmxhbmsiPmh0dHA6
Ly90bGRwLm9yZy9IT1dUTy9MVk0tSE9XVE8vPC9hPjxicj4NCjwvYmxvY2txdW90ZT48L2Rpdj48
YnI+PC9kaXY+DQo=
--047d7b10ce5122bcfc050411f901--
