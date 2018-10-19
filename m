Received: from mx1.redhat.com (ext-mx20.extmail.prod.ext.phx2.redhat.com
	[10.5.110.49])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5FC9A60851
	for <linux-lvm@redhat.com>; Fri, 19 Oct 2018 09:55:15 +0000 (UTC)
Received: from mail.service4.ru (mail.service4.ru [195.201.68.178])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id ED48530B96FB
	for <linux-lvm@redhat.com>; Fri, 19 Oct 2018 09:55:12 +0000 (UTC)
Received: from mail.service4.ru (localhost [127.0.0.1])
	by mail.service4.ru (Postfix) with ESMTP id 4F5A5407FB
	for <linux-lvm@redhat.com>; Fri, 19 Oct 2018 12:55:11 +0300 (MSK)
Received: from mail.service4.ru ([127.0.0.1])
	by mail.service4.ru (mail.service4.ru [127.0.0.1]) (amavisd-new,
	port 10026) with ESMTP id q60dlh1QxNtM for <linux-lvm@redhat.com>;
	Fri, 19 Oct 2018 12:55:10 +0300 (MSK)
Received: from ilia (89-178-222-191.broadband.corbina.ru [89.178.222.191])
	by mail.service4.ru (Postfix) with ESMTPSA id 77685404DA
	for <linux-lvm@redhat.com>; Fri, 19 Oct 2018 12:55:10 +0300 (MSK)
References: <de207689-775b-5c36-1443-e035f19ff65f@izyk.ru>
	<06b65c62-8ca2-0d29-b98d-1a1585141f81@redhat.com>
From: Ilia Zykov <mail@izyk.ru>
Message-ID: <8ecbd3c8-4819-9ff2-40b1-315e6ae03c97@izyk.ru>
Date: Fri, 19 Oct 2018 12:55:09 +0300
MIME-Version: 1.0
In-Reply-To: <06b65c62-8ca2-0d29-b98d-1a1585141f81@redhat.com>
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
	micalg=sha-256; boundary="------------ms000502030407030903080203"
Subject: Re: [linux-lvm] Why doesn't the lvmcache support the discard (trim)
 command?
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
To: LVM general discussion and development <linux-lvm@redhat.com>

This is a cryptographically signed message in MIME format.

--------------ms000502030407030903080203
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 19.10.2018 12:12, Zdenek Kabelac wrote:
> Dne 19. 10. 18 v 0:56 Ilia Zykov napsal(a):
>> Maybe it will be implemented later? But it seems to me a little
>> strange when there is no way to clear the cache from a garbage.
>> Maybe I do not understand? Can you please explain this behavior.
>> For example:
>=20
> Hi
>=20
> Applying my brain logic here:
>=20
> Cache (by default) operates on 32KB chunks.
> SSD (usually) have the minimal size of trimable block as 512KB.
>=20
> Conclusion can be there is non-trivial to even implement TRIM support
> for cache - as something would need to keep a secondary data structure
> which would keep the information about which all cached blocks are
> completely 'unused/trimmed' and available from a 'complete block trim'
> (i.e. something like when ext4=C2=A0 implements 'fstrim' support.)
>=20
> Second thought -=C2=A0 if there is a wish to completely 'erase' cache -=
 there
> is very simple path by using 'lvconvert --uncache' - and once the cache=

> is needed again, create cache again from scratch.
>=20
> Note - dm-cache is SLOW moving cache - so it doesn't target acceleratio=
n
> one-time usage - i.e. if you read block just once from slow storage - i=
t
> doesn't mean it will be immediately cached.
>=20
> Dm-cache is about keeping info about used blocks on 'slow' storage (hdd=
)
> which typically does not support/implemnent TRIM. There could be
> possibly a multi-layer cache, where even the cached device can handle
> TRIM - but this kind on construct is not really support and it's even
> unclear if it would make any sense to introduce this concept ATM=C2=A0 =
(since
> there would need to be some well measurable benefit).
>=20
> And final note - there is upcoming support for accelerating writes with=

> new dm-writecache target.
>=20
> Regards
>=20
>=20
> Zdenek
>=20

Thank you, I supposed it is so.
One more little question about dm-writecache:
The description says that:

"It doesn't cache reads because reads are supposed to be cached in page c=
ache
in normal RAM."

Is it only mean, missing reads not promoted to the cache?



--------------ms000502030407030903080203
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
s3DqAf4cXxMiEKcff7PNa4M3RGTqH0pWR8p6EjGCBDgwggQ0AgEBMIGtMIGXMQswCQYDVQQG
EwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVyMRAwDgYDVQQHEwdTYWxmb3JkMRow
GAYDVQQKExFDT01PRE8gQ0EgTGltaXRlZDE9MDsGA1UEAxM0Q09NT0RPIFJTQSBDbGllbnQg
QXV0aGVudGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQQIRAO972IVOBelhSnQnHwXEayow
DQYJYIZIAWUDBAIBBQCgggJbMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcN
AQkFMQ8XDTE4MTAxOTA5NTUwOVowLwYJKoZIhvcNAQkEMSIEIA0FmKRHCAkyJf17Vq9+x8ff
PZZgipLf4b236wAC1wfFMGwGCSqGSIb3DQEJDzFfMF0wCwYJYIZIAWUDBAEqMAsGCWCGSAFl
AwQBAjAKBggqhkiG9w0DBzAOBggqhkiG9w0DAgICAIAwDQYIKoZIhvcNAwICAUAwBwYFKw4D
AgcwDQYIKoZIhvcNAwICASgwgb4GCSsGAQQBgjcQBDGBsDCBrTCBlzELMAkGA1UEBhMCR0Ix
GzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEaMBgGA1UE
ChMRQ09NT0RPIENBIExpbWl0ZWQxPTA7BgNVBAMTNENPTU9ETyBSU0EgQ2xpZW50IEF1dGhl
bnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1haWwgQ0ECEQDve9iFTgXpYUp0Jx8FxGsqMIHABgsq
hkiG9w0BCRACCzGBsKCBrTCBlzELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFu
Y2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEaMBgGA1UEChMRQ09NT0RPIENBIExpbWl0ZWQx
PTA7BgNVBAMTNENPTU9ETyBSU0EgQ2xpZW50IEF1dGhlbnRpY2F0aW9uIGFuZCBTZWN1cmUg
RW1haWwgQ0ECEQDve9iFTgXpYUp0Jx8FxGsqMA0GCSqGSIb3DQEBAQUABIIBAEq8ZX+12tQs
378MTce9OHDN2kECbwlAln6vbpbxIvfLcCLZJ8J5sIH3ibVU96CwUHRYsqOIUgbXYLv0Jocm
rs+QrOp/WMeB3nPjL5F8DZ0h03UHjV+BQyKM2jtj9aPDbcEeq1KoyYBV0zG0EcJKaK+b9NLa
/aSBHA/Z6SOlWHq1Tfl1VsEI5Apy6DY21Yb/BFbHsCFvPQ9N4l9kI79H73Yr7FMcE6LJXEG+
8Vq0wS/JmYjKTSOI2o5bpRJrI/jdfCs0nTTEefaQliKipMNuOW607Sp6luIShiGALh0Iv0kA
5nygdmQN5x7A1YOyvHdg5O6Gfs2E8RUWnVaIeyq6Y6IAAAAAAAA=
--------------ms000502030407030903080203--
