Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mBN0GMrA012526
	for <linux-lvm@redhat.com>; Mon, 22 Dec 2008 19:16:22 -0500
Received: from omr15.networksolutionsemail.com
	(omr15.networksolutionsemail.com [205.178.146.65])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id mBN0FRsP017513
	for <linux-lvm@redhat.com>; Mon, 22 Dec 2008 19:15:47 -0500
Received: from mail.networksolutionsemail.com
	(ns-omr15.mgt.hosting.dc2.netsol.com [10.49.6.78])
	by omr15.networksolutionsemail.com (8.13.6/8.13.6) with SMTP id
	mBN0FQEa028768
	for <linux-lvm@redhat.com>; Mon, 22 Dec 2008 19:15:26 -0500
From: "Steve Costaras" <stevecs@chaven.com>
References: <alpine.LFD.2.00.0812210927010.3626@tigger.tntechs.com>
	<1229884467.5412.26.camel@localhost.localdomain>
Date: Mon, 22 Dec 2008 18:15:28 -0600
MIME-Version: 1.0
Message-ID: <5440B12A673140C89F22744165C88838@analytical>
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
	micalg=SHA1; boundary="----=_NextPart_000_000A_01C9645E.1AEFDB00"
In-Reply-To: <1229884467.5412.26.camel@localhost.localdomain>
Subject: [linux-lvm] LVM2 robustness w/ large (>100TB) name spaces?
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

------=_NextPart_000_000A_01C9645E.1AEFDB00
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit


I have not seen much commentary in my searches concerning LVM under linux
with very large name spaces (single file systems), and figured I would pose
the question out to the forum as I am in the planning stages here to rebuild
and consolidate systems.

Initially I have a couple questions regarding the underlying LVM structure
and what it supports:

- Are PV sizes >=16TB possible?   (I am looking to add external RAID chassis
which will present to the system as large (~13TB (16-drive, raid-6, + hot
spare)) drive.   The subsystem drive will be replaced w/ 2TB or greater
models when they are available in 2010-2011 and am trying to avoid a
forklift upgrade of subsystem components.

- What are the limits on PE/LE's per logical volume (>200,000,000? A
problem?)  (I will be attaching multiple external chassis like above to
several HBA's and will be using LVM striping to increase performance.   So a
small PE size (4MB-8MB) would be best to aid in the distribution of requests
across the physical subsystems.)

- Are there any references or examples of users who have created/run large
(100TB - 1PB) LVM installations that are functional in the real-world?   (I
don't see why this would not work on paper, but theory and practice are two
different things).


Thanks,

Steve

------=_NextPart_000_000A_01C9645E.1AEFDB00
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
BTEPFw0wODEyMjIyMzUyNDlaMCMGCSqGSIb3DQEJBDEWBBSanSnXvI1Cwhlxlvf6oiwPwMHGdDBn
BgkqhkiG9w0BCQ8xWjBYMAoGCCqGSIb3DQMHMA4GCCqGSIb3DQMCAgIAgDANBggqhkiG9w0DAgIB
QDAHBgUrDgMCBzANBggqhkiG9w0DAgIBKDAHBgUrDgMCGjAKBggqhkiG9w0CBTCBkQYJKwYBBAGC
NxAEMYGDMIGAMHkxEDAOBgNVBAoTB1Jvb3QgQ0ExHjAcBgNVBAsTFWh0dHA6Ly93d3cuY2FjZXJ0
Lm9yZzEiMCAGA1UEAxMZQ0EgQ2VydCBTaWduaW5nIEF1dGhvcml0eTEhMB8GCSqGSIb3DQEJARYS
c3VwcG9ydEBjYWNlcnQub3JnAgMFyDcwgZMGCyqGSIb3DQEJEAILMYGDoIGAMHkxEDAOBgNVBAoT
B1Jvb3QgQ0ExHjAcBgNVBAsTFWh0dHA6Ly93d3cuY2FjZXJ0Lm9yZzEiMCAGA1UEAxMZQ0EgQ2Vy
dCBTaWduaW5nIEF1dGhvcml0eTEhMB8GCSqGSIb3DQEJARYSc3VwcG9ydEBjYWNlcnQub3JnAgMF
yDcwDQYJKoZIhvcNAQEBBQAEgYCig98ky/Tr20NVS3ADx1NB4EG5Ub3AdQeCR0OPtaPHi7tsUfVk
Np0WqIPd5k/pXatTOl0wRJxbeQ1ygmmC93bZB7zSwu9iNkNZSLioFQFyd3tm8v97pCJf6XPMN5p7
9uQTwsC/ho3/2nM8qiZ6bhINrbGDW2Pk/GmQHcnTLFF4UAAAAAAAAA==

------=_NextPart_000_000A_01C9645E.1AEFDB00--
