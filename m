Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i7KJEUa24670
	for <linux-lvm@redhat.com>; Fri, 20 Aug 2004 15:14:30 -0400
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.131])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i7KJEOXn014924
	for <linux-lvm@Redhat.com>; Fri, 20 Aug 2004 15:14:24 -0400
Received: from westrelay02.boulder.ibm.com (westrelay02.boulder.ibm.com
	[9.17.195.11])
	by e33.co.us.ibm.com (8.12.10/8.12.9) with ESMTP id i7KJEIDD577436
	for <linux-lvm@Redhat.com>; Fri, 20 Aug 2004 15:14:18 -0400
Received: from d03nm128.boulder.ibm.com (d03av04.boulder.ibm.com
	[9.17.195.170])
	by westrelay02.boulder.ibm.com (8.12.10/NCO/VER6.6) with ESMTP id
	i7KJEI4L326290
	for <linux-lvm@Redhat.com>; Fri, 20 Aug 2004 13:14:18 -0600
Message-ID: <OFF72412F3.A0A1F322-ON87256EF6.00688D9D-07256EF6.0069ACC5@us.ibm.com>
From: Ceri I Davies <ceri@us.ibm.com>
Date: Fri, 20 Aug 2004 13:14:16 -0600
MIME-Version: 1.0
Content-type: multipart/mixed; 
	Boundary="0__=08BBE465DFFB0B0D8f9e8a93df938690918c08BBE465DFFB0B0D"
Subject: [linux-lvm] Adding a new device to LVM
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com

--0__=08BBE465DFFB0B0D8f9e8a93df938690918c08BBE465DFFB0B0D
Content-type: multipart/alternative; 
	Boundary="1__=08BBE465DFFB0B0D8f9e8a93df938690918c08BBE465DFFB0B0D"

--1__=08BBE465DFFB0B0D8f9e8a93df938690918c08BBE465DFFB0B0D
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: quoted-printable






Hi, I am a developer on the IBM Total Storage Multipathing Subsystem De=
vice
Driver (SDD) at IBM.

We create /dev/vpathX devices, and LVM does not work with these devices=
.
Here is a patch to the LVM source code to get LVM to work with our devi=
ces.
What is the view in terms of getting this patch accepted into the
mainstream code, especially since this is for some scum-sucking non-GPL=

proprietary driver.

(See attached file: lvm-1.0.3-15.ibm-vpath.patch)

Mr Ceri I Davies
ceri@us.ibm.com=

--1__=08BBE465DFFB0B0D8f9e8a93df938690918c08BBE465DFFB0B0D
Content-type: text/html; charset=US-ASCII
Content-Disposition: inline
Content-transfer-encoding: quoted-printable

<html><body>
<p>Hi, I am a developer on the IBM Total Storage Multipathing Subsystem=
 Device Driver (SDD) at IBM.<br>
<br>
We create /dev/vpathX devices, and LVM does not work with these devices=
.  Here is a patch to the LVM source code to get LVM to work with our d=
evices.  What is the view in terms of getting this patch accepted into =
the mainstream code, especially since this is for some scum-sucking non=
-GPL proprietary driver.<br>
<br>
<i>(See attached file: lvm-1.0.3-15.ibm-vpath.patch)</i><br>
<br>
Mr Ceri I Davies<br>
ceri@us.ibm.com<br>
</body></html>=


--1__=08BBE465DFFB0B0D8f9e8a93df938690918c08BBE465DFFB0B0D--


--0__=08BBE465DFFB0B0D8f9e8a93df938690918c08BBE465DFFB0B0D
Content-type: application/octet-stream; 
	name="lvm-1.0.3-15.ibm-vpath.patch"
Content-Disposition: attachment; filename="lvm-1.0.3-15.ibm-vpath.patch"
Content-ID: <10__=08BBE465DFFB0B0D8f9e8a93df938@us.ibm.com>
Content-transfer-encoding: base64

