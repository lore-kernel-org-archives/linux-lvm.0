Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t98ALj02003628
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Thu, 8 Oct 2015 06:21:45 -0400
Received: from mail-ig0-f181.google.com (mail-ig0-f181.google.com
	[209.85.213.181])
	by mx1.redhat.com (Postfix) with ESMTPS id A6416C0BE067
	for <linux-lvm@redhat.com>; Thu,  8 Oct 2015 10:21:43 +0000 (UTC)
Received: by igbkq10 with SMTP id kq10so11437674igb.0
	for <linux-lvm@redhat.com>; Thu, 08 Oct 2015 03:21:43 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CADxRZqz1mYyRgtwXcf5jwKeRCBBsP0Yf19C0oVt4Z3kKj6ffdA@mail.gmail.com>
References: <CADxRZqwQ4u66WWDCRQXe-zGrnhzxZjmFgNB27c0eFgYop9++uw@mail.gmail.com>
	<CADxRZqz1mYyRgtwXcf5jwKeRCBBsP0Yf19C0oVt4Z3kKj6ffdA@mail.gmail.com>
Date: Thu, 8 Oct 2015 13:21:42 +0300
Message-ID: <CADxRZqysSB=GmA8Y1+FPe-72K_KNbOhyj1cVo=AzoZF1OTR28A@mail.gmail.com>
From: Anatoly Pugachev <matorola@gmail.com>
Content-Type: multipart/alternative; boundary=047d7b10c9d1c04a960521953a2e
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

--047d7b10c9d1c04a960521953a2e
Content-Type: text/plain; charset=UTF-8

13:01 < kabi_> looking into WHATS new  -   2.02.116 fixes  raid1
--splitmirror
13:05 < kabi_> (and got broken in 2.02.112 - so your 114 release is
affected)

PS: there's updated package at
http://download.opensuse.org/repositories/systemsmanagement/openSUSE_13.2/x86_64/
with lvm2 2.02.120 version. Use at your own risk, since messing with
device-mapper and lvm2 can easily break something (like booting of server).

On Thu, Oct 8, 2015 at 12:53 PM, Anatoly Pugachev <matorola@gmail.com>
wrote:

