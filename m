Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r9895k4n028587
	for <linux-lvm@redhat.com>; Tue, 8 Oct 2013 05:05:46 -0400
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de
	[130.133.4.66])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r9895i9C027830
	for <linux-lvm@redhat.com>; Tue, 8 Oct 2013 05:05:44 -0400
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
	by outpost1.zedat.fu-berlin.de (Exim 4.80.1)
	for linux-lvm@redhat.com with esmtp
	(envelope-from <sebastian.walter@fu-berlin.de>)
	id <1VTTEc-0026S7-Tz>; Tue, 08 Oct 2013 11:05:42 +0200
Received: from triton.geoinf.fu-berlin.de ([130.133.86.10])
	by inpost2.zedat.fu-berlin.de (Exim 4.80.1)
	for linux-lvm@redhat.com with esmtpsa
	(envelope-from <sebastian.walter@fu-berlin.de>)
	id <1VTTEc-0000qC-RJ>; Tue, 08 Oct 2013 11:05:42 +0200
Message-ID: <5253CB06.2000901@fu-berlin.de>
Date: Tue, 08 Oct 2013 11:06:14 +0200
From: Sebastian Walter <sebastian.walter@fu-berlin.de>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
	micalg=sha1; boundary="------------ms010206000108070803020600"
Subject: [linux-lvm] Find Correct LE Size of ext4 Partition (16TB)
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

This is a cryptographically signed message in MIME format.

--------------ms010206000108070803020600
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Dear List,

For extending an ext4 partition to some additional TBs, I extended the
underlying logical volume (LV) to fill the entire physical volume of the
disk. This was about 19.4 TB. While trying to extend the ext4 partition
to fill the hole LV, I realized that the ext4 size limit is still at
16TB. So I set the partition to 16TB. Now I'm wasting space on the LV
which I would like to again be reduced to the minimum size of the
partition (16TB).

Has anyone an idea to exactly calculate the amount of logical extends
(LE) needed for holding the 16TB partition? I'm sure there are some
bytes needed for overhead, journaling, etc. Maybe we can read it from
one of these outputs:

This is the partition:
tune2fs -l /dev/storage/storage
tune2fs 1.42.8 (20-Jun-2013)
Filesystem volume name:   storage
Last mounted on:          /mnt/storage/mnt/storage
Filesystem UUID:          9c05fe79-6a1b-484e-980d-788a6cf5b99c
Filesystem magic number:  0xEF53
Filesystem revision #:    1 (dynamic)
Filesystem features:      has_journal ext_attr resize_inode dir_index
filetype needs_recovery extent sparse_super large_file uninit_bg
Filesystem flags:         signed_directory_hash
Default mount options:    (none)
Filesystem state:         clean
Errors behavior:          Continue
Filesystem OS type:       Linux
Inode count:              2147483648
Block count:              4294967295
Reserved block count:     42909770
Free blocks:              229845414
Free inodes:              1929998857
First block:              0
Block size:               4096
Fragment size:            4096
Blocks per group:         32768
Fragments per group:      32768
Inodes per group:         16384
Inode blocks per group:   512
Filesystem created:       Tue Sep 18 14:50:21 2007
Last mount time:          Tue Oct  8 04:00:16 2013
Last write time:          Tue Oct  8 04:00:16 2013
Mount count:              24
Maximum mount count:      36
Last checked:             Sat Oct  6 14:50:58 2012
Check interval:           15552000 (6 months)
Next check after:         Thu Apr  4 14:50:58 2013
Reserved blocks uid:      0 (user root)
Reserved blocks gid:      0 (group root)
First inode:              11
Inode size:	          128
Journal inode:            8
Default directory hash:   tea
Directory Hash Seed:      675a96e5-faf3-4576-af10-713007ac8387
Journal backup:           inode blocks

This is the Logical Volume (vgdisplay -v):
--- Logical volume ---
  LV Name                /dev/storage/storage
  VG Name                storage
  LV UUID                KQtBJN-RXzo-UUhT-MeiR-Ack8-QB2x-g9aPOT
  LV Write Access        read/write
  LV Status              available
  # open                 1
  LV Size                19.18 TB
  Current LE             5027838
  Segments               4
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     256
  Block device           253:24

