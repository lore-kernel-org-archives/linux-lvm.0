Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i51H3U009732
	for <linux-lvm@redhat.com>; Tue, 1 Jun 2004 13:03:30 -0400
Received: from mail.shadowconnect.com ([213.239.201.226])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i51H3OXn009351
	for <linux-lvm@redhat.com>; Tue, 1 Jun 2004 13:03:24 -0400
Received: from pd9e0a27b.dip.t-dialin.net ([217.224.162.123]
	helo=[192.168.1.52])
	by mail.shadowconnect.com with asmtp (TLSv1:AES256-SHA:256)
	(Exim 4.34) id 1BVCfa-0002vO-CL
	for linux-lvm@redhat.com; Tue, 01 Jun 2004 19:03:22 +0200
Message-ID: <40BCB865.50208@shadowconnect.com>
Date: Tue, 01 Jun 2004 19:09:57 +0200
From: Markus Lidel <Markus.Lidel@shadowconnect.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] [PATCH] to create a PV on a I2O RAID array
References: <40BCB207.7090404@shadowconnect.com>
	<20040601163949.GI6302@agk.surrey.redhat.com>
In-Reply-To: <20040601163949.GI6302@agk.surrey.redhat.com>
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
	micalg=sha1; boundary="------------ms090501000509000005090202"
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: LVM general discussion and development <linux-lvm@redhat.com>

This is a cryptographically signed message in MIME format.

--------------ms090501000509000005090202
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

Alasdair G Kergon wrote:
>>attached is a patch, which makes it possible to create a PV on a I2O 
>>RAID array.
> Or you can add it to the runtime config file, avoiding 
> having to recompile.
> (types in the devices section: see man lvm.conf or doc/example.conf)

Yep, thanks for the hint. But it could be used for future versions to 
work out of the box, instead of setting it in lvm.conf :-)



Best regards,


Markus Lidel
------------------------------------------
Markus Lidel (Senior IT Consultant)

Shadow Connect GmbH
Carl-Reisch-Weg 12
D-86381 Krumbach
Germany

Phone:  +49 82 82/99 51-0
Fax:    +49 82 82/99 51-11

E-Mail: Markus.Lidel@shadowconnect.com
URL:    http://www.shadowconnect.com

