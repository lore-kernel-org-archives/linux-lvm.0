Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q1JNQPAS016359
	for <linux-lvm@redhat.com>; Sun, 19 Feb 2012 18:26:25 -0500
Received: from mx02.ausregistry.net.au (mx02.ausregistry.net.au [202.65.15.42])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q1JNQL4B005906
	for <linux-lvm@redhat.com>; Sun, 19 Feb 2012 18:26:22 -0500
From: Stuart Browne <stuart.browne@ausregistry.com.au>
Date: Mon, 20 Feb 2012 10:26:05 +1100
Message-ID: <8CEF048B9EC83748B1517DC64EA130FB6B2AB35166@off-win2003-01.ausregistrygroup.local>
Content-Language: en-US
Content-Type: multipart/mixed;
	boundary="_002_8CEF048B9EC83748B1517DC64EA130FB6B2AB35166offwin200301a_"
MIME-Version: 1.0
Subject: [linux-lvm] Strange behavior adding LUN
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
To: "linux-lvm@redhat.com" <linux-lvm@redhat.com>

--_002_8CEF048B9EC83748B1517DC64EA130FB6B2AB35166offwin200301a_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

We've been cleaning up some of our storage recently and migrating to new di=
sks etc. when I came across this issue.

I've re-allocated some old storage back to a server as a new array, but lvm=
 is refusing to allow the LUN to participate.  Here's what I see:

[root@office ~]# pvcreate /dev/mpath/backup1
  Physical volume "/dev/mpath/backup1" successfully created
[root@office ~]# pvdisplay /dev/mpath/backup1
  "/dev/mpath/backup1" is a new physical volume of "2.93 TB"
  --- NEW Physical volume ---
  PV Name               /dev/mpath/backup1
  VG Name
  PV Size               2.93 TB
  Allocatable           NO
  PE Size (KByte)       0
  Total PE              0
  Free PE               0
  Allocated PE          0
  PV UUID               ipTgcI-kjdJ-Aucx-cUVs-TWKr-wAFO-Rkd0u8

Thinking it's somehow mussed up the labelling, I had a quick look at the di=
sk header:

[root@office ~]# dd if=3D/dev/mpath/backup1 bs=3D1k count=3D1 | cat -v -
^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^=
@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@=
^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^=
@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@=
^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^=
@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@=
^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^=
@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@=
^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^=
@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@=
^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^=
@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@=
^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^=
@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@LABELONE^A^@^@^@^@^@^@^@M-=
Tl^LM-z ^@^@^@LVM2 001ipTgcIkjdJAucxcUVsTWKrwAFORkd0u8^@^@^@^@M-n^B^@^@^@^@=
^C^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^P^@^@^@^@^@^=
@^@M-p^B^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^=
@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@=
^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^=
@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@=
^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^=
@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@=
^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^=
@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@=
^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^=
@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@=
^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@^@1+0 records in
1+0 records out
1024 bytes (1.0 kB) copied, 0.000809 seconds, 1.3 MB/s

Given that it looks, well, 'ok' to me, I thought I'd 'pvremove' it and vali=
date that the disk is empty.  It was (^@'s all the way, for the first 10MB =
at least), and re-add it.  New UUID, but basically the same.

So, weird.  Why is the 'pvcreate' seeing the new LUN, seeing that it is 2.9=
3TB, but not creating any PE's for use.

Anybody have any idea what I should try next?

Stuart J. Browne
Senior Unix Administrator, Network Administrator, Database Administrator
AusRegistry Pty Ltd
Level 8, 10 Queens Road
Melbourne. Victoria. Australia. 3004.
Ph:=A0 +61 3 9866 3710
Fax: +61 3 9866 1970
Email: stuart.browne@ausregistry.com.au
Web: www.ausregistry.com.au

The information contained in this communication is intended for the named r=
ecipients only. It is subject to copyright and may contain privileged and/o=
r confidential information. If you are not an intended recipient you must n=
ot use, copy, distribute or take any action in reliance on it. If you have =
received this communication in error, please delete all copies from your sy=
stem and notify us immediately.



--_002_8CEF048B9EC83748B1517DC64EA130FB6B2AB35166offwin200301a_
Content-Type: text/plain; name="pvcreate.txt"
Content-Description: pvcreate.txt
Content-Disposition: attachment; filename="pvcreate.txt"; size=9536;
	creation-date="Mon, 20 Feb 2012 10:22:01 GMT";
	modification-date="Mon, 20 Feb 2012 10:23:08 GMT"
