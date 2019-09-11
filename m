Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 359EF6012A
	for <linux-lvm@redhat.com>; Wed, 11 Sep 2019 10:03:52 +0000 (UTC)
Received: from mail.service4.ru (mail.service4.ru [95.217.67.65])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1726379704
	for <linux-lvm@redhat.com>; Wed, 11 Sep 2019 10:03:50 +0000 (UTC)
Received: from mail.service4.ru (localhost [127.0.0.1])
	by mail.service4.ru (Postfix) with ESMTP id CA8C840871
	for <linux-lvm@redhat.com>; Wed, 11 Sep 2019 13:03:48 +0300 (MSK)
Received: from mail.service4.ru ([127.0.0.1])
	by mail.service4.ru (mail.service4.ru [127.0.0.1]) (amavisd-new,
	port 10026) with ESMTP id rpREaDizmhsF for <linux-lvm@redhat.com>;
	Wed, 11 Sep 2019 13:03:47 +0300 (MSK)
References: <CH2PR18MB32067A650CBE520D9A0DC547CFB10@CH2PR18MB3206.namprd18.prod.outlook.com>
From: Ilia Zykov <mail@izyk.ru>
Message-ID: <116a2ce6-452e-5c7b-3bb6-e53461125824@izyk.ru>
Date: Wed, 11 Sep 2019 13:03:48 +0300
MIME-Version: 1.0
In-Reply-To: <CH2PR18MB32067A650CBE520D9A0DC547CFB10@CH2PR18MB3206.namprd18.prod.outlook.com>
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
	micalg=sha-256; boundary="------------ms080901020601050706090802"
Subject: Re: [linux-lvm] pvresize will cause a meta-data corruption with
 error message "Error writing device at 4096 length 512"
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Gang He <GHe@suse.com>

This is a cryptographically signed message in MIME format.

--------------ms080901020601050706090802
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Maybe this?

Please note that this problem can also happen in other cases, such as
mixing disks with different block sizes (e.g. SCSI disks with 512 bytes
and s390x-DASDs with 4096 block size).

https://www.redhat.com/archives/linux-lvm/2019-February/msg00018.html


On 11.09.2019 12:17, Gang He wrote:
> Hello List,
>=20
> Our user encountered a meta-data corruption problem, when run pvresize =
command after upgrading to LVM2 v2.02.180 from v2.02.120.
>=20
> The details are as below,
> we have following environment:
> - Storage: HP XP7 (SAN) - LUN's are presented to ESX via RDM
> - VMWare ESXi 6.5
> - SLES 12 SP 4 Guest
>=20
> Resize happened this way (is our standard way since years) - however - =
this is our first resize after upgrading SLES 12 SP3 to SLES 12 SP4 - unt=
il this upgrade, we
> never had a problem like this:
> - split continous access on storage box, resize lun on XP7
> - recreate ca on XP7
> - scan on ESX
> - rescan-scsi-bus.sh -s on SLES VM
> - pvresize  ( at this step the error happened)
>=20
> huns1vdb01:~ # pvresize /dev/disk/by-id/scsi-360060e80072a660000302a660=
0003274
>  Error writing device /dev/sdaf at 4096 length 512.
>  Failed to write mda header to /dev/sdaf fd -1
>  Failed to update old PV extension headers in VG vghundbhulv_ar.
>  Error writing device /dev/disk/by-id/scsi-360060e80072a660000302a66000=
031ec at 4096 length 512.
>  Failed to write mda header to /dev/disk/by-id/scsi-360060e80072a660000=
302a66000031ec fd -1
>  Failed to update old PV extension headers in VG vghundbhulk_ar.
>  VG info not found after rescan of vghundbhulv_r2
>  VG info not found after rescan of vghundbhula_r1
>  VG info not found after rescan of vghundbhuco_ar
>  Error writing device /dev/disk/by-id/scsi-360060e80072a660000302a66000=
031e8 at 4096 length 512.
>  Failed to write mda header to /dev/disk/by-id/scsi-360060e80072a660000=
302a66000031e8 fd -1
>  Failed to update old PV extension headers in VG vghundbhula_ar.
>  VG info not found after rescan of vghundbhuco_r2
>  Error writing device /dev/disk/by-id/scsi-360060e80072a660000302a66000=
0300b at 4096 length 512.
>  Failed to write mda header to /dev/disk/by-id/scsi-360060e80072a660000=
302a660000300b fd -1
>  Failed to update old PV extension headers in VG vghundbhunrm02_r2.
>=20
> Any idea for this bug?
>=20
> Thanks a lot.
> Gang
>=20
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>=20



--------------ms080901020601050706090802
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
Fw0xOTA5MTExMDAzNDhaMC8GCSqGSIb3DQEJBDEiBCB1uLK7TYbZo4OmNDMXVBHR5RaQNfl1
ES4Qh/w8ZrES9DBsBgkqhkiG9w0BCQ8xXzBdMAsGCWCGSAFlAwQBKjALBglghkgBZQMEAQIw
CgYIKoZIhvcNAwcwDgYIKoZIhvcNAwICAgCAMA0GCCqGSIb3DQMCAgFAMAcGBSsOAwIHMA0G
CCqGSIb3DQMCAgEoMA0GCSqGSIb3DQEBAQUABIIBAD7QzYcReK7k1CAS6ttucKjPT2GVyCsr
ukljewkq4x2ZzApeEv2U9j4X64EM6gmOGp0nFaJ1usy/Ba1wrRvM0FlXTFYnd4itIil/UyWv
r53DKw1DSmoIixHehNqaGbYX7b1GoeBu6hXWX7+tznOynRFiDl4hoJv7S5Z61Rwpjs1alKAM
x7Xoc4V4ot2fwMhX0EpttWGhTi0OW+8SDhmYZnU472us1hKe5OBqbPBYgDmvfD8x7Xex4oNN
Nagc/AQHF6AYZWoC7OncapvrVZdyPEQxMLvCMM2c9ebEdZad499H/tbhEoy06KzR03ZUVYbk
2LevjUW6e/9PNtXX42USRQIAAAAAAAA=
--------------ms080901020601050706090802--
