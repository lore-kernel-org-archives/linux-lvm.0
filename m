Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 79BD71001DDB
	for <linux-lvm@redhat.com>; Mon,  3 Jun 2019 21:13:42 +0000 (UTC)
Received: from mail.service4.ru (mail.service4.ru [195.201.68.178])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5A2FB22388B
	for <linux-lvm@redhat.com>; Mon,  3 Jun 2019 21:13:09 +0000 (UTC)
Received: from mail.service4.ru (localhost [127.0.0.1])
	by mail.service4.ru (Postfix) with ESMTP id 59B2D40816
	for <linux-lvm@redhat.com>; Tue,  4 Jun 2019 00:13:02 +0300 (MSK)
Received: from mail.service4.ru ([127.0.0.1])
	by mail.service4.ru (mail.service4.ru [127.0.0.1]) (amavisd-new,
	port 10026) with ESMTP id aHrAqAQ0OVjF for <linux-lvm@redhat.com>;
	Tue,  4 Jun 2019 00:13:00 +0300 (MSK)
Received: from ilia (89-178-216-202.broadband.corbina.ru [89.178.216.202])
	by mail.service4.ru (Postfix) with ESMTPSA id A765840211
	for <linux-lvm@redhat.com>; Tue,  4 Jun 2019 00:13:00 +0300 (MSK)
References: <93f53408-2f37-dec3-5c68-deef021f530c@assyoma.it>
	<20190603132327.GA32187@reti>
	<512bbf893225a1b4f6897b7540b09d1c@assyoma.it>
From: Ilia Zykov <mail@service4.ru>
Message-ID: <d831c385-b935-0c95-c900-f724468cec1f@service4.ru>
Date: Tue, 4 Jun 2019 00:12:57 +0300
MIME-Version: 1.0
In-Reply-To: <512bbf893225a1b4f6897b7540b09d1c@assyoma.it>
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
	micalg=sha-256; boundary="------------ms060009060403020303030302"
Subject: Re: [linux-lvm] Fast thin volume preallocation?
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

--------------ms060009060403020303030302
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

>=20
>> Presumably you want a thick volume but inside a thin pool so that you
>> can used snapshots?
>> If so have you considered the 'external snapshot' feature?
>=20
> Yes, in some cases they are quite useful. Still, a fast volume
> allocation can be an handy addition.
>=20

Hello.
Can I use external snapshot for fast zero allocation?
 "thpool" - is lvmthin with lvm zeroing disabled

# lvcreate -n ext2T -V 2TiB --thinpool thpool VG
# lvchange --permission r VG/ext2T

# lvcreate -n zeroed_lve -s VG/ext2T --thinpool VG/thpool

Or it will be the same as zeroing enabled?
Thanks.