Content-Transfer-Encoding: base64

W3Jvb3RAb2ZmaWNlIH5dIyBwdmNyZWF0ZSAtdnZ2diAvZGV2L21wYXRoL2JhY2t1cDENCiNsdm1j
bWRsaW5lLmM6MTA4OSAgICAgICAgIFByb2Nlc3Npbmc6IHB2Y3JlYXRlIC12dnZ2IC9kZXYvbXBh
dGgvYmFja3VwMQ0KI2x2bWNtZGxpbmUuYzoxMDkyICAgICAgICAgT19ESVJFQ1Qgd2lsbCBiZSB1
c2VkDQojY29uZmlnL2NvbmZpZy5jOjk5NCAgICAgICBTZXR0aW5nIGdsb2JhbC9sb2NraW5nX3R5
cGUgdG8gMQ0KI2NvbmZpZy9jb25maWcuYzo5OTQgICAgICAgU2V0dGluZyBnbG9iYWwvd2FpdF9m
b3JfbG9ja3MgdG8gMQ0KI2xvY2tpbmcvbG9ja2luZy5jOjI0MCAgICAgICBGaWxlLWJhc2VkIGxv
Y2tpbmcgc2VsZWN0ZWQuDQojY29uZmlnL2NvbmZpZy5jOjk3MSAgICAgICBTZXR0aW5nIGdsb2Jh
bC9sb2NraW5nX2RpciB0byAvdmFyL2xvY2svbHZtDQojbGliZG0tY29tbW9uLmM6NDMwICAgICAg
ICAgUHJlcGFyaW5nIFNFTGludXggY29udGV4dCBmb3IgL3Zhci9sb2NrL2x2bSB0byBzeXN0ZW1f
dTpvYmplY3Rfcjpsdm1fbG9ja190Lg0KI2xpYmRtLWNvbW1vbi5jOjQzMyAgICAgICAgIFJlc2V0
dGluZyBTRUxpbnV4IGNvbnRleHQgdG8gZGVmYXVsdCB2YWx1ZS4NCiNjb25maWcvY29uZmlnLmM6
OTc3ICAgICAgIG1ldGFkYXRhL3B2bWV0YWRhdGFpZ25vcmUgbm90IGZvdW5kIGluIGNvbmZpZzog
ZGVmYXVsdGluZyB0byBuDQojY29uZmlnL2NvbmZpZy5jOjk5OSAgICAgICBtZXRhZGF0YS9wdm1l
dGFkYXRhc2l6ZSBub3QgZm91bmQgaW4gY29uZmlnOiBkZWZhdWx0aW5nIHRvIDI1NQ0KI2NvbmZp
Zy9jb25maWcuYzo5OTkgICAgICAgbWV0YWRhdGEvcHZtZXRhZGF0YWNvcGllcyBub3QgZm91bmQg
aW4gY29uZmlnOiBkZWZhdWx0aW5nIHRvIDENCiNsb2NraW5nL2ZpbGVfbG9ja2luZy5jOjIzNSAg
ICAgICBMb2NraW5nIC92YXIvbG9jay9sdm0vUF9vcnBoYW5zIFdCDQojbGliZG0tY29tbW9uLmM6
NDMwICAgICAgICAgUHJlcGFyaW5nIFNFTGludXggY29udGV4dCBmb3IgL3Zhci9sb2NrL2x2bS9Q
X29ycGhhbnMgdG8gc3lzdGVtX3U6b2JqZWN0X3I6bHZtX2xvY2tfdC4NCiNsb2NraW5nL2ZpbGVf
bG9ja2luZy5jOjE0MSAgICAgICAgIF9kb19mbG9jayAvdmFyL2xvY2svbHZtL1Bfb3JwaGFuczph
dXggV0INCiNsb2NraW5nL2ZpbGVfbG9ja2luZy5jOjE0MSAgICAgICAgIF9kb19mbG9jayAvdmFy
L2xvY2svbHZtL1Bfb3JwaGFucyBXQg0KI2xvY2tpbmcvZmlsZV9sb2NraW5nLmM6NTEgICAgICAg
ICBfdW5kb19mbG9jayAvdmFyL2xvY2svbHZtL1Bfb3JwaGFuczphdXgNCiNsaWJkbS1jb21tb24u
Yzo0MzMgICAgICAgICBSZXNldHRpbmcgU0VMaW51eCBjb250ZXh0IHRvIGRlZmF1bHQgdmFsdWUu
DQojaW9jdGwvbGliZG0taWZhY2UuYzoyMDA1ICAgICAgICAgZG0gdmVyc2lvbiAgIE9GICAgWzE2
Mzg0XQ0KI2lvY3RsL2xpYmRtLWlmYWNlLmM6MjAwNSAgICAgICAgIGRtIHN0YXR1cyAgICgyNTM6
MykgT0YgICBbMTYzODRdDQojZGV2aWNlL2Rldi1pby5jOjQ5NSAgICAgICAgIE9wZW5lZCAvZGV2
L21wYXRoL2JhY2t1cDEgUk8gT19ESVJFQ1QNCiNkZXZpY2UvZGV2LWlvLmM6MjY4ICAgICAgIC9k
ZXYvbXBhdGgvYmFja3VwMTogc2l6ZSBpcyA2MjkxNDU2MDAwIHNlY3RvcnMNCiNkZXZpY2UvZGV2
LWlvLmM6NTQxICAgICAgICAgQ2xvc2VkIC9kZXYvbXBhdGgvYmFja3VwMQ0KI2RldmljZS9kZXYt
aW8uYzoyNjggICAgICAgL2Rldi9tcGF0aC9iYWNrdXAxOiBzaXplIGlzIDYyOTE0NTYwMDAgc2Vj
dG9ycw0KI2RldmljZS9kZXYtaW8uYzo0OTUgICAgICAgICBPcGVuZWQgL2Rldi9tcGF0aC9iYWNr
dXAxIFJXIE9fRElSRUNUDQojZGV2aWNlL2Rldi1pby5jOjEzNCAgICAgICAgIC9kZXYvbXBhdGgv
YmFja3VwMTogYmxvY2sgc2l6ZSBpcyA0MDk2IGJ5dGVzDQojZGV2aWNlL2Rldi1pby5jOjU0MSAg
ICAgICAgIENsb3NlZCAvZGV2L21wYXRoL2JhY2t1cDENCiNmaWx0ZXJzL2ZpbHRlci1jb21wb3Np
dGUuYzozMSAgICAgICAgIFVzaW5nIC9kZXYvbXBhdGgvYmFja3VwMQ0KI2RldmljZS9kZXYtaW8u
Yzo0OTUgICAgICAgICBPcGVuZWQgL2Rldi9tcGF0aC9iYWNrdXAxIFJXIE9fRElSRUNUDQojZGV2
aWNlL2Rldi1pby5jOjEzNCAgICAgICAgIC9kZXYvbXBhdGgvYmFja3VwMTogYmxvY2sgc2l6ZSBp
cyA0MDk2IGJ5dGVzDQojbGFiZWwvbGFiZWwuYzoxODQgICAgICAgL2Rldi9tcGF0aC9iYWNrdXAx
OiBObyBsYWJlbCBkZXRlY3RlZA0KI2RldmljZS9kZXYtaW8uYzo1NDEgICAgICAgICBDbG9zZWQg
L2Rldi9tcGF0aC9iYWNrdXAxDQojaW9jdGwvbGliZG0taWZhY2UuYzoyMDA1ICAgICAgICAgZG0g
c3RhdHVzICAgKDI1MzozKSBPRiAgIFsxNjM4NF0NCiNkZXZpY2UvZGV2LWlvLmM6NDk1ICAgICAg
ICAgT3BlbmVkIC9kZXYvbXBhdGgvYmFja3VwMSBSTyBPX0RJUkVDVA0KI2RldmljZS9kZXYtaW8u
YzoyNjggICAgICAgL2Rldi9tcGF0aC9iYWNrdXAxOiBzaXplIGlzIDYyOTE0NTYwMDAgc2VjdG9y
cw0KI2RldmljZS9kZXYtaW8uYzo1NDEgICAgICAgICBDbG9zZWQgL2Rldi9tcGF0aC9iYWNrdXAx
DQojZGV2aWNlL2Rldi1pby5jOjI2OCAgICAgICAvZGV2L21wYXRoL2JhY2t1cDE6IHNpemUgaXMg
NjI5MTQ1NjAwMCBzZWN0b3JzDQojZGV2aWNlL2Rldi1pby5jOjQ5NSAgICAgICAgIE9wZW5lZCAv
ZGV2L21wYXRoL2JhY2t1cDEgUlcgT19ESVJFQ1QNCiNkZXZpY2UvZGV2LWlvLmM6MTM0ICAgICAg
ICAgL2Rldi9tcGF0aC9iYWNrdXAxOiBibG9jayBzaXplIGlzIDQwOTYgYnl0ZXMNCiNkZXZpY2Uv
ZGV2LWlvLmM6NTQxICAgICAgICAgQ2xvc2VkIC9kZXYvbXBhdGgvYmFja3VwMQ0KI2ZpbHRlcnMv
ZmlsdGVyLWNvbXBvc2l0ZS5jOjMxICAgICAgICAgVXNpbmcgL2Rldi9tcGF0aC9iYWNrdXAxDQoj
ZGV2aWNlL2Rldi1pby5jOjQ5NSAgICAgICAgIE9wZW5lZCAvZGV2L21wYXRoL2JhY2t1cDEgUlcg
T19FWENMIE9fRElSRUNUDQojZGV2aWNlL2Rldi1pby5jOjU0MSAgICAgICAgIENsb3NlZCAvZGV2
L21wYXRoL2JhY2t1cDENCiNkZXZpY2UvZGV2LWlvLmM6MjY4ICAgICAgIC9kZXYvbXBhdGgvYmFj
a3VwMTogc2l6ZSBpcyA2MjkxNDU2MDAwIHNlY3RvcnMNCiNkZXZpY2UvZGV2LWlvLmM6NDk1ICAg
ICAgICAgT3BlbmVkIC9kZXYvbXBhdGgvYmFja3VwMSBSVyBPX0RJUkVDVA0KI2RldmljZS9kZXYt
aW8uYzoxMzQgICAgICAgICAvZGV2L21wYXRoL2JhY2t1cDE6IGJsb2NrIHNpemUgaXMgNDA5NiBi
eXRlcw0KI2RldmljZS9kZXYtaW8uYzo1NDEgICAgICAgICBDbG9zZWQgL2Rldi9tcGF0aC9iYWNr
dXAxDQojZGV2aWNlL2Rldi1pby5jOjI2OCAgICAgICAvZGV2L21wYXRoL2JhY2t1cDE6IHNpemUg
aXMgNjI5MTQ1NjAwMCBzZWN0b3JzDQojZGV2aWNlL2Rldi1pby5jOjQ5NSAgICAgICAgIE9wZW5l
ZCAvZGV2L21wYXRoL2JhY2t1cDEgUlcgT19ESVJFQ1QNCiNkZXZpY2UvZGV2LWlvLmM6MTM0ICAg
ICAgICAgL2Rldi9tcGF0aC9iYWNrdXAxOiBibG9jayBzaXplIGlzIDQwOTYgYnl0ZXMNCiNkZXZp
Y2UvZGV2LWlvLmM6NTQxICAgICAgICAgQ2xvc2VkIC9kZXYvbXBhdGgvYmFja3VwMQ0KI2Rldmlj
ZS9kZXYtaW8uYzo0OTUgICAgICAgICBPcGVuZWQgL2Rldi9tcGF0aC9iYWNrdXAxIFJXIE9fRElS
RUNUDQojZGV2aWNlL2Rldi1pby5jOjEzNCAgICAgICAgIC9kZXYvbXBhdGgvYmFja3VwMTogYmxv
Y2sgc2l6ZSBpcyA0MDk2IGJ5dGVzDQojZGV2aWNlL2Rldi1pby5jOjU0MSAgICAgICAgIENsb3Nl
ZCAvZGV2L21wYXRoL2JhY2t1cDENCiNpb2N0bC9saWJkbS1pZmFjZS5jOjIwMDUgICAgICAgICBk
bSBzdGF0dXMgICAoMjUzOjMpIE9GICAgWzE2Mzg0XQ0KI2RldmljZS9kZXYtaW8uYzo0OTUgICAg
ICAgICBPcGVuZWQgL2Rldi9tcGF0aC9iYWNrdXAxIFJPIE9fRElSRUNUDQojZGV2aWNlL2Rldi1p
by5jOjI2OCAgICAgICAvZGV2L21wYXRoL2JhY2t1cDE6IHNpemUgaXMgNjI5MTQ1NjAwMCBzZWN0
b3JzDQojZGV2aWNlL2Rldi1pby5jOjU0MSAgICAgICAgIENsb3NlZCAvZGV2L21wYXRoL2JhY2t1
cDENCiNkZXZpY2UvZGV2LWlvLmM6MjY4ICAgICAgIC9kZXYvbXBhdGgvYmFja3VwMTogc2l6ZSBp
cyA2MjkxNDU2MDAwIHNlY3RvcnMNCiNkZXZpY2UvZGV2LWlvLmM6NDk1ICAgICAgICAgT3BlbmVk
IC9kZXYvbXBhdGgvYmFja3VwMSBSVyBPX0RJUkVDVA0KI2RldmljZS9kZXYtaW8uYzoxMzQgICAg
ICAgICAvZGV2L21wYXRoL2JhY2t1cDE6IGJsb2NrIHNpemUgaXMgNDA5NiBieXRlcw0KI2Rldmlj
ZS9kZXYtaW8uYzo1NDEgICAgICAgICBDbG9zZWQgL2Rldi9tcGF0aC9iYWNrdXAxDQojZmlsdGVy
cy9maWx0ZXItY29tcG9zaXRlLmM6MzEgICAgICAgICBVc2luZyAvZGV2L21wYXRoL2JhY2t1cDEN
CiNkZXZpY2UvZGV2LWlvLmM6MjY4ICAgICAgIC9kZXYvbXBhdGgvYmFja3VwMTogc2l6ZSBpcyA2
MjkxNDU2MDAwIHNlY3RvcnMNCiNjb25maWcvY29uZmlnLmM6OTk0ICAgICAgIFNldHRpbmcgZGV2
aWNlcy9kYXRhX2FsaWdubWVudCB0byAwDQojY29uZmlnL2NvbmZpZy5jOjk5NCAgICAgICBTZXR0
aW5nIGRldmljZXMvZGVmYXVsdF9kYXRhX2FsaWdubWVudCB0byAwDQojbWV0YWRhdGEvbWV0YWRh
dGEuYzoxMjYgICAgICAgL2Rldi9tcGF0aC9iYWNrdXAxOiBTZXR0aW5nIFBFIGFsaWdubWVudCB0
byAxMjggc2VjdG9ycy4NCiNtZXRhZGF0YS9tZXRhZGF0YS5jOjE1OSAgICAgICAvZGV2L21wYXRo
L2JhY2t1cDE6IFNldHRpbmcgUEUgYWxpZ25tZW50IG9mZnNldCB0byAwIHNlY3RvcnMuDQojZGV2
aWNlL2Rldi1pby5jOjQ5NSAgICAgICAgIE9wZW5lZCAvZGV2L21wYXRoL2JhY2t1cDEgUlcgT19E
SVJFQ1QNCiNkZXZpY2UvZGV2LWlvLmM6NzMwICAgICAgICAgV2lwaW5nIC9kZXYvbXBhdGgvYmFj
a3VwMSBhdCBzZWN0b3IgOCBsZW5ndGggOCBzZWN0b3JzDQojZGV2aWNlL2Rldi1pby5jOjEzNCAg
ICAgICAgIC9kZXYvbXBhdGgvYmFja3VwMTogYmxvY2sgc2l6ZSBpcyA0MDk2IGJ5dGVzDQojZGV2
aWNlL2Rldi1pby5jOjU0MSAgICAgICAgIENsb3NlZCAvZGV2L21wYXRoL2JhY2t1cDENCiNtZXRh
ZGF0YS9tZXRhZGF0YS5jOjE0OTkgICAgIFNldCB1cCBwaHlzaWNhbCB2b2x1bWUgZm9yICIvZGV2
L21wYXRoL2JhY2t1cDEiIHdpdGggNjI5MTQ1NjAwMCBhdmFpbGFibGUgc2VjdG9ycw0KI2xhYmVs
L2xhYmVsLmM6MjAzICAgICAgIFNjYW5uaW5nIGZvciBsYWJlbHMgdG8gd2lwZSBmcm9tIC9kZXYv
bXBhdGgvYmFja3VwMQ0KI2RldmljZS9kZXYtaW8uYzo0OTUgICAgICAgICBPcGVuZWQgL2Rldi9t
cGF0aC9iYWNrdXAxIFJXIE9fRElSRUNUDQojZGV2aWNlL2Rldi1pby5jOjEzNCAgICAgICAgIC9k
ZXYvbXBhdGgvYmFja3VwMTogYmxvY2sgc2l6ZSBpcyA0MDk2IGJ5dGVzDQojZGV2aWNlL2Rldi1p
by5jOjU0MSAgICAgICAgIENsb3NlZCAvZGV2L21wYXRoL2JhY2t1cDENCiNtZXRhZGF0YS9tZXRh
ZGF0YS5jOjE1MDggICAgIFplcm9pbmcgc3RhcnQgb2YgZGV2aWNlIC9kZXYvbXBhdGgvYmFja3Vw
MQ0KI2RldmljZS9kZXYtaW8uYzo0OTUgICAgICAgICBPcGVuZWQgL2Rldi9tcGF0aC9iYWNrdXAx
IFJXIE9fRElSRUNUDQojZGV2aWNlL2Rldi1pby5jOjczMCAgICAgICAgIFdpcGluZyAvZGV2L21w
YXRoL2JhY2t1cDEgYXQgc2VjdG9yIDAgbGVuZ3RoIDQgc2VjdG9ycw0KI2RldmljZS9kZXYtaW8u
YzoxMzQgICAgICAgICAvZGV2L21wYXRoL2JhY2t1cDE6IGJsb2NrIHNpemUgaXMgNDA5NiBieXRl
cw0KI2RldmljZS9kZXYtaW8uYzo1NDEgICAgICAgICBDbG9zZWQgL2Rldi9tcGF0aC9iYWNrdXAx
DQojbWV0YWRhdGEvbWV0YWRhdGEuYzoxNTIzICAgICAgIFdyaXRpbmcgcGh5c2ljYWwgdm9sdW1l
IGRhdGEgdG8gZGlzayAiL2Rldi9tcGF0aC9iYWNrdXAxIg0KI2NhY2hlL2x2bWNhY2hlLmM6MTE2
NiAgICAgICAgIGx2bWNhY2hlOiAvZGV2L21wYXRoL2JhY2t1cDE6IG5vdyBpbiBWRyAjb3JwaGFu
c19sdm0yICgjb3JwaGFuc19sdm0yKQ0KI2Zvcm1hdF90ZXh0L2Zvcm1hdC10ZXh0LmM6MTQ1MyAg
ICAgICAgIENyZWF0aW5nIG1ldGFkYXRhIGFyZWEgb24gL2Rldi9tcGF0aC9iYWNrdXAxIGF0IHNl
Y3RvciA4IHNpemUgMzc2IHNlY3RvcnMNCiNmb3JtYXRfdGV4dC9mb3JtYXQtdGV4dC5jOjE1MjMg
ICAgICAgL2Rldi9tcGF0aC9iYWNrdXAxOiBzZXR0aW5nIHBlX3N0YXJ0PTM4NCAob3JpZ19wZV9z
dGFydD0zODQsIHBlX2FsaWduPTEyOCwgcGVfYWxpZ25fb2Zmc2V0PTAsIGFkanVzdG1lbnQ9MCkN
CiNkZXZpY2UvZGV2LWlvLmM6NDk1ICAgICAgICAgT3BlbmVkIC9kZXYvbXBhdGgvYmFja3VwMSBS
VyBPX0RJUkVDVA0KI2RldmljZS9kZXYtaW8uYzoxMzQgICAgICAgICAvZGV2L21wYXRoL2JhY2t1
cDE6IGJsb2NrIHNpemUgaXMgNDA5NiBieXRlcw0KI2Zvcm1hdF90ZXh0L3RleHRfbGFiZWwuYzox
MzcgICAgICAgICAvZGV2L21wYXRoL2JhY2t1cDE6IFByZXBhcmluZyBQViBsYWJlbCBoZWFkZXIg
c1ZzazRnLUZFd0ctblFmQy0zeHFYLU9jM0ItWXRlZS1LSDZyRmUgc2l6ZSAzMjIxMjI1NDcyMDAw
IHdpdGggZGExICgzODRzLCAwcykgbWRhMSAoOHMsIDM3NnMpDQojbGFiZWwvbGFiZWwuYzozMzQg
ICAgICAgL2Rldi9tcGF0aC9iYWNrdXAxOiBXcml0aW5nIGxhYmVsIHRvIHNlY3RvciAxIHdpdGgg
c3RvcmVkIG9mZnNldCAzMi4NCiAgUGh5c2ljYWwgdm9sdW1lICIvZGV2L21wYXRoL2JhY2t1cDEi
IHN1Y2Nlc3NmdWxseSBjcmVhdGVkDQojbG9ja2luZy9maWxlX2xvY2tpbmcuYzo3NCAgICAgICBV
bmxvY2tpbmcgL3Zhci9sb2NrL2x2bS9QX29ycGhhbnMNCiNsb2NraW5nL2ZpbGVfbG9ja2luZy5j
OjUxICAgICAgICAgX3VuZG9fZmxvY2sgL3Zhci9sb2NrL2x2bS9QX29ycGhhbnMNCiNkZXZpY2Uv
ZGV2LWlvLmM6NTQxICAgICAgICAgQ2xvc2VkIC9kZXYvbXBhdGgvYmFja3VwMQ0KDQpbcm9vdEBv
ZmZpY2Ugfl0jIGRkIGlmPS9kZXYvbXBhdGgvYmFja3VwMSBicz0xayBjb3VudD0xIHwgY2F0IC12
IC0NCl5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBe
QF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5A
XkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBe
QF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5A
XkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBe
QF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5A
XkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBe
QF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5A
XkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBe
QF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5A
XkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBe
QF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5A
XkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBe
QF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5A
XkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBe
QF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5A
XkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBe
QF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5A
XkBMQUJFTE9ORV5BXkBeQF5AXkBeQF5AXkAsTS0+TS1hTS1SIF5AXkBeQExWTTIgMDAxc1ZzazRn
RkV3R25RZkMzeHFYT2MzQll0ZWVLSDZyRmVeQF5AXkBeQE0tbl5CXkBeQF5AXkBeQ15AXkBeQF5A
XkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5QXkBe
QF5AXkBeQF5AXkBNLXBeQl5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBe
QF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5A
XkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBe
QF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5A
XkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBe
QF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5A
XkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBe
QF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5A
XkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBe
QF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5A
XkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBe
QF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5A
XkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBe
QF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5AXkBeQF5A
XkBeQF5AXkBeQF5AMSswIHJlY29yZHMgaW4NCjErMCByZWNvcmRzIG91dA0KMTAyNCBieXRlcyAo
MS4wIGtCKSBjb3BpZWQsIDAuMDEwMjQgc2Vjb25kcywgMTAwIGtCL3MNCltyb290QG9mZmljZSB+
XSMgcHZkaXNwbGF5IC9kZXYvbXBhdGgvYmFja3VwMQ0KICAiL2Rldi9tcGF0aC9iYWNrdXAxIiBp
cyBhIG5ldyBwaHlzaWNhbCB2b2x1bWUgb2YgIjIuOTMgVEIiDQogIC0tLSBORVcgUGh5c2ljYWwg
dm9sdW1lIC0tLQ0KICBQViBOYW1lICAgICAgICAgICAgICAgL2Rldi9tcGF0aC9iYWNrdXAxDQog
IFZHIE5hbWUNCiAgUFYgU2l6ZSAgICAgICAgICAgICAgIDIuOTMgVEINCiAgQWxsb2NhdGFibGUg
ICAgICAgICAgIE5PDQogIFBFIFNpemUgKEtCeXRlKSAgICAgICAwDQogIFRvdGFsIFBFICAgICAg
ICAgICAgICAwDQogIEZyZWUgUEUgICAgICAgICAgICAgICAwDQogIEFsbG9jYXRlZCBQRSAgICAg
ICAgICAwDQogIFBWIFVVSUQgICAgICAgICAgICAgICBzVnNrNGctRkV3Ry1uUWZDLTN4cVgtT2Mz
Qi1ZdGVlLUtINnJGZQ0KDQo=

--_002_8CEF048B9EC83748B1517DC64EA130FB6B2AB35166offwin200301a_--
