Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id sA41GK3B013150
	for <linux-lvm@redhat.com>; Mon, 3 Nov 2014 20:16:20 -0500
Received: from mail-la0-f46.google.com (mail-la0-f46.google.com
	[209.85.215.46])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id sA41GHvP017069
	(version=TLSv1/SSLv3 cipher=RC4-SHA bits=128 verify=FAIL)
	for <linux-lvm@redhat.com>; Mon, 3 Nov 2014 20:16:18 -0500
Received: by mail-la0-f46.google.com with SMTP id hs14so30934lab.33
	for <linux-lvm@redhat.com>; Mon, 03 Nov 2014 17:16:17 -0800 (PST)
MIME-Version: 1.0
From: Daniel Savard <daniel.savard@gmail.com>
Date: Mon, 3 Nov 2014 20:15:57 -0500
Message-ID: <CAHDsjKtjVuOVsEtzPpt-7x8BV1ficT7RQb5TVyUenutnuAnqMw@mail.gmail.com>
Content-Type: multipart/alternative; boundary=001a1132ed38c683460506fe357f
Subject: [linux-lvm] Volume "avg/alv" is not active locally.
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

--001a1132ed38c683460506fe357f
Content-Type: text/plain; charset=UTF-8

Hi,

I am running LVM2 on linux (Gentoo) with systemd and dracut. I ran into a
problem I am unable to find the cause.

I am trying to create a LV and I received an error as per the subject of
this post.

For example:

feynman ~ # lvcreate -a y --contiguous y --size 1G --name db2data
donneesvg   Volume "donneesvg/db2data" is not active locally.
  Aborting. Failed to wipe start of new LV.

What is going on? Any hints? What does it mean "not active locally"?

feynman ~ # vgdisplay donneesvg
  --- Volume group ---
  VG Name               donneesvg
  System ID
  Format                lvm2
  Metadata Areas        5
  Metadata Sequence No  142
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                18
  Open LV               18
  Max PV                0
  Cur PV                5
  Act PV                5
  VG Size               109,98 GiB
  PE Size               4,00 MiB
  Total PE              28155
  Alloc PE / Size       26087 / 101,90 GiB
  Free  PE / Size       2068 / 8,08 GiB
  VG UUID               AdmpT4-8BXf-jWvJ-42j9-i7aa-fln1-PSsweS

I am able increase the size of some LV, but I am not able to create a new
one. I added a PV because I was out of free space and since then I cannot
resize anymore the LV to take advantage of this new space.

feynman ~ # pvscan
  PV /dev/sda5    VG racinevg    lvm2 [50,00 GiB / 1,79 GiB free]
  PV /dev/sda8    VG bb10vg      lvm2 [5,00 GiB / 168,00 MiB free]
  PV /dev/sda6    VG donneesvg   lvm2 [50,00 GiB / 0    free]
  PV /dev/sda7    VG donneesvg   lvm2 [20,00 GiB / 0    free]
  PV /dev/sda9    VG donneesvg   lvm2 [10,00 GiB / 0    free]
  PV /dev/sda10   VG donneesvg   lvm2 [20,00 GiB / 0    free]
  PV /dev/sda11   VG donneesvg   lvm2 [10,00 GiB / 8,08 GiB free]
  Total: 7 [164,97 GiB] / in use: 7 [164,97 GiB] / in no VG: 0 [0   ]

-----------------
Daniel Savard