> to reply myself,
>
> probably bug in md raid1 implementation of lvm2, since it's quite a new
> code in 2014 lvm2.
>
> Fixed with help from irc #lvm, thanks to kabi :
>
> ithaqua:/mnt # lvremove vg1/split1
> Do you really want to remove active logical volume split1? [y/n]: y
>   Logical volume "split1" successfully removed
> ithaqua:/mnt # lvremove vg1/gatewayVol_rmeta_1
> Do you really want to remove active logical volume gatewayVol_rmeta_1?
> [y/n]: y
>   Logical volume "gatewayVol_rmeta_1" successfully removed
> ithaqua:/mnt # lvremove vg1/gatewayVol_rmeta_0
> Do you really want to remove active logical volume gatewayVol_rmeta_0?
> [y/n]: y
>   Logical volume "gatewayVol_rmeta_0" successfully removed
> ithaqua:/mnt # lvremove vg1/gatewayVol_rimage_1
>   Logical volume "gatewayVol_rimage_1" successfully removed
>
> ithaqua:/mnt # lvconvert -m1 vg1/gatewayVol
>   device-mapper: create ioctl on vg1-gatewayVol_rimage_0 failed: Device or
> resource busy
>   Failed to lock logical volume vg1/gatewayVol.
>
> ithaqua:/mnt # lvs
>   LV                  VG   Attr       LSize   Pool Origin Data%  Meta%
> Move Log Cpy%Sync Convert
>   gatewayVol          vg1  -wi-ao----
> 8.00g
>   gatewayVol_rimage_1 vg1  -wi-------
> 8.00g
>   gatewayVol_rmeta_0  vg1  -wi-a-----
> 4.00m
>   gatewayVol_rmeta_1  vg1  -wi-------   4.00m
>
>
> ithaqua:/mnt # lvremove vg1/gatewayVol_rmeta_1
> Do you really want to remove active logical volume gatewayVol_rmeta_1?
> [y/n]: y
>   Logical volume "gatewayVol_rmeta_1" successfully removed
> ithaqua:/mnt # lvremove vg1/gatewayVol_rmeta_0
> Do you really want to remove active logical volume gatewayVol_rmeta_0?
> [y/n]: y
>   Logical volume "gatewayVol_rmeta_0" successfully removed
> ithaqua:/mnt # lvremove vg1/gatewayVol_rimage_1
>   Logical volume "gatewayVol_rimage_1" successfully removed
>
> ithaqua:/mnt # lvs
>   LV                  VG   Attr       LSize   Pool Origin Data%  Meta%
> Move Log Cpy%Sync Convert
>   gatewayVol          vg1  -wi-ao----   8.00g
>
> ithaqua:/mnt # dmsetup table | grep gate
> vg1-gatewayVol_rimage_0: 0 16777216 linear 8:5 714926080
> vg1-gatewayVol: 0 16777216 linear 8:5 714926080
>
> ithaqua:/mnt # dmsetup info -c | grep gate
> vg1-gatewayVol_rimage_0          254  52 L--w    0    1      0
> LVM-BynKRpbJnegQy2RbeN9sxON1zKghQ7Fw2Q4aqEReJHtPNxXFyPyaXz040c5y3ZWA
> vg1-gatewayVol                   254  55 L--w    1    1      0
> LVM-BynKRpbJnegQy2RbeN9sxON1zKghQ7FwMYUKRXvsN40JWStnPz6PSjxrlg0QxmCb
>
> ithaqua:/mnt # dmsetup ls --tree
> vg1-gatewayVol_rimage_0 (254:52)
>  L- (8:5)
> vg1-gatewayVol (254:55)
>  L- (8:5)
>
> ithaqua:/mnt # dmsetup remove vg1-gatewayVol_rimage_0
> ithaqua:/mnt # dmsetup info -c | grep gate
> vg1-gatewayVol                   254  55 L--w    1    1      0
> LVM-BynKRpbJnegQy2RbeN9sxON1zKghQ7FwMYUKRXvsN40JWStnPz6PSjxrlg0QxmCb
> ithaqua:/mnt # dmsetup table | grep gate
> vg1-gatewayVol: 0 16777216 linear 8:5 714926080
>
>
> ithaqua:/mnt # lvconvert -m1 vg1/gatewayVol
> ithaqua:/mnt # lvs -a | grep gate
>   LV                  VG   Attr       LSize   Pool Origin Data%  Meta%
> Move Log Cpy%Sync Convert
>   gatewayVol                     vg1  rwi-aor---
> 8.00g                                    10.84
>   [gatewayVol_rimage_0]          vg1  Iwi-aor---
> 8.00g
>   [gatewayVol_rimage_1]          vg1  Iwi-aor---
> 8.00g
>   [gatewayVol_rmeta_0]           vg1  ewi-aor---
> 4.00m
>   [gatewayVol_rmeta_1]           vg1  ewi-aor---   4.00m
>
>
>
>
> On Thu, Oct 8, 2015 at 12:17 PM, Anatoly Pugachev <matorola@gmail.com>
> wrote:
>
>> Hello!
>>
>> Trying to split one of mirror volumes :
>>
>> # lvs
>>   LV                  VG   Attr       LSize   Pool Origin Data%  Meta%
>> Move Log Cpy%Sync Convert
>>   gatewayVol          vg1  rwi-aor---
>> 8.00g                                    100.00
>>
>> # lvconvert --splitmirrors 1 -n split1 vg1/gatewayVol
>> # lvs
>>   LV                  VG   Attr       LSize   Pool Origin Data%  Meta%
>> Move Log Cpy%Sync Convert
>>   gatewayVol          vg1  -wi-ao----   8.00g
>>   split1              vg1  -wi-a-----   8.00g
>>
>> converting original volume back to mirror configuration, leaving split1
>> volume intact:
>>
>> # lvconvert -m1 vg1/gatewayVol
>>   device-mapper: create ioctl on vg1-gatewayVol_rimage_1 failed: Device
>> or resource busy
>>   Failed to lock logical volume vg1/gatewayVol.
>>
>> # lvs
>>   LV                  VG   Attr       LSize   Pool Origin Data%  Meta%
>> Move Log Cpy%Sync Convert
>>   gatewayVol          vg1  -wi-ao----   8.00g
>>   gatewayVol_rimage_1 vg1  -wi-------   8.00g
>>   gatewayVol_rmeta_0  vg1  -wi-a-----   4.00m
>>   gatewayVol_rmeta_1  vg1  -wi-a-----   4.00m
>>   split1              vg1  -wi-a-----   8.00g
>>
>> So, what I should do now? What is rimage* and rmeta* ? How do I get rid
>> of them, preserving data on gatewayVol and split1 volumes?
>>
>> Thanks.
>>
>> PS: opensuse 13.2
>>
>> # lvm version
>>   LVM version:     2.02.114(2) (2014-11-28)
>>   Library version: 1.03.01 (2014-11-28)
>>   Driver version:  4.27.0
>>
>
>

