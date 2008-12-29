Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mBT36fis029783
	for <linux-lvm@redhat.com>; Sun, 28 Dec 2008 22:06:41 -0500
Received: from omr5.networksolutionsemail.com (omr5.networksolutionsemail.com
	[205.178.146.55])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id mBT36Ofm013308
	for <linux-lvm@redhat.com>; Sun, 28 Dec 2008 22:06:24 -0500
Received: from mail.networksolutionsemail.com (ns-omr5.mgt.netsol.com
	[10.49.6.68])
	by omr5.networksolutionsemail.com (8.13.6/8.13.6) with SMTP id
	mBT36Ogw002824
	for <linux-lvm@redhat.com>; Sun, 28 Dec 2008 22:06:24 -0500
From: "Steve Costaras" <stevecs@chaven.com>
References: <alpine.LFD.2.00.0812210927010.3626@tigger.tntechs.com><1229884467.5412.26.camel@localhost.localdomain><5440B12A673140C89F22744165C88838@analytical>
	<11910503774.20081223112736@marki-online.net>
Subject: RE: [linux-lvm] LVM2 robustness w/ large (>100TB) name spaces?
Date: Sun, 28 Dec 2008 21:06:16 -0600
MIME-Version: 1.0
Message-ID: <B874EA9D73DB49919102D7855C13744E@analytical>
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
	micalg=SHA1; boundary="----=_NextPart_000_0000_01C96930.1E12E030"
In-Reply-To: <11910503774.20081223112736@marki-online.net>
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
To: 'Marek Podmaka' <marki@marki-online.net>, 'LVM general discussion and development' <linux-lvm@redhat.com>

This is a multi-part message in MIME format.

------=_NextPart_000_0000_01C96930.1E12E030
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit


Thanks, yes the workload that this system will do is a lot of small I/O
requests.    From the system that I have logs from (I am trying to gather
logs from all systems to fine tune the sizes) the requests are in the
~64-128KiB range to the drive subsystem and very random in nature.    So a
4MiB PE or even 8MiB PE shouldn't be much of a problem (assuming the
workloads on the other boxes is similar).    

This is why I am planning on adding as many spindles as I can to grow that
way more so than streaming I/O.    I understand the limits of outstanding
commands IOPS (read/write) and scsi command queue depth, which the later
(command queue depth) is the biggest item that I see what would push me to
create more/smaller (instead of raid6 (13+2+1) for each PV something like a
raid-6 of (5+2+1) which would lower storage efficiency but increase the
number of PV's and command queue depth aggregate (as well as increasing
write iops but this is mainly a read-request array not many writes).

I am more looking for examples of builds that have real-world broached the
100+TB range under linux and what kinds of gotcha's I'm in for.   My current
arrays that are going to be merged into this are on average ~20-30TiB in
size each, since all serve similar (and somewhat overlapping functions)
merging them is in order.

Steve 

-----Original Message-----
From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com] On
Behalf Of Marek Podmaka
Sent: Tuesday, December 23, 2008 04:28
To: LVM general discussion and development
Subject: Re: [linux-lvm] LVM2 robustness w/ large (>100TB) name spaces?

Hello,

Tuesday, December 23, 2008, 1:15:28, Steve Costaras wrote:

> - What are the limits on PE/LE's per logical volume (>200,000,000? A
> problem?)  (I will be attaching multiple external chassis like above to
> several HBA's and will be using LVM striping to increase performance.   So
a
> small PE size (4MB-8MB) would be best to aid in the distribution of 
> requests across the physical subsystems.)

I think 4-8 MB for PE size is too small when you will be using such big (and
probably advanced arrays).
LVM stripping (strip size in hundreds of kB) would kill any array, because
when you request for example 512 kB from one array and next
512 kB from another array, they can't handle it efficiently. You won't see
the benefit of reading from all 16 spindles - everytime it will just load
512 kB from one physical disk. Also detection of sequential read might not
work well in array in this case.

