Received: from mx1.redhat.com (ext-mx18.extmail.prod.ext.phx2.redhat.com
	[10.5.110.47])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B4BB618012
	for <linux-lvm@redhat.com>; Thu, 28 Feb 2019 10:41:49 +0000 (UTC)
Received: from mail.service4.ru (mail.service4.ru [195.201.68.178])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2084230BC9C6
	for <linux-lvm@redhat.com>; Thu, 28 Feb 2019 10:41:47 +0000 (UTC)
Received: from mail.service4.ru (localhost [127.0.0.1])
	by mail.service4.ru (Postfix) with ESMTP id B04774082F
	for <linux-lvm@redhat.com>; Thu, 28 Feb 2019 13:41:45 +0300 (MSK)
Received: from mail.service4.ru ([127.0.0.1])
	by mail.service4.ru (mail.service4.ru [127.0.0.1]) (amavisd-new,
	port 10026) with ESMTP id JuzsPVR31l2S for <linux-lvm@redhat.com>;
	Thu, 28 Feb 2019 13:41:44 +0300 (MSK)
References: <253b63e7-e23b-9a0a-d677-a114c00a5134@linux.ibm.com>
	<2c295ce3-2766-ba41-4bba-575c799b3d46@gmail.com>
	<443f1e98-1dec-17e5-f38d-cbbd52cd541c@linux.ibm.com>
	<be7e5609-7377-d380-1197-7c75ab5999d4@gmail.com>
	<11dcbee0-ec65-d5d2-b07c-9937b99cc5b4@linux.ibm.com>
	<b54c26c3-ce43-674e-d620-28fc2f369956@izyk.ru>
	<3f94a1df-d333-70fe-56ab-3661b384e028@linux.ibm.com>
From: Ilia Zykov <mail@service4.ru>
Message-ID: <30ba3646-1562-4614-0b7a-786d01056bf8@service4.ru>
Date: Thu, 28 Feb 2019 13:41:42 +0300
MIME-Version: 1.0
In-Reply-To: <3f94a1df-d333-70fe-56ab-3661b384e028@linux.ibm.com>
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
	micalg=sha-256; boundary="------------ms010103090402060209020508"
Subject: Re: [linux-lvm] Filesystem corruption with LVM's pvmove onto a PV
 with a larger physical block size
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Ingo Franzki <ifranzki@linux.ibm.com>

This is a cryptographically signed message in MIME format.

--------------ms010103090402060209020508
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

>>
>>  smartctl -i /dev/sdb; blockdev --getbsz --getpbsz /dev/sdb
>> Device Model:     HGST HUS722T2TALA604
>> User Capacity:    2,000,398,934,016 bytes [2.00 TB]
>> Sector Size:      512 bytes logical/physical
>> Rotation Rate:    7200 rpm
>> Form Factor:      3.5 inches
>> 4096
>> 512
>>
>> As you see =E2=80=9C=E2=80=93getbsz=E2=80=9D forever 4096.
> I also see logical block size to be 4096 for all devices on my system.
>> But I think it must be forever 512.
>> What does it mean?
> I have seen the following description about logical and physical block =
sizes somewhere in the internet:
> "Logical block sizes are the units used by the 'kernel' for read/write =
operations.

Kernel can but usually does not want, because reduce performance.

> Physical block sizes are the units which 'disk controllers' use for rea=
d/write operations."

Not disk controller on the motherboard, but controller inside disk. We
don't have access to it.

>=20
> For the problem mentioned in this thread, the physical block size is wh=
at you are looking for.
>>

I think it is BUG in the "blockdev".
My question was:

Can this error(or similar) be related to a problem in pvmove?


--------------ms010103090402060209020508
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
CSqGSIb3DQEJBTEPFw0xOTAyMjgxMDQxNDJaMC8GCSqGSIb3DQEJBDEiBCBt2aH6pDuqic5G
CX1g3PmvfhtgbL/C+i9NVDXArw1/SjBsBgkqhkiG9w0BCQ8xXzBdMAsGCWCGSAFlAwQBKjAL
BglghkgBZQMEAQIwCgYIKoZIhvcNAwcwDgYIKoZIhvcNAwICAgCAMA0GCCqGSIb3DQMCAgFA
MAcGBSsOAwIHMA0GCCqGSIb3DQMCAgEoMA0GCSqGSIb3DQEBAQUABIIBALCUwXOgPTF/MG0h
RkKPKcu4imAtc5Ble8UHQhKJF1P2wtybHPFBvT8aKu6s7RH+H2tCFw8/6rmbM8+CO5tFeuSV
fN+xJ34ZOuVWQF2e8yyiUqkQ0Tc7VIwTWLEGHuKy7bAHnqWQpbN4Ia3s/KAoOQ8QeneEqdJ5
8rXNW8KipXlWY4WxTJLCOy0oS5XeBmDY+QZpPA4DwBT8bHgUg0ElGJ6UVGvc0vCuD5VfKWr0
t8FHwh9toaIc7+VGIer59EyususYxrs+HwoavI/JUN7LMU3UQeNVYOnc9amBZJ/tdJxWXl2X
v+hQFeI+LzZv7HZtUWInRxUIgF6HChuSeM4Y3+QAAAAAAAA=
--------------ms010103090402060209020508--
