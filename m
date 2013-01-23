Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r0NKuWVE005863
	for <linux-lvm@redhat.com>; Wed, 23 Jan 2013 15:56:32 -0500
Received: from mailrelay2.lrz-muenchen.de (mailrelay2.lrz-muenchen.de
	[129.187.254.102])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r0NKuSeh024068
	for <linux-lvm@redhat.com>; Wed, 23 Jan 2013 15:56:29 -0500
Received: from mailout.lrz.de ([10.156.6.64] [10.156.6.64]) by
	mailrelay2.lrz-muenchen.de with ESMTP for linux-lvm@redhat.com;
	Wed, 23 Jan 2013 21:56:20 +0100
Received: from [192.168.109.72] (zzz-dyn-nat-180.lnt.ei.tum.de
	[129.187.109.180])
	by postout3.mail.lrz.de (Postfix) with ESMTP id 001022007E
	for <linux-lvm@redhat.com>; Wed, 23 Jan 2013 21:56:19 +0100 (CET)
Message-Id: <51004E73.9080902@tum.de>
Date: Wed, 23 Jan 2013 21:56:19 +0100
From: Joschi Brauchle <joschi.brauchle@tum.de>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
	micalg=sha1; boundary="------------ms030808050600080507010204"
Subject: [linux-lvm] vgremove fails to remove empty VG (v2.02.98)
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

--------------ms030808050600080507010204
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

Hello,

I get the following error with lvm2.02.98:
-----------
#/sbin/vgdisplay --units k -v 'system'

   --- Volume group ---
   VG Name               system
   System ID
   Format                lvm2
   Metadata Areas        1
   Metadata Sequence No  13
   VG Access             read/write
   VG Status             resizable
   MAX LV                0
   Cur LV                0
   Open LV               0
   Max PV                0
   Cur PV                1
   Act PV                1
   VG Size               104669184.00 KiB
   PE Size               4096.00 KiB
   Total PE              25554
   Alloc PE / Size       0 / 0 KiB
   Free  PE / Size       25554 / 104669184.00 KiB
   VG UUID               Qs0uaZ-L88n-tC7T-fZQj-sgJY-2yRX-Dlt2Cr

   --- Physical volumes ---
   PV Name               /dev/sda3
   PV UUID               wzGjXi-F2lT-d2d4-l5a6-EmfM-W838-YxaFIh
   PV Status             allocatable
   Total PE / Free PE    25554 / 25554
-----------

VG system is empty, but still:
-----------
# /sbin/vgremove 'system'
-----------
failes with status code 5, which means 'can't remove volume group=20
containing logical volumes' (from man page).

Looks like a bug in vgremove?

Best regards,
J Brauchle


