Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m3NCV0f6005980
	for <linux-lvm@redhat.com>; Wed, 23 Apr 2008 08:31:00 -0400
Received: from wr-out-0506.google.com (wr-out-0506.google.com [64.233.184.227])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m3NCUo74002887
	for <linux-lvm@redhat.com>; Wed, 23 Apr 2008 08:30:50 -0400
Received: by wr-out-0506.google.com with SMTP id c57so1434074wra.9
	for <linux-lvm@redhat.com>; Wed, 23 Apr 2008 05:30:50 -0700 (PDT)
Message-ID: <cc7379f90804230530j24a16958s637d180f17b781e@mail.gmail.com>
Date: Wed, 23 Apr 2008 14:30:48 +0200
From: "=?ISO-8859-1?Q?P=E5l_Driveklepp?=" <pald@stud.ntnu.no>
Sender: jalla2000@gmail.com
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1181_32560957.1208953848294"
Subject: [linux-lvm] lvm metadata
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

------=_Part_1181_32560957.1208953848294
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

hi! i am truly desperate! i messed up my metadata and pvdisplay,
vgdisplay and lvdisplay outputs nothing. all my disks are still
functional and present. i keep getting the error message:

# vgcfgrestore -f main_disk_group_mod3 main_disk_group
 Cannot change metadata for partial volume group main_disk_group
 Restore failed.

