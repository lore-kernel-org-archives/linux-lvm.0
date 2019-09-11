Received: from mx1.redhat.com (ext-mx17.extmail.prod.ext.phx2.redhat.com
	[10.5.110.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E521B5DA5B
	for <linux-lvm@redhat.com>; Wed, 11 Sep 2019 10:01:49 +0000 (UTC)
Received: from mail.service4.ru (mail.service4.ru [95.217.67.65])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C7DCA3082E20
	for <linux-lvm@redhat.com>; Wed, 11 Sep 2019 10:01:46 +0000 (UTC)
Received: from mail.service4.ru (localhost [127.0.0.1])
	by mail.service4.ru (Postfix) with ESMTP id 231BC40CB3
	for <linux-lvm@redhat.com>; Wed, 11 Sep 2019 13:01:45 +0300 (MSK)
Received: from mail.service4.ru ([127.0.0.1])
	by mail.service4.ru (mail.service4.ru [127.0.0.1]) (amavisd-new,
	port 10026) with ESMTP id aKXeoaqyGqqi for <linux-lvm@redhat.com>;
	Wed, 11 Sep 2019 13:01:43 +0300 (MSK)
References: <CH2PR18MB32067A650CBE520D9A0DC547CFB10@CH2PR18MB3206.namprd18.prod.outlook.com>
From: Ilia Zykov <mail@service4.ru>
Message-ID: <008471a0-8620-dd7d-3915-62463f1b3f69@service4.ru>
Date: Wed, 11 Sep 2019 13:01:44 +0300
MIME-Version: 1.0
In-Reply-To: <CH2PR18MB32067A650CBE520D9A0DC547CFB10@CH2PR18MB3206.namprd18.prod.outlook.com>
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
	micalg=sha-256; boundary="------------ms050703010607070801030705"
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

--------------ms050703010607070801030705
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



--------------ms050703010607070801030705
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
hvcNAQkFMQ8XDTE5MDkxMTEwMDE0NFowLwYJKoZIhvcNAQkEMSIEIK+5uRMjHOC+bofgbO4x
o6bHSRNlO+9KS/tGeii7SthNMGwGCSqGSIb3DQEJDzFfMF0wCwYJYIZIAWUDBAEqMAsGCWCG
SAFlAwQBAjAKBggqhkiG9w0DBzAOBggqhkiG9w0DAgICAIAwDQYIKoZIhvcNAwICAUAwBwYF
Kw4DAgcwDQYIKoZIhvcNAwICASgwDQYJKoZIhvcNAQEBBQAEggEABYja2gV7C27NiNT5m+EK
baMa+BN+YcnD4m8V9C8dpV7pqtZHv6dJJhwM7cokTW8e9afdCAfoS5HeUQo8L7iR7wVZnMWT
qZjXa9QdO19d4WQ5Th6Z0ZUuds8yPpa6k9kBlQUisfFpj7C0luzXxQKXHy7TY62p/xl4cOHP
WXooZ0rIpeUkldmWizMk4wkxK/W4CdMGaWXzJ7qDV0wAGUEVZYASirGO8NX9OLpPLJll7K+K
ve8oFeoVpQPETftWF5EFUsJQv7XuOzYNbcU6+sI2OvcZWGA2ruETfE5UG4vU/uVZpcsdksxg
d4sWkHdh2oDKBZ5wHBzcoPcq/9RNbQY52wAAAAAAAA==
--------------ms050703010607070801030705--