--------------ms060009060403020303030302
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCC
CxowggUsMIIEFKADAgECAhEAiiHRAx2BN/J/vHFQnEFVdDANBgkqhkiG9w0BAQsFADCBlzEL
MAkGA1UEBhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2Fs
Zm9yZDEaMBgGA1UEChMRQ09NT0RPIENBIExpbWl0ZWQxPTA7BgNVBAMTNENPTU9ETyBSU0Eg
Q2xpZW50IEF1dGhlbnRpY2F0aW9uIGFuZCBTZWN1cmUgRW1haWwgQ0EwHhcNMTgxMDE1MDAw
MDAwWhcNMTkxMDE1MjM1OTU5WjAhMR8wHQYJKoZIhvcNAQkBFhBtYWlsQHNlcnZpY2U0LnJ1
MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAsJfqSy9iSZz1Pn76nAw5ObLxDo4C
7N7yScf2Khg/vcU0VEc7p2vcLM9Aaoed/up55L2IXkDu5ON1JsnpeCgEB8C/LXePQTOaxuv5
HZ4e/WK7m6JY7HdnFxfD70VdSzVp9zXHwqpo5cHD26yq8uMkQUhEdcNBXBJ0HimjPSsfmxlI
zFFnqWkVludzIsbkjZqSs1WgpwMqAj3+xX6lyzHwoNiYxS4JzY17NKumjE24BmLn/dgwqWBj
7T0d7ohREHys9zhXY2cSe5Zp99Ct5gec9eXSmNOpQC9kQowRJ+xBGhcQ8A5HNjhC6Y0UMP+i
9rL0aJZ4eDhE0H/0yavZMO9lDQIDAQABo4IB5jCCAeIwHwYDVR0jBBgwFoAUgq9sjPjF/pZh
fOgfPStxSF7Ei8AwHQYDVR0OBBYEFHO9cQFGnFW+qA5r3DNbOQgznj6NMA4GA1UdDwEB/wQE
AwIFoDAMBgNVHRMBAf8EAjAAMCAGA1UdJQQZMBcGCCsGAQUFBwMEBgsrBgEEAbIxAQMFAjAR
BglghkgBhvhCAQEEBAMCBSAwRgYDVR0gBD8wPTA7BgwrBgEEAbIxAQIBAQEwKzApBggrBgEF
BQcCARYdaHR0cHM6Ly9zZWN1cmUuY29tb2RvLm5ldC9DUFMwWgYDVR0fBFMwUTBPoE2gS4ZJ
aHR0cDovL2NybC5jb21vZG9jYS5jb20vQ09NT0RPUlNBQ2xpZW50QXV0aGVudGljYXRpb25h
bmRTZWN1cmVFbWFpbENBLmNybDCBiwYIKwYBBQUHAQEEfzB9MFUGCCsGAQUFBzAChklodHRw
Oi8vY3J0LmNvbW9kb2NhLmNvbS9DT01PRE9SU0FDbGllbnRBdXRoZW50aWNhdGlvbmFuZFNl
Y3VyZUVtYWlsQ0EuY3J0MCQGCCsGAQUFBzABhhhodHRwOi8vb2NzcC5jb21vZG9jYS5jb20w
GwYDVR0RBBQwEoEQbWFpbEBzZXJ2aWNlNC5ydTANBgkqhkiG9w0BAQsFAAOCAQEAm+i2Svc8
A4s75pc4HhZNchQgYENGqW2BShSMYhPlCcj0B7JkfSGR5z9dIQFFiqjKc0nlX/1lqgatrpvj
yxz7HLUJ6ZPH5xnq9IAC7MqXbadIME+2rxt/eN7/VMp0H0XryejZUrloFHJn243Ypq4kzCEy
Fc8NphqmWnLKmh5QiY2wFwTDoVNDilNBQOOBbklqL6mNtX/zS2bYbvU6nlrdhfz2RNL+Bv53
H/7HDwwhYKxqGMcH88hRFfqCZYprmUyiNWkC1GgNNEO4fo4HiHgSN2aFJfElgHPbIbVRMExd
vdOROlVkcZ110sz6QZlGoSEVzH9O+3qIpDfmI9sWdlN3ozCCBeYwggPOoAMCAQICEGqb4Tg7
/ytrnwHV2binUlYwDQYJKoZIhvcNAQEMBQAwgYUxCzAJBgNVBAYTAkdCMRswGQYDVQQIExJH
cmVhdGVyIE1hbmNoZXN0ZXIxEDAOBgNVBAcTB1NhbGZvcmQxGjAYBgNVBAoTEUNPTU9ETyBD
QSBMaW1pdGVkMSswKQYDVQQDEyJDT01PRE8gUlNBIENlcnRpZmljYXRpb24gQXV0aG9yaXR5
MB4XDTEzMDExMDAwMDAwMFoXDTI4MDEwOTIzNTk1OVowgZcxCzAJBgNVBAYTAkdCMRswGQYD
VQQIExJHcmVhdGVyIE1hbmNoZXN0ZXIxEDAOBgNVBAcTB1NhbGZvcmQxGjAYBgNVBAoTEUNP
TU9ETyBDQSBMaW1pdGVkMT0wOwYDVQQDEzRDT01PRE8gUlNBIENsaWVudCBBdXRoZW50aWNh
dGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKC
AQEAvrOeV6wodnVAFsc4A5jTxhh2IVDzJXkLTLWg0X06WD6cpzEup/Y0dtmEatrQPTRI5Or1
u6zf+bGBSyD9aH95dDSmeny1nxdlYCeXIoymMv6pQHJGNcIDpFDIMypVpVSRsivlJTRENf+R
KwrB6vcfWlP8dSsE3Rfywq09N0ZfxcBa39V0wsGtkGWC+eQKiz4pBZYKjrc5NOpG9qrxpZxy
b4o4yNNwTqzaaPpGRqXB7IMjtf7tTmU2jqPMLxFNe1VXj9XB1rHvbRikw8lBoNoSWY66nJN/
VCJv5ym6Q0mdCbDKCMPybTjoNCQuelc0IAaO4nLUXk0BOSxSxt8kCvsUtQIDAQABo4IBPDCC
ATgwHwYDVR0jBBgwFoAUu69+Aj36pvE8hI6t7jiY7NkyMtQwHQYDVR0OBBYEFIKvbIz4xf6W
YXzoHz0rcUhexIvAMA4GA1UdDwEB/wQEAwIBhjASBgNVHRMBAf8ECDAGAQH/AgEAMBEGA1Ud
IAQKMAgwBgYEVR0gADBMBgNVHR8ERTBDMEGgP6A9hjtodHRwOi8vY3JsLmNvbW9kb2NhLmNv
bS9DT01PRE9SU0FDZXJ0aWZpY2F0aW9uQXV0aG9yaXR5LmNybDBxBggrBgEFBQcBAQRlMGMw
OwYIKwYBBQUHMAKGL2h0dHA6Ly9jcnQuY29tb2RvY2EuY29tL0NPTU9ET1JTQUFkZFRydXN0
Q0EuY3J0MCQGCCsGAQUFBzABhhhodHRwOi8vb2NzcC5jb21vZG9jYS5jb20wDQYJKoZIhvcN
AQEMBQADggIBAHhcsoEoNE887l9Wzp+XVuyPomsX9vP2SQgG1NgvNc3fQP7TcePo7EIMERoh
42awGGsma65u/ITse2hKZHzT0CBxhuhb6txM1n/y78e/4ZOs0j8CGpfb+SJA3GaBQ+394k+z
3ZByWPQedXLL1OdK8aRINTsjk/H5Ns77zwbjOKkDamxlpZ4TKSDMKVmU/PUWNMKSTvtlenlx
Bhh7ETrN543j/Q6qqgCWgWuMAXijnRglp9fyadqGOncjZjaaSOGTTFB+E2pvOUtY+hPebuPt
Tbq7vODqzCM6ryEhNhzf+enm0zlpXK7q332nXttNtjv7VFNYG+I31gnMrwfHM5tdhYF/8v5U
Y5g2xANPECTQdu9vWPoqNSGDt87b3gXb1AiGGaI06vzgkejL580ul+9hz9D0S0U4jkhJiA7E
uTecP/CFtR72uYRBcunwwH3fciPjviDDAI9SnC/2aPY8ydehzuZutLbZdRJ5PDEJM/1tyZR2
niOYihZ+FCbtf3D9mB12D4ln9icgc7CwaxpNSCPt8i/GqK2HsOgkL3VYnwtx7cJUmpvVdZ4o
gnzgXtgtdk3ShrtOS1iAN2ZBXFiRmjVzmehoMof06r1xub+85hFQzVxZx5/bRaTKTlL8YXLI
8nAbR9HWdFqzcOoB/hxfEyIQpx9/s81rgzdEZOofSlZHynoSMYICszCCAq8CAQEwga0wgZcx
CzAJBgNVBAYTAkdCMRswGQYDVQQIExJHcmVhdGVyIE1hbmNoZXN0ZXIxEDAOBgNVBAcTB1Nh
bGZvcmQxGjAYBgNVBAoTEUNPTU9ETyBDQSBMaW1pdGVkMT0wOwYDVQQDEzRDT01PRE8gUlNB
IENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBAhEAiiHRAx2BN/J/
vHFQnEFVdDANBglghkgBZQMEAgEFAKCB1zAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwG
CSqGSIb3DQEJBTEPFw0xOTA2MDMyMTEyNTdaMC8GCSqGSIb3DQEJBDEiBCCd1utlTpGdhmaG
8AdIHgD09bV5nSKCJZQp9+JLk1a6yzBsBgkqhkiG9w0BCQ8xXzBdMAsGCWCGSAFlAwQBKjAL
BglghkgBZQMEAQIwCgYIKoZIhvcNAwcwDgYIKoZIhvcNAwICAgCAMA0GCCqGSIb3DQMCAgFA
MAcGBSsOAwIHMA0GCCqGSIb3DQMCAgEoMA0GCSqGSIb3DQEBAQUABIIBAK8po4EzLU/YE2q4
CFfUDNbg/bGNkAihc9O3P0v+d8a4KaIpA1bgGgj7wJCSVo3ZB+TBd380FxzwOIF3U3OAVthC
/rmDvxSlCiecwAw1LSTSNzowl32G+Fn+y3zpKPJkdIkSelh4VeYgkbymXdJaPFpVFWfaRGZS
R8/9jwv6kVkr0jt/ckFJ7t1euQu6U8MYSSLxxErybt78sa7OH9qpG+0rpAixscnW/sevropW
sfLe1JG+Ns43q/gvk0zZZmvCzsGdvsjJxqxUKex2E2KYzQLDQ2SqDgJ2EY+N4CxQ5IrG2E/a
qX2ka4b5mWW67jmWvjQuOJou3YVNy+ug5JnnzZ0AAAAAAAA=
--------------ms060009060403020303030302--