--------------ms090501000509000005090202
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIKPzCC
Az8wggKooAMCAQICAQ0wDQYJKoZIhvcNAQEFBQAwgdExCzAJBgNVBAYTAlpBMRUwEwYDVQQI
EwxXZXN0ZXJuIENhcGUxEjAQBgNVBAcTCUNhcGUgVG93bjEaMBgGA1UEChMRVGhhd3RlIENv
bnN1bHRpbmcxKDAmBgNVBAsTH0NlcnRpZmljYXRpb24gU2VydmljZXMgRGl2aXNpb24xJDAi
BgNVBAMTG1RoYXd0ZSBQZXJzb25hbCBGcmVlbWFpbCBDQTErMCkGCSqGSIb3DQEJARYccGVy
c29uYWwtZnJlZW1haWxAdGhhd3RlLmNvbTAeFw0wMzA3MTcwMDAwMDBaFw0xMzA3MTYyMzU5
NTlaMGIxCzAJBgNVBAYTAlpBMSUwIwYDVQQKExxUaGF3dGUgQ29uc3VsdGluZyAoUHR5KSBM
dGQuMSwwKgYDVQQDEyNUaGF3dGUgUGVyc29uYWwgRnJlZW1haWwgSXNzdWluZyBDQTCBnzAN
BgkqhkiG9w0BAQEFAAOBjQAwgYkCgYEAxKY8VXNV+065yplaHmjAdQRwnd/p/6Me7L3N9Vvy
Gna9fww6YfK/Uc4B1OVQCjDXAmNaLIkVcI7dyfArhVqqP3FWy688Cwfn8R+RNiQqE88r1fOC
dz0Dviv+uxg+B79AgAJk16emu59l0cUqVIUPSAR/p7bRPGEEQB5kGXJgt/sCAwEAAaOBlDCB
kTASBgNVHRMBAf8ECDAGAQH/AgEAMEMGA1UdHwQ8MDowOKA2oDSGMmh0dHA6Ly9jcmwudGhh
d3RlLmNvbS9UaGF3dGVQZXJzb25hbEZyZWVtYWlsQ0EuY3JsMAsGA1UdDwQEAwIBBjApBgNV
HREEIjAgpB4wHDEaMBgGA1UEAxMRUHJpdmF0ZUxhYmVsMi0xMzgwDQYJKoZIhvcNAQEFBQAD
gYEASIzRUIPqCy7MDaNmrGcPf6+svsIXoUOWlJ1/TCG4+DYfqi2fNi/A9BxQIJNwPP2t4WFi
w9k6GX6EsZkbAMUaC4J0niVQlGLH2ydxVyWN3amcOY6MIE9lX5Xa9/eH1sYITq726jTlEBpb
NU1341YheILcIRk13iSx0x1G/11fZU8wggN6MIIC46ADAgECAgML8dEwDQYJKoZIhvcNAQEE
BQAwYjELMAkGA1UEBhMCWkExJTAjBgNVBAoTHFRoYXd0ZSBDb25zdWx0aW5nIChQdHkpIEx0
ZC4xLDAqBgNVBAMTI1RoYXd0ZSBQZXJzb25hbCBGcmVlbWFpbCBJc3N1aW5nIENBMB4XDTA0
MDMxODE0MzM0MVoXDTA1MDMxODE0MzM0MVowgeAxCzAJBgNVBAYTAkRFMQ8wDQYDVQQIEwZC
YXllcm4xETAPBgNVBAcTCEtydW1iYWNoMScwJQYDVQQKEx5TaGFkb3cgQ29ubmVjdCBHbWJI
IChJbnRlcm5ldCkxHTAbBgNVBAwTFFNlbmlvciBJVCBDb25zdWx0YW50MQ4wDAYDVQQEEwVM
aWRlbDEPMA0GA1UEKhMGTWFya3VzMRUwEwYDVQQDEwxNYXJrdXMgTGlkZWwxLTArBgkqhkiG
9w0BCQEWHk1hcmt1cy5MaWRlbEBzaGFkb3djb25uZWN0LmNvbTCCASIwDQYJKoZIhvcNAQEB
BQADggEPADCCAQoCggEBAPmIWQ2zrKutnkd7iB3AQTEwE9q9p7Cs7F3f92dh29+RHpDpAGMv
ZlVxLBNPBkvPdhcVeWLHbKI2XKfjzLzXhVPZEs41KkSecQ9bOLMSu+T6y2SKvcnf0Qxw8pZ1
KJwkIJ0RcLyIUPE0RI/RG0DaBY6toApoLQEJOzKsdxuTUOK94m9kwSCRNJdjuZtYCAOihAVC
fl9vJJNFUw9h4mmZ4RWsjh85kvvqKK3Bo6eYia74AuXH6kWgvuvkyW0w8S9J8f62KXcVNQ8N
Zr9Gd4rclfNj55i73p+FL6opHjhryKa9GIV7IzpEp6q1LQ1OD/glJEaR/Vl0l1YQVWU24dUR
NtsCAwEAAaM7MDkwKQYDVR0RBCIwIIEeTWFya3VzLkxpZGVsQHNoYWRvd2Nvbm5lY3QuY29t
MAwGA1UdEwEB/wQCMAAwDQYJKoZIhvcNAQEEBQADgYEADutiuioIWfT1dzLD72TWc2y3yxg2
sJOZhJQYvZYxdwFh3MOht+Jd/JizLQvOsM+HXuU4qLTyCpYB+AfPpQH3xObQVBWV23d6nBkA
2QWie/BD18wl8Xv2bKykXyvW66l2Kk9VsROUlAQi2GyLiFGd9SvNJcTwNtbqV/8ojXmu7XIw
ggN6MIIC46ADAgECAgML8dEwDQYJKoZIhvcNAQEEBQAwYjELMAkGA1UEBhMCWkExJTAjBgNV
BAoTHFRoYXd0ZSBDb25zdWx0aW5nIChQdHkpIEx0ZC4xLDAqBgNVBAMTI1RoYXd0ZSBQZXJz
b25hbCBGcmVlbWFpbCBJc3N1aW5nIENBMB4XDTA0MDMxODE0MzM0MVoXDTA1MDMxODE0MzM0
MVowgeAxCzAJBgNVBAYTAkRFMQ8wDQYDVQQIEwZCYXllcm4xETAPBgNVBAcTCEtydW1iYWNo
MScwJQYDVQQKEx5TaGFkb3cgQ29ubmVjdCBHbWJIIChJbnRlcm5ldCkxHTAbBgNVBAwTFFNl
bmlvciBJVCBDb25zdWx0YW50MQ4wDAYDVQQEEwVMaWRlbDEPMA0GA1UEKhMGTWFya3VzMRUw
EwYDVQQDEwxNYXJrdXMgTGlkZWwxLTArBgkqhkiG9w0BCQEWHk1hcmt1cy5MaWRlbEBzaGFk
b3djb25uZWN0LmNvbTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAPmIWQ2zrKut
nkd7iB3AQTEwE9q9p7Cs7F3f92dh29+RHpDpAGMvZlVxLBNPBkvPdhcVeWLHbKI2XKfjzLzX
hVPZEs41KkSecQ9bOLMSu+T6y2SKvcnf0Qxw8pZ1KJwkIJ0RcLyIUPE0RI/RG0DaBY6toApo
LQEJOzKsdxuTUOK94m9kwSCRNJdjuZtYCAOihAVCfl9vJJNFUw9h4mmZ4RWsjh85kvvqKK3B
o6eYia74AuXH6kWgvuvkyW0w8S9J8f62KXcVNQ8NZr9Gd4rclfNj55i73p+FL6opHjhryKa9
GIV7IzpEp6q1LQ1OD/glJEaR/Vl0l1YQVWU24dURNtsCAwEAAaM7MDkwKQYDVR0RBCIwIIEe
TWFya3VzLkxpZGVsQHNoYWRvd2Nvbm5lY3QuY29tMAwGA1UdEwEB/wQCMAAwDQYJKoZIhvcN
AQEEBQADgYEADutiuioIWfT1dzLD72TWc2y3yxg2sJOZhJQYvZYxdwFh3MOht+Jd/JizLQvO
sM+HXuU4qLTyCpYB+AfPpQH3xObQVBWV23d6nBkA2QWie/BD18wl8Xv2bKykXyvW66l2Kk9V
sROUlAQi2GyLiFGd9SvNJcTwNtbqV/8ojXmu7XIxggM7MIIDNwIBATBpMGIxCzAJBgNVBAYT
AlpBMSUwIwYDVQQKExxUaGF3dGUgQ29uc3VsdGluZyAoUHR5KSBMdGQuMSwwKgYDVQQDEyNU
aGF3dGUgUGVyc29uYWwgRnJlZW1haWwgSXNzdWluZyBDQQIDC/HRMAkGBSsOAwIaBQCgggGn
MBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTA0MDYwMTE3MDk1
N1owIwYJKoZIhvcNAQkEMRYEFJBPj/K+3gCwSO8/ksPwLNY9em0fMFIGCSqGSIb3DQEJDzFF
MEMwCgYIKoZIhvcNAwcwDgYIKoZIhvcNAwICAgCAMA0GCCqGSIb3DQMCAgFAMAcGBSsOAwIH
MA0GCCqGSIb3DQMCAgEoMHgGCSsGAQQBgjcQBDFrMGkwYjELMAkGA1UEBhMCWkExJTAjBgNV
BAoTHFRoYXd0ZSBDb25zdWx0aW5nIChQdHkpIEx0ZC4xLDAqBgNVBAMTI1RoYXd0ZSBQZXJz
b25hbCBGcmVlbWFpbCBJc3N1aW5nIENBAgML8dEwegYLKoZIhvcNAQkQAgsxa6BpMGIxCzAJ
BgNVBAYTAlpBMSUwIwYDVQQKExxUaGF3dGUgQ29uc3VsdGluZyAoUHR5KSBMdGQuMSwwKgYD
VQQDEyNUaGF3dGUgUGVyc29uYWwgRnJlZW1haWwgSXNzdWluZyBDQQIDC/HRMA0GCSqGSIb3
DQEBAQUABIIBAKgneNJYm9tDY+k3JczMofh6Z1s7fCmqTEUgNJaGooqCGTiAdx9n4WrxItDi
8EavNp+ijn/cYqOI1rx+FiFTSXxxaSs1ChbzcXPh//lIc36tW/rX4Bl+iQx+HFS0dinhaDIK
yYzaye8O9GZ+ypgZCvUq6oOYzYXJPpuWfaHYKpfqYEysWJTRcO+aHRmTXmkO2Hc0N7OdDe9I
m5vBBh7mzzC436HskFZoRMuCkz0x6njEE3t+xFXTZYtanMQKpHMkKrKT98TzWfKvMsH/Xje0
mXKkyXJgS1uPOsIumQ6V3hgfbHu9MMAW1oLuaN+dvhDZ9HIwClJT91PlXrvd4iFge6cAAAAA
AAA=
--------------ms090501000509000005090202--
