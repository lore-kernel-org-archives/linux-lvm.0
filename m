Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i9QG9ar16579
	for <linux-lvm@redhat.com>; Tue, 26 Oct 2004 12:09:36 -0400
Received: from home.cru.fr (home.cru.fr [195.220.94.79])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id i9QG9YkD000878
	for <linux-lvm@redhat.com>; Tue, 26 Oct 2004 12:09:34 -0400
Received: from [195.220.94.71] (joebar.cru.fr [195.220.94.71])
	by home.cru.fr (8.12.8/8.12.5) with ESMTP id i9QG9GmP002093
	for <linux-lvm@redhat.com>; Tue, 26 Oct 2004 18:09:16 +0200
Message-ID: <417E76AB.3090104@cru.fr>
Date: Tue, 26 Oct 2004 18:09:15 +0200
From: Vincent Carpier - Comite Reseaux des Universites <vincent.carpier@cru.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
	micalg=sha1; boundary="------------ms020903070905050508090304"
Subject: [linux-lvm] LVM and raid5
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
To: LVM general discussion and development <linux-lvm@redhat.com>

This is a cryptographically signed message in MIME format.

--------------ms020903070905050508090304
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
Content-Transfer-Encoding: quoted-printable

<>Hello,
We test LVM on server Dell PE1750 - Fedora 2 - linux 2.6.8-1.521smp -=20
lvm2-2.00.15-2
The VG and LV has create by this install.

I found some very bad performance on the VG !

Example with dump :
<>dump of  / on raid1 without LVM
DUMP: Average transfer rate: 14450 kB/s

<>dump de /usr on raid5 whith LVM
DUMP: Average transfer rate: 9276 kB/s

Did i forget some very important customization ?

 Vincent Carpier

Comit=EF=BF=BD R=EF=BF=BDseau des Universit=EF=BF=BDs
      http://www.cru.fr
--
Validation signature -> http://igc.cru.fr/trust.html
--
Informations sur la signature =EF=BF=BDlectronique et les certificats
                   http://www.cru.fr/igc