--047d7b10c9d1c04a960521953a2e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGRpdiBjbGFzcz0iZ21haWxfZGVmYXVsdCIgc3R5bGU9ImZvbnQtZmFt
aWx5OnZlcmRhbmEsc2Fucy1zZXJpZiI+PGJyPjEzOjAxICZsdDsga2FiaV8mZ3Q7IGxvb2tpbmcg
aW50byBXSEFUUyBuZXfCoCAtwqDCoCAyLjAyLjExNiBmaXhlc8KgIHJhaWQxIC0tc3BsaXRtaXJy
b3I8YnI+MTM6MDUgJmx0OyBrYWJpXyZndDsgKGFuZCBnb3QgYnJva2VuIGluIDIuMDIuMTEyIC0g
c28geW91ciAxMTQgcmVsZWFzZSBpcyBhZmZlY3RlZCk8YnI+PGJyPjwvZGl2PjxkaXYgY2xhc3M9
ImdtYWlsX2RlZmF1bHQiIHN0eWxlPSJmb250LWZhbWlseTp2ZXJkYW5hLHNhbnMtc2VyaWYiPlBT
OiB0aGVyZSYjMzk7cyB1cGRhdGVkIHBhY2thZ2UgYXQgPGEgaHJlZj0iaHR0cDovL2Rvd25sb2Fk
Lm9wZW5zdXNlLm9yZy9yZXBvc2l0b3JpZXMvc3lzdGVtc21hbmFnZW1lbnQvb3BlblNVU0VfMTMu
Mi94ODZfNjQvIj5odHRwOi8vZG93bmxvYWQub3BlbnN1c2Uub3JnL3JlcG9zaXRvcmllcy9zeXN0
ZW1zbWFuYWdlbWVudC9vcGVuU1VTRV8xMy4yL3g4Nl82NC88L2E+PGJyPjwvZGl2PjxkaXYgY2xh
c3M9ImdtYWlsX2RlZmF1bHQiIHN0eWxlPSJmb250LWZhbWlseTp2ZXJkYW5hLHNhbnMtc2VyaWYi
PndpdGggbHZtMiAyLjAyLjEyMCB2ZXJzaW9uLiBVc2UgYXQgeW91ciBvd24gcmlzaywgc2luY2Ug
bWVzc2luZyB3aXRoIGRldmljZS1tYXBwZXIgYW5kIGx2bTIgY2FuIGVhc2lseSBicmVhayBzb21l
dGhpbmcgKGxpa2UgYm9vdGluZyBvZiBzZXJ2ZXIpLiA8YnI+PC9kaXY+PGRpdiBjbGFzcz0iZ21h
aWxfZXh0cmEiPjxicj48ZGl2IGNsYXNzPSJnbWFpbF9xdW90ZSI+T24gVGh1LCBPY3QgOCwgMjAx
NSBhdCAxMjo1MyBQTSwgQW5hdG9seSBQdWdhY2hldiA8c3BhbiBkaXI9Imx0ciI+Jmx0OzxhIGhy
ZWY9Im1haWx0bzptYXRvcm9sYUBnbWFpbC5jb20iIHRhcmdldD0iX2JsYW5rIj5tYXRvcm9sYUBn
bWFpbC5jb208L2E+Jmd0Ozwvc3Bhbj4gd3JvdGU6PGJyPjxibG9ja3F1b3RlIGNsYXNzPSJnbWFp
bF9xdW90ZSIgc3R5bGU9Im1hcmdpbjowcHggMHB4IDBweCAwLjhleDtib3JkZXItbGVmdDoxcHgg
c29saWQgcmdiKDIwNCwyMDQsMjA0KTtwYWRkaW5nLWxlZnQ6MWV4Ij48ZGl2IGRpcj0ibHRyIj48
ZGl2IHN0eWxlPSJmb250LWZhbWlseTp2ZXJkYW5hLHNhbnMtc2VyaWYiPnRvIHJlcGx5IG15c2Vs
ZiwgPGJyPjxicj5wcm9iYWJseSBidWcgaW4gbWQgcmFpZDEgaW1wbGVtZW50YXRpb24gb2YgbHZt
Miwgc2luY2UgaXQmIzM5O3MgcXVpdGUgYSBuZXcgY29kZSBpbiAyMDE0IGx2bTIuPGJyPjxicj48
L2Rpdj48ZGl2IHN0eWxlPSJmb250LWZhbWlseTp2ZXJkYW5hLHNhbnMtc2VyaWYiPkZpeGVkIHdp
dGggaGVscCBmcm9tIGlyYyAjbHZtLCB0aGFua3MgdG8ga2FiaSA6PGJyPjxicj48c3BhbiBzdHls
ZT0iZm9udC1mYW1pbHk6bW9ub3NwYWNlLG1vbm9zcGFjZSI+aXRoYXF1YTovbW50ICMgbHZyZW1v
dmUgdmcxL3NwbGl0MTxicj5EbyB5b3UgcmVhbGx5IHdhbnQgdG8gcmVtb3ZlIGFjdGl2ZSBsb2dp
Y2FsIHZvbHVtZSBzcGxpdDE/IFt5L25dOiB5PGJyPsKgIExvZ2ljYWwgdm9sdW1lICZxdW90O3Nw
bGl0MSZxdW90OyBzdWNjZXNzZnVsbHkgcmVtb3ZlZDxicj5pdGhhcXVhOi9tbnQgIyBsdnJlbW92
ZSB2ZzEvZ2F0ZXdheVZvbF9ybWV0YV8xPGJyPkRvIHlvdSByZWFsbHkgd2FudCB0byByZW1vdmUg
YWN0aXZlIGxvZ2ljYWwgdm9sdW1lIGdhdGV3YXlWb2xfcm1ldGFfMT8gW3kvbl06IHk8YnI+wqAg
TG9naWNhbCB2b2x1bWUgJnF1b3Q7Z2F0ZXdheVZvbF9ybWV0YV8xJnF1b3Q7IHN1Y2Nlc3NmdWxs
eSByZW1vdmVkPGJyPml0aGFxdWE6L21udCAjIGx2cmVtb3ZlIHZnMS9nYXRld2F5Vm9sX3JtZXRh
XzA8YnI+RG8geW91IHJlYWxseSB3YW50IHRvIHJlbW92ZSBhY3RpdmUgbG9naWNhbCB2b2x1bWUg
Z2F0ZXdheVZvbF9ybWV0YV8wPyBbeS9uXTogeTxicj7CoCBMb2dpY2FsIHZvbHVtZSAmcXVvdDtn
YXRld2F5Vm9sX3JtZXRhXzAmcXVvdDsgc3VjY2Vzc2Z1bGx5IHJlbW92ZWQ8YnI+aXRoYXF1YTov
bW50ICMgbHZyZW1vdmUgdmcxL2dhdGV3YXlWb2xfcmltYWdlXzE8YnI+wqAgTG9naWNhbCB2b2x1
bWUgJnF1b3Q7Z2F0ZXdheVZvbF9yaW1hZ2VfMSZxdW90OyBzdWNjZXNzZnVsbHkgcmVtb3ZlZDxi
cj48YnI+aXRoYXF1YTovbW50ICMgbHZjb252ZXJ0IC1tMSB2ZzEvZ2F0ZXdheVZvbDxicj7CoCBk
ZXZpY2UtbWFwcGVyOiBjcmVhdGUgaW9jdGwgb24gdmcxLWdhdGV3YXlWb2xfcmltYWdlXzAgZmFp
bGVkOiBEZXZpY2Ugb3IgcmVzb3VyY2UgYnVzeTxzcGFuIGNsYXNzPSIiPjxicj7CoCBGYWlsZWQg
dG8gbG9jayBsb2dpY2FsIHZvbHVtZSB2ZzEvZ2F0ZXdheVZvbC48YnI+PGJyPjwvc3Bhbj5pdGhh
cXVhOi9tbnQgIyBsdnM8c3BhbiBjbGFzcz0iIj48YnI+wqAgTFbCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIFZHwqDCoCBBdHRywqDCoMKgwqDCoMKgIExTaXplwqDCoCBQb29sIE9y
aWdpbiBEYXRhJcKgIE1ldGElwqAgTW92ZSBMb2cgQ3B5JVN5bmMgQ29udmVydDxicj7CoCBnYXRl
d2F5Vm9swqDCoMKgwqDCoMKgwqDCoMKgIHZnMcKgIC13aS1hby0tLS3CoMKgIDguMDBnwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDxicj7CoCBnYXRld2F5Vm9s
X3JpbWFnZV8xIHZnMcKgIC13aS0tLS0tLS3CoMKgIDguMDBnwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDxicj7CoCBnYXRld2F5Vm9sX3JtZXRhXzDCoCB2ZzHC
oCAtd2ktYS0tLS0twqDCoCA0LjAwbcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCA8YnI+PC9zcGFuPsKgIGdhdGV3YXlWb2xfcm1ldGFfMcKgIHZnMcKgIC13aS0t
LS0tLS3CoMKgIDQuMDBtwqAgPC9zcGFuPjxicj48YnI+PGJyPjxzcGFuIHN0eWxlPSJmb250LWZh
bWlseTptb25vc3BhY2UsbW9ub3NwYWNlIj5pdGhhcXVhOi9tbnQgIyBsdnJlbW92ZSB2ZzEvZ2F0
ZXdheVZvbF9ybWV0YV8xPGJyPkRvIHlvdSByZWFsbHkgd2FudCB0byByZW1vdmUgYWN0aXZlIGxv
Z2ljYWwgdm9sdW1lIGdhdGV3YXlWb2xfcm1ldGFfMT8gW3kvbl06IHk8YnI+wqAgTG9naWNhbCB2
b2x1bWUgJnF1b3Q7Z2F0ZXdheVZvbF9ybWV0YV8xJnF1b3Q7IHN1Y2Nlc3NmdWxseSByZW1vdmVk
PGJyPml0aGFxdWE6L21udCAjIGx2cmVtb3ZlIHZnMS9nYXRld2F5Vm9sX3JtZXRhXzA8YnI+RG8g
eW91IHJlYWxseSB3YW50IHRvIHJlbW92ZSBhY3RpdmUgbG9naWNhbCB2b2x1bWUgZ2F0ZXdheVZv
bF9ybWV0YV8wPyBbeS9uXTogeTxicj7CoCBMb2dpY2FsIHZvbHVtZSAmcXVvdDtnYXRld2F5Vm9s
X3JtZXRhXzAmcXVvdDsgc3VjY2Vzc2Z1bGx5IHJlbW92ZWQ8YnI+aXRoYXF1YTovbW50ICMgbHZy
ZW1vdmUgdmcxL2dhdGV3YXlWb2xfcmltYWdlXzE8YnI+wqAgTG9naWNhbCB2b2x1bWUgJnF1b3Q7
Z2F0ZXdheVZvbF9yaW1hZ2VfMSZxdW90OyBzdWNjZXNzZnVsbHkgcmVtb3ZlZDxicj48YnI+PC9z
cGFuPjxzcGFuIHN0eWxlPSJmb250LWZhbWlseTptb25vc3BhY2UsbW9ub3NwYWNlIj5pdGhhcXVh
Oi9tbnQgIyBsdnM8c3BhbiBjbGFzcz0iIj48YnI+wqAgTFbCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIFZHwqDCoCBBdHRywqDCoMKgwqDCoMKgIExTaXplwqDCoCBQb29sIE9yaWdp
biBEYXRhJcKgIE1ldGElwqAgTW92ZSBMb2cgQ3B5JVN5bmMgQ29udmVydDxicj7CoCBnYXRld2F5
Vm9swqDCoMKgwqDCoMKgwqDCoMKgIHZnMcKgIC13aS1hby0tLS3CoMKgIDguMDBnPGJyPsKgIDxi
cj48L3NwYW4+aXRoYXF1YTovbW50ICMgZG1zZXR1cCB0YWJsZSB8IGdyZXAgZ2F0ZTxicj52ZzEt
Z2F0ZXdheVZvbF9yaW1hZ2VfMDogMCAxNjc3NzIxNiBsaW5lYXIgODo1IDcxNDkyNjA4MDxicj52
ZzEtZ2F0ZXdheVZvbDogMCAxNjc3NzIxNiBsaW5lYXIgODo1IDcxNDkyNjA4MDxicj48YnI+aXRo
YXF1YTovbW50ICMgZG1zZXR1cCBpbmZvIC1jIHwgZ3JlcCBnYXRlPGJyPnZnMS1nYXRld2F5Vm9s
X3JpbWFnZV8wwqDCoMKgwqDCoMKgwqDCoMKgIDI1NMKgIDUyIEwtLXfCoMKgwqAgMMKgwqDCoCAx
wqDCoMKgwqDCoCAwIExWTS1CeW5LUnBiSm5lZ1F5MlJiZU45c3hPTjF6S2doUTdGdzJRNGFxRVJl
Skh0UE54WEZ5UHlhWHowNDBjNXkzWldBPGJyPnZnMS1nYXRld2F5Vm9swqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIDI1NMKgIDU1IEwtLXfCoMKgwqAgMcKgwqDCoCAxwqDCoMKg
wqDCoCAwIExWTS1CeW5LUnBiSm5lZ1F5MlJiZU45c3hPTjF6S2doUTdGd01ZVUtSWHZzTjQwSldT
dG5QejZQU2p4cmxnMFF4bUNiPGJyPjxicj5pdGhhcXVhOi9tbnQgIyBkbXNldHVwIGxzIC0tdHJl
ZTxicj52ZzEtZ2F0ZXdheVZvbF9yaW1hZ2VfMCAoMjU0OjUyKTxicj7CoEwtICg4OjUpPGJyPnZn
MS1nYXRld2F5Vm9sICgyNTQ6NTUpPGJyPsKgTC0gKDg6NSk8L3NwYW4+PGJyPjxicj48c3BhbiBz
dHlsZT0iZm9udC1mYW1pbHk6bW9ub3NwYWNlLG1vbm9zcGFjZSI+aXRoYXF1YTovbW50ICMgZG1z
ZXR1cCByZW1vdmUgdmcxLWdhdGV3YXlWb2xfcmltYWdlXzA8YnI+aXRoYXF1YTovbW50ICMgZG1z
ZXR1cCBpbmZvIC1jIHwgZ3JlcCBnYXRlPGJyPnZnMS1nYXRld2F5Vm9swqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIDI1NMKgIDU1IEwtLXfCoMKgwqAgMcKgwqDCoCAxwqDCoMKg
wqDCoCAwIExWTS1CeW5LUnBiSm5lZ1F5MlJiZU45c3hPTjF6S2doUTdGd01ZVUtSWHZzTjQwSldT
dG5QejZQU2p4cmxnMFF4bUNiPGJyPml0aGFxdWE6L21udCAjIGRtc2V0dXAgdGFibGUgfCBncmVw
IGdhdGU8YnI+dmcxLWdhdGV3YXlWb2w6IDAgMTY3NzcyMTYgbGluZWFyIDg6NSA3MTQ5MjYwODA8
YnI+PGJyPjxicj5pdGhhcXVhOi9tbnQgIyBsdmNvbnZlcnQgLW0xIHZnMS9nYXRld2F5Vm9sPGJy
Pml0aGFxdWE6L21udCAjIGx2cyAtYSB8IGdyZXAgZ2F0ZTxzcGFuIGNsYXNzPSIiPjxicj7CoCBM
VsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgVkfCoMKgIEF0dHLCoMKgwqDCoMKg
wqAgTFNpemXCoMKgIFBvb2wgT3JpZ2luIERhdGElwqAgTWV0YSXCoCBNb3ZlIExvZyBDcHklU3lu
YyBDb252ZXJ0PGJyPjwvc3Bhbj7CoCBnYXRld2F5Vm9swqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCB2ZzHCoCByd2ktYW9yLS0twqDCoCA4LjAwZ8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
MTAuODTCoMKgwqDCoMKgwqDCoMKgwqDCoCA8YnI+wqAgW2dhdGV3YXlWb2xfcmltYWdlXzBdwqDC
oMKgwqDCoMKgwqDCoMKgIHZnMcKgIEl3aS1hb3ItLS3CoMKgIDguMDBnwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDxicj7CoCBbZ2F0ZXdheVZvbF9yaW1hZ2Vf
MV3CoMKgwqDCoMKgwqDCoMKgwqAgdmcxwqAgSXdpLWFvci0tLcKgwqAgOC4wMGfCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPGJyPsKgIFtnYXRld2F5Vm9sX3Jt
ZXRhXzBdwqDCoMKgwqDCoMKgwqDCoMKgwqAgdmcxwqAgZXdpLWFvci0tLcKgwqAgNC4wMG3CoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgPGJyPsKgIFtnYXRld2F5
Vm9sX3JtZXRhXzFdwqDCoMKgwqDCoMKgwqDCoMKgwqAgdmcxwqAgZXdpLWFvci0tLcKgwqAgNC4w
MG3CoCA8L3NwYW4+PGJyPjxicj48YnI+PGJyPjwvZGl2PjxkaXY+PGRpdiBjbGFzcz0iaDUiPjxk
aXYgY2xhc3M9ImdtYWlsX2V4dHJhIj48YnI+PGRpdiBjbGFzcz0iZ21haWxfcXVvdGUiPk9uIFRo
dSwgT2N0IDgsIDIwMTUgYXQgMTI6MTcgUE0sIEFuYXRvbHkgUHVnYWNoZXYgPHNwYW4gZGlyPSJs
dHIiPiZsdDs8YSBocmVmPSJtYWlsdG86bWF0b3JvbGFAZ21haWwuY29tIiB0YXJnZXQ9Il9ibGFu
ayI+bWF0b3JvbGFAZ21haWwuY29tPC9hPiZndDs8L3NwYW4+IHdyb3RlOjxicj48YmxvY2txdW90
ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MHB4IDBweCAwcHggMC44ZXg7Ym9y
ZGVyLWxlZnQ6MXB4IHNvbGlkIHJnYigyMDQsMjA0LDIwNCk7cGFkZGluZy1sZWZ0OjFleCI+PGRp
diBkaXI9Imx0ciI+PGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6dmVyZGFuYSxzYW5zLXNlcmlmIj5I
ZWxsbyE8YnI+PGJyPjwvZGl2PjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OnZlcmRhbmEsc2Fucy1z
ZXJpZiI+VHJ5aW5nIHRvIHNwbGl0IG9uZSBvZiBtaXJyb3Igdm9sdW1lcyA6PGJyPjxicj48c3Bh
biBzdHlsZT0iZm9udC1mYW1pbHk6bW9ub3NwYWNlLG1vbm9zcGFjZSI+IyBsdnM8YnI+PC9zcGFu
PjxzcGFuIHN0eWxlPSJmb250LWZhbWlseTptb25vc3BhY2UsbW9ub3NwYWNlIj48c3BhbiBzdHls
ZT0iZm9udC1mYW1pbHk6bW9ub3NwYWNlLG1vbm9zcGFjZSI+wqAgTFbCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIFZHwqDCoCBBdHRywqDCoMKgwqDCoMKgIExTaXplwqDCoCBQb29s
IE9yaWdpbiBEYXRhJcKgIE1ldGElwqAgTW92ZSBMb2cgQ3B5JVN5bmMgQ29udmVydDwvc3Bhbj7C
oCA8YnI+wqAgZ2F0ZXdheVZvbMKgwqDCoMKgwqDCoMKgwqDCoCB2ZzHCoCByd2ktYW9yLS0twqDC
oCA4LjAwZ8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgMTAwLjAwPGJyPjxicj48L3NwYW4+PC9kaXY+PGRpdiBzdHls
ZT0iZm9udC1mYW1pbHk6dmVyZGFuYSxzYW5zLXNlcmlmIj48c3BhbiBzdHlsZT0iZm9udC1mYW1p
bHk6bW9ub3NwYWNlLG1vbm9zcGFjZSI+IyBsdmNvbnZlcnQgLS1zcGxpdG1pcnJvcnMgMSAtbiBz
cGxpdDEgdmcxL2dhdGV3YXlWb2w8YnI+IyBsdnM8YnI+wqAgTFbCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIFZHwqDCoCBBdHRywqDCoMKgwqDCoMKgIExTaXplwqDCoCBQb29sIE9y
aWdpbiBEYXRhJcKgIE1ldGElwqAgTW92ZSBMb2cgQ3B5JVN5bmMgQ29udmVydDxicj7CoCBnYXRl
d2F5Vm9swqDCoMKgwqDCoMKgwqDCoMKgIHZnMcKgIC13aS1hby0tLS3CoMKgIDguMDBnPGJyPsKg
IHNwbGl0McKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHZnMcKgIC13aS1hLS0tLS3CoMKgIDgu
MDBnPC9zcGFuPjxicj48YnI+PC9kaXY+PGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6dmVyZGFuYSxz
YW5zLXNlcmlmIj5jb252ZXJ0aW5nIG9yaWdpbmFsIHZvbHVtZSBiYWNrIHRvIG1pcnJvciBjb25m
aWd1cmF0aW9uLCBsZWF2aW5nIHNwbGl0MSB2b2x1bWUgaW50YWN0Ojxicj48YnI+PHNwYW4gc3R5
bGU9ImZvbnQtZmFtaWx5Om1vbm9zcGFjZSxtb25vc3BhY2UiPiMgbHZjb252ZXJ0IC1tMSB2ZzEv
Z2F0ZXdheVZvbDxicj7CoCBkZXZpY2UtbWFwcGVyOiBjcmVhdGUgaW9jdGwgb24gdmcxLWdhdGV3
YXlWb2xfcmltYWdlXzEgZmFpbGVkOiBEZXZpY2Ugb3IgcmVzb3VyY2UgYnVzeTxicj7CoCBGYWls
ZWQgdG8gbG9jayBsb2dpY2FsIHZvbHVtZSB2ZzEvZ2F0ZXdheVZvbC48YnI+PC9zcGFuPjxicj48
c3BhbiBzdHlsZT0iZm9udC1mYW1pbHk6bW9ub3NwYWNlLG1vbm9zcGFjZSI+IyBsdnM8YnI+wqAg
TFbCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFZHwqDCoCBBdHRywqDCoMKgwqDC
oMKgIExTaXplwqDCoCBQb29sIE9yaWdpbiBEYXRhJcKgIE1ldGElwqAgTW92ZSBMb2cgQ3B5JVN5
bmMgQ29udmVydDxicj7CoCBnYXRld2F5Vm9swqDCoMKgwqDCoMKgwqDCoMKgIHZnMcKgIC13aS1h
by0tLS3CoMKgIDguMDBnPGJyPsKgIGdhdGV3YXlWb2xfcmltYWdlXzEgdmcxwqAgLXdpLS0tLS0t
LcKgwqAgOC4wMGc8YnI+wqAgZ2F0ZXdheVZvbF9ybWV0YV8wwqAgdmcxwqAgLXdpLWEtLS0tLcKg
wqAgNC4wMG08YnI+wqAgZ2F0ZXdheVZvbF9ybWV0YV8xwqAgdmcxwqAgLXdpLWEtLS0tLcKgwqAg
NC4wMG08YnI+wqAgc3BsaXQxwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdmcxwqAgLXdpLWEt
LS0tLcKgwqAgOC4wMGc8YnI+wqAgPGJyPjwvc3Bhbj48L2Rpdj48ZGl2IHN0eWxlPSJmb250LWZh
bWlseTp2ZXJkYW5hLHNhbnMtc2VyaWYiPlNvLCB3aGF0IEkgc2hvdWxkIGRvIG5vdz8gV2hhdCBp
cyByaW1hZ2UqIGFuZCBybWV0YSogPyBIb3cgZG8gSSBnZXQgcmlkIG9mIHRoZW0sIHByZXNlcnZp
bmcgZGF0YSBvbiBnYXRld2F5Vm9sIGFuZCBzcGxpdDEgdm9sdW1lcz8gPGJyPjxicj48L2Rpdj48
ZGl2IHN0eWxlPSJmb250LWZhbWlseTp2ZXJkYW5hLHNhbnMtc2VyaWYiPlRoYW5rcy48YnI+PGJy
PjwvZGl2PjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OnZlcmRhbmEsc2Fucy1zZXJpZiI+UFM6IG9w
ZW5zdXNlIDEzLjI8YnI+PGJyPiMgbHZtIHZlcnNpb27CoCA8YnI+wqAgTFZNIHZlcnNpb246wqDC
oMKgwqAgMi4wMi4xMTQoMikgKDIwMTQtMTEtMjgpPGJyPsKgIExpYnJhcnkgdmVyc2lvbjogMS4w
My4wMSAoMjAxNC0xMS0yOCk8YnI+wqAgRHJpdmVyIHZlcnNpb246wqAgNC4yNy4wPGJyPjwvZGl2
PjwvZGl2Pg0KPC9ibG9ja3F1b3RlPjwvZGl2Pjxicj48L2Rpdj48L2Rpdj48L2Rpdj48L2Rpdj4N
CjwvYmxvY2txdW90ZT48L2Rpdj48YnI+PC9kaXY+PC9kaXY+DQo=
--047d7b10c9d1c04a960521953a2e--
