Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 51FA820A052B
	for <linux-lvm@redhat.com>; Thu, 30 Jul 2020 20:40:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 215EF800580
	for <linux-lvm@redhat.com>; Thu, 30 Jul 2020 20:40:09 +0000 (UTC)
Received: from rufous.cora.nwra.com (inferno.cora.nwra.com [204.134.157.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by mail.nwra.com (Postfix) with ESMTPSA id 5D6903404CC
	for <linux-lvm@redhat.com>; Thu, 30 Jul 2020 13:34:42 -0700 (PDT)
From: Orion Poplawski <orion@nwra.com>
Message-ID: <d98fb84c-2b32-d6eb-65cb-022e5a974319@nwra.com>
Date: Thu, 30 Jul 2020 14:34:40 -0600
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
	micalg=sha-256; boundary="------------ms090601040005090008050404"
Subject: [linux-lvm] What do these messages mean?
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
--------------ms090601040005090008050404
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

I'm guessing this simply indicates that the kernel device name=20
associated with the PV has changed.  Is that correct?

Jul 28 16:50:58 hostname lvm[1424]:   PVID=20
6seLWa-Oz2d-jZIC-Ox17-MPaB-QGu5-uElsKN read from /dev/sdb1 last written=20
to /dev/sdd1.

No idea what this means.  Should we be using quick activation?  Is it a=20
result of the above?

Jul 28 16:50:58 hostname lvm[1424]:   pvscan[1424] VG vg_leka not using=20
quick activation.

Thanks!

--=20
Orion Poplawski
Manager of NWRA Technical Systems          720-772-5637
NWRA, Boulder/CoRA Office             FAX: 303-415-9702
3380 Mitchell Lane                       orion@nwra.com
Boulder, CO 80301                 https://www.nwra.com/


--------------ms090601040005090008050404
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCCCjYw
ggTpMIID0aADAgECAgRMDow4MA0GCSqGSIb3DQEBBQUAMIG0MRQwEgYDVQQKEwtFbnRydXN0Lm5l
dDFAMD4GA1UECxQ3d3d3LmVudHJ1c3QubmV0L0NQU18yMDQ4IGluY29ycC4gYnkgcmVmLiAobGlt
aXRzIGxpYWIuKTElMCMGA1UECxMcKGMpIDE5OTkgRW50cnVzdC5uZXQgTGltaXRlZDEzMDEGA1UE
AxMqRW50cnVzdC5uZXQgQ2VydGlmaWNhdGlvbiBBdXRob3JpdHkgKDIwNDgpMB4XDTExMTExMTE1
MzgzNFoXDTIxMTExMjAwMTczNFowgaUxCzAJBgNVBAYTAlVTMRYwFAYDVQQKEw1FbnRydXN0LCBJ
bmMuMTkwNwYDVQQLEzB3d3cuZW50cnVzdC5uZXQvQ1BTIGlzIGluY29ycG9yYXRlZCBieSByZWZl
cmVuY2UxHzAdBgNVBAsTFihjKSAyMDEwIEVudHJ1c3QsIEluYy4xIjAgBgNVBAMTGUVudHJ1c3Qg
Q2xhc3MgMiBDbGllbnQgQ0EwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDEMo1C0J4Z
nVuQWhBMtRAAIbkHSN6uboDW/xRQBuh1r2tGjuelT63DjLD6e+AZkf3wY61xSfOoHB+rNBkgTktU
6QCTvnAIMd6JU6xXvCTvKo9C1PfqlSVdFHbSzacS+huytFxhQL1f3VebRFXYxYkZPGU9uejUpS3C
LNPqgzGiCDxeWa4SLioKjF7zszGuCq1+7LBJCfynLiIeaGQ0nRbjpj0DMUAW95T2Sxk0yZfmIpxI
3mSggwtYBZjEIkaJBf2jvvZJTGEDFqT4Cpkc4sDGfmkCMleQA68AlKG53M6v7/R8GM4wC8qH+NVf
H1lR2IsLuTjGWMJTfNom1NvyvZDNAgMBAAGjggEOMIIBCjAOBgNVHQ8BAf8EBAMCAQYwEgYDVR0T
AQH/BAgwBgEB/wIBADAzBggrBgEFBQcBAQQnMCUwIwYIKwYBBQUHMAGGF2h0dHA6Ly9vY3NwLmVu
dHJ1c3QubmV0MDIGA1UdHwQrMCkwJ6AloCOGIWh0dHA6Ly9jcmwuZW50cnVzdC5uZXQvMjA0OGNh
LmNybDA7BgNVHSAENDAyMDAGBFUdIAAwKDAmBggrBgEFBQcCARYaaHR0cDovL3d3dy5lbnRydXN0
Lm5ldC9ycGEwHQYDVR0OBBYEFAmRpbrp8i4qdd/Nfv53yvLea5skMB8GA1UdIwQYMBaAFFXkgdER
gL7YibkIozH5oSQJFrlwMA0GCSqGSIb3DQEBBQUAA4IBAQAKibWxMzkQsSwJee7zG22odkq0w3jj
5/8nYTTMSuzYgu4fY0rhfUV6REaqVsaATN/IdQmcYSHZPk3LoBr0kYolpXptG7lnGT8lM9RBH2E/
GCKTyD73w+kP51j0nh9O45/h1d83uvyx7YA2ZmaFJlditeJusIJq0KwjE9EXFUYJWXbOp3CniB5x
Jz4d3tnqnQiKfyuW8oubFH/KRXJPCi1bv865e+iMiEyP114JkKDnyPmAPq3BMrJGw/3NDAzlwv1P
CbeCIJK802SfBzFN9s81aTek70c/JSt7Dt+bO7JxPSfOlC57Jq1InwR/nxuHzHodsSCQFQiuAhHT
wwA9qOtHMIIFRTCCBC2gAwIBAgIQF5XJg+ffrZoAAAAATDX/LTANBgkqhkiG9w0BAQsFADCBpTEL
MAkGA1UEBhMCVVMxFjAUBgNVBAoTDUVudHJ1c3QsIEluYy4xOTA3BgNVBAsTMHd3dy5lbnRydXN0
Lm5ldC9DUFMgaXMgaW5jb3Jwb3JhdGVkIGJ5IHJlZmVyZW5jZTEfMB0GA1UECxMWKGMpIDIwMTAg
RW50cnVzdCwgSW5jLjEiMCAGA1UEAxMZRW50cnVzdCBDbGFzcyAyIENsaWVudCBDQTAeFw0xNzEy
MTUxNzE3MTBaFw0yMDEyMTUxNzQ3MDBaMIGTMQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGlu
Z3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEmMCQGA1UEChMdTm9ydGhXZXN0IFJlc2VhcmNoIEFzc29j
aWF0ZXMxNTAWBgNVBAMTD09yaW9uIFBvcGxhd3NraTAbBgkqhkiG9w0BCQEWDm9yaW9uQG53cmEu
Y29tMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAop24yyNf/vYlUdWtgHFHWcittcBF
eMIWS5GJxcDDYSjYfHUYhiEq8D4eMrktwirxZqnGTwMdN+RCqrnNZSR/YOsHSwpsW+9eOtAAlHMP
CbaPsS+X0xxZX3VRSdxXulwELCE6Saik1UMQ0MWHts1TwNuDrAXlvmoxCHgXSgcs4ukfNSOAs49O
l09tOt5xI5NACz2sDjAiwonIm2ccuqbc5zJZiL2YOVTzOq9Aa/i38tRldTYkJH80WgnpmMZTSgGL
ua8kwA/u4Lmax2VEcoRMw9zzmJav8gFNpQDbVnO3Ik2nlreJ/FX9+JmUa7zDn4FS0rT37ZJ7rOA3
N968CwBHAwIDAQABo4IBfzCCAXswDgYDVR0PAQH/BAQDAgWgMB0GA1UdJQQWMBQGCCsGAQUFBwMC
BggrBgEFBQcDBDBCBgNVHSAEOzA5MDcGC2CGSAGG+mwKAQQCMCgwJgYIKwYBBQUHAgEWGmh0dHA6
Ly93d3cuZW50cnVzdC5uZXQvcnBhMGoGCCsGAQUFBwEBBF4wXDAjBggrBgEFBQcwAYYXaHR0cDov
L29jc3AuZW50cnVzdC5uZXQwNQYIKwYBBQUHMAKGKWh0dHA6Ly9haWEuZW50cnVzdC5uZXQvMjA0
OGNsYXNzMnNoYTIuY2VyMDQGA1UdHwQtMCswKaAnoCWGI2h0dHA6Ly9jcmwuZW50cnVzdC5uZXQv
Y2xhc3MyY2EuY3JsMBkGA1UdEQQSMBCBDm9yaW9uQG53cmEuY29tMB8GA1UdIwQYMBaAFAmRpbrp
8i4qdd/Nfv53yvLea5skMB0GA1UdDgQWBBSU5GXZh96BMn8UDBnIwT0CYlbijTAJBgNVHRMEAjAA
MA0GCSqGSIb3DQEBCwUAA4IBAQAj5E9g5NtdnH5bR1qKtyUGL9Rd6BIZBrVIMoEkpXi6rRwhfeAV
2cU5T/Te94+pv5JkBQfJQAakeQM+VRvSHtODHTPot12IpX/Dm9oxhKXpWIveNjC/6Qbx+/E6iNvU
GTtTTtCfwwpmyzVpUnJUN0B9XSHy78+fjJkDUIv6byrBSC/zW0MxSd0HKtr2Do3FYZgEmFiEchDz
wJeTmpJiJN/IVk/gtfJXSYQFOA0QawovCSvGgZy/0fRY5y8h1MDWmVBRrHBRoL+ot9Q6nbhMyszv
EGIVYVvWleE3Zcpu0teQ5WDv7WYs6ZZexIkGhIIW65NWIa1rG+UYok993UqK2FGnMYIEXzCCBFsC
AQEwgbowgaUxCzAJBgNVBAYTAlVTMRYwFAYDVQQKEw1FbnRydXN0LCBJbmMuMTkwNwYDVQQLEzB3
d3cuZW50cnVzdC5uZXQvQ1BTIGlzIGluY29ycG9yYXRlZCBieSByZWZlcmVuY2UxHzAdBgNVBAsT
FihjKSAyMDEwIEVudHJ1c3QsIEluYy4xIjAgBgNVBAMTGUVudHJ1c3QgQ2xhc3MgMiBDbGllbnQg
Q0ECEBeVyYPn362aAAAAAEw1/y0wDQYJYIZIAWUDBAIBBQCgggJ1MBgGCSqGSIb3DQEJAzELBgkq
hkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTIwMDczMDIwMzQ0MFowLwYJKoZIhvcNAQkEMSIEIIPl
MNv3WHD45MVcv0olvvQO2yDUbl70nUjZZSADSuh+MGwGCSqGSIb3DQEJDzFfMF0wCwYJYIZIAWUD
BAEqMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzAOBggqhkiG9w0DAgICAIAwDQYIKoZIhvcNAwIC
AUAwBwYFKw4DAgcwDQYIKoZIhvcNAwICASgwgcsGCSsGAQQBgjcQBDGBvTCBujCBpTELMAkGA1UE
BhMCVVMxFjAUBgNVBAoTDUVudHJ1c3QsIEluYy4xOTA3BgNVBAsTMHd3dy5lbnRydXN0Lm5ldC9D
UFMgaXMgaW5jb3Jwb3JhdGVkIGJ5IHJlZmVyZW5jZTEfMB0GA1UECxMWKGMpIDIwMTAgRW50cnVz
dCwgSW5jLjEiMCAGA1UEAxMZRW50cnVzdCBDbGFzcyAyIENsaWVudCBDQQIQF5XJg+ffrZoAAAAA
TDX/LTCBzQYLKoZIhvcNAQkQAgsxgb2ggbowgaUxCzAJBgNVBAYTAlVTMRYwFAYDVQQKEw1FbnRy
dXN0LCBJbmMuMTkwNwYDVQQLEzB3d3cuZW50cnVzdC5uZXQvQ1BTIGlzIGluY29ycG9yYXRlZCBi
eSByZWZlcmVuY2UxHzAdBgNVBAsTFihjKSAyMDEwIEVudHJ1c3QsIEluYy4xIjAgBgNVBAMTGUVu
dHJ1c3QgQ2xhc3MgMiBDbGllbnQgQ0ECEBeVyYPn362aAAAAAEw1/y0wDQYJKoZIhvcNAQEBBQAE
ggEAK/AyCZiUqD3QfRHuDlG8Q1/wDADMHlrM80bBEwiDqQl+x90Vdy2EXc4f0drfk1ZxAKY32d0N
wOiYdlVY6kC/B1lSDDwr98WCmpWBfXBNOibKy68mlgXYoX8t/eh8Hjnsuvk7jgG0ZR0HusiNU3db
ZtOiKOsjtxZQ01Mmqazwr0r1Dtpel99Cg64p9elpWRDs2Uat8uENiMdAGm/U/kYJo1+M+lvONOQa
yRWC/pyvcwF73Uhj9qJGZQX48GqHzmfjmjR9kbV7avXolIzuRH5zlZ/WLeRwQVp9f1jfR193nVIo
hEdITxoQfaH1VEsQft4bmoY60eC3budXTn84OGhHZQAAAAAAAA==
--------------ms090601040005090008050404--