ZGlmZiAtTmF1ciAxLjAuNS5vcmlnL3Rvb2xzL2xpYi9saWJsdm0uaCAxLjAuNS52cGF0aC90b29s
cy9saWIvbGlibHZtLmgKLS0tIDEuMC41Lm9yaWcvdG9vbHMvbGliL2xpYmx2bS5oCTIwMDItMDQt
MjkgMDI6NDA6NDEuMDAwMDAwMDAwIC0wNzAwCisrKyAxLjAuNS52cGF0aC90b29scy9saWIvbGli
bHZtLmgJMjAwNC0wNy0zMCAxMDo0Nzo0MS4wMDAwMDAwMDAgLTA3MDAKQEAgLTE5Miw2ICsxOTIs
NyBAQAogICBMVk1fREVWSUNFX1RZUEVfQ09NUEFRX0NJU1MsCS8qIENvbXBhcSBDQ0lTUyBhcnJh
eQkJCSovCiAgIExWTV9ERVZJQ0VfVFlQRV9VQkQsCQkvKiBVc2VyLW1vZGUgdmlydHVhbCBibG9j
ayBkZXZpY2UJKi8KICAgTFZNX0RFVklDRV9UWVBFX0FUQVJBSUQsCS8qIEFUQSBSYWlkCQkJCSov
CisgIExWTV9ERVZJQ0VfVFlQRV9WUEFUSCwgICAgICAgIC8qIElCTSB2cGF0aCAqLwogfSBsdm1f
ZGV2aWNlX3R5cGVfdDsKIAogLyogZm9yIGx2bV9zaG93X3NpemUgKCkgKi8KZGlmZiAtTmF1ciAx
LjAuNS5vcmlnL3Rvb2xzL2xpYi9sdm1fY2hlY2tfcGFydGl0aW9uZWRfZGV2LmMgMS4wLjUudnBh
dGgvdG9vbHMvbGliL2x2bV9jaGVja19wYXJ0aXRpb25lZF9kZXYuYwotLS0gMS4wLjUub3JpZy90
b29scy9saWIvbHZtX2NoZWNrX3BhcnRpdGlvbmVkX2Rldi5jCTIwMDItMDEtMTYgMDk6Mjc6NTUu
MDAwMDAwMDAwIC0wODAwCisrKyAxLjAuNS52cGF0aC90b29scy9saWIvbHZtX2NoZWNrX3BhcnRp
dGlvbmVkX2Rldi5jCTIwMDQtMDctMzAgMTY6Mzc6MjYuMDAwMDAwMDAwIC0wNzAwCkBAIC02NSw2
ICs2NSw3IEBACiAJY2FzZSBMVk1fREVWSUNFX1RZUEVfTUQ6CiAJY2FzZSBMVk1fREVWSUNFX1RZ
UEVfQVRBUkFJRDoKIAkgICAgYnJlYWs7CisJY2FzZSBMVk1fREVWSUNFX1RZUEVfVlBBVEg6CiAJ
ZGVmYXVsdDoKIAkgICAgcmV0ID0gVFJVRTsKIAl9CkBAIC0xNjAsNiArMTYxLDcgQEAKIAl7ICJj
Y2lzcyIsIExWTV9ERVZJQ0VfVFlQRV9DT01QQVFfQ0lTUyB9LC8qIENvbXBhcSBDSVNTIGFycmF5
CSAgICAgKi8KIAl7ICJ1YmQiLCBMVk1fREVWSUNFX1RZUEVfVUJEIH0sCSAgLyogVXNlci1tb2Rl
IHZpcnR1YWwgYmxvY2sgZGV2aWNlICAqLwogCXsgImF0YXJhaWQiLCBMVk1fREVWSUNFX1RZUEVf
QVRBUkFJRCB9LCAvKiBBVEEgUmFpZCAgICAgICAgICAgICAgICAgICovCisJeyAidnBhdGgiLCBM
Vk1fREVWSUNFX1RZUEVfVlBBVEggfSwgLyogSUJNIHZwYXRoICovCiAJeyBOVUxMLCBMVk1fREVW
SUNFX1RZUEVfSU5WQUxJRCB9IC8qIERldmljZSBub3QgcmVjb2duaXplZAkgICAgICovCiAgICAg
fTsKICAgICBGSUxFICpwcm9jZGV2aWNlcyA9IE5VTEw7Cg==

--0__=08BBE465DFFB0B0D8f9e8a93df938690918c08BBE465DFFB0B0D--