In HP-UX LVM with enterprise arrays like HP EVA or HP XP we use 32-64 MB PE
and enable distribution - that means "stripe" size = PE size.
LE1 = PV1_1
LE2 = PV2_1
LE3 = PV1_2
LE4 = PV2_2 and so on.
Using this you request for example 32 MB from one array. Given the cache
sizes of arrays and readahead, so should get much better performance,
because those 32 MB will be fetched partially from all 16 drives.
Also we don't use ditribution among 2 arrays, just using different paths to
one array (different HBA, different SAN switch and different array FC
controller). We use 2 arrays only for mirroring data to other datacentre for
clusters.
The main reason for us for that PE distribution is that HP-UX does not have
loadbalancing multipath built-in. But even when you will have it, using more
PVs is better because of the architectural limits of arrays (no. of
outstanding request for single virtual drive, scsi queue depth on server and
on array, cache memory limits per virtual drive, etc.)


--
  bYE, Marki


_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

------=_NextPart_000_0000_01C96930.1E12E030
Content-Type: application/x-pkcs7-signature;
	name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename="smime.p7s"

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIL8zCCBK4w
ggKWoAMCAQICAwXINzANBgkqhkiG9w0BAQUFADB5MRAwDgYDVQQKEwdSb290IENBMR4wHAYDVQQL
ExVodHRwOi8vd3d3LmNhY2VydC5vcmcxIjAgBgNVBAMTGUNBIENlcnQgU2lnbmluZyBBdXRob3Jp
dHkxITAfBgkqhkiG9w0BCQEWEnN1cHBvcnRAY2FjZXJ0Lm9yZzAeFw0wODA5MTkyMDQ1NTJaFw0w
OTAzMTgyMDQ1NTJaMD0xGDAWBgNVBAMTD0NBY2VydCBXb1QgVXNlcjEhMB8GCSqGSIb3DQEJARYS
c3RldmVjc0BjaGF2ZW4uY29tMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDDFrIzE7UKfd8F
HA2O+y/Dp3j6ojSalos1sJyVx3NCFAtwZUARScjiVaRL5N+NtllpLJfD37cC+mqGzs7cdZVG3mRg
eymr083ZOBmcqVkzyl0JoOcM8AbdajyJMD4Rz146oxUyrDTfDUSBrpZyCrlk4Izd5qe9o1B9gqaC
BUVEXwIDAQABo4H+MIH7MAwGA1UdEwEB/wQCMAAwVgYJYIZIAYb4QgENBEkWR1RvIGdldCB5b3Vy
IG93biBjZXJ0aWZpY2F0ZSBmb3IgRlJFRSBoZWFkIG92ZXIgdG8gaHR0cDovL3d3dy5DQWNlcnQu
b3JnMEAGA1UdJQQ5MDcGCCsGAQUFBwMEBggrBgEFBQcDAgYKKwYBBAGCNwoDBAYKKwYBBAGCNwoD
AwYJYIZIAYb4QgQBMDIGCCsGAQUFBwEBBCYwJDAiBggrBgEFBQcwAYYWaHR0cDovL29jc3AuY2Fj
ZXJ0Lm9yZzAdBgNVHREEFjAUgRJzdGV2ZWNzQGNoYXZlbi5jb20wDQYJKoZIhvcNAQEFBQADggIB
ABUc4CHBeBoqrVpZFHSqLYtqYeg8kBvhaHSZ23+v4/prNBJ7syOaBK+U0wvcQkhYjnMia2AconGX
Pmw4Yg8pBQ32aGJ594xVc5mZHdhOEHoP7HuavEyUE9BDXixfrxhHWSNRCPXEypVBTSl5Hr7xqvDF
NIdl6ZBAqEDP5rSyEBxXEUXP4WjYQjQA+9WDq5yk5jzIJGa5QChhlXD+1Ycx5aiT/s6KA4jQcZ4Y
adUV0SCDupgOhMtdUSFVl3AfK+mVwuDsxWFtE0Q4oVrAg1jKE9Jqsgc2OFJo8LS9qNY+TgJauD+H
/tV4zj7+bDD3aCR+J+gpRQydHRs7pRx4V63KVMrGzV/UJ8UaG1a2Udcx9TXl8SfeiEehDFn+bncE
v4BI8JiNEzr99USOiuaI4OCTAMTcPYczWNm5bfBFTkKPI+vSiv3dHue/EzD2dxUKQNKjFK76joWB
LfBv8okdUtDj5Yui8Phg8u3MuGhXVMBwt6azLREOhHxiacu5NfNuP5JsVVbD9FcdXVpHhKMf969y
tpW6yyM5Ga7+PK1ixMSmECanTWpjutmeyo6ljp+HNcik18Gtkd7HTRTe1Shp7sG24IpJzN/CgfSx
/wZl4j5u+Bgu+pnYzfvi3F9RuThgPK6M2gPyZ81v+84S6RZ3tekhYp8holyEmjxu42k7Naj04mV0
MIIHPTCCBSWgAwIBAgIBADANBgkqhkiG9w0BAQQFADB5MRAwDgYDVQQKEwdSb290IENBMR4wHAYD
VQQLExVodHRwOi8vd3d3LmNhY2VydC5vcmcxIjAgBgNVBAMTGUNBIENlcnQgU2lnbmluZyBBdXRo
b3JpdHkxITAfBgkqhkiG9w0BCQEWEnN1cHBvcnRAY2FjZXJ0Lm9yZzAeFw0wMzAzMzAxMjI5NDla
Fw0zMzAzMjkxMjI5NDlaMHkxEDAOBgNVBAoTB1Jvb3QgQ0ExHjAcBgNVBAsTFWh0dHA6Ly93d3cu
Y2FjZXJ0Lm9yZzEiMCAGA1UEAxMZQ0EgQ2VydCBTaWduaW5nIEF1dGhvcml0eTEhMB8GCSqGSIb3
DQEJARYSc3VwcG9ydEBjYWNlcnQub3JnMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEA
ziLA4kZ97DYoB1CW8qAzQIxL8TtmPzHlawI229Z89vGIj053NgVBlfkJ8BLPRoZzYLdufujAWGSu
zbCtRRcMY/pnCujW0r8+55jE8Ez64AO7NV1sId6eINm6zWYyN3L69wj1x81YyY7nDl7qPv4coRQK
FWyGhFtkZip6qUtTefWIonvuLwphK42yfk1WpRPs6tqSnqxEQR5YYGUFZvjARL3LlPdCfgv3ZWiY
UQXw8wWRBB0bF4LsyFe7w2t6iPGwcswlWyCR7BYCEo8y6RcYSNDHBS4CMEK4JZwFaz+qOqfrU0j3
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
BTEPFw0wODEyMjkwMzA2MTRaMCMGCSqGSIb3DQEJBDEWBBSKv/fiv6v+uoaqNc0da4L+D3IopjBn
BgkqhkiG9w0BCQ8xWjBYMAoGCCqGSIb3DQMHMA4GCCqGSIb3DQMCAgIAgDANBggqhkiG9w0DAgIB
QDAHBgUrDgMCBzANBggqhkiG9w0DAgIBKDAHBgUrDgMCGjAKBggqhkiG9w0CBTCBkQYJKwYBBAGC
NxAEMYGDMIGAMHkxEDAOBgNVBAoTB1Jvb3QgQ0ExHjAcBgNVBAsTFWh0dHA6Ly93d3cuY2FjZXJ0
Lm9yZzEiMCAGA1UEAxMZQ0EgQ2VydCBTaWduaW5nIEF1dGhvcml0eTEhMB8GCSqGSIb3DQEJARYS
c3VwcG9ydEBjYWNlcnQub3JnAgMFyDcwgZMGCyqGSIb3DQEJEAILMYGDoIGAMHkxEDAOBgNVBAoT
B1Jvb3QgQ0ExHjAcBgNVBAsTFWh0dHA6Ly93d3cuY2FjZXJ0Lm9yZzEiMCAGA1UEAxMZQ0EgQ2Vy
dCBTaWduaW5nIEF1dGhvcml0eTEhMB8GCSqGSIb3DQEJARYSc3VwcG9ydEBjYWNlcnQub3JnAgMF
yDcwDQYJKoZIhvcNAQEBBQAEgYB1sbC7AqUwtO93LvJF9l0oiWIiwwUdwbbcQ61IeiQh+/+AAU+t
9Sz4RZ72tlZgQJQZfS5xLmu9+ozR4AClv2hav6nJPIG37acDwTdBvDGxAljuCbmBd6zSfuGwNLeG
wkD4ybqLppZhMeRXrrTB5oeORhGqSYOSjcITlf4YcILrNwAAAAAAAA==

------=_NextPart_000_0000_01C96930.1E12E030--
