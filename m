Message-ID: <38AE95CD.915AC596@alwan.com>
Date: Sat, 19 Feb 2000 07:08:29 -0600
From: Chris Anderson <chris@alwan.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Can we make char files not blocked for the volumes
References: <200002191235.NAA27590@u9etz.164.27.16.48>
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature"; micalg=sha1; boundary="------------msEF7C171D87CCA78CD18EB750"
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
To: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>, "linux-lvm@msede.com" <linux-lvm@msede.com>

This is a cryptographically signed message in MIME format.

--------------msEF7C171D87CCA78CD18EB750
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Heinz Mauelshagen wrote:

> Please have a look at the rawio support for Linux.

Where can I find this?  In the kernel?  Any help would be great.

>
> This enables you to create raw devices for every block device in the system
> including the LVM ones.
>
> Heinz
>
> > Can lvm create char devices not blocked for the volumes?
> >
> > Did a listing in the volume group dir.  Note the char device file
> > (group).  How can we make the other files / volumes the same.  Informix
> > wants char devices not blocked.  I seem to note that linux does not
> > really treat them different but...
> >
> > $ ls -l
> >
> > crw-r-----   1 root     root     109,   0 Jan 29 18:46 group
> > brw-rw----   1 informix informix  58,   1 Jan 29 19:10 infx_data1
> > brw-rw----   1 informix informix  58,   0 Jan 29 19:09 infx_root
> >
> > Thanks,
> >
> >    Chris Anderson
> >     chris@alwan.com
> >
> Content-Description: S/MIME Cryptographic Signature
>
> [Attachment, skipping...]
>
> --
>
> =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
>
> Systemmanagement CS-TS                           T-Nova
>                                                  Entwicklungszentrum Darmstadt
> Heinz Mauelshagen                                Otto-Roehm-Strasse 71c
> Senior Systems Engineer                          Postfach 10 05 41
>                                                  64205 Darmstadt
> mge@EZ-Darmstadt.Telekom.de                      Germany
>                                                  +49 6151 886-425
>                                                           FAX-386
> =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

--------------msEF7C171D87CCA78CD18EB750
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
9w0BCQUxDxcNMDAwMjE5MTMwODQwWjAjBgkqhkiG9w0BCQQxFgQU8VehiZAJ5GFUPA6HUKy0
tOATDeIwJwYJKoZIhvcNAQkPMRowGDAHBgUrDgMCBzANBggqhkiG9w0DAgIBKDANBgkqhkiG
9w0BAQEFAASBgBbPPyhrmTgvX6DD91EBfL9lgdn/gqST2G7IkbfOGuA1SjjCeJ4IxofSoMRY
7K1Z6i2lb+5AvaLnciJxqH+SaslJQ5s1D+tVBAzs3a5fS8vY9FGOgZkvS+clUTX9zOELs6oa
Xl43dXzo8I91bn49WO/kXrxm/vLeLLoe7/A9kRrf
--------------msEF7C171D87CCA78CD18EB750--
