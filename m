Received: from mx1.redhat.com (ext-mx19.extmail.prod.ext.phx2.redhat.com
	[10.5.110.48])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1F5A11948B
	for <linux-lvm@redhat.com>; Thu, 28 Feb 2019 14:36:20 +0000 (UTC)
Received: from mail.service4.ru (mail.service4.ru [195.201.68.178])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6963C31325AB
	for <linux-lvm@redhat.com>; Thu, 28 Feb 2019 14:36:18 +0000 (UTC)
Received: from mail.service4.ru (localhost [127.0.0.1])
	by mail.service4.ru (Postfix) with ESMTP id 0042140836
	for <linux-lvm@redhat.com>; Thu, 28 Feb 2019 17:36:16 +0300 (MSK)
Received: from mail.service4.ru ([127.0.0.1])
	by mail.service4.ru (mail.service4.ru [127.0.0.1]) (amavisd-new,
	port 10026) with ESMTP id i0maMkVcfFft for <linux-lvm@redhat.com>;
	Thu, 28 Feb 2019 17:36:14 +0300 (MSK)
References: <253b63e7-e23b-9a0a-d677-a114c00a5134@linux.ibm.com>
From: Ilia Zykov <mail@izyk.ru>
Message-ID: <5cc14cbf-57e3-50b4-1332-07b688536be5@izyk.ru>
Date: Thu, 28 Feb 2019 17:36:11 +0300
MIME-Version: 1.0
In-Reply-To: <253b63e7-e23b-9a0a-d677-a114c00a5134@linux.ibm.com>
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
	micalg=sha-256; boundary="------------ms060907010209020306070002"
Subject: Re: [linux-lvm] Filesystem corruption with LVM's pvmove onto a PV
 with a larger physical block size
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Ingo Franzki <ifranzki@linux.ibm.com>

This is a cryptographically signed message in MIME format.

--------------ms060907010209020306070002
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

> Discarding device blocks: done
> Creating filesystem with 307200 1k blocks and 76912 inodes
> ......
> # pvs
>   /dev/LOOP_VG/LV: read failed after 0 of 1024 at 0: Invalid argument
>   /dev/LOOP_VG/LV: read failed after 0 of 1024 at 314507264: Invalid ar=
gument
>   /dev/LOOP_VG/LV: read failed after 0 of 1024 at 314564608: Invalid ar=
gument
>   /dev/LOOP_VG/LV: read failed after 0 of 1024 at 4096: Invalid argumen=
t
>   PV                   VG      Fmt  Attr PSize   PFree
>   /dev/loop0           LOOP_VG lvm2 a--  496.00m 496.00m
>   /dev/mapper/enc-loop LOOP_VG lvm2 a--  492.00m 192.00m
>=20
> In case the filesystem of the logical volume is not mounted at the time=
 of pvmove, it gets corrupted anyway, but you only see errors when trying=
 to mount it.
>=20

It's because you FS had 1k blocks.
New device can't read with block 1k.
If you plan pvmove on device with 4k. Maybe you need make fs with:
"mkfs.ext4 -b 4096"

See comments:
https://bugzilla.redhat.com/show_bug.cgi?id=3D1684078


