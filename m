Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m5B8Bu9s030507
	for <linux-lvm@redhat.com>; Wed, 11 Jun 2008 04:11:56 -0400
Received: from rv-out-0506.google.com (rv-out-0506.google.com [209.85.198.227])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m5B8BgY8006391
	for <linux-lvm@redhat.com>; Wed, 11 Jun 2008 04:11:42 -0400
Received: by rv-out-0506.google.com with SMTP id f6so3320490rvb.51
	for <linux-lvm@redhat.com>; Wed, 11 Jun 2008 01:11:41 -0700 (PDT)
Message-ID: <ad41208c0806110111t6290e5a5yf8e03ce1766362c4@mail.gmail.com>
Date: Wed, 11 Jun 2008 16:11:41 +0800
From: "Zhen Zhou" <zhouzhenzj@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_462_33196611.1213171901493"
Subject: [linux-lvm] [help] how to deal with Incorrect metadata area header
	checksum in LVM
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com

------=_Part_462_33196611.1213171901493
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Dear all,

I guess I did stupid way to handle the lvm.

Now the situation is:

root %lvscan
  Incorrect metadata area header checksum
  inactive          '/dev/VolGroup00/LogVol02' [114.22 GB] inherit
  inactive          '/dev/VolGroup00/LogVol01' [8.00 GB] inherit
  inactive          '/dev/VolGroup00/LogVol00' [8.00 GB] inherit
  inactive          '/dev/VolGroup00/LogVol03' [101.19 GB] inherit

root %  vgchange -ay VolGroup00

Incorrect metadata area header checksum
  Incorrect metadata area header checksum
  Volume group VolGroup00 metadata is inconsistent
  Volume group for uuid not found:
Jt5E71u5LDUBOEbyPbKSAwYoHDth1lSa6HriQywmrKEuO4lVRT5lBdar7LEm65jD
  Incorrect metadata area header checksum
  Volume group VolGroup00 metadata is inconsistent
  Volume group for uuid not found:
Jt5E71u5LDUBOEbyPbKSAwYoHDth1lSaXl65MLs5oJFH9gPYo70eB9p7eVWUJ6SB
  Incorrect metadata area header checksum
  Volume group VolGroup00 metadata is inconsistent
  Volume group for uuid not found:
Jt5E71u5LDUBOEbyPbKSAwYoHDth1lSaWgaUTHNB4qQZ900HNzVO8rPhbT8LhhWy
  Incorrect metadata area header checksum
  Volume group VolGroup00 metadata is inconsistent
  Volume group for uuid not found:
Jt5E71u5LDUBOEbyPbKSAwYoHDth1lSaS7daEG6cQQO2tZ4NJzggGCsbZvYpOTdR
  0 logical volume(s) in volume group "VolGroup00" now active

root % pvscan
  Incorrect metadata area header checksum
  PV /dev/sda3   VG VolGroup00   lvm2 [30.25 GB / 0    free]
  PV /dev/sda2   VG VolGroup00   lvm2 [101.16 GB / 0    free]
  PV /dev/sda1   VG VolGroup00   lvm2 [192.00 MB / 192.00 MB free]
  PV /dev/sda5   VG VolGroup00   lvm2 [101.22 GB / 1.22 GB free]
  Total: 4 [232.81 GB] / in use: 4 [232.81 GB] / in no VG: 0 [0   ]

Now I have no idea how to deal with it, I refered some articles:
http://www.novell.com/coolsolutions/appnote/19386.html, whatever I tried
'vgcfgrestore VolGroup00':

root  % vgcfgrestore VolGroup00
  Incorrect metadata area header checksum
  Incorrect metadata area header checksum
  Restore failed.

So what is the right way to recover these lvm?

Any tips will be welcome! Thanks in advanced,

BTW: the attached is lvm metadata file. More detail information
needed, pls tell me.


Zhou Zhen

------=_Part_462_33196611.1213171901493
Content-Type: text/plain; name=VolGroup00_00000.txt
Content-Transfer-Encoding: base64
X-Attachment-Id: f_fhbn0kir1
Content-Disposition: attachment; filename=VolGroup00_00000.txt

