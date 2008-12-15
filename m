Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mBF8nsho028760
	for <linux-lvm@redhat.com>; Mon, 15 Dec 2008 03:49:54 -0500
Received: from mailrelay1.lrz-muenchen.de (mailrelay1.lrz-muenchen.de
	[129.187.254.106])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id mBF8ndO7014386
	for <linux-lvm@redhat.com>; Mon, 15 Dec 2008 03:49:40 -0500
Received: from [129.187.151.193] ([129.187.151.193] [129.187.151.193]) by
	mailout.lrz-muenchen.de with ESMTP for linux-lvm@redhat.com;
	Mon, 15 Dec 2008 09:49:33 +0100
Message-Id: <49461A1C.8050006@tum.de>
Date: Mon, 15 Dec 2008 09:49:32 +0100
From: Reinald Gfuellner <Reinald.Gfuellner@tum.de>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
	micalg=sha1; boundary="------------ms020501050205030706090701"
Subject: [linux-lvm] FC8: "no Volumegroups found" after Mainboard-Change,
	Rescueboot:OK
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com

This is a cryptographically signed message in MIME format.

--------------ms020501050205030706090701
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit


After changing the mainboard, booting of several preexistent
FC8-Installations fails: "No volume groups found".
(kernel can not mount root-filesystem.)

DVD-Rescue-Boot however is OK, volumegroups are found and
root-filesystem is accessible.

I've been searching quite a while for a solution.

Any help would be great! Thanks.
  Reinald
-------------------------------------------------------------------------------

Fedora 8
Gigabyte-MA78GM-S2 (Chipset: AMD SB700, AMD 780G)
HD, DVD: PATA (SATA-Controller : OFF)


FC8-DVD-Rescue-Session:

fdisk -l :
Disk /dev/sda: 10.1 GB, 10140204544 bytes
255 heads, 63 sectors/track, 1232 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes
Disk identifier: 0x0009356a

Device Boot Start End Blocks Id System
/dev/sda1 * 1 25 200781 83 Linux
/dev/sda2 26 1232 9695227+ 8e Linux LVM

------
/etc/fstab:
/dev/VolGroup00/LogVol00 / ext3 defaults 1 1
LABEL=/boot /boot ext3 defaults 1 2
tmpfs /dev/shm tmpfs defaults 0 0
devpts /dev/pts devpts gid=5,mode=620 0 0
sysfs /sys sysfs defaults 0 0
proc /proc proc defaults 0 0
/dev/VolGroup00/LogVol01 swap swap defaults 0 0
-----
vpdisplay:
--- Physical volume ---
PV Name /dev/sda2
VG Name VolGroup00
PV Size 9.25 GB / not usable 28.00 MB
Allocatable yes
PE Size (KByte) 32768
Total PE 295
Free PE 1
Allocated PE 294
PV UUID DC88UL-JHKW-wZak-2MlF-paO2-3u2a-uVqlIr
--------
lvdisplay:
--- Logical volume ---
LV Name /dev/VolGroup00/LogVol00
VG Name VolGroup00
LV UUID GvUO1w-rZMj-Rd0X-pdWm-wNeB-DeZW-5jBcX6
LV Write Access read/write
LV Status available
# open 1
LV Size 8.31 GB
Current LE 266
Segments 1
Allocation inherit
Read ahead sectors 0
Block device 253:0

--- Logical volume ---
LV Name /dev/VolGroup00/LogVol01
VG Name VolGroup00
LV UUID CREAgo-wh4y-Bnyl-CjFn-00oZ-cJEV-onvFh8
LV Write Access read/write
LV Status available
# open 1
LV Size 896.00 MB
Current LE 28
Segments 1
Allocation inherit
Read ahead sectors 0
Block device 253:1
-- 
________________________________________________________________________
Dipl.-Ing.(FH) Reinald Gfuellner               http://www.rcs.ei.tum.de
Institute for Real-Time Computer Systems (RCS)     fon +49-89-289-23564
Technische Universitaet Muenchen, D-80290 Muenchen fax +49-89-289-23555

