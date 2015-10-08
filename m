Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t989rFHM015444
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Thu, 8 Oct 2015 05:53:15 -0400
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mx1.redhat.com (Postfix) with ESMTPS id A7AA4C0BD8B1
	for <linux-lvm@redhat.com>; Thu,  8 Oct 2015 09:53:14 +0000 (UTC)
Received: by igcpe7 with SMTP id pe7so8878219igc.0
	for <linux-lvm@redhat.com>; Thu, 08 Oct 2015 02:53:14 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CADxRZqwQ4u66WWDCRQXe-zGrnhzxZjmFgNB27c0eFgYop9++uw@mail.gmail.com>
References: <CADxRZqwQ4u66WWDCRQXe-zGrnhzxZjmFgNB27c0eFgYop9++uw@mail.gmail.com>
Date: Thu, 8 Oct 2015 12:53:14 +0300
Message-ID: <CADxRZqz1mYyRgtwXcf5jwKeRCBBsP0Yf19C0oVt4Z3kKj6ffdA@mail.gmail.com>
From: Anatoly Pugachev <matorola@gmail.com>
Content-Type: multipart/alternative; boundary=089e013a0744e2fcd9052194d434
Subject: Re: [linux-lvm] mirror volume split
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

--089e013a0744e2fcd9052194d434
Content-Type: text/plain; charset=UTF-8

to reply myself,

probably bug in md raid1 implementation of lvm2, since it's quite a new
code in 2014 lvm2.

Fixed with help from irc #lvm, thanks to kabi :

ithaqua:/mnt # lvremove vg1/split1
Do you really want to remove active logical volume split1? [y/n]: y
  Logical volume "split1" successfully removed
ithaqua:/mnt # lvremove vg1/gatewayVol_rmeta_1
Do you really want to remove active logical volume gatewayVol_rmeta_1?
[y/n]: y
  Logical volume "gatewayVol_rmeta_1" successfully removed
ithaqua:/mnt # lvremove vg1/gatewayVol_rmeta_0
Do you really want to remove active logical volume gatewayVol_rmeta_0?
[y/n]: y
  Logical volume "gatewayVol_rmeta_0" successfully removed
ithaqua:/mnt # lvremove vg1/gatewayVol_rimage_1
  Logical volume "gatewayVol_rimage_1" successfully removed

ithaqua:/mnt # lvconvert -m1 vg1/gatewayVol
  device-mapper: create ioctl on vg1-gatewayVol_rimage_0 failed: Device or
resource busy
  Failed to lock logical volume vg1/gatewayVol.

ithaqua:/mnt # lvs
  LV                  VG   Attr       LSize   Pool Origin Data%  Meta%
Move Log Cpy%Sync Convert
  gatewayVol          vg1  -wi-ao----
8.00g
  gatewayVol_rimage_1 vg1  -wi-------
8.00g
  gatewayVol_rmeta_0  vg1  -wi-a-----
4.00m
  gatewayVol_rmeta_1  vg1  -wi-------   4.00m


ithaqua:/mnt # lvremove vg1/gatewayVol_rmeta_1
Do you really want to remove active logical volume gatewayVol_rmeta_1?
[y/n]: y
  Logical volume "gatewayVol_rmeta_1" successfully removed
ithaqua:/mnt # lvremove vg1/gatewayVol_rmeta_0
Do you really want to remove active logical volume gatewayVol_rmeta_0?
[y/n]: y
  Logical volume "gatewayVol_rmeta_0" successfully removed
ithaqua:/mnt # lvremove vg1/gatewayVol_rimage_1
  Logical volume "gatewayVol_rimage_1" successfully removed

ithaqua:/mnt # lvs
  LV                  VG   Attr       LSize   Pool Origin Data%  Meta%
Move Log Cpy%Sync Convert
  gatewayVol          vg1  -wi-ao----   8.00g

ithaqua:/mnt # dmsetup table | grep gate
vg1-gatewayVol_rimage_0: 0 16777216 linear 8:5 714926080
vg1-gatewayVol: 0 16777216 linear 8:5 714926080