IyBHZW5lcmF0ZWQgYnkgTFZNMiB2ZXJzaW9uIDIuMDIuMzMgKDIwMDgtMDEtMzEpOiBXZWQgSnVu
IDExIDE1OjIyOjI1IDIwMDgNCg0KY29udGVudHMgPSAiVGV4dCBGb3JtYXQgVm9sdW1lIEdyb3Vw
Ig0KdmVyc2lvbiA9IDENCg0KZGVzY3JpcHRpb24gPSAiQ3JlYXRlZCAqYmVmb3JlKiBleGVjdXRp
bmcgJ3Znc2NhbiAtUCAtLW1rbm9kZXMgLS1pZ25vcmVsb2NraW5nZmFpbHVyZSciDQoNCmNyZWF0
aW9uX2hvc3QgPSAiKG5vbmUpIgkjIExpbnV4IChub25lKSAyLjYuMjUuMDQtZmQxNyAjMSBTTVAg
V2VkIEp1biA0IDIwOjU0OjA4IFVUQyAyMDA4IGk2ODYNCmNyZWF0aW9uX3RpbWUgPSAxMjEzMTk3
NzQ1CSMgV2VkIEp1biAxMSAxNToyMjoyNSAyMDA4DQoNClZvbEdyb3VwMDAgew0KCWlkID0gIkp0
NUU3MS11NUxELVVCT0UtYnlQYi1LU0F3LVlvSEQtdGgxbFNhIg0KCXNlcW5vID0gMTMNCglzdGF0
dXMgPSBbIlJFU0laRUFCTEUiLCAiUkVBRCIsICJXUklURSJdDQoJZXh0ZW50X3NpemUgPSA2NTUz
NgkJIyAzMiBNZWdhYnl0ZXMNCgltYXhfbHYgPSAwDQoJbWF4X3B2ID0gMA0KDQoJcGh5c2ljYWxf
dm9sdW1lcyB7DQoNCgkJcHYwIHsNCgkJCWlkID0gIlAzeW5vSC01cXlhLTdjYVktcEc5YS03ZU0y
LUU5MjYtcHM3MWxVIg0KCQkJZGV2aWNlID0gIi9kZXYvc2RhMyIJIyBIaW50IG9ubHkNCg0KCQkJ
c3RhdHVzID0gWyJBTExPQ0FUQUJMRSJdDQoJCQlkZXZfc2l6ZSA9IDYzNDg4ODgwCSMgMzAuMjcz
OSBHaWdhYnl0ZXMNCgkJCXBlX3N0YXJ0ID0gMzg0DQoJCQlwZV9jb3VudCA9IDk2OAkjIDMwLjI1
IEdpZ2FieXRlcw0KCQl9DQoNCgkJcHYxIHsNCgkJCWlkID0gIlhLTmVDbC1ORXZKLVc0aGYtVTFr
WS1iYTN1LVJTYmstWG9kZzF5Ig0KCQkJZGV2aWNlID0gIi9kZXYvc2RhMiIJIyBIaW50IG9ubHkN
Cg0KCQkJc3RhdHVzID0gWyJBTExPQ0FUQUJMRSJdDQoJCQlkZXZfc2l6ZSA9IDIxMjE3MDQ1NQkj
IDEwMS4xNzEgR2lnYWJ5dGVzDQoJCQlwZV9zdGFydCA9IDM4NA0KCQkJcGVfY291bnQgPSAzMjM3
CSMgMTAxLjE1NiBHaWdhYnl0ZXMNCgkJfQ0KDQoJCXB2MiB7DQoJCQlpZCA9ICIzc0xOVVctdUNs
NC1McHBsLVFXTlotSlkyTy1ZTWRNLVdZaHJwbyINCgkJCWRldmljZSA9ICIvZGV2L3NkYTEiCSMg
SGludCBvbmx5DQoNCgkJCXN0YXR1cyA9IFsiQUxMT0NBVEFCTEUiXQ0KCQkJZGV2X3NpemUgPSA0
MDE1NjIJIyAxOTYuMDc1IE1lZ2FieXRlcw0KCQkJcGVfc3RhcnQgPSAzODQNCgkJCXBlX2NvdW50
ID0gNgkjIDE5MiBNZWdhYnl0ZXMNCgkJfQ0KDQoJCXB2MyB7DQoJCQlpZCA9ICJ2TFhkVVItYXZV
WS1OY3JGLUd4VHEtOXYway1UWlJoLWJ0dldSQSINCgkJCWRldmljZSA9ICIvZGV2L3NkYTUiCSMg
SGludCBvbmx5DQoNCgkJCXN0YXR1cyA9IFsiQUxMT0NBVEFCTEUiXQ0KCQkJZGV2X3NpemUgPSAy
MTIzMzEwNDIJIyAxMDEuMjQ3IEdpZ2FieXRlcw0KCQkJcGVfc3RhcnQgPSAzODQNCgkJCXBlX2Nv
dW50ID0gMzIzOQkjIDEwMS4yMTkgR2lnYWJ5dGVzDQoJCX0NCgl9DQoNCglsb2dpY2FsX3ZvbHVt
ZXMgew0KDQoJCUxvZ1ZvbDAyIHsNCgkJCWlkID0gIjZIcmlReS13bXJLLUV1TzQtbFZSVC01bEJk
LWFyN0wtRW02NWpEIg0KCQkJc3RhdHVzID0gWyJSRUFEIiwgIldSSVRFIiwgIlZJU0lCTEUiXQ0K
CQkJc2VnbWVudF9jb3VudCA9IDINCg0KCQkJc2VnbWVudDEgew0KCQkJCXN0YXJ0X2V4dGVudCA9
IDANCgkJCQlleHRlbnRfY291bnQgPSA0NTUJIyAxNC4yMTg4IEdpZ2FieXRlcw0KDQoJCQkJdHlw
ZSA9ICJzdHJpcGVkIg0KCQkJCXN0cmlwZV9jb3VudCA9IDEJIyBsaW5lYXINCg0KCQkJCXN0cmlw
ZXMgPSBbDQoJCQkJCSJwdjAiLCAwDQoJCQkJXQ0KCQkJfQ0KCQkJc2VnbWVudDIgew0KCQkJCXN0
YXJ0X2V4dGVudCA9IDQ1NQ0KCQkJCWV4dGVudF9jb3VudCA9IDMyMDAJIyAxMDAgR2lnYWJ5dGVz
DQoNCgkJCQl0eXBlID0gInN0cmlwZWQiDQoJCQkJc3RyaXBlX2NvdW50ID0gMQkjIGxpbmVhcg0K
DQoJCQkJc3RyaXBlcyA9IFsNCgkJCQkJInB2MyIsIDANCgkJCQldDQoJCQl9DQoJCX0NCg0KCQlM
b2dWb2wwMSB7DQoJCQlpZCA9ICJYbDY1TUwtczVvSi1GSDlnLVBZbzctMGVCOS1wN2VWLVdVSjZT
QiINCgkJCXN0YXR1cyA9IFsiUkVBRCIsICJXUklURSIsICJWSVNJQkxFIl0NCgkJCXNlZ21lbnRf
Y291bnQgPSAxDQoNCgkJCXNlZ21lbnQxIHsNCgkJCQlzdGFydF9leHRlbnQgPSAwDQoJCQkJZXh0
ZW50X2NvdW50ID0gMjU2CSMgOCBHaWdhYnl0ZXMNCg0KCQkJCXR5cGUgPSAic3RyaXBlZCINCgkJ
CQlzdHJpcGVfY291bnQgPSAxCSMgbGluZWFyDQoNCgkJCQlzdHJpcGVzID0gWw0KCQkJCQkicHYw
IiwgNDU1DQoJCQkJXQ0KCQkJfQ0KCQl9DQoNCgkJTG9nVm9sMDAgew0KCQkJaWQgPSAiV2dhVVRI
LU5CNHEtUVo5MC0wSE56LVZPOHItUGhiVC04TGhoV3kiDQoJCQlzdGF0dXMgPSBbIlJFQUQiLCAi
V1JJVEUiLCAiVklTSUJMRSJdDQoJCQlzZWdtZW50X2NvdW50ID0gMQ0KDQoJCQlzZWdtZW50MSB7
DQoJCQkJc3RhcnRfZXh0ZW50ID0gMA0KCQkJCWV4dGVudF9jb3VudCA9IDI1NgkjIDggR2lnYWJ5
dGVzDQoNCgkJCQl0eXBlID0gInN0cmlwZWQiDQoJCQkJc3RyaXBlX2NvdW50ID0gMQkjIGxpbmVh
cg0KDQoJCQkJc3RyaXBlcyA9IFsNCgkJCQkJInB2MCIsIDcxMQ0KCQkJCV0NCgkJCX0NCgkJfQ0K
DQoJCUxvZ1ZvbDAzIHsNCgkJCWlkID0gIlM3ZGFFRy02Y1FRLU8ydFotNE5Kei1nZ0dDLXNiWnYt
WXBPVGRSIg0KCQkJc3RhdHVzID0gWyJSRUFEIiwgIldSSVRFIiwgIlZJU0lCTEUiXQ0KCQkJc2Vn
bWVudF9jb3VudCA9IDINCg0KCQkJc2VnbWVudDEgew0KCQkJCXN0YXJ0X2V4dGVudCA9IDANCgkJ
CQlleHRlbnRfY291bnQgPSAzMjM3CSMgMTAxLjE1NiBHaWdhYnl0ZXMNCg0KCQkJCXR5cGUgPSAi
c3RyaXBlZCINCgkJCQlzdHJpcGVfY291bnQgPSAxCSMgbGluZWFyDQoNCgkJCQlzdHJpcGVzID0g
Ww0KCQkJCQkicHYxIiwgMA0KCQkJCV0NCgkJCX0NCgkJCXNlZ21lbnQyIHsNCgkJCQlzdGFydF9l
eHRlbnQgPSAzMjM3DQoJCQkJZXh0ZW50X2NvdW50ID0gMQkjIDMyIE1lZ2FieXRlcw0KDQoJCQkJ
dHlwZSA9ICJzdHJpcGVkIg0KCQkJCXN0cmlwZV9jb3VudCA9IDEJIyBsaW5lYXINCg0KCQkJCXN0
cmlwZXMgPSBbDQoJCQkJCSJwdjAiLCA5NjcNCgkJCQldDQoJCQl9DQoJCX0NCgl9DQp9DQo=
------=_Part_462_33196611.1213171901493--
