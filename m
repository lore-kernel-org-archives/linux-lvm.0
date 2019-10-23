Received: from mx1.redhat.com (ext-mx20.extmail.prod.ext.phx2.redhat.com
	[10.5.110.49])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ED7A75DE5B
	for <linux-lvm@redhat.com>; Wed, 23 Oct 2019 12:12:56 +0000 (UTC)
Received: from mail.service4.ru (mail.service4.ru [95.217.67.65])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A12B03086246
	for <linux-lvm@redhat.com>; Wed, 23 Oct 2019 12:12:53 +0000 (UTC)
Received: from mail.service4.ru (localhost [127.0.0.1])
	by mail.service4.ru (Postfix) with ESMTP id 0F9AC40962
	for <linux-lvm@redhat.com>; Wed, 23 Oct 2019 15:12:52 +0300 (MSK)
Received: from mail.service4.ru ([127.0.0.1])
	by mail.service4.ru (mail.service4.ru [127.0.0.1]) (amavisd-new,
	port 10026) with ESMTP id ct591czGFMVq for <linux-lvm@redhat.com>;
	Wed, 23 Oct 2019 15:12:51 +0300 (MSK)
Received: from ilia (unknown [95.217.67.1])
	by mail.service4.ru (Postfix) with ESMTPSA id 3F12540310
	for <linux-lvm@redhat.com>; Wed, 23 Oct 2019 15:12:51 +0300 (MSK)
References: <c1598cf7-442e-13c5-5877-c6e2667bb4bd@gmail.com>
	<909d4cae-ddd2-3951-eee8-8dec8faa6f22@redhat.com>
	<def626d9-52ef-4761-ebe0-3a29bd664bb1@gmail.com>
	<f1f7dfc1-dfd8-a023-5305-2065446a890e@redhat.com>
	<alpine.LRH.2.21.1910221142290.1156@fairfax.gathman.org>
	<f3a53c24-1f91-e5f5-e7e1-091b886da44a@redhat.com>
	<f73ab6ce-ba22-34f8-7153-e876b13fab5c@assyoma.it>
From: Ilia Zykov <mail@service4.ru>
Message-ID: <4daf9dc2-c2b4-7191-80c4-fa2073d7b5e9@service4.ru>
Date: Wed, 23 Oct 2019 15:12:52 +0300
MIME-Version: 1.0
In-Reply-To: <f73ab6ce-ba22-34f8-7153-e876b13fab5c@assyoma.it>
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
	micalg=sha-256; boundary="------------ms020701070205010904000503"
Subject: Re: [linux-lvm] exposing snapshot block device
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

This is a cryptographically signed message in MIME format.

--------------ms020701070205010904000503
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 23.10.2019 14:08, Gionatan Danti wrote:
>=20
> For example, consider a completely filled 64k chunk thin volume (with
> thinpool having ample free space). Snapshotting it and writing a 4k
> block on origin will obviously cause a read of the original 64k chunk,
> an in-memory change of the 4k block and a write of the entire modified
> 64k block to a new location. But writing, say, a 1 MB block should *not=
*
> cause the same read on source: after all, the read data will be
> immediately discarded, overwritten by the changed 1 MB block.
>=20
> However, my testing shows that source chunks are always read, even when=

> completely overwritten.

Not only read but sometimes write.
I watched it without snapshot. Only zeroing was enabled. Before wrote
new chunks "dd bs=3D1048576 ..." chunks were zeroed. But for security it'=
s
good. IMHO: In this case best choice firstly write chunks to the disk
and then give this chunks to the volume.

>=20
> Am I missing something?
>=20