--------------ms020903070905050508090304
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
Z2ktYmluL2xvYWRjcmw/Q0E9YWMtdXRpbGlzYXRldXImZm9ybWF0PURFUjBOBgNVHSAERzBF
MEMGDikDBgEEAAG3XwMBAgAEMDEwLwYIKwYBBQUHAgEWI2h0dHA6Ly9pZ2MuY3J1LmZyL3Jl
ZmVyZW5jZXMvcGMucGRmMA0GCSqGSIb3DQEBBAUAA4IBAQB6QLv2WttBvWTlMAmqxxfvoYSO
SVo2HpzEQDwLkampkxI2eBvT902YCV0sWA9VvxowB1hKtA5GSn7XDqu6QGrN/479niz1PUmi
r9o/d16P1G+kDUPgvo6WbN7UV4w1AtTmuCyblYiuDXSdzNCl/4339pM0xoZTspORlxxX1Ncr
KQoxmvm6vwFkGqcoWQzdcJfAe2aHEhFV7dCExumPUGkGEwsyRqU3zwTPJy51KO1HjimMRI5v
uH3dCwvNAdG741YJ70qZPRzTiYZkJQ9LcZjkLKtOz9RLJycbvo2ZpzjvLnWmuwnUgDch4EN8
6vxgQz0VaXhAGlkOY14uXzWcjZEMMIIEpDCCA4ygAwIBAgICApYwDQYJKoZIhvcNAQEEBQAw
VDELMAkGA1UEBhMCRlIxDDAKBgNVBAoTA0NSVTEXMBUGA1UEAxMOYWMtdXRpbGlzYXRldXIx
HjAcBgkqhkiG9w0BCQEWD2NhLWFkbWluQGNydS5mcjAeFw0wNDA2MTExMzQ0MTNaFw0wNTA2
MTExMzQ0MTNaMHYxCzAJBgNVBAYTAkZSMSYwJAYDVQQKEx1Db21pdGUgUmVzZWF1IGRlcyBV
bml2ZXJzaXRlczEYMBYGA1UEAxMPVmluY2VudCBDYXJwaWVyMSUwIwYJKoZIhvcNAQkBFhZ2
aW5jZW50LmNhcnBpZXJAY3J1LmZyMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDH51zi
s/psOuPkLjEqFWwhr7bqSkpe/pP2ipAeqFwhUJnvdgCJDBhwG5PpG3kqAs2+GGqSlU/MGjf3
sGtMlP1zR2z1hO/0tfWZrr7k01gXWUUV2Gh0n4fsFVwZwjT2oxQR+HV54VOCnC/e8ztU2BmM
J3hagG2tVvGkkOzh7u//IwIDAQABo4IB4DCCAdwwDAYDVR0TAQH/BAIwADARBglghkgBhvhC
AQEEBAMCBLAwDgYDVR0PAQH/BAQDAgXgMHAGCWCGSAGG+EIBDQRjFmFDZXJ0aWZpY2F0IGFj
LXV0aWxpc2F0ZXVyLiBQb3VyIHRvdXRlIGluZm9ybWF0aW9uIHNlIHJlcG9ydGVyIOAgaHR0
cDovL2lnYy5jcnUuZnIvYWMtdXRpbGlzYXRldXIvMB0GA1UdDgQWBBT4hGerWiXfRr8WFiY/
JHxij/vQETB3BgNVHSMEcDBugBQVCnwotaymvNf9MjMdeb2zSQoxkKFTpFEwTzELMAkGA1UE
BhMCRlIxDDAKBgNVBAoTA0NSVTESMBAGA1UEAxMJYWMtcmFjaW5lMR4wHAYJKoZIhvcNAQkB
Fg9jYS1hZG1pbkBjcnUuZnKCAQIwTwYDVR0fBEgwRjBEoEKgQIY+aHR0cDovL2lnYy5jcnUu
ZnIvY2dpLWJpbi9sb2FkY3JsP0NBPWFjLXV0aWxpc2F0ZXVyJmZvcm1hdD1ERVIwTgYDVR0g
BEcwRTBDBg4pAwYBBAABt18DAQIABDAxMC8GCCsGAQUFBwIBFiNodHRwOi8vaWdjLmNydS5m
ci9yZWZlcmVuY2VzL3BjLnBkZjANBgkqhkiG9w0BAQQFAAOCAQEAekC79lrbQb1k5TAJqscX
76GEjklaNh6cxEA8C5GpqZMSNngb0/dNmAldLFgPVb8aMAdYSrQORkp+1w6rukBqzf+O/Z4s
9T1Joq/aP3dej9RvpA1D4L6Olmze1FeMNQLU5rgsm5WIrg10nczQpf+N9/aTNMaGU7KTkZcc
V9TXKykKMZr5ur8BZBqnKFkM3XCXwHtmhxIRVe3QhMbpj1BpBhMLMkalN88EzycudSjtR44p
jESOb7h93QsLzQHRu+NWCe9KmT0c04mGZCUPS3GY5CyrTs/USycnG76Nmac47y51prsJ1IA3
IeBDfOr8YEM9FWl4QBpZDmNeLl81nI2RDDGCAo0wggKJAgEBMFowVDELMAkGA1UEBhMCRlIx
DDAKBgNVBAoTA0NSVTEXMBUGA1UEAxMOYWMtdXRpbGlzYXRldXIxHjAcBgkqhkiG9w0BCQEW
D2NhLWFkbWluQGNydS5mcgICApYwCQYFKw4DAhoFAKCCAYkwGAYJKoZIhvcNAQkDMQsGCSqG
SIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMDQxMDI2MTYwOTE1WjAjBgkqhkiG9w0BCQQxFgQU
R2FiS6IT0ZjTLGkXGU+IsD9UhzYwUgYJKoZIhvcNAQkPMUUwQzAKBggqhkiG9w0DBzAOBggq
hkiG9w0DAgICAIAwDQYIKoZIhvcNAwICAUAwBwYFKw4DAgcwDQYIKoZIhvcNAwICASgwaQYJ
KwYBBAGCNxAEMVwwWjBUMQswCQYDVQQGEwJGUjEMMAoGA1UEChMDQ1JVMRcwFQYDVQQDEw5h
Yy11dGlsaXNhdGV1cjEeMBwGCSqGSIb3DQEJARYPY2EtYWRtaW5AY3J1LmZyAgICljBrBgsq
hkiG9w0BCRACCzFcoFowVDELMAkGA1UEBhMCRlIxDDAKBgNVBAoTA0NSVTEXMBUGA1UEAxMO
YWMtdXRpbGlzYXRldXIxHjAcBgkqhkiG9w0BCQEWD2NhLWFkbWluQGNydS5mcgICApYwDQYJ
KoZIhvcNAQEBBQAEgYBFDJ6A5fw8w7BZHMaIz18Kovjv4uo6eQqXprV+6Qv8wG/miKoGwhFY
p3316bloLVDw4or5EfcuyOQdwkdvqvCvL+ajbWtJOO3fmoZxMZkNFjFt6Iis6x34E1IG7ILk
UYkKEvaB1e9mrINGNCw+kmLQgV0D0EuL+l32230jeiTp+wAAAAAAAA==
--------------ms020903070905050508090304--
