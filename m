Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u3EAOTNe023330
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Thu, 14 Apr 2016 06:24:29 -0400
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5E6943B756
	for <linux-lvm@redhat.com>; Thu, 14 Apr 2016 10:24:28 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id u206so118575659wme.1
	for <linux-lvm@redhat.com>; Thu, 14 Apr 2016 03:24:28 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 14 Apr 2016 12:24:26 +0200
Message-ID: <CAPD1+aPkA54SDUFf=OPzLwjE2p3QpcQgx8_Uh4dRYB+xmHX1rw@mail.gmail.com>
From: Timo Gurr <timo.gurr@gmail.com>
Content-Type: multipart/mixed; boundary=001a11361f66880cb005306f4c06
Subject: [linux-lvm] lvm2-2.02.150: error running autotools
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

--001a11361f66880cb005306f4c06
Content-Type: text/plain; charset=UTF-8

When running autotools on lvm2-2.02.150 I get the following error:

Using autoconf:2.5
Using automake:1.15
eautoreconf: running in
/var/tmp/paludis/build/sys-fs-lvm2-2.02.150/work/LVM2.2.02.150 ...
aclocal
aclocal-1.15: warning: autoconf input should be named 'configure.ac',
not 'configure.in'
autoconf
configure.in:1527: error: possibly undefined macro: AC_PYTHON_MODULE
     If this token and others are legitimate, please use m4_pattern_allow.
     See the Autoconf documentation.
* Failed Running autoconf !

Attached is a full build.log and the error can also be observed on our CI:
https://galileo.mailstation.de/jenkins/job/arbor/6248/console

System is a 64bit Exherbo installation, lvm2-2.02.137
configures/compiles und runs without any problems.

-- 
Timo Gurr

--001a11361f66880cb005306f4c06
Content-Type: text/plain; charset=US-ASCII; name="sys-fs_lvm2-2.02.150.txt"
Content-Disposition: attachment; filename="sys-fs_lvm2-2.02.150.txt"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_in04x6zb0