--------------ms030808050600080507010204
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIObzCC
BCEwggMJoAMCAQICAgDHMA0GCSqGSIb3DQEBBQUAMHExCzAJBgNVBAYTAkRFMRwwGgYDVQQK
ExNEZXV0c2NoZSBUZWxla29tIEFHMR8wHQYDVQQLExZULVRlbGVTZWMgVHJ1c3QgQ2VudGVy
MSMwIQYDVQQDExpEZXV0c2NoZSBUZWxla29tIFJvb3QgQ0EgMjAeFw0wNjEyMTkxMDI5MDBa
Fw0xOTA2MzAyMzU5MDBaMFoxCzAJBgNVBAYTAkRFMRMwEQYDVQQKEwpERk4tVmVyZWluMRAw
DgYDVQQLEwdERk4tUEtJMSQwIgYDVQQDExtERk4tVmVyZWluIFBDQSBHbG9iYWwgLSBHMDEw
ggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDpm8NnhfkNrvWNVMOWUDU9YuluTO2U
1wBblSJ01CDrNI/W7MAxBAuZgeKmFNJSoCgjhIt0iQReW+DieMF4yxbLKDU5ey2QRdDtoAB6
fL9KDhsAw4bpXCsxEXsM84IkQ4wcOItqaACa7txPeKvSxhObdq3u3ibo7wGvdA/BCaL2a869
080UME/15eOkyGKbghoDJzANAmVgTe3RCSMqljVYJ9N2xnG2kB3E7f81hn1vM7PbD8URwoqD
oZRdQWvY0hD1TP3KUazZve+Sg7va64sWVlZDz+HVEz2mHycwzUlU28kTNJpxdcVs6qcLmPkh
nSevPqM5OUhqjK3JmfvDEvK9AgMBAAGjgdkwgdYwcAYDVR0fBGkwZzBloGOgYYZfaHR0cDov
L3BraS50ZWxlc2VjLmRlL2NnaS1iaW4vc2VydmljZS9hZl9Eb3dubG9hZEFSTC5jcmw/LWNy
bF9mb3JtYXQ9WF81MDkmLWlzc3Vlcj1EVF9ST09UX0NBXzIwHQYDVR0OBBYEFEm3xs/oPR9/
6kR7Eyn38QpwPt5kMB8GA1UdIwQYMBaAFDHDeRu69VPXF+CJei0XbAqzK50zMA4GA1UdDwEB
/wQEAwIBBjASBgNVHRMBAf8ECDAGAQH/AgECMA0GCSqGSIb3DQEBBQUAA4IBAQA74Vp3wEgX
3KkY7IGvWonwvSiSpspZGBJw7Cjy565/lizn8l0ZMfYTK3S9vYCyufdnyTmieTvhERHua3iR
M347XyYndVNljjNj7s9zw7CSI0khUHUjoR8Y4pSFPT8z6XcgjaK95qGFKUD2P3MyWA0Ja6ba
hWzAP7uNZmRWJE6uDT8yNQFb6YyC2XJZT7GGhfF0hVblw/hc843uR7NTBXDn5U2KaYMo4RMJ
hp5eyOpYHgwf+aTUWgRo/Sg+iwK2WLX2oSw3VwBnqyNojWOl75lrXP1LVvarQIc01BGSbOyH
xQoLBzNytG8MHVQs2FHHzL8w00Ny8TK/jM5JY6gA9/IcMIIEzDCCA7SgAwIBAgIECfEKYzAN
BgkqhkiG9w0BAQUFADBaMQswCQYDVQQGEwJERTETMBEGA1UEChMKREZOLVZlcmVpbjEQMA4G
A1UECxMHREZOLVBLSTEkMCIGA1UEAxMbREZOLVZlcmVpbiBQQ0EgR2xvYmFsIC0gRzAxMB4X
DTA3MDIxMzEwMDMwMVoXDTE5MDIxMjAwMDAwMFowYDELMAkGA1UEBhMCREUxKTAnBgNVBAoT
IFRlY2huaXNjaGUgVW5pdmVyc2l0YWV0IE11ZW5jaGVuMSYwJAYDVQQDEx1aZXJ0aWZpemll
cnVuZ3NzdGVsbGUgZGVyIFRVTTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAKjv
6NPYBFzJ+ZELc6JfE/5aga/7K7LWMVBHZvohdJZGd31pN9QEfzQeph0kiqsm1X5kHraPtTc9
jMH8SLASBI45JppNSSYRfw6j6RjKA7PUStRfV0dq5cBPBl5FpxAY23lAzMzY+6EQEq3/hS8I
a3zG5Q5saJsc+9B2So8+gvaVwZhrWhe7NhyvVqYMiBpTE9fbViah3Ur5VdDpcGbsb/BqRDxR
rOCjQdNQ6TCQHfIUEDTQMW/czj1wbgLxrp8sB5XlwMPX7c2Do+yByWbcrkitdGEeagcWqC1g
c8pD/f8PJIoVeW4cy60PjHRIfYC0NBVvg9P0viuwFEyWM17brI8CAwEAAaOCAZIwggGOMA8G
A1UdEwEB/wQFMAMBAf8wCwYDVR0PBAQDAgEGMB0GA1UdDgQWBBSdnyPwGRt+xyNdJyrMpTY6
pmnliTAfBgNVHSMEGDAWgBRJt8bP6D0ff+pEexMp9/EKcD7eZDCBiAYDVR0fBIGAMH4wPaA7
oDmGN2h0dHA6Ly9jZHAxLnBjYS5kZm4uZGUvZ2xvYmFsLXJvb3QtY2EvcHViL2NybC9jYWNy
bC5jcmwwPaA7oDmGN2h0dHA6Ly9jZHAyLnBjYS5kZm4uZGUvZ2xvYmFsLXJvb3QtY2EvcHVi
L2NybC9jYWNybC5jcmwwgaIGCCsGAQUFBwEBBIGVMIGSMEcGCCsGAQUFBzAChjtodHRwOi8v
Y2RwMS5wY2EuZGZuLmRlL2dsb2JhbC1yb290LWNhL3B1Yi9jYWNlcnQvY2FjZXJ0LmNydDBH
BggrBgEFBQcwAoY7aHR0cDovL2NkcDIucGNhLmRmbi5kZS9nbG9iYWwtcm9vdC1jYS9wdWIv
Y2FjZXJ0L2NhY2VydC5jcnQwDQYJKoZIhvcNAQEFBQADggEBAINoNtnDCyUwcPDc68e/u5O/
ffcs+r4x4OeRxKtYXd3dRCyuCoxJAhhepSk2oQc89QhWFOOBxeT7KosoCsn+htLtgnZLj4R/
yNX8MemzYP170OZ/m4X9vmRhty+gh90kCSZlaQgT9MfV+7g1C6QgelUDV8N68Nd4Pl1IMBWk
AkZZLcT9/Hgol59FGhFDF1uFx7Su+vYBlO3g+tHnI18XJBDOs2abHRXI5PmYcvtGirsVMfWc
s0ooZOonYw5pvWI+N8dat9DNIvgRdoChTOKdvPURjtkY3kJkvdAfPKsf/ZCj3HhdEn0b6VZQ
qDj7VJRCvFOL0tqSc2wUrHLRw/9Mu2gwggV2MIIEXqADAgECAgQQ26t7MA0GCSqGSIb3DQEB
BQUAMGAxCzAJBgNVBAYTAkRFMSkwJwYDVQQKEyBUZWNobmlzY2hlIFVuaXZlcnNpdGFldCBN
dWVuY2hlbjEmMCQGA1UEAxMdWmVydGlmaXppZXJ1bmdzc3RlbGxlIGRlciBUVU0wHhcNMTAx
MDE4MTEyMjIwWhcNMTMxMDE3MTEyMjIwWjCB3TELMAkGA1UEBhMCREUxDzANBgNVBAgTBkJh
eWVybjERMA8GA1UEBxMITXVlbmNoZW4xKTAnBgNVBAoTIFRlY2huaXNjaGUgVW5pdmVyc2l0
YWV0IE11ZW5jaGVuMT4wPAYDVQQLEzVGYWt1bHRhZXQgZnVlciBFbGVrdHJvdGVjaG5payB1
bmQgSW5mb3JtYXRpb25zdGVjaG5pazEYMBYGA1UEAxMPSm9zY2hpIEJyYXVjaGxlMSUwIwYJ
KoZIhvcNAQkBFhZqb3NjaGkuYnJhdWNobGVAdHVtLmRlMIIBIjANBgkqhkiG9w0BAQEFAAOC
AQ8AMIIBCgKCAQEA2cF6tIlKUNmY12XEz8gAtWLnifpPKQ06VhsHNH3FRa3qqpScW96ypYRL
z3HTot2GdY7JSmEKSx7p5ehlOKbEcKsr57nbVzOkVW/0SmmWjroxzXe1e4KTw9QmpxXXQI5F
uUXRQoXZhgkPJWXa31uEzixbWIO4DHzM2TuEidFk3y2zcyA4j6g8flb8zMMSQjqAafTDA8Cf
A+j7cJZOCk30UZYNRuGLJi6tJi1nmaDy1ZMDAQA5P8nQJ3BpJGCxWwm5A0ppEBlKPFWjproJ
n8NErCRHRhWWcKkHwzwI48zB0bnrsKqMQVpkgSquGD94dbyDAIbht5M8HSE8eqmWj7Ug6QID
AQABo4IBuDCCAbQwCQYDVR0TBAIwADALBgNVHQ8EBAMCBeAwKQYDVR0lBCIwIAYIKwYBBQUH
AwIGCCsGAQUFBwMEBgorBgEEAYI3FAICMB0GA1UdDgQWBBSqoAQm9/5Acan0m0kcMmLzRDUu
FDAfBgNVHSMEGDAWgBSdnyPwGRt+xyNdJyrMpTY6pmnliTAhBgNVHREEGjAYgRZqb3NjaGku
YnJhdWNobGVAdHVtLmRlMHcGA1UdHwRwMG4wNaAzoDGGL2h0dHA6Ly9jZHAxLnBjYS5kZm4u
ZGUvdHVtLWNhL3B1Yi9jcmwvY2FjcmwuY3JsMDWgM6Axhi9odHRwOi8vY2RwMi5wY2EuZGZu
LmRlL3R1bS1jYS9wdWIvY3JsL2NhY3JsLmNybDCBkgYIKwYBBQUHAQEEgYUwgYIwPwYIKwYB
BQUHMAKGM2h0dHA6Ly9jZHAxLnBjYS5kZm4uZGUvdHVtLWNhL3B1Yi9jYWNlcnQvY2FjZXJ0
LmNydDA/BggrBgEFBQcwAoYzaHR0cDovL2NkcDIucGNhLmRmbi5kZS90dW0tY2EvcHViL2Nh
Y2VydC9jYWNlcnQuY3J0MA0GCSqGSIb3DQEBBQUAA4IBAQCnQxDlwDKK5DSFIj5NaYxqCc3W
xO2X/VXL+MSw+3cgsp9W9pYsnWSUoYY32lHoOj45LNGJWZ4ikueDiG20j23n/ao+G8lwVh3D
+UPikmFPp2PWg3GlbRwQ33cbAxVIJ+XsOJupbQDfKh3U4AV91bdd/Eug3OAGOMbtB84HgD9G
sy1xEUDHuq4Ol24JUuZdimNPHUyMvk4bth+CECNcDjiUZ6kJ24m0AKE1GqkRbk7hyfqwhSCU
OP2riJ6JBQZf0U9sK91TjdNF0+he8SZpDJtJdMFZ75TO5Rwr7KLh6v6IefYYPo4f/IfdtMOX
LIVBpOWj/snSrDeGoO9X62zPufqGMYIDUjCCA04CAQEwaDBgMQswCQYDVQQGEwJERTEpMCcG
A1UEChMgVGVjaG5pc2NoZSBVbml2ZXJzaXRhZXQgTXVlbmNoZW4xJjAkBgNVBAMTHVplcnRp
Zml6aWVydW5nc3N0ZWxsZSBkZXIgVFVNAgQQ26t7MAkGBSsOAwIaBQCgggG/MBgGCSqGSIb3
DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTEzMDEyMzIwNTYxOVowIwYJKoZI
hvcNAQkEMRYEFM/xobm/PiqyhVsOtgPY7YplfM5yMGwGCSqGSIb3DQEJDzFfMF0wCwYJYIZI
AWUDBAEqMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzAOBggqhkiG9w0DAgICAIAwDQYIKoZI
hvcNAwICAUAwBwYFKw4DAgcwDQYIKoZIhvcNAwICASgwdwYJKwYBBAGCNxAEMWowaDBgMQsw
CQYDVQQGEwJERTEpMCcGA1UEChMgVGVjaG5pc2NoZSBVbml2ZXJzaXRhZXQgTXVlbmNoZW4x
JjAkBgNVBAMTHVplcnRpZml6aWVydW5nc3N0ZWxsZSBkZXIgVFVNAgQQ26t7MHkGCyqGSIb3
DQEJEAILMWqgaDBgMQswCQYDVQQGEwJERTEpMCcGA1UEChMgVGVjaG5pc2NoZSBVbml2ZXJz
aXRhZXQgTXVlbmNoZW4xJjAkBgNVBAMTHVplcnRpZml6aWVydW5nc3N0ZWxsZSBkZXIgVFVN
AgQQ26t7MA0GCSqGSIb3DQEBAQUABIIBADw314b3qb6G4foeYdgBtx0+9tD32KJ7OaafDVj0
lzLMG2bX9I0iFB8P/vWwZAsxE9oitgclIZZdoLApaBccUXAHQOuiAr0+dQTJ/gJv/r0aauwi
jdgx4wQZ1On8MtGfHVD8JdHZMqQ1DsxA6k+BJVBrnyo1xhPYCyt5ruTd5J/6Kb8qhlP3L/CZ
8DAeLxebZg1Uzsn+ATtDypC2TBtbOaN95RWGB5PZ6m6+JYO/99hWLkCn+ConJ8bbAVtFA8/F
U34LE/s5ms22CP1/GElwsl1k+Ynpyd7y4EZX5g9i3sXKAVJCVd/QGEKoKhiSCqSA97ThNFSR
0fuZKJIjuZqDsygAAAAAAAA=
--------------ms030808050600080507010204--
