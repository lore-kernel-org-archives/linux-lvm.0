Message-ID: <38A444BD.E7027411@alwan.com>
Date: Fri, 11 Feb 2000 11:19:57 -0600
From: Chris Anderson <chris@alwan.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Mirroring
References: <38A431B0.C4B1114E@alwan.com> <20000211162518.0A595E81E@seneca.muc.de>
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature"; micalg=sha1; boundary="------------ms9F729093D8D4B6A0D1E097DA"
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
To: h.milz@seneca.muc.de, "linux-lvm@msede.com" <linux-lvm@msede.com>

This is a cryptographically signed message in MIME format.

--------------ms9F729093D8D4B6A0D1E097DA
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Harald Milz wrote:

> Chris Anderson <chris@alwan.com> wrote:
> > I have looked through the doc and I see that LVM stripes but how do you
> > setup a true mirror?  One hard dive mirrored to another hard drive (1 to
> > 1).
>
> It's more like one partition or logical volume mirrored against another
> one (not necessarily disks - you seem to be familiar with Novell). LVM
> can't do this. Use MD.

I know veritas.  It has a SubDisk, Plex Volume setup.  A subdisk is part of a
disk and one or more subdisk make a Plex and one or more plexes make a
volume.  And a volume can be used as a mount point or whatever.

So if a disk goes bad only plexes with use a subdisk from that disk are
down.  And if a volume has two plex only one need to be up to run.  Later the
plex can be re-joined back to the volume and the data is synched back to the
other plex.

In a nut shell what happens when one disk goes down with LVM?  Can it be
setup to keep the volume up and alive and run and if so what is the best way?

>
>
> --
> If you sit down at a poker game and don't see a sucker, get up.  You're
> the sucker.