--------------ms020701070205010904000503
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCC
C5gwggVJMIIEMaADAgECAhB4cYLFWiS6TlQZt1XHO6t8MA0GCSqGSIb3DQEBCwUAMIGCMQsw
CQYDVQQGEwJJVDEPMA0GA1UECAwGTWlsYW5vMQ8wDQYDVQQHDAZNaWxhbm8xIzAhBgNVBAoM
GkFjdGFsaXMgUy5wLkEuLzAzMzU4NTIwOTY3MSwwKgYDVQQDDCNBY3RhbGlzIENsaWVudCBB
dXRoZW50aWNhdGlvbiBDQSBHMTAeFw0xOTA4MTUxMzIzMjhaFw0yMDA4MTUxMzIzMjhaMBsx
GTAXBgNVBAMMEG1haWxAc2VydmljZTQucnUwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEK
AoIBAQCVtIsFGaETpCy13RrPlkkWnljEyXpI9AXCaVqXgwJ1Zw6rnUndl3FPB6L7e4tnaT2w
OAXak0cbxS4AlUOXfYA6cSfS42n5QUOdo7HKoS+F50hYeiwXetF6q2UejDcdTXQsXLwXyk3d
ROvzGgQ3wyANWElQHOJ+3LIujEmNxMv5h9CMZuEA/yFyaVHxzfRX1mzxnDIywQrsXxjVrnaM
r+3AJDezkq0qkIWA9+JFfcCcLrKVOD7sKG9wwZ1XlRljYgQDV1OHhTsJoti8fBWtofDCNkmy
7NtocVHQ/Krux0i3e8xl2oS7LVoViSKJ5pUhVCzLJyX8XOE7ue1X9iTGp+gFAgMBAAGjggIf
MIICGzAMBgNVHRMBAf8EAjAAMB8GA1UdIwQYMBaAFH5g/Phspz09166ToXkCj7N0KTv1MEsG
CCsGAQUFBwEBBD8wPTA7BggrBgEFBQcwAoYvaHR0cDovL2NhY2VydC5hY3RhbGlzLml0L2Nl
cnRzL2FjdGFsaXMtYXV0Y2xpZzEwGwYDVR0RBBQwEoEQbWFpbEBzZXJ2aWNlNC5ydTBHBgNV
HSAEQDA+MDwGBiuBHwEYATAyMDAGCCsGAQUFBwIBFiRodHRwczovL3d3dy5hY3RhbGlzLml0
L2FyZWEtZG93bmxvYWQwHQYDVR0lBBYwFAYIKwYBBQUHAwIGCCsGAQUFBwMEMIHoBgNVHR8E
geAwgd0wgZuggZiggZWGgZJsZGFwOi8vbGRhcDA1LmFjdGFsaXMuaXQvY24lM2RBY3RhbGlz
JTIwQ2xpZW50JTIwQXV0aGVudGljYXRpb24lMjBDQSUyMEcxLG8lM2RBY3RhbGlzJTIwUy5w
LkEuLzAzMzU4NTIwOTY3LGMlM2RJVD9jZXJ0aWZpY2F0ZVJldm9jYXRpb25MaXN0O2JpbmFy
eTA9oDugOYY3aHR0cDovL2NybDA1LmFjdGFsaXMuaXQvUmVwb3NpdG9yeS9BVVRIQ0wtRzEv
Z2V0TGFzdENSTDAdBgNVHQ4EFgQUgCpQAAD0UTKv6ZEg7yBkU1mt5vAwDgYDVR0PAQH/BAQD
AgWgMA0GCSqGSIb3DQEBCwUAA4IBAQBalXd7ytQdG2BOxQ4dKhXLsqz/UtbmgFOz26u2XnSb
ttiq6INAdtDOyjqLDAVwRA6VDzNd/3I7jUzpVVl1iEAm3K/f3fjANb00EE4c5w7QCH1YQ3MB
eu2HVlfxCrrFC1ZrhvuCypKwXNOuDdFYpxMyPLWaU5wIjyU5TWbJyXdYgd1+KRad2vSwO+2k
BLkrn0ApSeTBuK9PhWcQbH/SDD8KrAIjQOAmyqiywaJPjtHLGkObyh8JqAkg9HeiVtmlqvOe
xp3/oXdbTnYUuEFGXyUofoRiOhPB5Hh1f2T8XFZxg5hay5cKU3RB1Y4UkxG5xEjPYj+ASes9
bkxdaIYB9i60MIIGRzCCBC+gAwIBAgIILNSK07EeD4kwDQYJKoZIhvcNAQELBQAwazELMAkG
A1UEBhMCSVQxDjAMBgNVBAcMBU1pbGFuMSMwIQYDVQQKDBpBY3RhbGlzIFMucC5BLi8wMzM1
ODUyMDk2NzEnMCUGA1UEAwweQWN0YWxpcyBBdXRoZW50aWNhdGlvbiBSb290IENBMB4XDTE1
MDUxNDA3MTQxNVoXDTMwMDUxNDA3MTQxNVowgYIxCzAJBgNVBAYTAklUMQ8wDQYDVQQIDAZN
aWxhbm8xDzANBgNVBAcMBk1pbGFubzEjMCEGA1UECgwaQWN0YWxpcyBTLnAuQS4vMDMzNTg1
MjA5NjcxLDAqBgNVBAMMI0FjdGFsaXMgQ2xpZW50IEF1dGhlbnRpY2F0aW9uIENBIEcxMIIB
IjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAwPzBiVbZiOL0BGW/zQk1qygpMP4Myvcn
qxwR7oY9XeT1bES2DFczlZfeiIqNLanbkyqTxydXZ+kxoS9071qWsZ6zS+pxSqXLs+RTvndE
aWx5hdHZcKNWGzhy5FiO4GZvGlFInFEiaY+dOEpjjWvSeXpvcDpnYw6M9AXuHo4JhjC3P/OK
//5QFXnztTa4iU66RpLteOTgCtiRCwZNKx8EFeqqfTpYvfEb4H91E7n+Y61jm0d2E8fJ2wGT
aSSwjc8nTI2ApXujoczukb2kHqwaGP3q5UuedWcnRZc65XUhK/Z6K32KvrQuNP32F/5MxkvE
DnJpUnnt9iMExvEzn31zDQIDAQABo4IB1TCCAdEwQQYIKwYBBQUHAQEENTAzMDEGCCsGAQUF
BzABhiVodHRwOi8vb2NzcDA1LmFjdGFsaXMuaXQvVkEvQVVUSC1ST09UMB0GA1UdDgQWBBR+
YPz4bKc9Pdeuk6F5Ao+zdCk79TAPBgNVHRMBAf8EBTADAQH/MB8GA1UdIwQYMBaAFFLYiDrI
n3hm7YnzezhwlMkCAjbQMEUGA1UdIAQ+MDwwOgYEVR0gADAyMDAGCCsGAQUFBwIBFiRodHRw
czovL3d3dy5hY3RhbGlzLml0L2FyZWEtZG93bmxvYWQwgeMGA1UdHwSB2zCB2DCBlqCBk6CB
kIaBjWxkYXA6Ly9sZGFwMDUuYWN0YWxpcy5pdC9jbiUzZEFjdGFsaXMlMjBBdXRoZW50aWNh
dGlvbiUyMFJvb3QlMjBDQSxvJTNkQWN0YWxpcyUyMFMucC5BLiUyZjAzMzU4NTIwOTY3LGMl
M2RJVD9jZXJ0aWZpY2F0ZVJldm9jYXRpb25MaXN0O2JpbmFyeTA9oDugOYY3aHR0cDovL2Ny
bDA1LmFjdGFsaXMuaXQvUmVwb3NpdG9yeS9BVVRILVJPT1QvZ2V0TGFzdENSTDAOBgNVHQ8B
Af8EBAMCAQYwDQYJKoZIhvcNAQELBQADggIBAE2TztUkvkEbShZYc19lifLZej5YjLzLxA/l
WxZnssFLpDPySfzMmndz3F06S51ltwDe+blTwcpdzUl3M2alKH3bOr855ku9Rr6uedya+HGQ
UT0OhqDo2K2CAE9nBcfANxifjfT8XzCoC3ctf9ux3og1WuE8WTcLZKgCMuNRBmJte9C4Ug0w
3iXqPzq8KuRRobNKqddPjk3EiK+QA+EFCCka1xOLh/7cPGTJMNta1/0u5oLiXaOAHeALt/nq
eZ2kZ+lizK8oTv4in5avIf3ela3oL6vrwpTca7TZxTX90e805dZQN4qRVPdPbrBlWtNozH7S
dLeLrcoN8l2EXO6190GAJYdynTc2E6EyrLVGcDKUX91VmCSRrqEppZ7W05TbWRLi6+wPjAzm
Tq2XSmKfajq7juTKgkkw7FFJByixa0NdSZosdQb3VkLqG8EOYOamZLqH+v7ua0+ulg7FOviF
beZ7YR9eRO81O8FC1uLgutlyGD2+GLjgQnsvneDsbNAWfkory+qqAxvVzX5PSaQp2pJ52AaI
H1MN1i2/geRSP83TRMrFkwuIMzDhXxKFQvpspNc19vcTryzjtwP4xq0WNS4YWPS4U+9mW+U0
Cgnsgx9fMiJNbLflf5qSb53j3AGHnjK/qJzPa39wFTXLXB648F3w1Qf9R7eZeTRJfCQY/fJU
MYICnTCCApkCAQEwgZcwgYIxCzAJBgNVBAYTAklUMQ8wDQYDVQQIDAZNaWxhbm8xDzANBgNV
BAcMBk1pbGFubzEjMCEGA1UECgwaQWN0YWxpcyBTLnAuQS4vMDMzNTg1MjA5NjcxLDAqBgNV
BAMMI0FjdGFsaXMgQ2xpZW50IEF1dGhlbnRpY2F0aW9uIENBIEcxAhB4cYLFWiS6TlQZt1XH
O6t8MA0GCWCGSAFlAwQCAQUAoIHXMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZI
hvcNAQkFMQ8XDTE5MTAyMzEyMTI1M1owLwYJKoZIhvcNAQkEMSIEIOritgBn33WFWpoq9T/C
0xrFhrM+n491gGTsulphnr9rMGwGCSqGSIb3DQEJDzFfMF0wCwYJYIZIAWUDBAEqMAsGCWCG
SAFlAwQBAjAKBggqhkiG9w0DBzAOBggqhkiG9w0DAgICAIAwDQYIKoZIhvcNAwICAUAwBwYF
Kw4DAgcwDQYIKoZIhvcNAwICASgwDQYJKoZIhvcNAQEBBQAEggEAeSAsfKsTQccN4jP9luGR
fUEQtSrN/6dkjd/UtIgnrm3/nxLUBLqwurrRaR5HG8HA1ad/E9mlmwt6kpQky4KVqCFcAXmM
oo7nECKKGpw3mmPH7JjP3ZYUfe1H8W8910CwTsBA9hTdICol5fGvTEgkgF0M726s/btiCCYf
j5RK8ytdITLrpdx/o5VfapJzfYPxFWCVnOMv4jfLFCi4W7V8zBapv2KMFLS8OyCRWQ34oB3R
TEFHEeCd7cenm33MP+81kscvxR5EA9+mdSu0gi4VLcrOjw3hjY/GpeUZY5Z1xb92utitsu82
DzT/USFYgDzi7HjQTbdFCa6JeEcgrO/EHwAAAAAAAA==
--------------ms020701070205010904000503--