--------------ms020501050205030706090701
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIITozCC
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
qDj7VJRCvFOL0tqSc2wUrHLRw/9Mu2gwggVTMIIEO6ADAgECAgQLyRDHMA0GCSqGSIb3DQEB
BQUAMGAxCzAJBgNVBAYTAkRFMSkwJwYDVQQKEyBUZWNobmlzY2hlIFVuaXZlcnNpdGFldCBN
dWVuY2hlbjEmMCQGA1UEAxMdWmVydGlmaXppZXJ1bmdzc3RlbGxlIGRlciBUVU0wHhcNMDgw
MjA2MTEwMDA5WhcNMTEwMjA1MTEwMDA5WjCBuDELMAkGA1UEBhMCREUxDzANBgNVBAgTBkJh
eWVybjERMA8GA1UEBxMITXVlbmNoZW4xKTAnBgNVBAoTIFRlY2huaXNjaGUgVW5pdmVyc2l0
YWV0IE11ZW5jaGVuMT4wPAYDVQQLEzVGYWt1bHRhZXQgZnVlciBFbGVrdHJvdGVjaG5payB1
bmQgSW5mb3JtYXRpb25zdGVjaG5pazEaMBgGA1UEAxMRUmVpbmFsZCBHZnVlbGxuZXIwggEi
MA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCsFQDvWhiVgY58hiffinpk6VUANpZQfeEp
2+w7OgYAZFzmD5xufFsQX2nMYcDLNVdj73OdWWbXsu5ii7ubkHQwOCHfYZFK1fHjO/WZTa5V
Sh6Cz2YYldaf0hG5KVVCKRis7eg/bkWOJ/77atOzfIlcHybrUYRgRKjSxu0mpM5rjLCEj75y
9rVR1Zz044/1N18OX5KtnjRFpG1xGzoFk3r9ofL/nLyvxWQtx7a3MwBA0EcfqgqkWhnVjm/V
oVZuoNDgKyWATf+paUdFFTofOx01/lK/XhW40f4rJthRk4IfaWWYjjZriOKqcbzgGlkzZuxz
23OhvUSmjsfN6xcvEIIbAgMBAAGjggG6MIIBtjAJBgNVHRMEAjAAMAsGA1UdDwQEAwIF4DAp
BgNVHSUEIjAgBggrBgEFBQcDAgYIKwYBBQUHAwQGCisGAQQBgjcUAgIwHQYDVR0OBBYEFFE1
sSA7HZlwVayUX3TFXHoXXKdeMB8GA1UdIwQYMBaAFJ2fI/AZG37HI10nKsylNjqmaeWJMCMG
A1UdEQQcMBqBGFJlaW5hbGQuR2Z1ZWxsbmVyQHR1bS5kZTB3BgNVHR8EcDBuMDWgM6Axhi9o
dHRwOi8vY2RwMS5wY2EuZGZuLmRlL3R1bS1jYS9wdWIvY3JsL2NhY3JsLmNybDA1oDOgMYYv
aHR0cDovL2NkcDIucGNhLmRmbi5kZS90dW0tY2EvcHViL2NybC9jYWNybC5jcmwwgZIGCCsG
AQUFBwEBBIGFMIGCMD8GCCsGAQUFBzAChjNodHRwOi8vY2RwMS5wY2EuZGZuLmRlL3R1bS1j
YS9wdWIvY2FjZXJ0L2NhY2VydC5jcnQwPwYIKwYBBQUHMAKGM2h0dHA6Ly9jZHAyLnBjYS5k
Zm4uZGUvdHVtLWNhL3B1Yi9jYWNlcnQvY2FjZXJ0LmNydDANBgkqhkiG9w0BAQUFAAOCAQEA
T9BXSR2xE/bUHcHzC3LaVPZxRiNSRB6FdsXa6xhTGQejs0XcxnwPewVzaokmTUT41r/sr/ic
DBgxr5n4FwCfYACKW3k4t1llzajuuMUORG1CBZWvzQogB0i8CEuj8+xSPvGQHrBKnjjywKIr
kbxBV6/9VRhjRLZtW+sULxEIEHgMJwnzxx3CeUfn26GAbf0FWFX7MuZgYwrJx6JAPUjzKjCj
HoguHk8UXhmtE0j6jeJFDovEZKKS4VzzqVRmDrCv/hTYE0jwKIoUHZQMSJqjctD7dDsEfjf8
uoBzndWjlwoEDLHtMfzbs2tPAoLlXG/exE1bvY0HdkdDgOMkM6Pq9DCCBVMwggQ7oAMCAQIC
BAvJEMcwDQYJKoZIhvcNAQEFBQAwYDELMAkGA1UEBhMCREUxKTAnBgNVBAoTIFRlY2huaXNj
aGUgVW5pdmVyc2l0YWV0IE11ZW5jaGVuMSYwJAYDVQQDEx1aZXJ0aWZpemllcnVuZ3NzdGVs
bGUgZGVyIFRVTTAeFw0wODAyMDYxMTAwMDlaFw0xMTAyMDUxMTAwMDlaMIG4MQswCQYDVQQG
EwJERTEPMA0GA1UECBMGQmF5ZXJuMREwDwYDVQQHEwhNdWVuY2hlbjEpMCcGA1UEChMgVGVj
aG5pc2NoZSBVbml2ZXJzaXRhZXQgTXVlbmNoZW4xPjA8BgNVBAsTNUZha3VsdGFldCBmdWVy
IEVsZWt0cm90ZWNobmlrIHVuZCBJbmZvcm1hdGlvbnN0ZWNobmlrMRowGAYDVQQDExFSZWlu
YWxkIEdmdWVsbG5lcjCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAKwVAO9aGJWB
jnyGJ9+KemTpVQA2llB94Snb7Ds6BgBkXOYPnG58WxBfacxhwMs1V2Pvc51ZZtey7mKLu5uQ
dDA4Id9hkUrV8eM79ZlNrlVKHoLPZhiV1p/SEbkpVUIpGKzt6D9uRY4n/vtq07N8iVwfJutR
hGBEqNLG7SakzmuMsISPvnL2tVHVnPTjj/U3Xw5fkq2eNEWkbXEbOgWTev2h8v+cvK/FZC3H
trczAEDQRx+qCqRaGdWOb9WhVm6g0OArJYBN/6lpR0UVOh87HTX+Ur9eFbjR/ism2FGTgh9p
ZZiONmuI4qpxvOAaWTNm7HPbc6G9RKaOx83rFy8QghsCAwEAAaOCAbowggG2MAkGA1UdEwQC
MAAwCwYDVR0PBAQDAgXgMCkGA1UdJQQiMCAGCCsGAQUFBwMCBggrBgEFBQcDBAYKKwYBBAGC
NxQCAjAdBgNVHQ4EFgQUUTWxIDsdmXBVrJRfdMVcehdcp14wHwYDVR0jBBgwFoAUnZ8j8Bkb
fscjXScqzKU2OqZp5YkwIwYDVR0RBBwwGoEYUmVpbmFsZC5HZnVlbGxuZXJAdHVtLmRlMHcG
A1UdHwRwMG4wNaAzoDGGL2h0dHA6Ly9jZHAxLnBjYS5kZm4uZGUvdHVtLWNhL3B1Yi9jcmwv
Y2FjcmwuY3JsMDWgM6Axhi9odHRwOi8vY2RwMi5wY2EuZGZuLmRlL3R1bS1jYS9wdWIvY3Js
L2NhY3JsLmNybDCBkgYIKwYBBQUHAQEEgYUwgYIwPwYIKwYBBQUHMAKGM2h0dHA6Ly9jZHAx
LnBjYS5kZm4uZGUvdHVtLWNhL3B1Yi9jYWNlcnQvY2FjZXJ0LmNydDA/BggrBgEFBQcwAoYz
aHR0cDovL2NkcDIucGNhLmRmbi5kZS90dW0tY2EvcHViL2NhY2VydC9jYWNlcnQuY3J0MA0G
CSqGSIb3DQEBBQUAA4IBAQBP0FdJHbET9tQdwfMLctpU9nFGI1JEHoV2xdrrGFMZB6OzRdzG
fA97BXNqiSZNRPjWv+yv+JwMGDGvmfgXAJ9gAIpbeTi3WWXNqO64xQ5EbUIFla/NCiAHSLwI
S6Pz7FI+8ZAesEqeOPLAoiuRvEFXr/1VGGNEtm1b6xQvEQgQeAwnCfPHHcJ5R+fboYBt/QVY
Vfsy5mBjCsnHokA9SPMqMKMeiC4eTxReGa0TSPqN4kUOi8RkopLhXPOpVGYOsK/+FNgTSPAo
ihQdlAxImqNy0Pt0OwR+N/y6gHOd1aOXCgQMse0x/Nuza08CguVcb97ETVu9jQd2R0OA4yQz
o+r0MYIDODCCAzQCAQEwaDBgMQswCQYDVQQGEwJERTEpMCcGA1UEChMgVGVjaG5pc2NoZSBV
bml2ZXJzaXRhZXQgTXVlbmNoZW4xJjAkBgNVBAMTHVplcnRpZml6aWVydW5nc3N0ZWxsZSBk
ZXIgVFVNAgQLyRDHMAkGBSsOAwIaBQCgggGlMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEw
HAYJKoZIhvcNAQkFMQ8XDTA4MTIxNTA4NDkzMlowIwYJKoZIhvcNAQkEMRYEFHkNBo4Lmt2P
VTTLKmZBlRB2vboMMFIGCSqGSIb3DQEJDzFFMEMwCgYIKoZIhvcNAwcwDgYIKoZIhvcNAwIC
AgCAMA0GCCqGSIb3DQMCAgFAMAcGBSsOAwIHMA0GCCqGSIb3DQMCAgEoMHcGCSsGAQQBgjcQ
BDFqMGgwYDELMAkGA1UEBhMCREUxKTAnBgNVBAoTIFRlY2huaXNjaGUgVW5pdmVyc2l0YWV0
IE11ZW5jaGVuMSYwJAYDVQQDEx1aZXJ0aWZpemllcnVuZ3NzdGVsbGUgZGVyIFRVTQIEC8kQ
xzB5BgsqhkiG9w0BCRACCzFqoGgwYDELMAkGA1UEBhMCREUxKTAnBgNVBAoTIFRlY2huaXNj
aGUgVW5pdmVyc2l0YWV0IE11ZW5jaGVuMSYwJAYDVQQDEx1aZXJ0aWZpemllcnVuZ3NzdGVs
bGUgZGVyIFRVTQIEC8kQxzANBgkqhkiG9w0BAQEFAASCAQA97Q8E1COFgBjn22P0Gw+wgDqj
7aPZ1ZARykxGAmWt9x5MXEy3Gs2J+Sqc+U3XLeeXeAN2VcQxyZgYPx29WDg8jrR/mlzEdlRL
9NmRx1I2YcmVWBqhOTpJ6Gxst7T1sjDnjv5NYjZIYoFUtijOb5v0AlMEhETOGuLJ6kCxkQEQ
qmGPpHMX0q5GvIchVOor1qKMAy+hxQNAK076L57UwWesrhIFH8ELmsPpNzOGsPaWHc5u1TPE
7IVn+ZBwqOrrmhANg3k4m6WV6rvAh7UWgDTX6FbNKfDItRKrbeGL5ZNQHmQrL4+Bd8J0dVuj
oFQ+goQ7rrrQESm7izJ/PJxZXlmaAAAAAAAA
--------------ms020501050205030706090701--
