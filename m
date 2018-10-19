Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2459185576
	for <linux-lvm@redhat.com>; Fri, 19 Oct 2018 13:17:00 +0000 (UTC)
Received: from mail.service4.ru (mail.service4.ru [195.201.68.178])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0AA0A9D434
	for <linux-lvm@redhat.com>; Fri, 19 Oct 2018 13:16:58 +0000 (UTC)
Received: from mail.service4.ru (localhost [127.0.0.1])
	by mail.service4.ru (Postfix) with ESMTP id C2D9E407FB
	for <linux-lvm@redhat.com>; Fri, 19 Oct 2018 16:16:56 +0300 (MSK)
Received: from mail.service4.ru ([127.0.0.1])
	by mail.service4.ru (mail.service4.ru [127.0.0.1]) (amavisd-new,
	port 10026) with ESMTP id OLy5YmxzKOmo for <linux-lvm@redhat.com>;
	Fri, 19 Oct 2018 16:16:56 +0300 (MSK)
Received: from ilia (128-68-196-240.broadband.corbina.ru [128.68.196.240])
	by mail.service4.ru (Postfix) with ESMTPSA id ED1854036E
	for <linux-lvm@redhat.com>; Fri, 19 Oct 2018 16:16:55 +0300 (MSK)
References: <de207689-775b-5c36-1443-e035f19ff65f@izyk.ru>
	<06b65c62-8ca2-0d29-b98d-1a1585141f81@redhat.com>
	<8ecbd3c8-4819-9ff2-40b1-315e6ae03c97@izyk.ru>
	<36f0f734-c49f-eaf9-7ff5-8aedfd7345b3@redhat.com>
	<707aafdc-cfd2-3bdd-13bb-1bfdc08c6ad9@assyoma.it>
	<c6043f6f-f10a-5e6f-19ba-b50508e48ee0@redhat.com>
From: Ilia Zykov <mail@izyk.ru>
Message-ID: <e0155a77-fc10-5625-c9e5-b46a0f2ba04e@izyk.ru>
Date: Fri, 19 Oct 2018 16:16:54 +0300
MIME-Version: 1.0
In-Reply-To: <c6043f6f-f10a-5e6f-19ba-b50508e48ee0@redhat.com>
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
	micalg=sha-256; boundary="------------ms000108030803010704000704"
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

--------------ms000108030803010704000704
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 19.10.2018 16:08, Zdenek Kabelac wrote:
> Dne 19. 10. 18 v 14:45 Gionatan Danti napsal(a):
>> On 19/10/2018 12:58, Zdenek Kabelac wrote:
>>> Hi
>>>
>>> Writecache simply doesn't care about caching your reads at all.
>>> Your RAM with it's page caching mechanism keeps read data as long as
>>> there is free RAM for this - the less RAM goes to page cache - less
>>> read operations remains cached.
>>
>> Hi, does it mean that to have *both* fast write cache *and* read cache=

>> one should use a dm-writeback target + a dm-cache writethrough target
>> (possibly pointing to different devices)?
>>
>> Can you quantify/explain why and how faster is dm-writeback for heavy
>> write workload?
>=20
>=20
>=20
> Hi
>=20
> It's rather about different workload takes benefit from different
> caching approaches.
>=20
> If your system is heavy on writes -=C2=A0 dm-writecache is what you wan=
t,
> if you mostly reads - dm-cache will win.
>=20
> That's why there is=C2=A0 dmstats to also help identify hotspots and ov=
eral
> logic.
> There is nothing to win always in all cases - so ATM 2 different target=
s
> are provided -=C2=A0 NVDIMMs already seems to change game a lot...
>=20
> dm-writecache could be seen as 'extension' of your page-cache to held
> longer list of dirty-pages...
>=20
> Zdenek

Sorry, but I don't understand too. What be if reboot happens between data=
 writes from the fast cache to the slow device? After reboot what data wi=
ll be reads? A new data from the fast cache or an old from the slow devic=
e? And what data will be read 'dd if=3D/dev/cached iflag=3Ddirect'?=20
Thanks.


--------------ms000108030803010704000704
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
AQkFMQ8XDTE4MTAxOTEzMTY1NFowLwYJKoZIhvcNAQkEMSIEIO6wNRgqBS/xslEdqSiltpqD
sTrDZyjuxFrLHjXK2zwoMGwGCSqGSIb3DQEJDzFfMF0wCwYJYIZIAWUDBAEqMAsGCWCGSAFl
AwQBAjAKBggqhkiG9w0DBzAOBggqhkiG9w0DAgICAIAwDQYIKoZIhvcNAwICAUAwBwYFKw4D
AgcwDQYIKoZIhvcNAwICASgwgb4GCSsGAQQBgjcQBDGBsDCBrTCBlzELMAkGA1UEBhMCR0Ix
GzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEaMBgGA1UE
ChMRQ09NT0RPIENBIExpbWl0ZWQxPTA7BgNVBAMTNENPTU9ETyBSU0EgQ2xpZW50IEF1dGhl
bnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1haWwgQ0ECEQDve9iFTgXpYUp0Jx8FxGsqMIHABgsq
hkiG9w0BCRACCzGBsKCBrTCBlzELMAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFu
Y2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEaMBgGA1UEChMRQ09NT0RPIENBIExpbWl0ZWQx
PTA7BgNVBAMTNENPTU9ETyBSU0EgQ2xpZW50IEF1dGhlbnRpY2F0aW9uIGFuZCBTZWN1cmUg
RW1haWwgQ0ECEQDve9iFTgXpYUp0Jx8FxGsqMA0GCSqGSIb3DQEBAQUABIIBABzDY92IUW/K
wpZctDyrx80Alx4wlc4Ci2MNwmMPtq/B12Oo9cRt+0+HxgTXNM7yMthsNnHOC5EYaqfje6KN
adra2IDo5RW2HeKcFT8JMMcc4MhHDK3kFwv+N9SW3sk6ql7oZDHjQLJnV8jBXLV4E4/2gCmB
UcI6AoD/DF3xuqXa2BwZBgdpG41szQwHRLz5Ojm37IdRTX/U7msUriFDjuBbnMFat2q8NG0M
qBPpDOVMcmWOcS71M6tVdcFyrQoPPpcw9bwvG9O7SfuX1S7AC1rbEbndzs+ddPrLOIm7RDX0
QY2SY6Rwh6XDeqnuzVvEKTBp3p4KroCJCqmtYi1bYx4AAAAAAAA=
--------------ms000108030803010704000704--
