Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C945A5D75D
	for <linux-lvm@redhat.com>; Wed, 28 Mar 2018 08:59:49 +0000 (UTC)
Received: from hetzner.fladi.at (hetzner.fladi.at [144.76.17.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DA4057F7AE
	for <linux-lvm@redhat.com>; Wed, 28 Mar 2018 08:59:41 +0000 (UTC)
Received: from [2a01:4f8:191:4a4:7ce0:55ff:fe3b:6350] (port=40522 helo=bespin)
	by hetzner.fladi.at with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.90_1)
	(envelope-from <michael@fladi.at>) id 1f16vg-00021u-Bl
	for linux-lvm@redhat.com; Wed, 28 Mar 2018 10:59:40 +0200
Message-ID: <88c5661905b2d32428baf748d226b1b989aecac9.camel@fladi.at>
From: Michael Fladischer <michael@fladi.at>
Date: Wed, 28 Mar 2018 10:59:19 +0200
In-Reply-To: <5bf42865-57aa-9bbf-9d0b-2e2e34d74a8c@redhat.com>
References: <5efc943a1039bda80e77469afbfffd3d323c9a8f.camel@fladi.at>
	<5bf42865-57aa-9bbf-9d0b-2e2e34d74a8c@redhat.com>
Content-Type: multipart/signed; micalg="sha-512";
	protocol="application/x-pkcs7-signature";
	boundary="=-FjPZy3rxp7JtTxIQwBKW"
Mime-Version: 1.0
Subject: Re: [linux-lvm] Cannot create PV on /dev/dm-NN (/dev/dm-N works)
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


--=-FjPZy3rxp7JtTxIQwBKW
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-GF1NRYdaZ2gVP6P9uxL1"


--=-GF1NRYdaZ2gVP6P9uxL1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2018-03-28 at 10:27 +0200, Zdenek Kabelac wrote:
> lvm2 is detecting  multipath 'component' devices - those are not
> allowed to be=20
> used for pvcreate.
>=20
> You can use  'pvcreate -vvv' to get more information - there will be
> printed=20
> the reason why devices are rejected....

Thanks, I figured it out. As it happens those devices with two digits
had a GPT on them. Once I erased the primary copy at the beginning of
the devices, I was able to use pvcreate on them.

Cheers,
--=20
Michael Fladischer
Fladi.at
--=-GF1NRYdaZ2gVP6P9uxL1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEqVSlRXW87UkkCnJc/9PIi5l90WoFAlq7WWcACgkQ/9PIi5l9
0Wp2aQf/Sj/IxbRI9OTR52F+ZmjtVZsgu6nvOrEG/uaq6bS1WfE3iCb4JCTMpw2L
8hFmP/F0OwE5UqWVjcR+bcdV/vuvYoBsnwfczqjFWRZy6vNqlUuKfcJD+8wM7wpF
Z3BEg0cBKeYyaBF45GdnmOeizBJyvh45fOsDA3dDeUJ2wwnohkCz3k8hnLNpzcDx
ylT2ulnbc2fFLR68tRrs9QxnS//ZPA3aTr2Q1C+nbDt+PzCzU0VvbkG6JJ7eFdXj
vzD1co/7RPyLB85MNOmbm/cOl1Ys6zYxjsElZxmk87ouZBgdnJG0Z0+5ekpp10Cj
aM5MvKfwH0ugewc53YQQIlypRNZ4+A==
=Azve
-----END PGP SIGNATURE-----

--=-GF1NRYdaZ2gVP6P9uxL1--

--=-FjPZy3rxp7JtTxIQwBKW
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgMFADCABgkqhkiG9w0BBwEAAKCCCk8w
ggUAMIID6KADAgECAhADS+4XH7fhBjcv1HJCQL0qMA0GCSqGSIb3DQEBCwUAMGUxCzAJBgNVBAYT
AlVTMRUwEwYDVQQKEwxEaWdpQ2VydCBJbmMxGTAXBgNVBAsTEHd3dy5kaWdpY2VydC5jb20xJDAi
BgNVBAMTG0RpZ2lDZXJ0IEFzc3VyZWQgSUQgUm9vdCBDQTAeFw0xNDExMTgxMjAwMDBaFw0yNDEx
MTgxMjAwMDBaMGkxCzAJBgNVBAYTAk5MMRYwFAYDVQQIEw1Ob29yZC1Ib2xsYW5kMRIwEAYDVQQH
EwlBbXN0ZXJkYW0xDzANBgNVBAoTBlRFUkVOQTEdMBsGA1UEAxMUVEVSRU5BIFBlcnNvbmFsIENB
IDMwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDGpbsfVYL0pTRyFHJlm1/V6qBo2JuC
iU9TYpx7jM4O2tQyDq8bjMum69vg6wM0lMGHflMgqB75GxeKfQFmEldoXi2cLishqFUvU2cJeM3S
aRsLk2BsuCgTzh9NsYgmrUX60KHOq7eYKVZxbPFWJF2nMOBuMXNu2qBXTGSLeLXHnNvG3r7TLzGg
1oA5teAxQE6Eo8ySSeIXbP7wZB76urwlh51PIbrJZjkDjdQVELh7OlTP1WO6T/Hf6BsEfeFcpoa1
e+MW/lw0VetTPPHQ15HYKYP2WYohHxzDiC+QUwE7UZVBlp9cXIpwHuDzSibc5RG3z0n/j2SQCx0D
k5FMAUErAgMBAAGjggGmMIIBojASBgNVHRMBAf8ECDAGAQH/AgEAMA4GA1UdDwEB/wQEAwIBhjB5
BggrBgEFBQcBAQRtMGswJAYIKwYBBQUHMAGGGGh0dHA6Ly9vY3NwLmRpZ2ljZXJ0LmNvbTBDBggr
BgEFBQcwAoY3aHR0cDovL2NhY2VydHMuZGlnaWNlcnQuY29tL0RpZ2lDZXJ0QXNzdXJlZElEUm9v
dENBLmNydDCBgQYDVR0fBHoweDA6oDigNoY0aHR0cDovL2NybDMuZGlnaWNlcnQuY29tL0RpZ2lD
ZXJ0QXNzdXJlZElEUm9vdENBLmNybDA6oDigNoY0aHR0cDovL2NybDQuZGlnaWNlcnQuY29tL0Rp
Z2lDZXJ0QXNzdXJlZElEUm9vdENBLmNybDA9BgNVHSAENjA0MDIGBFUdIAAwKjAoBggrBgEFBQcC
ARYcaHR0cHM6Ly93d3cuZGlnaWNlcnQuY29tL0NQUzAdBgNVHQ4EFgQU8CHpSXdzn4WuGDvoUnAU
Bu1C7sowHwYDVR0jBBgwFoAUReuir/SSy4IxLVGLp6chnfNtyA8wDQYJKoZIhvcNAQELBQADggEB
ADrCGyv+Y967YbS5R6j8fAWxJiAiUZvIPfn1xVgesF6jspwCQY8xGn/MG04d+Jh97I8I/Xfx29JE
EFq2rQmw4PxiO9RiDZ7xoDxNd4rrRDR7jrtOKQP8J+o+ah0vSOP62hnD/zPS7NRMtIyVS2G277KA
L5fIR62ngr984fmJghDv0bsjGAmeu3EP0xhUsDJT61IoAGoKBnxBPAeg3WXsdSm4Gn7btyvakeyF
tYebr2KmOBSa28PRqGSDur56aZhJoM2eMzc6prmvGwwtAzRsc5t2OsKRuHWV6O3anP2K27jGZR2b
i1VX1NQUvIbpVNTuwjm+XcZtsa/AAJF9KGkEseAwggVHMIIEL6ADAgECAhAI3JSbODDZWhoKTtiP
F6J+MA0GCSqGSIb3DQEBCwUAMGkxCzAJBgNVBAYTAk5MMRYwFAYDVQQIEw1Ob29yZC1Ib2xsYW5k
MRIwEAYDVQQHEwlBbXN0ZXJkYW0xDzANBgNVBAoTBlRFUkVOQTEdMBsGA1UEAxMUVEVSRU5BIFBl
cnNvbmFsIENBIDMwHhcNMTcwMTMxMDAwMDAwWhcNMjAwMTMxMTIwMDAwWjBzMQswCQYDVQQGEwJB
VDEPMA0GA1UECBMGU3R5cmlhMQ0wCwYDVQQHEwRHcmF6MScwJQYDVQQKDB5NZWRpemluaXNjaGUg
VW5pdmVyc2l0w6R0IEdyYXoxGzAZBgNVBAMTEk1pY2hhZWwgRmxhZGlzY2hlcjCCASIwDQYJKoZI
hvcNAQEBBQADggEPADCCAQoCggEBAMGmdPBw6N1NzRrl8cjIyPcD819zDHZm5rnisycqUyvgv+fp
T40HHBxUaN3CbKT/UX3MT06XFONRLQzVIvxeCltz6C9HzmxE0HJwHkOIcRMRGc/gyFdeJa+yHpyy
S0zCBIHoSS3T4NUeYI08CzvZiuj2XxS1yoirNRrOCaTewfcO1D0ugrwQYxgF+EcZx/nYCraGGeZd
0Kck8Er/BJ1755sFwB+UBAehWPOsUeDA3Osix6ctRtMlOaWLbatA/f8/lAZxrUqSn0zuaEBMgtaq
AP4a//NH7xAdIIvacgmaVW7GqL/J0d4M5MCtoFv5WOp+wabj3x9rE77iYVzvacMqc8cCAwEAAaOC
Ad8wggHbMB8GA1UdIwQYMBaAFPAh6Ul3c5+Frhg76FJwFAbtQu7KMB0GA1UdDgQWBBSfnAWs+nxH
MXbKvjmoB42RpMApzDAMBgNVHRMBAf8EAjAAMCsGA1UdEQQkMCKBIG1pY2hhZWwuZmxhZGlzY2hl
ckBtZWR1bmlncmF6LmF0MA4GA1UdDwEB/wQEAwIFoDAdBgNVHSUEFjAUBggrBgEFBQcDAgYIKwYB
BQUHAwQwQwYDVR0gBDwwOjA4BgpghkgBhv1sBAECMCowKAYIKwYBBQUHAgEWHGh0dHBzOi8vd3d3
LmRpZ2ljZXJ0LmNvbS9DUFMwdQYDVR0fBG4wbDA0oDKgMIYuaHR0cDovL2NybDMuZGlnaWNlcnQu
Y29tL1RFUkVOQVBlcnNvbmFsQ0EzLmNybDA0oDKgMIYuaHR0cDovL2NybDQuZGlnaWNlcnQuY29t
L1RFUkVOQVBlcnNvbmFsQ0EzLmNybDBzBggrBgEFBQcBAQRnMGUwJAYIKwYBBQUHMAGGGGh0dHA6
Ly9vY3NwLmRpZ2ljZXJ0LmNvbTA9BggrBgEFBQcwAoYxaHR0cDovL2NhY2VydHMuZGlnaWNlcnQu
Y29tL1RFUkVOQVBlcnNvbmFsQ0EzLmNydDANBgkqhkiG9w0BAQsFAAOCAQEAtK94UyqfXdQYRbaa
+QDO1AstXwIcNG13lN+nRE8/GP/Sl19ffnOoC9KXXhWYRWIkE/Zm7rsPnuy3K4LiCpsA624Qt+N9
s/NIkGD5L/Y/zk0Qw2nn9GRLphAl+ww2GTvqodPbQjDNMjYCeSpftVe1UfF+iLkdrI2q9OTpfdEp
pQTy+iFHXPOLDEWrH9/PMyIB3UTaZqERCP8Ro8yTtf6rUSA5u64cmndk4bVDSYpx2e1nPKN7alQt
N905Y0oXHDrUdlfWObOrxm+7SjoH6w8GlfG+qovzsrKyc7+eXn15FfGsTAgqzmNZQsuA7JYgUdQd
WbEt7L0ertbsXYYH5OWhDDGCAjQwggIwAgEBMH0waTELMAkGA1UEBhMCTkwxFjAUBgNVBAgTDU5v
b3JkLUhvbGxhbmQxEjAQBgNVBAcTCUFtc3RlcmRhbTEPMA0GA1UEChMGVEVSRU5BMR0wGwYDVQQD
ExRURVJFTkEgUGVyc29uYWwgQ0EgMwIQCNyUmzgw2VoaCk7YjxeifjANBglghkgBZQMEAgMFAKCB
iTAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0xODAzMjgwODU5MzRa
ME8GCSqGSIb3DQEJBDFCBEC/j7nYgoDR4+phrknmpi9t9FyhSoa6V1gp0ctxbAIh/xv431FjO5rD
DyDbaJ7e3PxgPOo7k/Z5Rt/57ach03PmMA0GCSqGSIb3DQEBAQUABIIBAIeB8h/NBjy2IjX28Q17
zeAuyGW2FfOOrYd+yxa3HLN8iNjr0n7qUQ691TS1TGllIP0nVb1tUuTwFdP2ws4uMrZ4Neepe5+9
pS9QbOBLhtZIDI8OHEdGatfSJfvFd8TzTWEYPEvHV2LnbWpo4R16aftWIG5/hbNjfFvERLdLBq1A
QH30D/LAl0Bz0rOc5YQl0iSnC8rl5F446DYZYALSGZyGz4Gc67jDXml+14Voas8nnpqkBj+ZsCsq
4Qil/ewDFRS2xXP0QncOXXNzvOu2rhW/a16EE7qax9qrNR2LqlaI0Ra4Hz+rKQJytVMX6X0Gsl9X
PWyNK871sALBeiXKSz4AAAAAAAA=


--=-FjPZy3rxp7JtTxIQwBKW--
