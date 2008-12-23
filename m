Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mBN1XmEY007938
	for <linux-lvm@redhat.com>; Mon, 22 Dec 2008 20:33:48 -0500
Received: from omr7.networksolutionsemail.com (omr7.networksolutionsemail.com
	[205.178.146.57])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id mBN1XVYY021132
	for <linux-lvm@redhat.com>; Mon, 22 Dec 2008 20:33:31 -0500
Received: from mail.networksolutionsemail.com (ns-omr7.mgt.netsol.com
	[10.49.6.70])
	by omr7.networksolutionsemail.com (8.13.6/8.13.6) with SMTP id
	mBN1XUva024716
	for <linux-lvm@redhat.com>; Mon, 22 Dec 2008 20:33:30 -0500
From: "Steve Costaras" <stevecs@chaven.com>
References: <alpine.LFD.2.00.0812210927010.3626@tigger.tntechs.com><1229884467.5412.26.camel@localhost.localdomain><5440B12A673140C89F22744165C88838@analytical>
	<20081223012443.GB17247@agk.fab.redhat.com>
Subject: RE: [linux-lvm] LVM2 robustness w/ large (>100TB) name spaces?
Date: Mon, 22 Dec 2008 19:33:36 -0600
MIME-Version: 1.0
Message-ID: <1EDA649E10E54ABFA14B31B7D732CEFC@analytical>
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
	micalg=SHA1; boundary="----=_NextPart_000_0017_01C9646C.2E5F8FB0"
In-Reply-To: <20081223012443.GB17247@agk.fab.redhat.com>
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
To: 'LVM general discussion and development' <linux-lvm@redhat.com>

This is a multi-part message in MIME format.

------=_NextPart_000_0017_01C9646C.2E5F8FB0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Thanks, I was planning on using a larger metadata area anyway, just to play
it safe as I'm expecting a 3-4x growth for the life of the array before next
hard rebuild and all the comments I've seen on the Inet are talking about
much smaller array sizes than what I'm building.     Is there any rule of
thumb or sizing guidelines or is it a black art?

With PE/LE's being 32bit (or is it a signed 32bit so 31 bits?)  Either way,
that's more than enough even w/ 4MiB sizes for the expected end-state of the
name space.

    

-----Original Message-----
From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com] On
Behalf Of Alasdair G Kergon
Sent: Monday, December 22, 2008 19:25
To: LVM general discussion and development
Subject: Re: [linux-lvm] LVM2 robustness w/ large (>100TB) name spaces?

 From the LVM2 point of view, extents (PEs/LEs) are counted using 32-bit
numbers so that's where the limit comes from.
(You can change extent size later, shuffling extent boundaries with pvmove
first as necessary.)

The stripe size is controlled by a separate parameter essentially
independent of the PE size.

When creating the PVs, use a larger-than-default size for the metadata area:
it is awkward to change later if you fill it up.

Alasdair
--
agk@redhat.com

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