G1szNTswMW09PT0bWzBtIFJ1bm5pbmcgZWJ1aWxkIHBoYXNlIGtpbGxvbGQgYXMgcm9vdDpyb290
Li4uDQobWzM1OzAxbT09PRtbMG0gU3RhcnRpbmcgYnVpbHRpbl9raWxsb2xkDQobWzM1OzAxbT09
PRtbMG0gRG9uZSBidWlsdGluX2tpbGxvbGQNChtbMzU7MDFtPT09G1swbSBDb21wbGV0ZWQgZWJ1
aWxkIHBoYXNlIGtpbGxvbGQNChtbMzU7MDFtPT09G1swbSBSdW5uaW5nIGVidWlsZCBwaGFzZXMg
aW5pdCBzYXZlZW52IGFzIHBhbHVkaXNidWlsZDpwYWx1ZGlzYnVpbGQuLi4NChtbMzU7MDFtPT09
G1swbSBTdGFydGluZyBidWlsdGluX2luaXQNChtbMzU7MDFtPT09G1swbSBEb25lIGJ1aWx0aW5f
aW5pdA0KG1szNTswMW09PT0bWzBtIFN0YXJ0aW5nIGJ1aWx0aW5fc2F2ZWVudg0KG1szNTswMW09
PT0bWzBtIERvbmUgYnVpbHRpbl9zYXZlZW52DQobWzM1OzAxbT09PRtbMG0gQ29tcGxldGVkIGVi
dWlsZCBwaGFzZXMgaW5pdCBzYXZlZW52DQotLS0gTm8gbmVlZCB0byBkbyBhbnl0aGluZyBmb3Ig
c2V0dXAgcGhhc2UKG1szNTswMW09PT0bWzBtIFJ1bm5pbmcgZWJ1aWxkIHBoYXNlcyBsb2FkZW52
IHVucGFjayBzYXZlZW52IGFzIHBhbHVkaXNidWlsZDpwYWx1ZGlzYnVpbGQuLi4NChtbMzU7MDFt
PT09G1swbSBTdGFydGluZyBidWlsdGluX2xvYWRlbnYNChtbMzU7MDFtPT09G1swbSBEb25lIGJ1
aWx0aW5fbG9hZGVudg0KG1szNTswMW09PT0bWzBtIFN0YXJ0aW5nIHNyY191bnBhY2sNCj4+PiBV
bnBhY2tpbmcgTFZNMi4yLjAyLjE1MC50Z3ogdG8gL3Zhci90bXAvcGFsdWRpcy9idWlsZC9zeXMt
ZnMtbHZtMi0yLjAyLjE1MC93b3JrDQp0YXIgenhmIC92YXIvY2FjaGUvcGFsdWRpcy9kaXN0Zmls
ZXMvTFZNMi4yLjAyLjE1MC50Z3ogLS1uby1zYW1lLW93bmVyDQobWzM1OzAxbT09PRtbMG0gRG9u
ZSBzcmNfdW5wYWNrDQobWzM1OzAxbT09PRtbMG0gU3RhcnRpbmcgYnVpbHRpbl9zYXZlZW52DQob
WzM1OzAxbT09PRtbMG0gRG9uZSBidWlsdGluX3NhdmVlbnYNChtbMzU7MDFtPT09G1swbSBDb21w
bGV0ZWQgZWJ1aWxkIHBoYXNlcyBsb2FkZW52IHVucGFjayBzYXZlZW52DQobWzM1OzAxbT09PRtb
MG0gUnVubmluZyBlYnVpbGQgcGhhc2VzIGxvYWRlbnYgcHJlcGFyZSBzYXZlZW52IGFzIHBhbHVk
aXNidWlsZDpwYWx1ZGlzYnVpbGQuLi4NChtbMzU7MDFtPT09G1swbSBTdGFydGluZyBidWlsdGlu
X2xvYWRlbnYNChtbMzU7MDFtPT09G1swbSBEb25lIGJ1aWx0aW5fbG9hZGVudg0KG1szNTswMW09
PT0bWzBtIFN0YXJ0aW5nIHNyY19wcmVwYXJlDQpVc2luZyBhdXRvY29uZjoyLjUNClVzaW5nIGF1
dG9tYWtlOjEuMTUNCmVhdXRvcmVjb25mOiBydW5uaW5nIGluIC92YXIvdG1wL3BhbHVkaXMvYnVp
bGQvc3lzLWZzLWx2bTItMi4wMi4xNTAvd29yay9MVk0yLjIuMDIuMTUwIC4uLg0KYWNsb2NhbA0K
YWNsb2NhbC0xLjE1OiB3YXJuaW5nOiBhdXRvY29uZiBpbnB1dCBzaG91bGQgYmUgbmFtZWQgJ2Nv
bmZpZ3VyZS5hYycsIG5vdCAnY29uZmlndXJlLmluJw0KYXV0b2NvbmYNCmNvbmZpZ3VyZS5pbjox
NTI3OiBlcnJvcjogcG9zc2libHkgdW5kZWZpbmVkIG1hY3JvOiBBQ19QWVRIT05fTU9EVUxFDQog
ICAgICBJZiB0aGlzIHRva2VuIGFuZCBvdGhlcnMgYXJlIGxlZ2l0aW1hdGUsIHBsZWFzZSB1c2Ug
bTRfcGF0dGVybl9hbGxvdy4NCiAgICAgIFNlZSB0aGUgQXV0b2NvbmYgZG9jdW1lbnRhdGlvbi4N
CiAbWzMxOzAxbSobWzBtIEZhaWxlZCBSdW5uaW5nIGF1dG9jb25mICENCg0KISEhIEVSUk9SIGlu
IHN5cy1mcy9sdm0yLTIuMDIuMTUwOjphcmJvcjoNCiEhISBJbiBhdXRvdG9vbHNfcnVuX3Rvb2wg
YXQgbGluZSA1OTQNCiEhISBGYWlsZWQgUnVubmluZyBhdXRvY29uZiAhDQoNCiEhISBDYWxsIHN0
YWNrOg0KISEhICAgICogYXV0b3Rvb2xzX3J1bl90b29sICgvdmFyL3RtcC9wYWx1ZGlzL2J1aWxk
L3N5cy1mcy1sdm0yLTIuMDIuMTUwL3RlbXAvbG9hZHNhdmVlbnY6NTk0KQ0KISEhICAgICogZWF1
dG9jb25mICgvdmFyL3RtcC9wYWx1ZGlzL2J1aWxkL3N5cy1mcy1sdm0yLTIuMDIuMTUwL3RlbXAv
bG9hZHNhdmVlbnY6ODI5KQ0KISEhICAgICogZWF1dG9yZWNvbmYgKC92YXIvdG1wL3BhbHVkaXMv
YnVpbGQvc3lzLWZzLWx2bTItMi4wMi4xNTAvdGVtcC9sb2Fkc2F2ZWVudjo4ODUpDQohISEgICAg
KiBhdXRvdG9vbHNfc3JjX3ByZXBhcmUgKC92YXIvdG1wL3BhbHVkaXMvYnVpbGQvc3lzLWZzLWx2
bTItMi4wMi4xNTAvdGVtcC9sb2Fkc2F2ZWVudjo2MTUpDQohISEgICAgKiBzcmNfcHJlcGFyZSAo
L3Zhci90bXAvcGFsdWRpcy9idWlsZC9zeXMtZnMtbHZtMi0yLjAyLjE1MC90ZW1wL2xvYWRzYXZl
ZW52OjI3MjUpDQohISEgICAgKiBleGhlcmVzX2ludGVybmFsX3ByZXBhcmUgKC91c3IveDg2XzY0
LXBjLWxpbnV4LWdudS9saWJleGVjL3BhbHVkaXMvZXhoZXJlcy0wL3NyY19wcmVwYXJlLmJhc2g6
NDYpDQohISEgICAgKiBlYnVpbGRfbWFpbiAoL3Vzci94ODZfNjQtcGMtbGludXgtZ251L2xpYmV4
ZWMvcGFsdWRpcy9lYnVpbGQuYmFzaDo3MjUpDQohISEgICAgKiBtYWluICgvdXNyL3g4Nl82NC1w
Yy1saW51eC1nbnUvbGliZXhlYy9wYWx1ZGlzL2VidWlsZC5iYXNoOjc0OCkNCg0KZGllZnVuYzog
bWFraW5nIGVidWlsZCBQSUQgOTQ5NCBleGl0IHdpdGggZXJyb3INCmRpZSB0cmFwOiBleGl0aW5n
IHdpdGggZXJyb3IuDQo=
--001a11361f66880cb005306f4c06--