i found almost no information about this error message on the web. i
have one backup-file that i am pretty sure is the one i want to backup
(see attachment). it seems /dev/sda's uuid has changed and that is why
i modified it to have the right uuid (hence the "vgcfgrestore -f
main_disk_group_mod3")

lvmdiskscan outputs the following:
  /dev/ram0      [       64.00 MB]
  /dev/sda       [      465.76 GB] LVM physical volume
  /dev/evms/hda1 [        8.99 GB]
  /dev/ram1      [       64.00 MB]
  /dev/hda1      [        8.99 GB]
  /dev/hdc1      [      232.88 GB] LVM physical volume
  /dev/evms/hda5 [      431.40 MB]
  /dev/ram2      [       64.00 MB]
  /dev/evms/hdb1 [      149.05 GB] LVM physical volume
  /dev/ram3      [       64.00 MB]
  /dev/evms/hdc1 [      232.88 GB] LVM physical volume
  /dev/ram4      [       64.00 MB]
  /dev/evms/hdd1 [      186.31 GB]
  /dev/ram5      [       64.00 MB]
  /dev/hda5      [      431.40 MB]
  /dev/ram6      [       64.00 MB]
  /dev/ram7      [       64.00 MB]
  /dev/ram8      [       64.00 MB]
  /dev/ram9      [       64.00 MB]
  /dev/ram10     [       64.00 MB]
  /dev/ram11     [       64.00 MB]
  /dev/ram12     [       64.00 MB]
  /dev/ram13     [       64.00 MB]
  /dev/ram14     [       64.00 MB]
  /dev/ram15     [       64.00 MB]
  /dev/sdb       [      465.76 GB] LVM physical volume
  /dev/hdb1      [      149.05 GB]
  /dev/hdd1      [      186.31 GB]
  0 disks
  23 partitions
  2 LVM physical volume whole disks
  3 LVM physical volumes

disk overview:
/dev/sdb=0914AP4R-X75R-94Dx-Pk5g-HU0e-F6yh-8tQoEz=09500gig=09
(somehow changed to mQYVpB-CCAn-OdlL-Ows5-m33h-gCMy-DWS8ku)
/dev/hdb=09kUgW4k-AO0G-qRS0-0cH8-VkzD-Xjfj-ZjzZVL=09150gig
/dev/hdc1=09JDMxOF-84VA-Ir6e-tAeB-LAKj-gy4J-7GXspF=09250gig
/dev/sda=09F87gox-1Z8e-eDcZ-QUxW-9gLI-XJLp-ySl017=09500gig


P=E5l Driveklepp
Norway

>  But the error probably means you're attempting to use an incomplete back=
up
>  (or you attempted hand-editing it incorrectly).
>
>  Alasdair

------=_Part_1181_32560957.1208953848294
Content-Type: application/octet-stream; name=main_disk_group_00001.vg
Content-Transfer-Encoding: base64
X-Attachment-Id: f_ffdvqax90
Content-Disposition: attachment; filename=main_disk_group_00001.vg

IyBHZW5lcmF0ZWQgYnkgTFZNMjogRnJpIEFwciAxOCAwMTozMDo0NyAyMDA4Cgpjb250ZW50cyA9
ICJUZXh0IEZvcm1hdCBWb2x1bWUgR3JvdXAiCnZlcnNpb24gPSAxCgpkZXNjcmlwdGlvbiA9ICJD
cmVhdGVkICpiZWZvcmUqIGV4ZWN1dGluZyAndmdyZWR1Y2UgLS1yZW1vdmVtaXNzaW5nIG1haW5f
ZGlza19ncm91cCciCgpjcmVhdGlvbl9ob3N0ID0gImluZGlnbyIJIyBMaW51eCBpbmRpZ28gMi42
LjIwLTE2LWdlbmVyaWMgIzIgU01QIFR1ZSBGZWIgMTIgMDU6NDE6MzQgVVRDIDIwMDggaTY4Ngpj
cmVhdGlvbl90aW1lID0gMTIwODQ3NTA0NwkjIEZyaSBBcHIgMTggMDE6MzA6NDcgMjAwOAoKbWFp
bl9kaXNrX2dyb3VwIHsKCWlkID0gIkVhWWVCNi11Rkh4LWQycDItVFZGbC1keW9tLWZRZWUtT3hY
YlRGIgoJc2Vxbm8gPSA4CglzdGF0dXMgPSBbIlJFU0laRUFCTEUiLCAiUEFSVElBTCIsICJSRUFE
Il0KCWV4dGVudF9zaXplID0gODE5MgkJIyA0IE1lZ2FieXRlcwoJbWF4X2x2ID0gMAoJbWF4X3B2
ID0gMAoKCXBoeXNpY2FsX3ZvbHVtZXMgewoKCQlwdjAgewoJCQlpZCA9ICIxNEFQNFItWDc1Ui05
NER4LVBrNWctSFUwZS1GNnloLTh0UW9FeiIKCQkJZGV2aWNlID0gIi9kZXYvc2RiIgkjIEhpbnQg
b25seQoKCQkJc3RhdHVzID0gWyJBTExPQ0FUQUJMRSJdCgkJCXBlX3N0YXJ0ID0gMzg0CgkJCXBl
X2NvdW50ID0gMTE5MjM0CSMgNDY1Ljc1OCBHaWdhYnl0ZXMKCQl9CgoJCXB2MSB7CgkJCWlkID0g
ImtVZ1c0ay1BTzBHLXFSUzAtMGNIOC1Wa3pELVhqZmotWmp6WlZMIgoJCQlkZXZpY2UgPSAidW5r
bm93biBkZXZpY2UiCSMgSGludCBvbmx5CgoJCQlzdGF0dXMgPSBbIkFMTE9DQVRBQkxFIl0KCQkJ
cGVfc3RhcnQgPSAzODQKCQkJcGVfY291bnQgPSAzODE1NgkjIDE0OS4wNDcgR2lnYWJ5dGVzCgkJ
fQoKCQlwdjIgewoJCQlpZCA9ICJKRE14T0YtODRWQS1JcjZlLXRBZUItTEFLai1neTRKLTdHWHNw
RiIKCQkJZGV2aWNlID0gIi9kZXYvaGRjMSIJIyBIaW50IG9ubHkKCgkJCXN0YXR1cyA9IFsiQUxM
T0NBVEFCTEUiXQoJCQlwZV9zdGFydCA9IDM4NAoJCQlwZV9jb3VudCA9IDU5NjE4CSMgMjMyLjg4
MyBHaWdhYnl0ZXMKCQl9CgoJCXB2MyB7CgkJCWlkID0gIkY4N2dveC0xWjhlLWVEY1otUVV4Vy05
Z0xJLVhKTHAteVNsMDE3IgoJCQlkZXZpY2UgPSAiL2Rldi9zZGEiCSMgSGludCBvbmx5CgoJCQlz
dGF0dXMgPSBbIkFMTE9DQVRBQkxFIl0KCQkJcGVfc3RhcnQgPSAzODQKCQkJcGVfY291bnQgPSAx
MTkyMzQJIyA0NjUuNzU4IEdpZ2FieXRlcwoJCX0KCX0KCglsb2dpY2FsX3ZvbHVtZXMgewoKCQlk
aXNrYXJyYXkgewoJCQlpZCA9ICJLcllIUUUtZFF6eS1tVnNZLUNtT2otck4zNy1PMVg3LUJEOUFk
YiIKCQkJc3RhdHVzID0gWyJSRUFEIiwgIldSSVRFIiwgIlZJU0lCTEUiXQoJCQlzZWdtZW50X2Nv
dW50ID0gNAoKCQkJc2VnbWVudDEgewoJCQkJc3RhcnRfZXh0ZW50ID0gMAoJCQkJZXh0ZW50X2Nv
dW50ID0gMTE5MjM0CSMgNDY1Ljc1OCBHaWdhYnl0ZXMKCgkJCQl0eXBlID0gInN0cmlwZWQiCgkJ
CQlzdHJpcGVfY291bnQgPSAxCSMgbGluZWFyCgoJCQkJc3RyaXBlcyA9IFsKCQkJCQkicHYwIiwg
MAoJCQkJXQoJCQl9CgkJCXNlZ21lbnQyIHsKCQkJCXN0YXJ0X2V4dGVudCA9IDExOTIzNAoJCQkJ
ZXh0ZW50X2NvdW50ID0gMzgxNTYJIyAxNDkuMDQ3IEdpZ2FieXRlcwoKCQkJCXR5cGUgPSAic3Ry
aXBlZCIKCQkJCXN0cmlwZV9jb3VudCA9IDEJIyBsaW5lYXIKCgkJCQlzdHJpcGVzID0gWwoJCQkJ
CSJwdjEiLCAwCgkJCQldCgkJCX0KCQkJc2VnbWVudDMgewoJCQkJc3RhcnRfZXh0ZW50ID0gMTU3
MzkwCgkJCQlleHRlbnRfY291bnQgPSA1OTYxOAkjIDIzMi44ODMgR2lnYWJ5dGVzCgoJCQkJdHlw
ZSA9ICJzdHJpcGVkIgoJCQkJc3RyaXBlX2NvdW50ID0gMQkjIGxpbmVhcgoKCQkJCXN0cmlwZXMg
PSBbCgkJCQkJInB2MiIsIDAKCQkJCV0KCQkJfQoJCQlzZWdtZW50NCB7CgkJCQlzdGFydF9leHRl
bnQgPSAyMTcwMDgKCQkJCWV4dGVudF9jb3VudCA9IDExODUzNwkjIDQ2My4wMzUgR2lnYWJ5dGVz
CgoJCQkJdHlwZSA9ICJzdHJpcGVkIgoJCQkJc3RyaXBlX2NvdW50ID0gMQkjIGxpbmVhcgoKCQkJ
CXN0cmlwZXMgPSBbCgkJCQkJInB2MyIsIDAKCQkJCV0KCQkJfQoJCX0KCX0KfQo=
------=_Part_1181_32560957.1208953848294--