--------------ms9F729093D8D4B6A0D1E097DA
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIIKpgYJKoZIhvcNAQcCoIIKlzCCCpMCAQExCzAJBgUrDgMCGgUAMAsGCSqGSIb3DQEHAaCC
CF0wggUnMIIEkKADAgECAhA14LyrFmviXOa5H/eKmM+TMA0GCSqGSIb3DQEBBAUAMIHMMRcw
FQYDVQQKEw5WZXJpU2lnbiwgSW5jLjEfMB0GA1UECxMWVmVyaVNpZ24gVHJ1c3QgTmV0d29y
azFGMEQGA1UECxM9d3d3LnZlcmlzaWduLmNvbS9yZXBvc2l0b3J5L1JQQSBJbmNvcnAuIEJ5
IFJlZi4sTElBQi5MVEQoYyk5ODFIMEYGA1UEAxM/VmVyaVNpZ24gQ2xhc3MgMSBDQSBJbmRp
dmlkdWFsIFN1YnNjcmliZXItUGVyc29uYSBOb3QgVmFsaWRhdGVkMB4XDTAwMDIwNzAwMDAw
MFoXDTAxMDIwNjIzNTk1OVowggEQMRcwFQYDVQQKEw5WZXJpU2lnbiwgSW5jLjEfMB0GA1UE
CxMWVmVyaVNpZ24gVHJ1c3QgTmV0d29yazFGMEQGA1UECxM9d3d3LnZlcmlzaWduLmNvbS9y
ZXBvc2l0b3J5L1JQQSBJbmNvcnAuIGJ5IFJlZi4sTElBQi5MVEQoYyk5ODEeMBwGA1UECxMV
UGVyc29uYSBOb3QgVmFsaWRhdGVkMTMwMQYDVQQLEypEaWdpdGFsIElEIENsYXNzIDEgLSBO
ZXRzY2FwZSBGdWxsIFNlcnZpY2UxFzAVBgNVBAMUDkNocmlzIEFuZGVyc29uMR4wHAYJKoZI
hvcNAQkBFg9jaHJpc0BhbHdhbi5jb20wgZ8wDQYJKoZIhvcNAQEBBQADgY0AMIGJAoGBAN31
Pw5bIWCEGpDtVb3kV1G7JEMH/ECRNxH4s9EfaJZ0T5ee/nm0BujUEu0ek3RqAouEBxz5o0vy
oZBxBBf5AAyUyAFVbComcVQfWRJ2rDCvOe6cpsPCa9AAweMESWd1IUaE2GHU9QYwVdg+viyu
0DmDaYqBCOsfpYQzMvnCNh3pAgMBAAGjggHBMIIBvTAJBgNVHRMEAjAAMIGsBgNVHSAEgaQw
gaEwgZ4GC2CGSAGG+EUBBwEBMIGOMCgGCCsGAQUFBwIBFhxodHRwczovL3d3dy52ZXJpc2ln
bi5jb20vQ1BTMGIGCCsGAQUFBwICMFYwFRYOVmVyaVNpZ24sIEluYy4wAwIBARo9VmVyaVNp
Z24ncyBDUFMgaW5jb3JwLiBieSByZWZlcmVuY2UgbGlhYi4gbHRkLiAoYyk5NyBWZXJpU2ln
bjARBglghkgBhvhCAQEEBAMCB4AwgYYGCmCGSAGG+EUBBgMEeBZ2ZDQ2NTJiZDYzZjIwNDcw
MjkyOTg3NjNjOWQyZjI3NTA2OWM3MzU5YmVkMWIwNTlkYTc1YmM0YmM5NzAxNzQ3ZGE1ZDNm
MjE0MWJlYWRiMmJkMmU4OTIxMGFkNmJmM2QyMTE0ODljYTFiMjQ0ZmFmM2VhNDUwYzAwBgpg
hkgBhvhFAQYHBCIWIDZkNjgwYWY3ZGM0NWE5OWM1NTJkN2Q3YjRjYTI4OGRjMDMGA1UdHwQs
MCowKKAmoCSGImh0dHA6Ly9jcmwudmVyaXNpZ24uY29tL2NsYXNzMS5jcmwwDQYJKoZIhvcN
AQEEBQADgYEAfxMC1IcZq/V/Mi9W8Ngok5Tg4ru3Z/kNihrBpkzXbwkx2MOqD6iPLHmv3MP4
g0x1f5noUVEKAbiMh9r9T2EhezsdyfGSS4EcGH0AFmpovR4FD5RK3sjtoFQ9ETO/WLGzwY33
LkUP3Zd3XtgB7/1zqYio4uaPr+iHedKIeAn6d3EwggMuMIICl6ADAgECAhEA0nYujRQMPX2y
qCVdr+4NdTANBgkqhkiG9w0BAQIFADBfMQswCQYDVQQGEwJVUzEXMBUGA1UEChMOVmVyaVNp
Z24sIEluYy4xNzA1BgNVBAsTLkNsYXNzIDEgUHVibGljIFByaW1hcnkgQ2VydGlmaWNhdGlv
biBBdXRob3JpdHkwHhcNOTgwNTEyMDAwMDAwWhcNMDgwNTEyMjM1OTU5WjCBzDEXMBUGA1UE
ChMOVmVyaVNpZ24sIEluYy4xHzAdBgNVBAsTFlZlcmlTaWduIFRydXN0IE5ldHdvcmsxRjBE
BgNVBAsTPXd3dy52ZXJpc2lnbi5jb20vcmVwb3NpdG9yeS9SUEEgSW5jb3JwLiBCeSBSZWYu
LExJQUIuTFREKGMpOTgxSDBGBgNVBAMTP1ZlcmlTaWduIENsYXNzIDEgQ0EgSW5kaXZpZHVh
bCBTdWJzY3JpYmVyLVBlcnNvbmEgTm90IFZhbGlkYXRlZDCBnzANBgkqhkiG9w0BAQEFAAOB
jQAwgYkCgYEAu1pEigQWu1X9A3qKLZRPFXg2uA1Ksm+cVL+86HcqnbnwaLuV2TFBcHqBS7lI
E1YtxwjhhEKrwKKSq0RcqkLwgg4C6S/7wju7vsknCl22sDZCM7VuVIhPh0q/Gdr5FegPh7Yc
48zGmo5/aiSS4/zgZbqnsX7vyds3ashKyAkG5JkCAwEAAaN8MHowEQYJYIZIAYb4QgEBBAQD
AgEGMEcGA1UdIARAMD4wPAYLYIZIAYb4RQEHAQEwLTArBggrBgEFBQcCARYfd3d3LnZlcmlz
aWduLmNvbS9yZXBvc2l0b3J5L1JQQTAPBgNVHRMECDAGAQH/AgEAMAsGA1UdDwQEAwIBBjAN
BgkqhkiG9w0BAQIFAAOBgQCIuDc73dqUNwCtqp/hgQFxHpJqbS/28Z3TymQ43BuYDAeGW4UV
ag+5SYWklfEXfWe0fy0s3ZpCnsM+tI6q5QsG3vJWKvozx74Z11NMw73I4xe1pElCY+zCphcP
XVgaSTyQXFWjZSAA/Rgg5V+CprGoksVYasGNAzzrw80FopCubjGCAhEwggINAgEBMIHhMIHM
MRcwFQYDVQQKEw5WZXJpU2lnbiwgSW5jLjEfMB0GA1UECxMWVmVyaVNpZ24gVHJ1c3QgTmV0
d29yazFGMEQGA1UECxM9d3d3LnZlcmlzaWduLmNvbS9yZXBvc2l0b3J5L1JQQSBJbmNvcnAu
IEJ5IFJlZi4sTElBQi5MVEQoYyk5ODFIMEYGA1UEAxM/VmVyaVNpZ24gQ2xhc3MgMSBDQSBJ
bmRpdmlkdWFsIFN1YnNjcmliZXItUGVyc29uYSBOb3QgVmFsaWRhdGVkAhA14LyrFmviXOa5
H/eKmM+TMAkGBSsOAwIaBQCggYYwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG
9w0BCQUxDxcNMDAwMjExMTcxOTU5WjAjBgkqhkiG9w0BCQQxFgQUQj0pP3KIEt/MpBEFkQVK
qFiwX0QwJwYJKoZIhvcNAQkPMRowGDAHBgUrDgMCBzANBggqhkiG9w0DAgIBKDANBgkqhkiG
9w0BAQEFAASBgAIx+MV+1ydqYy8/2pIJ786Jw30yYy9lnKFuy2sWToC0EK5MDIFfPL3uyPwb
FfXb/CJOZaHIgKDpaYvHivgd2kZPreCJIZUhD8oYuUdDG2GqbR49szmOjCA91xWrJ9N+nuCR
zyIpXT6781RaK/scU8QLIP3rxi3YjbfVdHPOM/Bs
--------------ms9F729093D8D4B6A0D1E097DA--
