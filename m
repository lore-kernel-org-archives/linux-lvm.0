Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 70F9E60624
	for <linux-lvm@redhat.com>; Wed, 23 Oct 2019 12:20:56 +0000 (UTC)
Received: from mail.service4.ru (mail.service4.ru [95.217.67.65])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DA4F7C0495A3
	for <linux-lvm@redhat.com>; Wed, 23 Oct 2019 12:20:53 +0000 (UTC)
Received: from mail.service4.ru (localhost [127.0.0.1])
	by mail.service4.ru (Postfix) with ESMTP id 9C3F240962
	for <linux-lvm@redhat.com>; Wed, 23 Oct 2019 15:20:52 +0300 (MSK)
Received: from mail.service4.ru ([127.0.0.1])
	by mail.service4.ru (mail.service4.ru [127.0.0.1]) (amavisd-new,
	port 10026) with ESMTP id 7LfVSn2KIkqn for <linux-lvm@redhat.com>;
	Wed, 23 Oct 2019 15:20:51 +0300 (MSK)
Received: from ilia (unknown [95.217.67.1])
	by mail.service4.ru (Postfix) with ESMTPSA id AABE940310
	for <linux-lvm@redhat.com>; Wed, 23 Oct 2019 15:20:51 +0300 (MSK)
References: <c1598cf7-442e-13c5-5877-c6e2667bb4bd@gmail.com>
	<909d4cae-ddd2-3951-eee8-8dec8faa6f22@redhat.com>
	<def626d9-52ef-4761-ebe0-3a29bd664bb1@gmail.com>
	<f1f7dfc1-dfd8-a023-5305-2065446a890e@redhat.com>
	<alpine.LRH.2.21.1910221142290.1156@fairfax.gathman.org>
	<f3a53c24-1f91-e5f5-e7e1-091b886da44a@redhat.com>
	<f73ab6ce-ba22-34f8-7153-e876b13fab5c@assyoma.it>
From: Ilia Zykov <mail@izyk.ru>
Message-ID: <e282b0b3-e373-c454-8243-3b09c23dd2a1@izyk.ru>
Date: Wed, 23 Oct 2019 15:20:53 +0300
MIME-Version: 1.0
In-Reply-To: <f73ab6ce-ba22-34f8-7153-e876b13fab5c@assyoma.it>
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
	micalg=sha-256; boundary="------------ms000005010904030503070602"
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

--------------ms000005010904030503070602
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
good. IMHO: In this case good choice firstly write chunks to the disk
and then give this chunks to the volume.
>=20
> Am I missing something?
>=20