--------------ms060907010209020306070002
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCC
CxIwggUkMIIEDKADAgECAhEA73vYhU4F6WFKdCcfBcRrKjANBgkqhkiG9w0BAQsFADCBlzEL
MAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2Fs
Zm9yZDEaMBgGA1UEChMRQ09NT0RPIENBIExpbWl0ZWQxPTA7BgNVBAMTNENPTU9ETyBSU0Eg
Q2xpZW50IEF1dGhlbnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1haWwgQ0EwHhcNMTgwNDIwMDAw
MDAwWhcNMTkwNDIwMjM1OTU5WjAdMRswGQYJKoZIhvcNAQkBFgxtYWlsQGl6eWsucnUwggEi
MA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCu+RV0CiXSbZX5GWUw5M4PhdbkC4p8rAXp
i1O/h8jnk1uJ9MVJMDrt5waZ13kGrs445Vv3ffBsLCTHFcrOTBRgMkMtfYu0i2rSqmT6VgK+
3oU1YgNueCaAsFVYoV5zHr2xIqW8jOZXEbrrRkTjMnNHcfSTOoXBHRzCAZ4F39/InKIWrtji
JOff0IJ2lXrPNPxo/2u+Qer86f0peKm8sLlNsGRQZKJkLzCg5bmDXMONVvmcR2myoGfzN+02
sRvAUbz7NOKP/90DwmvteKgwfXeyKUgxbX8Ma4gk+lmr6Ty0PlpO6c2fc8NSHHa3yn/TGWNw
xl81k76vMGvK5HldNUvFAgMBAAGjggHiMIIB3jAfBgNVHSMEGDAWgBSCr2yM+MX+lmF86B89
K3FIXsSLwDAdBgNVHQ4EFgQUSOOeveBlmaDlK/jZWEu9MOXRTEIwDgYDVR0PAQH/BAQDAgWg
MAwGA1UdEwEB/wQCMAAwIAYDVR0lBBkwFwYIKwYBBQUHAwQGCysGAQQBsjEBAwUCMBEGCWCG
SAGG+EIBAQQEAwIFIDBGBgNVHSAEPzA9MDsGDCsGAQQBsjEBAgEBATArMCkGCCsGAQUFBwIB
Fh1odHRwczovL3NlY3VyZS5jb21vZG8ubmV0L0NQUzBaBgNVHR8EUzBRME+gTaBLhklodHRw
Oi8vY3JsLmNvbW9kb2NhLmNvbS9DT01PRE9SU0FDbGllbnRBdXRoZW50aWNhdGlvbmFuZFNl
Y3VyZUVtYWlsQ0EuY3JsMIGLBggrBgEFBQcBAQR/MH0wVQYIKwYBBQUHMAKGSWh0dHA6Ly9j
cnQuY29tb2RvY2EuY29tL0NPTU9ET1JTQUNsaWVudEF1dGhlbnRpY2F0aW9uYW5kU2VjdXJl
RW1haWxDQS5jcnQwJAYIKwYBBQUHMAGGGGh0dHA6Ly9vY3NwLmNvbW9kb2NhLmNvbTAXBgNV
HREEEDAOgQxtYWlsQGl6eWsucnUwDQYJKoZIhvcNAQELBQADggEBAFDES4sT8eTuNZVdI6t/
aeB/iFNk/qSp4Ttx+lWTin74za10iJhVxVTZCqruDNX9/+TB4AgIX54YsHVc9H8R8tFMEASn
FEi2YyvgFSmTdZPaEawsH+ExlEm+V6nf0Gl92KtqfgbOe0hFt3VlTIsz/QXXY+EGdqUZ3NQc
JMwGEk9phu2Pg8YJfAWeGkLGf05TZCZNGNqGkHZCMNOJALSvZZlYzBW0ILcEV2s5AA96GAUo
D24B5+oidW5z5obKK9fdSaTorrVN/yRkSTdEI06ImQE9w8GavDtpf2ddxQxLQv9WBsxQMngx
mPXkSpHJ2zSSigSut8QQHVTlIxAPBx5tg3IwggXmMIIDzqADAgECAhBqm+E4O/8ra58B1dm4
p1JWMA0GCSqGSIb3DQEBDAUAMIGFMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3JlYXRlciBN
YW5jaGVzdGVyMRAwDgYDVQQHEwdTYWxmb3JkMRowGAYDVQQKExFDT01PRE8gQ0EgTGltaXRl
ZDErMCkGA1UEAxMiQ09NT0RPIFJTQSBDZXJ0aWZpY2F0aW9uIEF1dGhvcml0eTAeFw0xMzAx
MTAwMDAwMDBaFw0yODAxMDkyMzU5NTlaMIGXMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3Jl
YXRlciBNYW5jaGVzdGVyMRAwDgYDVQQHEwdTYWxmb3JkMRowGAYDVQQKExFDT01PRE8gQ0Eg
TGltaXRlZDE9MDsGA1UEAxM0Q09NT0RPIFJTQSBDbGllbnQgQXV0aGVudGljYXRpb24gYW5k
IFNlY3VyZSBFbWFpbCBDQTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAL6znles
KHZ1QBbHOAOY08YYdiFQ8yV5C0y1oNF9Olg+nKcxLqf2NHbZhGra0D00SOTq9bus3/mxgUsg
/Wh/eXQ0pnp8tZ8XZWAnlyKMpjL+qUByRjXCA6RQyDMqVaVUkbIr5SU0RDX/kSsKwer3H1pT
/HUrBN0X8sKtPTdGX8XAWt/VdMLBrZBlgvnkCos+KQWWCo63OTTqRvaq8aWccm+KOMjTcE6s
2mj6RkalweyDI7X+7U5lNo6jzC8RTXtVV4/Vwdax720YpMPJQaDaElmOupyTf1Qib+cpukNJ
nQmwygjD8m046DQkLnpXNCAGjuJy1F5NATksUsbfJAr7FLUCAwEAAaOCATwwggE4MB8GA1Ud
IwQYMBaAFLuvfgI9+qbxPISOre44mOzZMjLUMB0GA1UdDgQWBBSCr2yM+MX+lmF86B89K3FI
XsSLwDAOBgNVHQ8BAf8EBAMCAYYwEgYDVR0TAQH/BAgwBgEB/wIBADARBgNVHSAECjAIMAYG
BFUdIAAwTAYDVR0fBEUwQzBBoD+gPYY7aHR0cDovL2NybC5jb21vZG9jYS5jb20vQ09NT0RP
UlNBQ2VydGlmaWNhdGlvbkF1dGhvcml0eS5jcmwwcQYIKwYBBQUHAQEEZTBjMDsGCCsGAQUF
BzAChi9odHRwOi8vY3J0LmNvbW9kb2NhLmNvbS9DT01PRE9SU0FBZGRUcnVzdENBLmNydDAk
BggrBgEFBQcwAYYYaHR0cDovL29jc3AuY29tb2RvY2EuY29tMA0GCSqGSIb3DQEBDAUAA4IC
AQB4XLKBKDRPPO5fVs6fl1bsj6JrF/bz9kkIBtTYLzXN30D+03Hj6OxCDBEaIeNmsBhrJmuu
bvyE7HtoSmR809AgcYboW+rcTNZ/8u/Hv+GTrNI/AhqX2/kiQNxmgUPt/eJPs92Qclj0HnVy
y9TnSvGkSDU7I5Px+TbO+88G4zipA2psZaWeEykgzClZlPz1FjTCkk77ZXp5cQYYexE6zeeN
4/0OqqoAloFrjAF4o50YJafX8mnahjp3I2Y2mkjhk0xQfhNqbzlLWPoT3m7j7U26u7zg6swj
Oq8hITYc3/np5tM5aVyu6t99p17bTbY7+1RTWBviN9YJzK8HxzObXYWBf/L+VGOYNsQDTxAk
0Hbvb1j6KjUhg7fO294F29QIhhmiNOr84JHoy+fNLpfvYc/Q9EtFOI5ISYgOxLk3nD/whbUe
9rmEQXLp8MB933Ij474gwwCPUpwv9mj2PMnXoc7mbrS22XUSeTwxCTP9bcmUdp4jmIoWfhQm
7X9w/Zgddg+JZ/YnIHOwsGsaTUgj7fIvxqith7DoJC91WJ8Lce3CVJqb1XWeKIJ84F7YLXZN
0oa7TktYgDdmQVxYkZo1c5noaDKH9Oq9cbm/vOYRUM1cWcef20Wkyk5S/GFyyPJwG0fR1nRa
s3DqAf4cXxMiEKcff7PNa4M3RGTqH0pWR8p6EjGCArMwggKvAgEBMIGtMIGXMQswCQYDVQQG
EwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVyMRAwDgYDVQQHEwdTYWxmb3JkMRow
GAYDVQQKExFDT01PRE8gQ0EgTGltaXRlZDE9MDsGA1UEAxM0Q09NT0RPIFJTQSBDbGllbnQg
QXV0aGVudGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQQIRAO972IVOBelhSnQnHwXEayow
DQYJYIZIAWUDBAIBBQCggdcwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0B
CQUxDxcNMTkwMjI4MTQzNjExWjAvBgkqhkiG9w0BCQQxIgQgxnLu1Er5pdmBTZPZenNwfeKR
cRtsAEdYS5WGxjOqq8kwbAYJKoZIhvcNAQkPMV8wXTALBglghkgBZQMEASowCwYJYIZIAWUD
BAECMAoGCCqGSIb3DQMHMA4GCCqGSIb3DQMCAgIAgDANBggqhkiG9w0DAgIBQDAHBgUrDgMC
BzANBggqhkiG9w0DAgIBKDANBgkqhkiG9w0BAQEFAASCAQAuV9H6iMWp9GVqNzazFZ49djbD
e3OvkVx6c8MHj179jy5LPwUT4BAcJJCgZPOg801k8k9l0g3hCeQNWmWvNZS2Xm9X/mqdzSk8
fdTXSDV82VoYnfNWiEOvsfJh7GBjtrQRHO8egw7gudO8NVHnCc/O4TE+TA/1GfLVkD4vBZtK
ZBLAp7hxivDt1f9CvH16WEvNNRaC2BzNgoGsygHFgWdrwO/K2qxByw2hrXKRnDEG6SlJKGhS
zT+dMBXkJHk5HqKSYtd4Idqnk5wFrpTv/LmAUAm7tvetDL6y9KEnQ4Vax6fCBiGS1HH82Q1s
y9jmGcleo5UABlNSolShgu7GwS66AAAAAAAA
--------------ms060907010209020306070002--