------=_NextPart_000_0017_01C9646C.2E5F8FB0
Content-Type: application/x-pkcs7-signature;
	name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename="smime.p7s"

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
6NK2B5jcG8Y0f3/JHIJ6BVgrCFvzOKKrF11myZjXnhCLotLddJr3cQxyYN/Nb5gznZY0dj4kepKw
DpUeb+agRThHqtdB7Uq3EvbXG4OKDy7YCbZZ16oE/9KTfWgu3YtLq1i6L43qlaegw1SJpfvbi1Ei
nbLDvhG+LJGGi5Z4rSDTii8aP8bQUWWHIbEZAWV/RRyH9XzQQUxPKZgh/TMfdQwEUfoZd9vUFBzu
gcMd9Zi3aQaRIt0AUMyBMawSB3s42mhb5ivUfslfrejrckzzAeVLIL+aplfKkQABi6F1ITe1Yw1n
PkZPcCBnzsXWWdsC4PDSy826YreQQejdIOQpvGQpQsgi3Hia/0PsmBsJUUtaWsJx8cTLc6nloQsC
AwEAAaOCAc4wggHKMB0GA1UdDgQWBBQWtTIb1Mfz4OaO873SsDrusjkY0TCBowYDVR0jBIGbMIGY
gBQWtTIb1Mfz4OaO873SsDrusjkY0aF9pHsweTEQMA4GA1UEChMHUm9vdCBDQTEeMBwGA1UECxMV
aHR0cDovL3d3dy5jYWNlcnQub3JnMSIwIAYDVQQDExlDQSBDZXJ0IFNpZ25pbmcgQXV0aG9yaXR5
MSEwHwYJKoZIhvcNAQkBFhJzdXBwb3J0QGNhY2VydC5vcmeCAQAwDwYDVR0TAQH/BAUwAwEB/zAy
BgNVHR8EKzApMCegJaAjhiFodHRwczovL3d3dy5jYWNlcnQub3JnL3Jldm9rZS5jcmwwMAYJYIZI
AYb4QgEEBCMWIWh0dHBzOi8vd3d3LmNhY2VydC5vcmcvcmV2b2tlLmNybDA0BglghkgBhvhCAQgE
JxYlaHR0cDovL3d3dy5jYWNlcnQub3JnL2luZGV4LnBocD9pZD0xMDBWBglghkgBhvhCAQ0ESRZH
VG8gZ2V0IHlvdXIgb3duIGNlcnRpZmljYXRlIGZvciBGUkVFIGhlYWQgb3ZlciB0byBodHRwOi8v
d3d3LmNhY2VydC5vcmcwDQYJKoZIhvcNAQEEBQADggIBACjH7pyCArpcgBLKNQodgW+JapnM8mgP
f6fhjViVPr3yBsOQWqy1YPaZQwGjiHCcnWKdpIevZ1gNMDY75q1I08t0AoZxPuIrA2jxNGJARjtT
6ij0rPtmlVOKTV39O9lg18p5aTuxZZKmxoGCXJzN600BiqXfEVWqFcofN8CCmHBh22p8lqOOLlQ+
TyGpkO/cgr/c6EWtTZBzCDyUZbAEmXZ/4rzCahWqlwQ3JNgelE5tDlG+1sSPypZt90Pf6DBlJzt7
u0NDY8RD97LsaMzhGY4i+5jhe1o+ATc7iwiwovOVThrLm82asduycPAtStvYsONvRUgzEv/+PDIq
VPfE94rwiCPCR/5kenHA0R6mY7AHfqQv0wGP3J8rtsYIqQ+TSCX8Ev2fQtzzxD72V7DX3WnRBnc0
CkvSyqD/HMaMyRa+xMwyN2hzXwj7UfdJUzYFCpUCTPJ5GhD22Dp1nPMd8aINcGeGG7MW9S/lpOt5
hvk9C8JzC6WZrG/8Z7jlLwumGCSNe9FINSkYQKyTYOGWhlC0elnYjyELn8+CkcY7v2vcB5G5l1Yj
qrZslMZIBjzkzk6q5PYvCdxTby78dOs6Y5nCpqyJvKeyRKANihDjbPIky/qbn3BHLt4Ui9SyIAmW
omTxJBzcoTWcFbLUvFUufQb1nA5V9FrWk9p2rSVzTMVDMYIDGzCCAxcCAQEwgYAweTEQMA4GA1UE
ChMHUm9vdCBDQTEeMBwGA1UECxMVaHR0cDovL3d3dy5jYWNlcnQub3JnMSIwIAYDVQQDExlDQSBD
ZXJ0IFNpZ25pbmcgQXV0aG9yaXR5MSEwHwYJKoZIhvcNAQkBFhJzdXBwb3J0QGNhY2VydC5vcmcC
AwXINzAJBgUrDgMCGgUAoIIB8DAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJ
BTEPFw0wODEyMjMwMTMzMzVaMCMGCSqGSIb3DQEJBDEWBBTBh/Z8PiB5a9U8sMOQ8nNfUCfpUjBn
BgkqhkiG9w0BCQ8xWjBYMAoGCCqGSIb3DQMHMA4GCCqGSIb3DQMCAgIAgDANBggqhkiG9w0DAgIB
QDAHBgUrDgMCBzANBggqhkiG9w0DAgIBKDAHBgUrDgMCGjAKBggqhkiG9w0CBTCBkQYJKwYBBAGC
NxAEMYGDMIGAMHkxEDAOBgNVBAoTB1Jvb3QgQ0ExHjAcBgNVBAsTFWh0dHA6Ly93d3cuY2FjZXJ0
Lm9yZzEiMCAGA1UEAxMZQ0EgQ2VydCBTaWduaW5nIEF1dGhvcml0eTEhMB8GCSqGSIb3DQEJARYS
c3VwcG9ydEBjYWNlcnQub3JnAgMFyDcwgZMGCyqGSIb3DQEJEAILMYGDoIGAMHkxEDAOBgNVBAoT
B1Jvb3QgQ0ExHjAcBgNVBAsTFWh0dHA6Ly93d3cuY2FjZXJ0Lm9yZzEiMCAGA1UEAxMZQ0EgQ2Vy
dCBTaWduaW5nIEF1dGhvcml0eTEhMB8GCSqGSIb3DQEJARYSc3VwcG9ydEBjYWNlcnQub3JnAgMF
yDcwDQYJKoZIhvcNAQEBBQAEgYBfwJHXKq6HVpZVcB/OnK1/R08Bek/KC+quxwsZhX+pDdF+7pvw
bPmhk932mBqvQ3SHYIVMvQ6W5bxghtRjLfsCkaXVsz4ZyfLC9hzU6E3xXQEg764nu6rJOOk43Xcn
eYdlPIxXCu/DRAq60JF2TlYjFjsZNF1mh2Yyh3Dm2aPqVgAAAAAAAA==

------=_NextPart_000_0017_01C9646C.2E5F8FB0--
