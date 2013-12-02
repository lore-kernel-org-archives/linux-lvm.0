Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id rB2CRSrw030910
	for <linux-lvm@redhat.com>; Mon, 2 Dec 2013 07:27:28 -0500
Received: from gribule.nick.on.net (gribule.nick.on.net [72.14.189.49])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id rB2CRPmX013490
	for <linux-lvm@redhat.com>; Mon, 2 Dec 2013 07:27:26 -0500
Received: from [192.168.1.4] (g229109111.adsl.alicedsl.de [92.229.109.111])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested) (Authenticated sender: nickm)
	by gribule.nick.on.net (Postfix) with ESMTPSA id 257F2104002
	for <linux-lvm@redhat.com>; Mon,  2 Dec 2013 13:27:23 +0100 (CET)
From: Nick Morrison <nick@nick.on.net>
Content-Type: multipart/signed;
	boundary="Apple-Mail=_EF545576-06DE-44DD-98E9-131FB6798E61";
	protocol="application/pkcs7-signature"; micalg=sha1
Message-Id: <AE4DD287-4A04-456F-B6D5-F15418B7CA40@nick.on.net>
Mime-Version: 1.0 (Mac OS X Mail 7.0 \(1822\))
Date: Mon, 2 Dec 2013 13:27:20 +0100
References: <20131115111323.GA24094@nick.on.net>
In-Reply-To: <20131115111323.GA24094@nick.on.net>
Subject: Re: [linux-lvm] LVM2 snapshot weirdness
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


--Apple-Mail=_EF545576-06DE-44DD-98E9-131FB6798E61
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


On 15.11.2013, at 12:13, Nick Morrison <nick@nick.on.net> wrote:

> .. and md5sum gave me a third, different, result.
>=20
> It seems as if the data read from the snapshot is changing.

More tests. I created a snapshot using=20

# lvcreate -pr -L 2G -s -n test-snapshot /dev/VolGroup00/LogVol00


Then I ran:

# md5sum /dev/VolGroup00/test-snapshot

... three times. test-snapshot is a read-only snapshot of the / volume, =
which is about 265G.

One one server, each time, I got a different md5sum. Generally a bad =
result. However:

on the other server, I got the same md5sum result on the first and third =
runs, but a different result on the second. Curious.

I'm getting no interesting messages in dmesg during the reads.

Is it likely that we have a fault at a lower level than LVM's snapshot =
code here?


[root@server-01:/backup/test]# cat nohup.out
Checking md5sum of /dev/VolGroup00/test-dump multiple times.

Pass 1 started Fri Nov 29 11:46:56 CET 2013
103fa0cc0351836598866423fabcfb6b  /dev/VolGroup00/test-dump

real    34m31.006s
user    15m15.252s
sys     6m48.961s

Pass 2 started Fri Nov 29 12:21:28 CET 2013
2d37fce8eea493eb4600f1593b9da825  /dev/VolGroup00/test-dump

real    34m24.818s
user    15m11.098s
sys     6m28.567s

Pass 3 started Fri Nov 29 12:55:52 CET 2013
4f6940a672115b896cea5220ba8bde7c  /dev/VolGroup00/test-dump

real    35m13.079s
user    15m15.016s
sys     6m19.312s

Complete at Fri Nov 29 13:31:05 CET 2013
[root@server-01:/backup/test]#=20



Other server:


[root@server-02:/backup/test]# cat nohup.out
Checking md5sum of /dev/VolGroup00/test-dump multiple times.

Pass 1 started Fri Nov 29 11:47:04 CET 2013
de7f4847be8dd3019ee2a690f48c6397  /dev/VolGroup00/test-dump

real    29m34.334s
user    14m49.219s
sys     6m33.685s

Pass 2 started Fri Nov 29 12:16:38 CET 2013
363ee32c1bb5da6eb9754b0d6de79180  /dev/VolGroup00/test-dump

real    29m24.910s
user    14m40.705s
sys     6m44.806s

Pass 3 started Fri Nov 29 12:46:03 CET 2013
de7f4847be8dd3019ee2a690f48c6397  /dev/VolGroup00/test-dump

real    29m20.927s
user    14m40.441s
sys     6m46.865s

Complete at Fri Nov 29 13:15:24 CET 2013
[root@server-02:/backup/test]#
=20


--Apple-Mail=_EF545576-06DE-44DD-98E9-131FB6798E61
Content-Disposition: attachment;
	filename=smime.p7s