--001a1132ed38c683460506fe357f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGRpdj48ZGl2PjxkaXY+PGRpdj5IaSw8YnI+PGJyPjwvZGl2PkkgYW0g
cnVubmluZyBMVk0yIG9uIGxpbnV4IChHZW50b28pIHdpdGggc3lzdGVtZCBhbmQgZHJhY3V0LiBJ
IHJhbiBpbnRvIGEgcHJvYmxlbSBJIGFtIHVuYWJsZSB0byBmaW5kIHRoZSBjYXVzZS48YnI+PGJy
PkkgYW0gdHJ5aW5nIHRvIGNyZWF0ZSBhIExWIGFuZCBJIHJlY2VpdmVkIGFuIGVycm9yIGFzIHBl
ciB0aGUgc3ViamVjdCBvZiB0aGlzIHBvc3QuPGJyPjxicj48L2Rpdj5Gb3IgZXhhbXBsZTo8YnI+
PGJyPmZleW5tYW4gfiAjIGx2Y3JlYXRlIC1hIHkgLS1jb250aWd1b3VzIHkgLS1zaXplIDFHIC0t
bmFtZSBkYjJkYXRhIGRvbm5lZXN2Z8KgwqAgVm9sdW1lICZxdW90O2Rvbm5lZXN2Zy9kYjJkYXRh
JnF1b3Q7IGlzIG5vdCBhY3RpdmUgbG9jYWxseS48YnI+wqAgQWJvcnRpbmcuIEZhaWxlZCB0byB3
aXBlIHN0YXJ0IG9mIG5ldyBMVi48YnI+PGJyPjwvZGl2PldoYXQgaXMgZ29pbmcgb24/IEFueSBo
aW50cz8gV2hhdCBkb2VzIGl0IG1lYW4gJnF1b3Q7bm90IGFjdGl2ZSBsb2NhbGx5JnF1b3Q7Pzxi
cj48YnI+ZmV5bm1hbiB+ICMgdmdkaXNwbGF5IGRvbm5lZXN2Zzxicj7CoCAtLS0gVm9sdW1lIGdy
b3VwIC0tLTxicj7CoCBWRyBOYW1lwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkb25uZWVz
dmc8YnI+wqAgU3lzdGVtIElEwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDxicj7CoCBGb3JtYXTC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbHZtMjxicj7CoCBNZXRhZGF0YSBBcmVhc8Kg
wqDCoMKgwqDCoMKgIDU8YnI+wqAgTWV0YWRhdGEgU2VxdWVuY2UgTm/CoCAxNDI8YnI+wqAgVkcg
QWNjZXNzwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJlYWQvd3JpdGU8YnI+wqAgVkcgU3RhdHVz
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJlc2l6YWJsZTxicj7CoCBNQVggTFbCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgMDxicj7CoCBDdXIgTFbCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgMTg8YnI+wqAgT3BlbiBMVsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMTg8
YnI+wqAgTWF4IFBWwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDA8YnI+wqAgQ3VyIFBW
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDU8YnI+wqAgQWN0IFBWwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIDU8YnI+wqAgVkcgU2l6ZcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgMTA5LDk4IEdpQjxicj7CoCBQRSBTaXplwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCA0LDAwIE1pQjxicj7CoCBUb3RhbCBQRcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDI4MTU1
PGJyPsKgIEFsbG9jIFBFIC8gU2l6ZcKgwqDCoMKgwqDCoCAyNjA4NyAvIDEwMSw5MCBHaUI8YnI+
wqAgRnJlZcKgIFBFIC8gU2l6ZcKgwqDCoMKgwqDCoCAyMDY4IC8gOCwwOCBHaUI8YnI+wqAgVkcg
VVVJRMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgQWRtcFQ0LThCWGYtald2Si00Mmo5LWk3
YWEtZmxuMS1QU3N3ZVM8YnI+PGJyPjwvZGl2PkkgYW0gYWJsZSBpbmNyZWFzZSB0aGUgc2l6ZSBv
ZiBzb21lIExWLCBidXQgSSBhbSBub3QgYWJsZSB0byBjcmVhdGUgYSBuZXcgb25lLiBJIGFkZGVk
IGEgUFYgYmVjYXVzZSBJIHdhcyBvdXQgb2YgZnJlZSBzcGFjZSBhbmQgc2luY2UgdGhlbiBJIGNh
bm5vdCByZXNpemUgYW55bW9yZSB0aGUgTFYgdG8gdGFrZSBhZHZhbnRhZ2Ugb2YgdGhpcyBuZXcg
c3BhY2UuPGJyPjxicj5mZXlubWFuIH4gIyBwdnNjYW48YnI+wqAgUFYgL2Rldi9zZGE1wqDCoMKg
IFZHIHJhY2luZXZnwqDCoMKgIGx2bTIgWzUwLDAwIEdpQiAvIDEsNzkgR2lCIGZyZWVdPGJyPsKg
IFBWIC9kZXYvc2RhOMKgwqDCoCBWRyBiYjEwdmfCoMKgwqDCoMKgIGx2bTIgWzUsMDAgR2lCIC8g
MTY4LDAwIE1pQiBmcmVlXTxicj7CoCBQViAvZGV2L3NkYTbCoMKgwqAgVkcgZG9ubmVlc3ZnwqDC
oCBsdm0yIFs1MCwwMCBHaUIgLyAwwqDCoMKgIGZyZWVdPGJyPsKgIFBWIC9kZXYvc2RhN8KgwqDC
oCBWRyBkb25uZWVzdmfCoMKgIGx2bTIgWzIwLDAwIEdpQiAvIDDCoMKgwqAgZnJlZV08YnI+wqAg
UFYgL2Rldi9zZGE5wqDCoMKgIFZHIGRvbm5lZXN2Z8KgwqAgbHZtMiBbMTAsMDAgR2lCIC8gMMKg
wqDCoCBmcmVlXTxicj7CoCBQViAvZGV2L3NkYTEwwqDCoCBWRyBkb25uZWVzdmfCoMKgIGx2bTIg
WzIwLDAwIEdpQiAvIDDCoMKgwqAgZnJlZV08YnI+wqAgUFYgL2Rldi9zZGExMcKgwqAgVkcgZG9u
bmVlc3ZnwqDCoCBsdm0yIFsxMCwwMCBHaUIgLyA4LDA4IEdpQiBmcmVlXTxicj7CoCBUb3RhbDog
NyBbMTY0LDk3IEdpQl0gLyBpbiB1c2U6IDcgWzE2NCw5NyBHaUJdIC8gaW4gbm8gVkc6IDAgWzDC
oMKgIF08YnI+PGJyIGNsZWFyPSJhbGwiPjxkaXY+PGRpdj48ZGl2PjxkaXY+PGRpdj48ZGl2Pjxk
aXY+PGRpdiBjbGFzcz0iZ21haWxfc2lnbmF0dXJlIj4tLS0tLS0tLS0tLS0tLS0tLTxicj5EYW5p
ZWwgU2F2YXJkPC9kaXY+PC9kaXY+DQo8L2Rpdj48L2Rpdj48L2Rpdj48L2Rpdj48L2Rpdj48L2Rp
dj48L2Rpdj4NCg==
--001a1132ed38c683460506fe357f--