ithaqua:/mnt # dmsetup info -c | grep gate
vg1-gatewayVol_rimage_0          254  52 L--w    0    1      0
LVM-BynKRpbJnegQy2RbeN9sxON1zKghQ7Fw2Q4aqEReJHtPNxXFyPyaXz040c5y3ZWA
vg1-gatewayVol                   254  55 L--w    1    1      0
LVM-BynKRpbJnegQy2RbeN9sxON1zKghQ7FwMYUKRXvsN40JWStnPz6PSjxrlg0QxmCb

ithaqua:/mnt # dmsetup ls --tree
vg1-gatewayVol_rimage_0 (254:52)
 L- (8:5)
vg1-gatewayVol (254:55)
 L- (8:5)

ithaqua:/mnt # dmsetup remove vg1-gatewayVol_rimage_0
ithaqua:/mnt # dmsetup info -c | grep gate
vg1-gatewayVol                   254  55 L--w    1    1      0
LVM-BynKRpbJnegQy2RbeN9sxON1zKghQ7FwMYUKRXvsN40JWStnPz6PSjxrlg0QxmCb
ithaqua:/mnt # dmsetup table | grep gate
vg1-gatewayVol: 0 16777216 linear 8:5 714926080


ithaqua:/mnt # lvconvert -m1 vg1/gatewayVol
ithaqua:/mnt # lvs -a | grep gate
  LV                  VG   Attr       LSize   Pool Origin Data%  Meta%
Move Log Cpy%Sync Convert
  gatewayVol                     vg1  rwi-aor---
8.00g                                    10.84
  [gatewayVol_rimage_0]          vg1  Iwi-aor---
8.00g
  [gatewayVol_rimage_1]          vg1  Iwi-aor---
8.00g
  [gatewayVol_rmeta_0]           vg1  ewi-aor---
4.00m
  [gatewayVol_rmeta_1]           vg1  ewi-aor---   4.00m




On Thu, Oct 8, 2015 at 12:17 PM, Anatoly Pugachev <matorola@gmail.com>
wrote:

> Hello!
>
> Trying to split one of mirror volumes :
>
> # lvs
>   LV                  VG   Attr       LSize   Pool Origin Data%  Meta%
> Move Log Cpy%Sync Convert
>   gatewayVol          vg1  rwi-aor---
> 8.00g                                    100.00
>
> # lvconvert --splitmirrors 1 -n split1 vg1/gatewayVol
> # lvs
>   LV                  VG   Attr       LSize   Pool Origin Data%  Meta%
> Move Log Cpy%Sync Convert
>   gatewayVol          vg1  -wi-ao----   8.00g
>   split1              vg1  -wi-a-----   8.00g
>
> converting original volume back to mirror configuration, leaving split1
> volume intact:
>
> # lvconvert -m1 vg1/gatewayVol
>   device-mapper: create ioctl on vg1-gatewayVol_rimage_1 failed: Device or
> resource busy
>   Failed to lock logical volume vg1/gatewayVol.
>
> # lvs
>   LV                  VG   Attr       LSize   Pool Origin Data%  Meta%
> Move Log Cpy%Sync Convert
>   gatewayVol          vg1  -wi-ao----   8.00g
>   gatewayVol_rimage_1 vg1  -wi-------   8.00g
>   gatewayVol_rmeta_0  vg1  -wi-a-----   4.00m
>   gatewayVol_rmeta_1  vg1  -wi-a-----   4.00m
>   split1              vg1  -wi-a-----   8.00g
>
> So, what I should do now? What is rimage* and rmeta* ? How do I get rid of
> them, preserving data on gatewayVol and split1 volumes?
>
> Thanks.
>
> PS: opensuse 13.2
>
> # lvm version
>   LVM version:     2.02.114(2) (2014-11-28)
>   Library version: 1.03.01 (2014-11-28)
>   Driver version:  4.27.0
>