And this is the Volume Group (vgdisplay):
  --- Volume group ---
  VG Name               storage
  System ID
  Format                lvm2
  Metadata Areas        2
  Metadata Sequence No  174
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                3
  Open LV               3
  Max PV                0
  Cur PV                2
  Act PV                2
  VG Size               19.77 TB
  PE Size               4.00 MB
  Total PE              5181438
  Alloc PE / Size       5181438 / 19.77 TB
  Free  PE / Size       0 / 0
  VG UUID               ZalMV7-fZqp-mBA3-aYzi-iADF-VDWV-YIifQr

What I would like to know is the correct *extents* parameter for
lvreduce. Any help is greatly appreciated!

Sebastian



--------------ms010206000108070803020600
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIPHDCC
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
xQoLBzNytG8MHVQs2FHHzL8w00Ny8TK/jM5JY6gA9/IcMIIFPjCCBCagAwIBAgIECc2lKDAN
BgkqhkiG9w0BAQUFADBaMQswCQYDVQQGEwJERTETMBEGA1UEChMKREZOLVZlcmVpbjEQMA4G
A1UECxMHREZOLVBLSTEkMCIGA1UEAxMbREZOLVZlcmVpbiBQQ0EgR2xvYmFsIC0gRzAxMB4X
DTA3MDExNzEzNDE0NloXDTE5MDExNTAwMDAwMFowgbUxCzAJBgNVBAYTAkRFMQ8wDQYDVQQI
EwZCZXJsaW4xDzANBgNVBAcTBkJlcmxpbjEiMCAGA1UEChMZRnJlaWUgVW5pdmVyc2l0YWV0
IEJlcmxpbjEOMAwGA1UECxMFWkVEQVQxMDAuBgNVBAMTJ0ZyZWllIFVuaXZlcnNpdGFldCBC
ZXJsaW4gLSBGVS1DQSAtIEcwMTEeMBwGCSqGSIb3DQEJARYPY2FARlUtQmVybGluLkRFMIIB
IjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAjYUI0048zDNevkmXipCDjSpIr+sEbhiX
PzWnZnCnkmLOrEMFaNDWDX6kcVQ1VP71opEfGuR5LtW0P6N+JM8E8y5HXdap62bD4Yfg0KQE
mlh9vpMQ75BckReW7wRKH/Ntcrg8gwn97d17Hs8hgRGk8cpBRAs5v5hcqRZcjR63mKCismsj
ld6MVdWSNYhZJhpcnb0dVzMa3A7Rf1OsXHwDXrhusCNph1+Pazuw2XbIKWSCsFS4qlhHOj5Q
A375qk5IjjsUnw2FqljLiziu9xB4/jhSx1fz6+5RVnTe5Tb9GMbk5RVR+dvPTnzF96T/yW5D
qsFIL+xBYQ8juFoBQog3MwIDAQABo4IBrjCCAaowDwYDVR0TAQH/BAUwAwEB/zALBgNVHQ8E
BAMCAQYwHQYDVR0OBBYEFAbhPfRv9DC3ejtXsDEFiXsNWFpsMB8GA1UdIwQYMBaAFEm3xs/o
PR9/6kR7Eyn38QpwPt5kMBoGA1UdEQQTMBGBD2NhQEZVLUJlcmxpbi5ERTCBiAYDVR0fBIGA
MH4wPaA7oDmGN2h0dHA6Ly9jZHAxLnBjYS5kZm4uZGUvZ2xvYmFsLXJvb3QtY2EvcHViL2Ny
bC9jYWNybC5jcmwwPaA7oDmGN2h0dHA6Ly9jZHAyLnBjYS5kZm4uZGUvZ2xvYmFsLXJvb3Qt
Y2EvcHViL2NybC9jYWNybC5jcmwwgaIGCCsGAQUFBwEBBIGVMIGSMEcGCCsGAQUFBzAChjto
dHRwOi8vY2RwMS5wY2EuZGZuLmRlL2dsb2JhbC1yb290LWNhL3B1Yi9jYWNlcnQvY2FjZXJ0
LmNydDBHBggrBgEFBQcwAoY7aHR0cDovL2NkcDIucGNhLmRmbi5kZS9nbG9iYWwtcm9vdC1j
YS9wdWIvY2FjZXJ0L2NhY2VydC5jcnQwDQYJKoZIhvcNAQEFBQADggEBAEyG7FCK8+oQK8Nx
T7knkDmt587hp0A5N1xBtF7pwXAz3QMauXSPUp+2PikXV7BeeGxcb21TViGsdJg3nt4hLgBI
+L+OKM+cs8jUDsSbWroUD5mwyIAlZENYRraiopYx4DlLaxFoor6shYCmWid7jo5/uELbJFAO
pgqS6pQ2lCCAPVsSLLdUS+sZx62D/b42P57yipO+QF7p08j/J1mJIDec9QzfSzgNla1LTcxh
sh3H8V+zFCo84lbonXiVNt+8tcDXbEVSHMwyJo7vrtq+L0QstaGEcApa+sySpPdvTl6Bl+ay
fRNOgeqJkbR6g0euV+7IZxCMDaWWMKkjDMXVqFEwggWxMIIEmaADAgECAgQRoCm2MA0GCSqG
SIb3DQEBBQUAMIG1MQswCQYDVQQGEwJERTEPMA0GA1UECBMGQmVybGluMQ8wDQYDVQQHEwZC
ZXJsaW4xIjAgBgNVBAoTGUZyZWllIFVuaXZlcnNpdGFldCBCZXJsaW4xDjAMBgNVBAsTBVpF
REFUMTAwLgYDVQQDEydGcmVpZSBVbml2ZXJzaXRhZXQgQmVybGluIC0gRlUtQ0EgLSBHMDEx
HjAcBgkqhkiG9w0BCQEWD2NhQEZVLUJlcmxpbi5ERTAeFw0xMTAzMTYxMjI1MTFaFw0xNDAz
MTUxMjI1MTFaMIG/MQswCQYDVQQGEwJERTEPMA0GA1UECBMGQmVybGluMQ8wDQYDVQQHEwZC
ZXJsaW4xIjAgBgNVBAoTGUZyZWllIFVuaXZlcnNpdGFldCBCZXJsaW4xJjAkBgNVBAsTHUZh
Y2hiZXJlaWNoIEdlb3dpc3NlbnNjaGFmdGVuMScwJQYDVQQLEx5QbGFuZXRvbG9naWUgdW5k
IEZlcm5lcmt1bmR1bmcxGTAXBgNVBAMTEFNlYmFzdGlhbiBXYWx0ZXIwggEiMA0GCSqGSIb3
DQEBAQUAA4IBDwAwggEKAoIBAQDgP7FPvwodtX7Ow0t1ESAYUYQwyrFaa2H618blWZwRoUoF
/BCXAby6O1Uxv/06qXfGq4Z/wn2ykGH/u899tu6unmwlJA4jFZBRbc7WK9E/rir8Y+Sa0CAT
A6omh0JMOayxIp79sA/5YMOKGYxU3hWaCcEk5MCJ33q+8kj84aHGbhKY648QKftIkLMrerZX
D2YvW6mqt7qLI7Be5kM1yd/t01VmJgQc36AndApneYk/TDr9eBlc1O6+gt5VqkgL4RaTAzvK
7xuW4zuYU054UPN1O71z+gRGCTfMZZ+DAsmwpPDPErSEDD9jig3ij9jjhOUFwjDPd5VfiXgw
Yw85p175AgMBAAGjggG7MIIBtzAJBgNVHRMEAjAAMAsGA1UdDwQEAwIF4DApBgNVHSUEIjAg
BggrBgEFBQcDAgYIKwYBBQUHAwQGCisGAQQBgjcUAgIwHQYDVR0OBBYEFEBRUODrSx9zE+2P
hCDcZsGBwP3JMB8GA1UdIwQYMBaAFAbhPfRv9DC3ejtXsDEFiXsNWFpsMCgGA1UdEQQhMB+B
HXNlYmFzdGlhbi53YWx0ZXJAZnUtYmVybGluLmRlMHUGA1UdHwRuMGwwNKAyoDCGLmh0dHA6
Ly9jZHAxLnBjYS5kZm4uZGUvZnUtY2EvcHViL2NybC9jYWNybC5jcmwwNKAyoDCGLmh0dHA6
Ly9jZHAyLnBjYS5kZm4uZGUvZnUtY2EvcHViL2NybC9jYWNybC5jcmwwgZAGCCsGAQUFBwEB
BIGDMIGAMD4GCCsGAQUFBzAChjJodHRwOi8vY2RwMS5wY2EuZGZuLmRlL2Z1LWNhL3B1Yi9j
YWNlcnQvY2FjZXJ0LmNydDA+BggrBgEFBQcwAoYyaHR0cDovL2NkcDIucGNhLmRmbi5kZS9m
dS1jYS9wdWIvY2FjZXJ0L2NhY2VydC5jcnQwDQYJKoZIhvcNAQEFBQADggEBAA4JcfBrtzZD
6YMEkFsI+Fu6FIaLrDUyXhMUMEc5Xw/CevRWiP1qhXo/laUYHMIN7XlR5Hd+2iYZl1VXtUdD
FFIHO7zmVPP9yw9/wSGcn6fG97jsevfelsn62YOqD8y0CJvNlyMJyy29MG2UdcFdjmXRGorl
3qTbWgWaQngPNNhrjwaXDSVSG28xJUNIS7FsvQwU9L6SMTc7tIeuvqvH7XkhRFhSC0GubpSe
ymAsJEDvERBVNL6IJqnP9PVgqcciBOBNOVrDYv7R0ZDYJ+gq3aDE4phki9P53KWChgmyS1O6
Y3ivB9aLpNgNXBue955wqG6X9E3CAr2KoDLFS80CqE8xggRbMIIEVwIBATCBvjCBtTELMAkG
A1UEBhMCREUxDzANBgNVBAgTBkJlcmxpbjEPMA0GA1UEBxMGQmVybGluMSIwIAYDVQQKExlG
cmVpZSBVbml2ZXJzaXRhZXQgQmVybGluMQ4wDAYDVQQLEwVaRURBVDEwMC4GA1UEAxMnRnJl
aWUgVW5pdmVyc2l0YWV0IEJlcmxpbiAtIEZVLUNBIC0gRzAxMR4wHAYJKoZIhvcNAQkBFg9j
YUBGVS1CZXJsaW4uREUCBBGgKbYwCQYFKw4DAhoFAKCCAnEwGAYJKoZIhvcNAQkDMQsGCSqG
SIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMTMxMDA4MDkwNjE0WjAjBgkqhkiG9w0BCQQxFgQU
u15RifTUcP1P3VZKBCnPhe7uyIQwbAYJKoZIhvcNAQkPMV8wXTALBglghkgBZQMEASowCwYJ
YIZIAWUDBAECMAoGCCqGSIb3DQMHMA4GCCqGSIb3DQMCAgIAgDANBggqhkiG9w0DAgIBQDAH
BgUrDgMCBzANBggqhkiG9w0DAgIBKDCBzwYJKwYBBAGCNxAEMYHBMIG+MIG1MQswCQYDVQQG
EwJERTEPMA0GA1UECBMGQmVybGluMQ8wDQYDVQQHEwZCZXJsaW4xIjAgBgNVBAoTGUZyZWll
IFVuaXZlcnNpdGFldCBCZXJsaW4xDjAMBgNVBAsTBVpFREFUMTAwLgYDVQQDEydGcmVpZSBV
bml2ZXJzaXRhZXQgQmVybGluIC0gRlUtQ0EgLSBHMDExHjAcBgkqhkiG9w0BCQEWD2NhQEZV
LUJlcmxpbi5ERQIEEaAptjCB0QYLKoZIhvcNAQkQAgsxgcGggb4wgbUxCzAJBgNVBAYTAkRF
MQ8wDQYDVQQIEwZCZXJsaW4xDzANBgNVBAcTBkJlcmxpbjEiMCAGA1UEChMZRnJlaWUgVW5p
dmVyc2l0YWV0IEJlcmxpbjEOMAwGA1UECxMFWkVEQVQxMDAuBgNVBAMTJ0ZyZWllIFVuaXZl
cnNpdGFldCBCZXJsaW4gLSBGVS1DQSAtIEcwMTEeMBwGCSqGSIb3DQEJARYPY2FARlUtQmVy
bGluLkRFAgQRoCm2MA0GCSqGSIb3DQEBAQUABIIBAC9+sVIO/FooewgO06tUfBJIPNTIonX/
Og84lULfat8fvZIaE/hu+0JfritDKgW4nkaXAop7qRiyCppdmG0jDWIuhAfWbBbXB6FaPPM3
clAiahhzv+SsvoIZQZzi+90DUhOVXxpeXUXCoq4zgKPMphiaLb0GKYZF7RevEJCQAr/M35zJ
9PgTwqr3KYeV7T+sbzlMNUY7U2N9hE/mIv5t7a9/OrlazJ/sL0ojKHOoC+X93lL47BsaRJtt
pHAS0//0AN5DHtne+altPl/48N5PEwLd1SN8wBEMNTt645LwXnLcEYZhl4ZwDuoqyKAeC5CC
k67Wii8wrx48ufSATJSNCEMAAAAAAAA=
--------------ms010206000108070803020600--