--------------ms000005010904030503070602
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCC
C5AwggVBMIIEKaADAgECAhAMikt7ZGHaNf6ki+JIVQugMA0GCSqGSIb3DQEBCwUAMIGCMQsw
CQYDVQQGEwJJVDEPMA0GA1UECAwGTWlsYW5vMQ8wDQYDVQQHDAZNaWxhbm8xIzAhBgNVBAoM
GkFjdGFsaXMgUy5wLkEuLzAzMzU4NTIwOTY3MSwwKgYDVQQDDCNBY3RhbGlzIENsaWVudCBB
dXRoZW50aWNhdGlvbiBDQSBHMTAeFw0xOTA4MTUxMDE1MjZaFw0yMDA4MTUxMDE1MjZaMBcx
FTATBgNVBAMMDG1haWxAaXp5ay5ydTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEB
ANVNYo+py/n2jfs2n8r7GjG/fV1caStg6b4ndJgjA/fTA9tqrQYQPbwfojv/ucOR+SopvLuq
iHAhe9AF14GYcZZ+C1bghoabnY0271D1y8MiY1u+fRlLsOyuKFVROGqccKxZv5YPFLm2lSzB
TqGTIje1BGlE6ONOl/3EdiL2D3+nLlhnoXJMF64rKywiehFzerNqoNCpfhsqztneZZ9PPxwZ
kgM/fZDHmF+WNPgFvK8j7BsgVIRbH1aej91Del8eXotFJE17wjOGXhe7xAp6EKpF0gqBtSz1
My3etWp1eiEWyksMd7jJCWEWwcBSX2TYYrwE5gWYonCkiY2eqZUm+yUCAwEAAaOCAhswggIX
MAwGA1UdEwEB/wQCMAAwHwYDVR0jBBgwFoAUfmD8+GynPT3XrpOheQKPs3QpO/UwSwYIKwYB
BQUHAQEEPzA9MDsGCCsGAQUFBzAChi9odHRwOi8vY2FjZXJ0LmFjdGFsaXMuaXQvY2VydHMv
YWN0YWxpcy1hdXRjbGlnMTAXBgNVHREEEDAOgQxtYWlsQGl6eWsucnUwRwYDVR0gBEAwPjA8
BgYrgR8BGAEwMjAwBggrBgEFBQcCARYkaHR0cHM6Ly93d3cuYWN0YWxpcy5pdC9hcmVhLWRv
d25sb2FkMB0GA1UdJQQWMBQGCCsGAQUFBwMCBggrBgEFBQcDBDCB6AYDVR0fBIHgMIHdMIGb
oIGYoIGVhoGSbGRhcDovL2xkYXAwNS5hY3RhbGlzLml0L2NuJTNkQWN0YWxpcyUyMENsaWVu
dCUyMEF1dGhlbnRpY2F0aW9uJTIwQ0ElMjBHMSxvJTNkQWN0YWxpcyUyMFMucC5BLi8wMzM1
ODUyMDk2NyxjJTNkSVQ/Y2VydGlmaWNhdGVSZXZvY2F0aW9uTGlzdDtiaW5hcnkwPaA7oDmG
N2h0dHA6Ly9jcmwwNS5hY3RhbGlzLml0L1JlcG9zaXRvcnkvQVVUSENMLUcxL2dldExhc3RD
UkwwHQYDVR0OBBYEFHTf5HbXR0vLELk8y8T2yn5e3stDMA4GA1UdDwEB/wQEAwIFoDANBgkq
hkiG9w0BAQsFAAOCAQEAYTBNdI9CGfJoZhiKLpk1n3MoDtprPV4ba5LS5SPb2qyzXnkWpp10
DAlUKS934tjIniXwSSsWvChoNv0iB07eTRRd3eG7aR9CMj3KTx2q6ZUrX8i+5goXE08aDE8v
fRJh3DVVSkcTw0s+4SzKW9DNz92C3LvTnozJcUnW30J+JhfsE0BqYt4yboRxfBaboXk9zAEB
YKtvH0ERemen1z/SMif/2bNjGG+kKfy+XoXNwM/UqVfguveiPZ3esnsnbH3BY+7HCwYz4i7s
VDc6IKmVko2gTXxbrZxutJq3yL989ou/mfpMo2S/Z/nvs6NBy63No4hVSCIM8bZLk0tomrDh
ajCCBkcwggQvoAMCAQICCCzUitOxHg+JMA0GCSqGSIb3DQEBCwUAMGsxCzAJBgNVBAYTAklU
MQ4wDAYDVQQHDAVNaWxhbjEjMCEGA1UECgwaQWN0YWxpcyBTLnAuQS4vMDMzNTg1MjA5Njcx
JzAlBgNVBAMMHkFjdGFsaXMgQXV0aGVudGljYXRpb24gUm9vdCBDQTAeFw0xNTA1MTQwNzE0
MTVaFw0zMDA1MTQwNzE0MTVaMIGCMQswCQYDVQQGEwJJVDEPMA0GA1UECAwGTWlsYW5vMQ8w
DQYDVQQHDAZNaWxhbm8xIzAhBgNVBAoMGkFjdGFsaXMgUy5wLkEuLzAzMzU4NTIwOTY3MSww
KgYDVQQDDCNBY3RhbGlzIENsaWVudCBBdXRoZW50aWNhdGlvbiBDQSBHMTCCASIwDQYJKoZI
hvcNAQEBBQADggEPADCCAQoCggEBAMD8wYlW2Yji9ARlv80JNasoKTD+DMr3J6scEe6GPV3k
9WxEtgxXM5WX3oiKjS2p25Mqk8cnV2fpMaEvdO9alrGes0vqcUqly7PkU753RGlseYXR2XCj
Vhs4cuRYjuBmbxpRSJxRImmPnThKY41r0nl6b3A6Z2MOjPQF7h6OCYYwtz/ziv/+UBV587U2
uIlOukaS7Xjk4ArYkQsGTSsfBBXqqn06WL3xG+B/dRO5/mOtY5tHdhPHydsBk2kksI3PJ0yN
gKV7o6HM7pG9pB6sGhj96uVLnnVnJ0WXOuV1ISv2eit9ir60LjT99hf+TMZLxA5yaVJ57fYj
BMbxM599cw0CAwEAAaOCAdUwggHRMEEGCCsGAQUFBwEBBDUwMzAxBggrBgEFBQcwAYYlaHR0
cDovL29jc3AwNS5hY3RhbGlzLml0L1ZBL0FVVEgtUk9PVDAdBgNVHQ4EFgQUfmD8+GynPT3X
rpOheQKPs3QpO/UwDwYDVR0TAQH/BAUwAwEB/zAfBgNVHSMEGDAWgBRS2Ig6yJ94Zu2J83s4
cJTJAgI20DBFBgNVHSAEPjA8MDoGBFUdIAAwMjAwBggrBgEFBQcCARYkaHR0cHM6Ly93d3cu
YWN0YWxpcy5pdC9hcmVhLWRvd25sb2FkMIHjBgNVHR8EgdswgdgwgZaggZOggZCGgY1sZGFw
Oi8vbGRhcDA1LmFjdGFsaXMuaXQvY24lM2RBY3RhbGlzJTIwQXV0aGVudGljYXRpb24lMjBS
b290JTIwQ0EsbyUzZEFjdGFsaXMlMjBTLnAuQS4lMmYwMzM1ODUyMDk2NyxjJTNkSVQ/Y2Vy
dGlmaWNhdGVSZXZvY2F0aW9uTGlzdDtiaW5hcnkwPaA7oDmGN2h0dHA6Ly9jcmwwNS5hY3Rh
bGlzLml0L1JlcG9zaXRvcnkvQVVUSC1ST09UL2dldExhc3RDUkwwDgYDVR0PAQH/BAQDAgEG
MA0GCSqGSIb3DQEBCwUAA4ICAQBNk87VJL5BG0oWWHNfZYny2Xo+WIy8y8QP5VsWZ7LBS6Qz
8kn8zJp3c9xdOkudZbcA3vm5U8HKXc1JdzNmpSh92zq/OeZLvUa+rnncmvhxkFE9Doag6Nit
ggBPZwXHwDcYn430/F8wqAt3LX/bsd6INVrhPFk3C2SoAjLjUQZibXvQuFINMN4l6j86vCrk
UaGzSqnXT45NxIivkAPhBQgpGtcTi4f+3DxkyTDbWtf9LuaC4l2jgB3gC7f56nmdpGfpYsyv
KE7+Ip+WryH93pWt6C+r68KU3Gu02cU1/dHvNOXWUDeKkVT3T26wZVrTaMx+0nS3i63KDfJd
hFzutfdBgCWHcp03NhOhMqy1RnAylF/dVZgkka6hKaWe1tOU21kS4uvsD4wM5k6tl0pin2o6
u47kyoJJMOxRSQcosWtDXUmaLHUG91ZC6hvBDmDmpmS6h/r+7mtPrpYOxTr4hW3me2EfXkTv
NTvBQtbi4LrZchg9vhi44EJ7L53g7GzQFn5KK8vqqgMb1c1+T0mkKdqSedgGiB9TDdYtv4Hk
Uj/N00TKxZMLiDMw4V8ShUL6bKTXNfb3E68s47cD+MatFjUuGFj0uFPvZlvlNAoJ7IMfXzIi
TWy35X+akm+d49wBh54yv6icz2t/cBU1y1weuPBd8NUH/Ue3mXk0SXwkGP3yVDGCAp0wggKZ
AgEBMIGXMIGCMQswCQYDVQQGEwJJVDEPMA0GA1UECAwGTWlsYW5vMQ8wDQYDVQQHDAZNaWxh
bm8xIzAhBgNVBAoMGkFjdGFsaXMgUy5wLkEuLzAzMzU4NTIwOTY3MSwwKgYDVQQDDCNBY3Rh
bGlzIENsaWVudCBBdXRoZW50aWNhdGlvbiBDQSBHMQIQDIpLe2Rh2jX+pIviSFULoDANBglg
hkgBZQMEAgEFAKCB1zAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEP
Fw0xOTEwMjMxMjIwNTNaMC8GCSqGSIb3DQEJBDEiBCBCgGo1yTpCLm7dCbf0Fv0rCY/ljt8n
4Ki4mcm9IMH6rTBsBgkqhkiG9w0BCQ8xXzBdMAsGCWCGSAFlAwQBKjALBglghkgBZQMEAQIw
CgYIKoZIhvcNAwcwDgYIKoZIhvcNAwICAgCAMA0GCCqGSIb3DQMCAgFAMAcGBSsOAwIHMA0G
CCqGSIb3DQMCAgEoMA0GCSqGSIb3DQEBAQUABIIBAFW0rFaFfG4bdxVdAsW/y600j1TsXUl5
9mQ/qh7IeMRZLomq/0CAQZqGEYiB/rKH265oaGgBK8w+6PGxp/jioZX1r0uJhSpCZS1EPnH9
FaJ/53b+6xRUEAv0oM46SPE5CJciXMSooViOYMu7lztIRShTjt4iFJyM4Jykvyr3RweY2wh5
lcq9M8svPJxUtBLYw/ClgEkahV39izux2EIugTgJNgN8mESiDhvOsPiP56JMT5xCPz6GDapm
8KBXgL2xry2r3z4PJgpFQdcC5LUjlr3auG5H0KlGWOrrAzSf2Px1gTE/5JtYWWv/9ZhPtIjv
2KzaoPR+hDVtF3ho8ogzI/wAAAAAAAA=
--------------ms000005010904030503070602--