--089e013a0744e2fcd9052194d434
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGRpdiBjbGFzcz0iZ21haWxfZGVmYXVsdCIgc3R5bGU9ImZvbnQtZmFt
aWx5OnZlcmRhbmEsc2Fucy1zZXJpZiI+dG8gcmVwbHkgbXlzZWxmLCA8YnI+PGJyPnByb2JhYmx5
IGJ1ZyBpbiBtZCByYWlkMSBpbXBsZW1lbnRhdGlvbiBvZiBsdm0yLCBzaW5jZSBpdCYjMzk7cyBx
dWl0ZSBhIG5ldyBjb2RlIGluIDIwMTQgbHZtMi48YnI+PGJyPjwvZGl2PjxkaXYgY2xhc3M9Imdt
YWlsX2RlZmF1bHQiIHN0eWxlPSJmb250LWZhbWlseTp2ZXJkYW5hLHNhbnMtc2VyaWYiPkZpeGVk
IHdpdGggaGVscCBmcm9tIGlyYyAjbHZtLCB0aGFua3MgdG8ga2FiaSA6PGJyPjxicj48c3BhbiBz
dHlsZT0iZm9udC1mYW1pbHk6bW9ub3NwYWNlLG1vbm9zcGFjZSI+aXRoYXF1YTovbW50ICMgbHZy
ZW1vdmUgdmcxL3NwbGl0MTxicj5EbyB5b3UgcmVhbGx5IHdhbnQgdG8gcmVtb3ZlIGFjdGl2ZSBs
b2dpY2FsIHZvbHVtZSBzcGxpdDE/IFt5L25dOiB5PGJyPsKgIExvZ2ljYWwgdm9sdW1lICZxdW90
O3NwbGl0MSZxdW90OyBzdWNjZXNzZnVsbHkgcmVtb3ZlZDxicj5pdGhhcXVhOi9tbnQgIyBsdnJl
bW92ZSB2ZzEvZ2F0ZXdheVZvbF9ybWV0YV8xPGJyPkRvIHlvdSByZWFsbHkgd2FudCB0byByZW1v
dmUgYWN0aXZlIGxvZ2ljYWwgdm9sdW1lIGdhdGV3YXlWb2xfcm1ldGFfMT8gW3kvbl06IHk8YnI+
wqAgTG9naWNhbCB2b2x1bWUgJnF1b3Q7Z2F0ZXdheVZvbF9ybWV0YV8xJnF1b3Q7IHN1Y2Nlc3Nm
dWxseSByZW1vdmVkPGJyPml0aGFxdWE6L21udCAjIGx2cmVtb3ZlIHZnMS9nYXRld2F5Vm9sX3Jt
ZXRhXzA8YnI+RG8geW91IHJlYWxseSB3YW50IHRvIHJlbW92ZSBhY3RpdmUgbG9naWNhbCB2b2x1
bWUgZ2F0ZXdheVZvbF9ybWV0YV8wPyBbeS9uXTogeTxicj7CoCBMb2dpY2FsIHZvbHVtZSAmcXVv
dDtnYXRld2F5Vm9sX3JtZXRhXzAmcXVvdDsgc3VjY2Vzc2Z1bGx5IHJlbW92ZWQ8YnI+aXRoYXF1
YTovbW50ICMgbHZyZW1vdmUgdmcxL2dhdGV3YXlWb2xfcmltYWdlXzE8YnI+wqAgTG9naWNhbCB2
b2x1bWUgJnF1b3Q7Z2F0ZXdheVZvbF9yaW1hZ2VfMSZxdW90OyBzdWNjZXNzZnVsbHkgcmVtb3Zl
ZDxicj48YnI+aXRoYXF1YTovbW50ICMgbHZjb252ZXJ0IC1tMSB2ZzEvZ2F0ZXdheVZvbDxicj7C
oCBkZXZpY2UtbWFwcGVyOiBjcmVhdGUgaW9jdGwgb24gdmcxLWdhdGV3YXlWb2xfcmltYWdlXzAg
ZmFpbGVkOiBEZXZpY2Ugb3IgcmVzb3VyY2UgYnVzeTxicj7CoCBGYWlsZWQgdG8gbG9jayBsb2dp
Y2FsIHZvbHVtZSB2ZzEvZ2F0ZXdheVZvbC48YnI+PGJyPml0aGFxdWE6L21udCAjIGx2czxicj7C
oCBMVsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgVkfCoMKgIEF0dHLCoMKgwqDC
oMKgwqAgTFNpemXCoMKgIFBvb2wgT3JpZ2luIERhdGElwqAgTWV0YSXCoCBNb3ZlIExvZyBDcHkl
U3luYyBDb252ZXJ0PGJyPsKgIGdhdGV3YXlWb2zCoMKgwqDCoMKgwqDCoMKgwqAgdmcxwqAgLXdp
LWFvLS0tLcKgwqAgOC4wMGfCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgPGJyPsKgIGdhdGV3YXlWb2xfcmltYWdlXzEgdmcxwqAgLXdpLS0tLS0tLcKgwqAgOC4w
MGfCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPGJyPsKgIGdh
dGV3YXlWb2xfcm1ldGFfMMKgIHZnMcKgIC13aS1hLS0tLS3CoMKgIDQuMDBtwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDxicj7CoCBnYXRld2F5Vm9sX3JtZXRh
XzHCoCB2ZzHCoCAtd2ktLS0tLS0twqDCoCA0LjAwbcKgIDwvc3Bhbj48YnI+PGJyPjxicj48c3Bh
biBzdHlsZT0iZm9udC1mYW1pbHk6bW9ub3NwYWNlLG1vbm9zcGFjZSI+aXRoYXF1YTovbW50ICMg
bHZyZW1vdmUgdmcxL2dhdGV3YXlWb2xfcm1ldGFfMTxicj5EbyB5b3UgcmVhbGx5IHdhbnQgdG8g
cmVtb3ZlIGFjdGl2ZSBsb2dpY2FsIHZvbHVtZSBnYXRld2F5Vm9sX3JtZXRhXzE/IFt5L25dOiB5
PGJyPsKgIExvZ2ljYWwgdm9sdW1lICZxdW90O2dhdGV3YXlWb2xfcm1ldGFfMSZxdW90OyBzdWNj
ZXNzZnVsbHkgcmVtb3ZlZDxicj5pdGhhcXVhOi9tbnQgIyBsdnJlbW92ZSB2ZzEvZ2F0ZXdheVZv
bF9ybWV0YV8wPGJyPkRvIHlvdSByZWFsbHkgd2FudCB0byByZW1vdmUgYWN0aXZlIGxvZ2ljYWwg
dm9sdW1lIGdhdGV3YXlWb2xfcm1ldGFfMD8gW3kvbl06IHk8YnI+wqAgTG9naWNhbCB2b2x1bWUg
JnF1b3Q7Z2F0ZXdheVZvbF9ybWV0YV8wJnF1b3Q7IHN1Y2Nlc3NmdWxseSByZW1vdmVkPGJyPml0
aGFxdWE6L21udCAjIGx2cmVtb3ZlIHZnMS9nYXRld2F5Vm9sX3JpbWFnZV8xPGJyPsKgIExvZ2lj
YWwgdm9sdW1lICZxdW90O2dhdGV3YXlWb2xfcmltYWdlXzEmcXVvdDsgc3VjY2Vzc2Z1bGx5IHJl
bW92ZWQ8YnI+PGJyPjwvc3Bhbj48c3BhbiBzdHlsZT0iZm9udC1mYW1pbHk6bW9ub3NwYWNlLG1v
bm9zcGFjZSI+aXRoYXF1YTovbW50ICMgbHZzPGJyPsKgIExWwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBWR8KgwqAgQXR0csKgwqDCoMKgwqDCoCBMU2l6ZcKgwqAgUG9vbCBPcmln
aW4gRGF0YSXCoCBNZXRhJcKgIE1vdmUgTG9nIENweSVTeW5jIENvbnZlcnQ8YnI+wqAgZ2F0ZXdh
eVZvbMKgwqDCoMKgwqDCoMKgwqDCoCB2ZzHCoCAtd2ktYW8tLS0twqDCoCA4LjAwZzxicj7CoCA8
YnI+aXRoYXF1YTovbW50ICMgZG1zZXR1cCB0YWJsZSB8IGdyZXAgZ2F0ZTxicj52ZzEtZ2F0ZXdh
eVZvbF9yaW1hZ2VfMDogMCAxNjc3NzIxNiBsaW5lYXIgODo1IDcxNDkyNjA4MDxicj52ZzEtZ2F0
ZXdheVZvbDogMCAxNjc3NzIxNiBsaW5lYXIgODo1IDcxNDkyNjA4MDxicj48YnI+aXRoYXF1YTov
bW50ICMgZG1zZXR1cCBpbmZvIC1jIHwgZ3JlcCBnYXRlPGJyPnZnMS1nYXRld2F5Vm9sX3JpbWFn
ZV8wwqDCoMKgwqDCoMKgwqDCoMKgIDI1NMKgIDUyIEwtLXfCoMKgwqAgMMKgwqDCoCAxwqDCoMKg
wqDCoCAwIExWTS1CeW5LUnBiSm5lZ1F5MlJiZU45c3hPTjF6S2doUTdGdzJRNGFxRVJlSkh0UE54
WEZ5UHlhWHowNDBjNXkzWldBPGJyPnZnMS1nYXRld2F5Vm9swqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIDI1NMKgIDU1IEwtLXfCoMKgwqAgMcKgwqDCoCAxwqDCoMKgwqDCoCAw
IExWTS1CeW5LUnBiSm5lZ1F5MlJiZU45c3hPTjF6S2doUTdGd01ZVUtSWHZzTjQwSldTdG5QejZQ
U2p4cmxnMFF4bUNiPGJyPjxicj5pdGhhcXVhOi9tbnQgIyBkbXNldHVwIGxzIC0tdHJlZTxicj52
ZzEtZ2F0ZXdheVZvbF9yaW1hZ2VfMCAoMjU0OjUyKTxicj7CoEwtICg4OjUpPGJyPnZnMS1nYXRl
d2F5Vm9sICgyNTQ6NTUpPGJyPsKgTC0gKDg6NSk8L3NwYW4+PGJyPjxicj48c3BhbiBzdHlsZT0i
Zm9udC1mYW1pbHk6bW9ub3NwYWNlLG1vbm9zcGFjZSI+aXRoYXF1YTovbW50ICMgZG1zZXR1cCBy
ZW1vdmUgdmcxLWdhdGV3YXlWb2xfcmltYWdlXzA8YnI+aXRoYXF1YTovbW50ICMgZG1zZXR1cCBp
bmZvIC1jIHwgZ3JlcCBnYXRlPGJyPnZnMS1nYXRld2F5Vm9swqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIDI1NMKgIDU1IEwtLXfCoMKgwqAgMcKgwqDCoCAxwqDCoMKgwqDCoCAw
IExWTS1CeW5LUnBiSm5lZ1F5MlJiZU45c3hPTjF6S2doUTdGd01ZVUtSWHZzTjQwSldTdG5QejZQ
U2p4cmxnMFF4bUNiPGJyPml0aGFxdWE6L21udCAjIGRtc2V0dXAgdGFibGUgfCBncmVwIGdhdGU8
YnI+dmcxLWdhdGV3YXlWb2w6IDAgMTY3NzcyMTYgbGluZWFyIDg6NSA3MTQ5MjYwODA8YnI+PGJy
Pjxicj5pdGhhcXVhOi9tbnQgIyBsdmNvbnZlcnQgLW0xIHZnMS9nYXRld2F5Vm9sPGJyPml0aGFx
dWE6L21udCAjIGx2cyAtYSB8IGdyZXAgZ2F0ZTxicj7CoCBMVsKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgVkfCoMKgIEF0dHLCoMKgwqDCoMKgwqAgTFNpemXCoMKgIFBvb2wgT3Jp
Z2luIERhdGElwqAgTWV0YSXCoCBNb3ZlIExvZyBDcHklU3luYyBDb252ZXJ0PGJyPsKgIGdhdGV3
YXlWb2zCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHZnMcKgIHJ3aS1h
b3ItLS3CoMKgIDguMDBnwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAxMC44NMKgwqDCoMKgwqDCoMKgwqDCoMKgIDxi
cj7CoCBbZ2F0ZXdheVZvbF9yaW1hZ2VfMF3CoMKgwqDCoMKgwqDCoMKgwqAgdmcxwqAgSXdpLWFv
ci0tLcKgwqAgOC4wMGfCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgPGJyPsKgIFtnYXRld2F5Vm9sX3JpbWFnZV8xXcKgwqDCoMKgwqDCoMKgwqDCoCB2ZzHCoCBJ
d2ktYW9yLS0twqDCoCA4LjAwZ8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCA8YnI+wqAgW2dhdGV3YXlWb2xfcm1ldGFfMF3CoMKgwqDCoMKgwqDCoMKgwqDCoCB2
ZzHCoCBld2ktYW9yLS0twqDCoCA0LjAwbcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCA8YnI+wqAgW2dhdGV3YXlWb2xfcm1ldGFfMV3CoMKgwqDCoMKgwqDCoMKg
wqDCoCB2ZzHCoCBld2ktYW9yLS0twqDCoCA0LjAwbcKgIDwvc3Bhbj48YnI+PGJyPjxicj48YnI+
PC9kaXY+PGRpdiBjbGFzcz0iZ21haWxfZXh0cmEiPjxicj48ZGl2IGNsYXNzPSJnbWFpbF9xdW90
ZSI+T24gVGh1LCBPY3QgOCwgMjAxNSBhdCAxMjoxNyBQTSwgQW5hdG9seSBQdWdhY2hldiA8c3Bh
biBkaXI9Imx0ciI+Jmx0OzxhIGhyZWY9Im1haWx0bzptYXRvcm9sYUBnbWFpbC5jb20iIHRhcmdl
dD0iX2JsYW5rIj5tYXRvcm9sYUBnbWFpbC5jb208L2E+Jmd0Ozwvc3Bhbj4gd3JvdGU6PGJyPjxi
bG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdpbjowcHggMHB4IDBweCAw
LjhleDtib3JkZXItbGVmdDoxcHggc29saWQgcmdiKDIwNCwyMDQsMjA0KTtwYWRkaW5nLWxlZnQ6
MWV4Ij48ZGl2IGRpcj0ibHRyIj48ZGl2IHN0eWxlPSJmb250LWZhbWlseTp2ZXJkYW5hLHNhbnMt
c2VyaWYiPkhlbGxvITxicj48YnI+PC9kaXY+PGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6dmVyZGFu
YSxzYW5zLXNlcmlmIj5UcnlpbmcgdG8gc3BsaXQgb25lIG9mIG1pcnJvciB2b2x1bWVzIDo8YnI+
PGJyPjxzcGFuIHN0eWxlPSJmb250LWZhbWlseTptb25vc3BhY2UsbW9ub3NwYWNlIj4jIGx2czxi
cj48L3NwYW4+PHNwYW4gc3R5bGU9ImZvbnQtZmFtaWx5Om1vbm9zcGFjZSxtb25vc3BhY2UiPjxz
cGFuIHN0eWxlPSJmb250LWZhbWlseTptb25vc3BhY2UsbW9ub3NwYWNlIj7CoCBMVsKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgVkfCoMKgIEF0dHLCoMKgwqDCoMKgwqAgTFNpemXC
oMKgIFBvb2wgT3JpZ2luIERhdGElwqAgTWV0YSXCoCBNb3ZlIExvZyBDcHklU3luYyBDb252ZXJ0
PC9zcGFuPsKgIDxicj7CoCBnYXRld2F5Vm9swqDCoMKgwqDCoMKgwqDCoMKgIHZnMcKgIHJ3aS1h
b3ItLS3CoMKgIDguMDBnwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAxMDAuMDA8YnI+PGJyPjwvc3Bhbj48L2Rpdj48
ZGl2IHN0eWxlPSJmb250LWZhbWlseTp2ZXJkYW5hLHNhbnMtc2VyaWYiPjxzcGFuIHN0eWxlPSJm
b250LWZhbWlseTptb25vc3BhY2UsbW9ub3NwYWNlIj4jIGx2Y29udmVydCAtLXNwbGl0bWlycm9y
cyAxIC1uIHNwbGl0MSB2ZzEvZ2F0ZXdheVZvbDxicj4jIGx2czxicj7CoCBMVsKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgVkfCoMKgIEF0dHLCoMKgwqDCoMKgwqAgTFNpemXCoMKg
IFBvb2wgT3JpZ2luIERhdGElwqAgTWV0YSXCoCBNb3ZlIExvZyBDcHklU3luYyBDb252ZXJ0PGJy
PsKgIGdhdGV3YXlWb2zCoMKgwqDCoMKgwqDCoMKgwqAgdmcxwqAgLXdpLWFvLS0tLcKgwqAgOC4w
MGc8YnI+wqAgc3BsaXQxwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdmcxwqAgLXdpLWEtLS0t
LcKgwqAgOC4wMGc8L3NwYW4+PGJyPjxicj48L2Rpdj48ZGl2IHN0eWxlPSJmb250LWZhbWlseTp2
ZXJkYW5hLHNhbnMtc2VyaWYiPmNvbnZlcnRpbmcgb3JpZ2luYWwgdm9sdW1lIGJhY2sgdG8gbWly
cm9yIGNvbmZpZ3VyYXRpb24sIGxlYXZpbmcgc3BsaXQxIHZvbHVtZSBpbnRhY3Q6PGJyPjxicj48
c3BhbiBzdHlsZT0iZm9udC1mYW1pbHk6bW9ub3NwYWNlLG1vbm9zcGFjZSI+IyBsdmNvbnZlcnQg
LW0xIHZnMS9nYXRld2F5Vm9sPGJyPsKgIGRldmljZS1tYXBwZXI6IGNyZWF0ZSBpb2N0bCBvbiB2
ZzEtZ2F0ZXdheVZvbF9yaW1hZ2VfMSBmYWlsZWQ6IERldmljZSBvciByZXNvdXJjZSBidXN5PGJy
PsKgIEZhaWxlZCB0byBsb2NrIGxvZ2ljYWwgdm9sdW1lIHZnMS9nYXRld2F5Vm9sLjxicj48L3Nw
YW4+PGJyPjxzcGFuIHN0eWxlPSJmb250LWZhbWlseTptb25vc3BhY2UsbW9ub3NwYWNlIj4jIGx2
czxicj7CoCBMVsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgVkfCoMKgIEF0dHLC
oMKgwqDCoMKgwqAgTFNpemXCoMKgIFBvb2wgT3JpZ2luIERhdGElwqAgTWV0YSXCoCBNb3ZlIExv
ZyBDcHklU3luYyBDb252ZXJ0PGJyPsKgIGdhdGV3YXlWb2zCoMKgwqDCoMKgwqDCoMKgwqAgdmcx
wqAgLXdpLWFvLS0tLcKgwqAgOC4wMGc8YnI+wqAgZ2F0ZXdheVZvbF9yaW1hZ2VfMSB2ZzHCoCAt
d2ktLS0tLS0twqDCoCA4LjAwZzxicj7CoCBnYXRld2F5Vm9sX3JtZXRhXzDCoCB2ZzHCoCAtd2kt
YS0tLS0twqDCoCA0LjAwbTxicj7CoCBnYXRld2F5Vm9sX3JtZXRhXzHCoCB2ZzHCoCAtd2ktYS0t
LS0twqDCoCA0LjAwbTxicj7CoCBzcGxpdDHCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB2ZzHC
oCAtd2ktYS0tLS0twqDCoCA4LjAwZzxicj7CoCA8YnI+PC9zcGFuPjwvZGl2PjxkaXYgc3R5bGU9
ImZvbnQtZmFtaWx5OnZlcmRhbmEsc2Fucy1zZXJpZiI+U28sIHdoYXQgSSBzaG91bGQgZG8gbm93
PyBXaGF0IGlzIHJpbWFnZSogYW5kIHJtZXRhKiA/IEhvdyBkbyBJIGdldCByaWQgb2YgdGhlbSwg
cHJlc2VydmluZyBkYXRhIG9uIGdhdGV3YXlWb2wgYW5kIHNwbGl0MSB2b2x1bWVzPyA8YnI+PGJy
PjwvZGl2PjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OnZlcmRhbmEsc2Fucy1zZXJpZiI+VGhhbmtz
Ljxicj48YnI+PC9kaXY+PGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6dmVyZGFuYSxzYW5zLXNlcmlm
Ij5QUzogb3BlbnN1c2UgMTMuMjxicj48YnI+IyBsdm0gdmVyc2lvbsKgIDxicj7CoCBMVk0gdmVy
c2lvbjrCoMKgwqDCoCAyLjAyLjExNCgyKSAoMjAxNC0xMS0yOCk8YnI+wqAgTGlicmFyeSB2ZXJz
aW9uOiAxLjAzLjAxICgyMDE0LTExLTI4KTxicj7CoCBEcml2ZXIgdmVyc2lvbjrCoCA0LjI3LjA8
YnI+PC9kaXY+PC9kaXY+DQo8L2Jsb2NrcXVvdGU+PC9kaXY+PGJyPjwvZGl2PjwvZGl2Pg0K
--089e013a0744e2fcd9052194d434--
