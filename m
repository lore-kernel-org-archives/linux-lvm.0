Message-ID: <38B1BFF2.769DED19@alwan.com>
Date: Mon, 21 Feb 2000 16:45:06 -0600
From: Chris Anderson <chris@alwan.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Can we make char files not blocked for the volumes
References: <200002191235.NAA27590@u9etz.164.27.16.48>
		<38AE95CD.915AC596@alwan.com> <14513.48287.977291.125248@dukat.scot.redhat.com>
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature"; micalg=sha1; boundary="------------ms8238F721DFC3E9B8B47F0DD3"
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
To: "Stephen C. Tweedie" <sct@redhat.com>, "linux-lvm@msede.com" <linux-lvm@msede.com>

This is a cryptographically signed message in MIME format.

--------------ms8238F721DFC3E9B8B47F0DD3
Content-Type: multipart/alternative;
 boundary="------------482195F7C22F26CD2816EA43"


--------------482195F7C22F26CD2816EA43
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

"Stephen C. Tweedie" wrote:

> Hi,
>
> On Sat, 19 Feb 2000 07:08:29 -0600, Chris Anderson <chris@alwan.com> said:
>
> > Heinz Mauelshagen wrote:
> >> Please have a look at the rawio support for Linux.
>
> > Where can I find this?  In the kernel?  Any help would be great.
>
> 2.3 has it, and there are 2.2 patches on
>
> ftp://ftp.uk.linux.org/pub/linux/sct/fs/raw-io

Thanks.  I used the link and download the files.

 It is odd how it is used.  I had to hack it into 2.2.14, but go it working.
I think the "raw" command is odd, also it needs to be run every time you
reboot.  Also who is the owner of this code. How does it find its way into
the standard 2.3 and lvm has not yet?  That is odd too.

My test with Informix IDS 7.3 for linux showed that the raw io is twice as
slow.  A 17 mins load under block device using lvm but took 31mins for the
raw linked version.  I will be testing the Informix 9.2 version tonight.  I
could not find much doc from informix other then the device need to be
char/raw.

Anyone using raw out there?  Did you find that you must call raw at reboot to
link back?  Who is the owner of the code?  What are the next step for the raw
code? Any thing would be great?

Thanks,

   Chris Anderson

>
>
> It comes with all recent Red Hat and SuSE distributions as standard,
> btw.  I'm not sure about other distributions (anyone know?)
>
> --Stephen

--------------482195F7C22F26CD2816EA43
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: 7bit

<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<html>
"Stephen C. Tweedie" wrote:
<blockquote TYPE=CITE>Hi,
<p>On Sat, 19 Feb 2000 07:08:29 -0600, Chris Anderson &lt;chris@alwan.com>
said:
<p>> Heinz Mauelshagen wrote:
<br>>> Please have a look at the rawio support for Linux.
<p>> Where can I find this?&nbsp; In the kernel?&nbsp; Any help would be
great.
<p>2.3 has it, and there are 2.2 patches on
<p><a href="ftp://ftp.uk.linux.org/pub/linux/sct/fs/raw-io">ftp://ftp.uk.linux.org/pub/linux/sct/fs/raw-io</a></blockquote>
Thanks.&nbsp; I used the link and download the files.
<p>&nbsp;It is odd how it is used.&nbsp; I had to hack it into 2.2.14,
but go it working.&nbsp; I think the "raw" command is odd, also it needs
to be run every time you reboot.&nbsp; Also who is the owner of this code.
How does it find its way into the standard 2.3 and lvm has not yet?&nbsp;
That is odd too.
<p>My test with Informix IDS 7.3 for linux showed that the raw io is twice
as slow.&nbsp; A 17 mins load under block device using lvm but took 31mins
for the raw linked version.&nbsp; I will be testing the Informix 9.2 version
tonight.&nbsp; I could not find much doc from informix other then the device
need to be char/raw.
<p>Anyone using raw out there?&nbsp; Did you find that you must call raw
at reboot to link back?&nbsp; Who is the owner of the code?&nbsp; What
are the next step for the raw code? Any thing would be great?
<p>Thanks,
<p>&nbsp;&nbsp; Chris Anderson
<blockquote TYPE=CITE><a href="ftp://ftp.uk.linux.org/pub/linux/sct/fs/raw-io"></a>&nbsp;
<p>It comes with all recent Red Hat and SuSE distributions as standard,
<br>btw.&nbsp; I'm not sure about other distributions (anyone know?)
<p>--Stephen</blockquote>
</html>

--------------482195F7C22F26CD2816EA43--

--------------ms8238F721DFC3E9B8B47F0DD3
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
9w0BCQUxDxcNMDAwMjIxMjI0NTA4WjAjBgkqhkiG9w0BCQQxFgQUj5AyDYQ6p+5qZjI3ExJ1
fzwxu4EwJwYJKoZIhvcNAQkPMRowGDAHBgUrDgMCBzANBggqhkiG9w0DAgIBKDANBgkqhkiG
9w0BAQEFAASBgNdT/03pYj2VtF1MlyQp4SUKm+Pb0gz+c06pbSswEQxarlczRnHtcA+L3oxG
0h7u3FRyvs1BTlcvWu3sC1VEqbT1Ts0XkEktDRNECEc0IKq4DzZBN45xNKTwa42y1B/+P/3Y
ee2vxuDMpZoe+a1ZRWoQbf4KA+cXbg3i2lyaRxVD
--------------ms8238F721DFC3E9B8B47F0DD3--