Content-Type: application/pkcs7-signature;
	name=smime.p7s
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIMdTCCBjQw
ggQcoAMCAQICAR4wDQYJKoZIhvcNAQEFBQAwfTELMAkGA1UEBhMCSUwxFjAUBgNVBAoTDVN0YXJ0
Q29tIEx0ZC4xKzApBgNVBAsTIlNlY3VyZSBEaWdpdGFsIENlcnRpZmljYXRlIFNpZ25pbmcxKTAn
BgNVBAMTIFN0YXJ0Q29tIENlcnRpZmljYXRpb24gQXV0aG9yaXR5MB4XDTA3MTAyNDIxMDE1NVoX
DTE3MTAyNDIxMDE1NVowgYwxCzAJBgNVBAYTAklMMRYwFAYDVQQKEw1TdGFydENvbSBMdGQuMSsw
KQYDVQQLEyJTZWN1cmUgRGlnaXRhbCBDZXJ0aWZpY2F0ZSBTaWduaW5nMTgwNgYDVQQDEy9TdGFy
dENvbSBDbGFzcyAxIFByaW1hcnkgSW50ZXJtZWRpYXRlIENsaWVudCBDQTCCASIwDQYJKoZIhvcN
AQEBBQADggEPADCCAQoCggEBAMcJg8zOLdgasSmkLhOrlr6KMoOMpohBllVHrdRvEg/q6r8jR+EK
75xCGhR8ToREoqe7zM9/UnC6TS2y9UKTpT1v7RSMzR0t6ndl0TWBuUr/UXBhPk+Kmy7bI4yW4urC
+y7P3/1/X7U8ocb8VpH/Clt+4iq7nirMcNh6qJR+xjOhV+VHzQMALuGYn5KZmc1NbJQYclsGkDxD
z2UbFqE2+6vIZoL+jb9x4Pa5gNf1TwSDkOkikZB1xtB4ZqtXThaABSONdfmv/Z1pua3FYxnCFmdr
/+N2JLKutIxMYqQOJebr/f/h5t95m4JgrM3Y/w7YX9d7YAL9jvN4SydHsU6n65cCAwEAAaOCAa0w
ggGpMA8GA1UdEwEB/wQFMAMBAf8wDgYDVR0PAQH/BAQDAgEGMB0GA1UdDgQWBBRTcu2SnODaywFc
fH6WNU7y1LhRgjAfBgNVHSMEGDAWgBROC+8apEBbpRdphzDKNGhD0EGu8jBmBggrBgEFBQcBAQRa
MFgwJwYIKwYBBQUHMAGGG2h0dHA6Ly9vY3NwLnN0YXJ0c3NsLmNvbS9jYTAtBggrBgEFBQcwAoYh
aHR0cDovL3d3dy5zdGFydHNzbC5jb20vc2ZzY2EuY3J0MFsGA1UdHwRUMFIwJ6AloCOGIWh0dHA6
Ly93d3cuc3RhcnRzc2wuY29tL3Nmc2NhLmNybDAnoCWgI4YhaHR0cDovL2NybC5zdGFydHNzbC5j
b20vc2ZzY2EuY3JsMIGABgNVHSAEeTB3MHUGCysGAQQBgbU3AQIBMGYwLgYIKwYBBQUHAgEWImh0
dHA6Ly93d3cuc3RhcnRzc2wuY29tL3BvbGljeS5wZGYwNAYIKwYBBQUHAgEWKGh0dHA6Ly93d3cu
c3RhcnRzc2wuY29tL2ludGVybWVkaWF0ZS5wZGYwDQYJKoZIhvcNAQEFBQADggIBAAqDCH14qywG
XLhjjF6uHLkjd02hcdh9hrw+VUsv+q1eeQWB21jWj3kJ96AUlPCoEGZ/ynJNScWy6QMVQjbbMXlt
UfO4n4bGGdKo3awPWp61tjAFgraLJgDk+DsSvUD6EowjMTNx25GQgyYJ5RPIzKKR9tQW8gGK+2+R
HxkUCTbYFnL6kl8Ch507rUdPPipJ9CgJFws3kDS3gOS5WFMxcjO5DwKfKSETEPrHh7p5shuuNktv
sv6hxHTLhiMKX893gxdT3XLS9OKmCv87vkINQcNEcIIoFWbP9HORz9v3vQwR4e3ksLc2JZOAFK+s
sS5XMEoznzpihEP0PLc4dCBYjbvSD7kxgDwZ+Aj8Q9PkbvE9sIPP7ON0fz095HdThKjiVJe6vofq
+n6b1NBc8XdrQvBmunwxD5nvtTW4vtN6VY7mUCmxsCieuoBJ9OlqmsVWQvifIYf40dJPZkk9YgGT
zWLpXDSfLSplbY2LL9C9U0ptvjcDjefLTvqSFc7tw1sEhF0n/qpA2r0GpvkLRDmcSwVyPvmjFBGq
Up/pNy8ZuPGQmHwFi2/14+xeSUDG2bwnsYJQG2EdJCB6luQ57GEnTA/yKZSTKI8dDQa8Sd3zfXb1
9mOgSF0bBdXbuKhEpuP9wirslFe6fQ1t5j5R0xi72MZ8ikMu1RQZKCyDbMwazlHiMIIGOTCCBSGg
AwIBAgIDBfC2MA0GCSqGSIb3DQEBBQUAMIGMMQswCQYDVQQGEwJJTDEWMBQGA1UEChMNU3RhcnRD
b20gTHRkLjErMCkGA1UECxMiU2VjdXJlIERpZ2l0YWwgQ2VydGlmaWNhdGUgU2lnbmluZzE4MDYG
A1UEAxMvU3RhcnRDb20gQ2xhc3MgMSBQcmltYXJ5IEludGVybWVkaWF0ZSBDbGllbnQgQ0EwHhcN
MTMwMjEzMjAzNDMzWhcNMTQwMjE1MDUwNTI0WjBXMRkwFwYDVQQNExBxOWJYR2Z4ck82N2piN0JZ
MRkwFwYDVQQDDBBuaWNrQG5pY2sub24ubmV0MR8wHQYJKoZIhvcNAQkBFhBuaWNrQG5pY2sub24u
bmV0MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAwsMyPq7MJxEK5XCuzwDbara6Qp6e
jDMvlPKKK2wdMxkVovGs5Sqq/mS9Aw21XxyA487byJvjNKUaNWPmafpYLV+x3dU6KVhSNxEKlwgp
/BRaNPr3She5c5JL++JVhXgJ+n+4HFeOP2VlJRHVW8iCurwLRkHoswGvLYWin2u09McYBsSzNBB2
iPX4cCnnsSSA8x9n5P3RV+ntwLiem5chiv702PmNN48wBNPZAoAYmFHGUoqVfk6k8nLCjixvBN7D
L/vDQDkAwNJlCzJ3Nm/ekbOcY3zkULaTKh8CankCfP8nFOgMqtoslDyZYXBwkxz7gsQb8DjNtv2a
IZP1UZRIdQIDAQABo4IC1jCCAtIwCQYDVR0TBAIwADALBgNVHQ8EBAMCBLAwHQYDVR0lBBYwFAYI
KwYBBQUHAwIGCCsGAQUFBwMEMB0GA1UdDgQWBBT9bZbCfdhAhsXTSjEC/fQsqBDWlDAfBgNVHSME
GDAWgBRTcu2SnODaywFcfH6WNU7y1LhRgjAbBgNVHREEFDASgRBuaWNrQG5pY2sub24ubmV0MIIB
TAYDVR0gBIIBQzCCAT8wggE7BgsrBgEEAYG1NwECAzCCASowLgYIKwYBBQUHAgEWImh0dHA6Ly93
d3cuc3RhcnRzc2wuY29tL3BvbGljeS5wZGYwgfcGCCsGAQUFBwICMIHqMCcWIFN0YXJ0Q29tIENl
cnRpZmljYXRpb24gQXV0aG9yaXR5MAMCAQEagb5UaGlzIGNlcnRpZmljYXRlIHdhcyBpc3N1ZWQg
YWNjb3JkaW5nIHRvIHRoZSBDbGFzcyAxIFZhbGlkYXRpb24gcmVxdWlyZW1lbnRzIG9mIHRoZSBT
dGFydENvbSBDQSBwb2xpY3ksIHJlbGlhbmNlIG9ubHkgZm9yIHRoZSBpbnRlbmRlZCBwdXJwb3Nl
IGluIGNvbXBsaWFuY2Ugb2YgdGhlIHJlbHlpbmcgcGFydHkgb2JsaWdhdGlvbnMuMDYGA1UdHwQv
MC0wK6ApoCeGJWh0dHA6Ly9jcmwuc3RhcnRzc2wuY29tL2NydHUxLWNybC5jcmwwgY4GCCsGAQUF
BwEBBIGBMH8wOQYIKwYBBQUHMAGGLWh0dHA6Ly9vY3NwLnN0YXJ0c3NsLmNvbS9zdWIvY2xhc3Mx
L2NsaWVudC9jYTBCBggrBgEFBQcwAoY2aHR0cDovL2FpYS5zdGFydHNzbC5jb20vY2VydHMvc3Vi
LmNsYXNzMS5jbGllbnQuY2EuY3J0MCMGA1UdEgQcMBqGGGh0dHA6Ly93d3cuc3RhcnRzc2wuY29t
LzANBgkqhkiG9w0BAQUFAAOCAQEAlqBpGcPfWBXjlzEcL4iC/bFI73ssdV6lRCjmZGjvydL7E4Ic
JEV1412YL3rqhcP6D/Q9tSkMXNxjiO4lWeotWFo6kKT3l/yi02XdO6RMEadCQFjZulWmzv6y4Lpb
gcwWejXHPHy80IjmWRbdOndf97IYrTfa/paycyOZ2fCsGMT8uMe+LlAiZZCql67MRGyF9R+ApLCx
kdf+DzPchdjVH7e4fsKB+rGjI+UkS3xpORJDhvEo5LXIPU50nwxi4q04dq7gRlQjNpgVwkQobU23
uF/zJvVAjwr1a8ah7qDGHqCgFTg2CSzZvmd7meoGPl7FniwlxumqH3PAPstmnSgBlzGCA28wggNr
AgEBMIGUMIGMMQswCQYDVQQGEwJJTDEWMBQGA1UEChMNU3RhcnRDb20gTHRkLjErMCkGA1UECxMi
U2VjdXJlIERpZ2l0YWwgQ2VydGlmaWNhdGUgU2lnbmluZzE4MDYGA1UEAxMvU3RhcnRDb20gQ2xh
c3MgMSBQcmltYXJ5IEludGVybWVkaWF0ZSBDbGllbnQgQ0ECAwXwtjAJBgUrDgMCGgUAoIIBrzAY
BgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0xMzEyMDIxMjI3MjBaMCMG
CSqGSIb3DQEJBDEWBBTVYZWjA0IrqTbKWYc7ZoYQ7DYwMjCBpQYJKwYBBAGCNxAEMYGXMIGUMIGM
MQswCQYDVQQGEwJJTDEWMBQGA1UEChMNU3RhcnRDb20gTHRkLjErMCkGA1UECxMiU2VjdXJlIERp
Z2l0YWwgQ2VydGlmaWNhdGUgU2lnbmluZzE4MDYGA1UEAxMvU3RhcnRDb20gQ2xhc3MgMSBQcmlt
YXJ5IEludGVybWVkaWF0ZSBDbGllbnQgQ0ECAwXwtjCBpwYLKoZIhvcNAQkQAgsxgZeggZQwgYwx
CzAJBgNVBAYTAklMMRYwFAYDVQQKEw1TdGFydENvbSBMdGQuMSswKQYDVQQLEyJTZWN1cmUgRGln
aXRhbCBDZXJ0aWZpY2F0ZSBTaWduaW5nMTgwNgYDVQQDEy9TdGFydENvbSBDbGFzcyAxIFByaW1h
cnkgSW50ZXJtZWRpYXRlIENsaWVudCBDQQIDBfC2MA0GCSqGSIb3DQEBAQUABIIBAHibNumjvIZv
/iYBMGxdNkdGnWNWyzVJdhK9sVkWpW9/HGef61Nzb3ZOnuQK86a6UTvcN3p9E1KYfkI7r0A0ekLl
DaHyttlkmyBrbvbIcEetx4KTWoA4IJA/+c/nkHdtTCuEUHoKmuqy/Y77McmP2cxDmF/s3fWGwq6Z
kFTHtn1uO44kCGT+A2rM73Pge9MjStxUjDBfoVqnycAET/TskqgGh5W5nIxAizstEGr1QMtR5BJ7
UoJtSb7v+omgjQymR5SGxWJfXt1sWfA40KJQnSh6S7uKsrn0O9WBe8WI3UxZJopk3z8rEqqUMeGe
g0ojyD/HtT5q+h8PCE8ZYTaoQwwAAAAAAAA=

--Apple-Mail=_EF545576-06DE-44DD-98E9-131FB6798E61--
