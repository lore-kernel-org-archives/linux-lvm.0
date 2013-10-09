Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r997vbw5007915
	for <linux-lvm@redhat.com>; Wed, 9 Oct 2013 03:57:37 -0400
Received: from outpost1.zedat.fu-berlin.de (outpost1.zedat.fu-berlin.de
	[130.133.4.66])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r997vQvx019816
	for <linux-lvm@redhat.com>; Wed, 9 Oct 2013 03:57:34 -0400
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
	by outpost1.zedat.fu-berlin.de (Exim 4.80.1)
	for linux-lvm@redhat.com with esmtp
	(envelope-from <sebastian.walter@fu-berlin.de>)
	id <1VToe2-003xaq-6r>; Wed, 09 Oct 2013 09:57:22 +0200
Received: from triton.geoinf.fu-berlin.de ([130.133.86.10])
	by inpost2.zedat.fu-berlin.de (Exim 4.80.1)
	for linux-lvm@redhat.com with esmtpsa
	(envelope-from <sebastian.walter@fu-berlin.de>)
	id <1VToe2-001X4D-4P>; Wed, 09 Oct 2013 09:57:22 +0200
Message-ID: <52550C81.2020607@fu-berlin.de>
Date: Wed, 09 Oct 2013 09:57:53 +0200
From: Sebastian Walter <sebastian.walter@fu-berlin.de>
MIME-Version: 1.0
References: <5253CB06.2000901@fu-berlin.de>
	<CAJc7SsYG90wMMaK6SrM-mNTiFhDxRJYGR3WapchAZSWD9vsdYw@mail.gmail.com>
	<1381273135.70303.YahooMailNeo@web181501.mail.ne1.yahoo.com>
In-Reply-To: <1381273135.70303.YahooMailNeo@web181501.mail.ne1.yahoo.com>
Content-Type: multipart/signed; protocol="application/pkcs7-signature";
	micalg=sha1; boundary="------------ms080707030104040705000901"
Subject: Re: [linux-lvm] Find Correct LE Size of ext4 Filesystem (16TB)
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

--------------ms080707030104040705000901
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Matthew,

On 10/09/2013 12:58 AM, matthew patton wrote:

>=20
> The whole point of using LVM is to dispense with the malarky of hard di=
sk partitions so I don't know why you're resizing them. If I read your em=
ail correctly you're going about this dangerously.>=20

Thanks for pointing this out. Now I realize that I used the term
"partition" instead of "filesystem" erroneously (changed subject).

What I initially wanted to do is to extend the filesystem to the whole
size of the underlying physical disks. So first I extended the LV to
fill the disks (19TB). As the second step I wanted to resize the ext4
filesystem to the LV size of 19TB. This last step failed with an error
message saying that tune4fs can't allocate more than 16TB. Setting the
filesystem's size to 16T worked.

Now I have a 16TB filesystem on a 19.18TB logical volume. The additional
3TB are unused on the LV so I want to reduce the LV to the same size as
the filesystem. This way I could use the 3TB for other LVs.

> 3) resize2fs (no args) <LV device>
>=20
> Step 3 will resize the FS to as close as the LV size allows and won't l=
et you write past the LV's endpoint like your method makes so easy to scr=
ew up when doing the extent calculation. Maybe your maths are always perf=
ect but I wouldn't risk my data for a measly few bytes. Do it the fool-pr=
oof way.

I agree with you that resizing the filesystem to the therotical values
of the LV geometry is much too risky.

What would be the fool-proof way? Creating a new filesystem on a 16TB LV
and copying the data from the backup?

Or is it really safe to reduce the LV by some amount - let's say 2.5TB -
and sacrifice 500GB for safety?

Thanks! Sebastian


--------------ms080707030104040705000901
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
SIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMTMxMDA5MDc1NzUzWjAjBgkqhkiG9w0BCQQxFgQU
HKxw2cIPAKas1/o5yACHb3SZL1kwbAYJKoZIhvcNAQkPMV8wXTALBglghkgBZQMEASowCwYJ
YIZIAWUDBAECMAoGCCqGSIb3DQMHMA4GCCqGSIb3DQMCAgIAgDANBggqhkiG9w0DAgIBQDAH
BgUrDgMCBzANBggqhkiG9w0DAgIBKDCBzwYJKwYBBAGCNxAEMYHBMIG+MIG1MQswCQYDVQQG
EwJERTEPMA0GA1UECBMGQmVybGluMQ8wDQYDVQQHEwZCZXJsaW4xIjAgBgNVBAoTGUZyZWll
IFVuaXZlcnNpdGFldCBCZXJsaW4xDjAMBgNVBAsTBVpFREFUMTAwLgYDVQQDEydGcmVpZSBV
bml2ZXJzaXRhZXQgQmVybGluIC0gRlUtQ0EgLSBHMDExHjAcBgkqhkiG9w0BCQEWD2NhQEZV
LUJlcmxpbi5ERQIEEaAptjCB0QYLKoZIhvcNAQkQAgsxgcGggb4wgbUxCzAJBgNVBAYTAkRF
MQ8wDQYDVQQIEwZCZXJsaW4xDzANBgNVBAcTBkJlcmxpbjEiMCAGA1UEChMZRnJlaWUgVW5p
dmVyc2l0YWV0IEJlcmxpbjEOMAwGA1UECxMFWkVEQVQxMDAuBgNVBAMTJ0ZyZWllIFVuaXZl
cnNpdGFldCBCZXJsaW4gLSBGVS1DQSAtIEcwMTEeMBwGCSqGSIb3DQEJARYPY2FARlUtQmVy
bGluLkRFAgQRoCm2MA0GCSqGSIb3DQEBAQUABIIBANfRZC+KMwO8XRepIvw1RVqUrN5vi0fq
lDdONhAJAOQjCF95QZB6Jatx+Dkx6IEubx1E88i7Gtw/KNTXpYm7CArtPemhHP7TjHctsJk8
U5/mIPGRzC3TizHO9bmob32XxOvXmzbjHntaJYHNtr5MwR+uiav7C+aC83QPZsDhbZa7Q/x8
GXqhDVbUgbbKOdmD9bTdEFJj9V/1WbOWFg0mUlThghNXoFXGrMx396InTdD7IFPvUwFGIvT5
VcFV3D+5fDMYi503RIY5hop4u180BwY7q+nfR078KHGQ3P9WKPbPlArqd+9RcfBIOtIHldSe
Fq/cFJ67wx4BUhYkukmXfOUAAAAAAAA=
--------------ms080707030104040705000901--
