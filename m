Message-Id: <009301c19918$6b3ab940$1600a8c0@aliz>
From: "Daniel Ahlberg" <aliz@telia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=SHA1;
    protocol="application/x-pkcs7-signature";
    boundary="----=_NextPart_000_008F_01C19920.CA3579F0"
Subject: [linux-lvm] LVM problems, possible solution
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Wed Jan  9 08:19:01 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

This is a multi-part message in MIME format.

------=_NextPart_000_008F_01C19920.CA3579F0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

Hello,

Im sorry if this is already known.

I've been having trouble with LVM on my linux server for quite som time. On
startup I got errors like (not sure, taken from memory) "0x59" and "0x04"
from the IDE harddisks resulting in disabled DMA on startup. Re-enabling DMA
was no problem, but I found it annoying to have to do that every time I
restarted the server.

A couple of days ago I tried to fix the problem. While checking the dmesg
output from the startup I noticed that the Partition check saying that I had
a partition on a couple of my IDE disks (hda: hda1). The strange thing is
that I remade some of the disks that I had created a partition of the whole
disk to use as a LVM device to instead just use the the whole disk (/dev/hda
instead of /dev/hda1). To try things I removed /dev/hda from the
VolumeGroup, created a partition, ran pvcreate /dev/hda1 and added the disk
to the volumegroup and from what I can see it works. Since then I get no
more errors on startup that disables DMA or saying that linux can't find
sectors and such.

Im using the latest Kernel together with a patch made from the latest
relased LVM tarballs.

Suggestion: Make pvcreate reset the partition describing stuff when
createing a new LVM disk if using it on the whole disk.

Hope this helps..

Sorry for any bad english..

Im not subscribed to this list, so please include my adress in any reply you
may write.

------=_NextPart_000_008F_01C19920.CA3579F0
Content-Type: application/x-pkcs7-signature;
	name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename="smime.p7s"

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIII5zCCAnYw
ggHfoAMCAQICAwYdKjANBgkqhkiG9w0BAQIFADCBkjELMAkGA1UEBhMCWkExFTATBgNVBAgTDFdl
c3Rlcm4gQ2FwZTESMBAGA1UEBxMJQ2FwZSBUb3duMQ8wDQYDVQQKEwZUaGF3dGUxHTAbBgNVBAsT
FENlcnRpZmljYXRlIFNlcnZpY2VzMSgwJgYDVQQDEx9QZXJzb25hbCBGcmVlbWFpbCBSU0EgMjAw
MC44LjMwMB4XDTAxMTExNjEwNDU1NVoXDTAyMTExNjEwNDU1NVowQDEfMB0GA1UEAxMWVGhhd3Rl
IEZyZWVtYWlsIE1lbWJlcjEdMBsGCSqGSIb3DQEJARYOYWxpekB0ZWxpYS5jb20wgZ8wDQYJKoZI
hvcNAQEBBQADgY0AMIGJAoGBALi3xKFEsnvWNMXBnF0c9wca3kPJxj8nZmpFLLWOrHhbUhQ2IUJi
YM+y0vFcBE5uMM49bLlVu51dEydo7MEWDLQZw7rzm/P2MTzNgUvl2QSTS33nl9Vmycly9l1ZRf50
3K+9NBl8Nf4VJ9KoqIcof51FAmWZexAXk0pq0M01GUdpAgMBAAGjKzApMBkGA1UdEQQSMBCBDmFs
aXpAdGVsaWEuY29tMAwGA1UdEwEB/wQCMAAwDQYJKoZIhvcNAQECBQADgYEAjMEvBhEb/oPhpAQS
CVA6W6Vl1XHRfYhzjwU5zQDzhGebvWWhAfapM0EdPJ20xmL//TY7LD1QiHYUvhrT1GoFamqoyTuh
kvU99J2JEA8mCKZPcG5QmrcoaXH2JF9hsaUrrtsjDWmGBohgKjuYyWikz8oVZwbhribt4cl687+v
ma8wggMtMIIClqADAgECAgEAMA0GCSqGSIb3DQEBBAUAMIHRMQswCQYDVQQGEwJaQTEVMBMGA1UE
CBMMV2VzdGVybiBDYXBlMRIwEAYDVQQHEwlDYXBlIFRvd24xGjAYBgNVBAoTEVRoYXd0ZSBDb25z
dWx0aW5nMSgwJgYDVQQLEx9DZXJ0aWZpY2F0aW9uIFNlcnZpY2VzIERpdmlzaW9uMSQwIgYDVQQD
ExtUaGF3dGUgUGVyc29uYWwgRnJlZW1haWwgQ0ExKzApBgkqhkiG9w0BCQEWHHBlcnNvbmFsLWZy
ZWVtYWlsQHRoYXd0ZS5jb20wHhcNOTYwMTAxMDAwMDAwWhcNMjAxMjMxMjM1OTU5WjCB0TELMAkG
A1UEBhMCWkExFTATBgNVBAgTDFdlc3Rlcm4gQ2FwZTESMBAGA1UEBxMJQ2FwZSBUb3duMRowGAYD
VQQKExFUaGF3dGUgQ29uc3VsdGluZzEoMCYGA1UECxMfQ2VydGlmaWNhdGlvbiBTZXJ2aWNlcyBE
aXZpc2lvbjEkMCIGA1UEAxMbVGhhd3RlIFBlcnNvbmFsIEZyZWVtYWlsIENBMSswKQYJKoZIhvcN
AQkBFhxwZXJzb25hbC1mcmVlbWFpbEB0aGF3dGUuY29tMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCB
iQKBgQDUadfUsJRkW3HpR9gMUbbqcpGwhF59LQ2PexLfhSV1KHQ6QixjJ5+Ve0vvfhmHHYbqo925
zpZkGsIUbkSsfOaP6E0PcR9AOKYAo4d49vmUhl6t6sBeduvZFKNdbnp8DKVLVX8GGSl/npom1Wq7
OCQIapjHsdqjmJH9edvlWsQcuQIDAQABoxMwETAPBgNVHRMBAf8EBTADAQH/MA0GCSqGSIb3DQEB
BAUAA4GBAMfskn5O+PWWpWdiKqTwTRFg0G+NYFhhrCa7UjVcCM8w+6hKloofYkIjjBcP9LpknBes
RynfnZhe0mxgcVyirNx54+duAEcftQ0o6AKd5Jr9E/Sm2Xyx+NxfIyYJkYBz0BQb3kOpgyXy5pwv
Fcr+pquKB3WLDN1RhGvk+NHOd6KBMIIDODCCAqGgAwIBAgIQZkVyt8x09c9jdkWE0C6RATANBgkq
hkiG9w0BAQQFADCB0TELMAkGA1UEBhMCWkExFTATBgNVBAgTDFdlc3Rlcm4gQ2FwZTESMBAGA1UE
BxMJQ2FwZSBUb3duMRowGAYDVQQKExFUaGF3dGUgQ29uc3VsdGluZzEoMCYGA1UECxMfQ2VydGlm
aWNhdGlvbiBTZXJ2aWNlcyBEaXZpc2lvbjEkMCIGA1UEAxMbVGhhd3RlIFBlcnNvbmFsIEZyZWVt
YWlsIENBMSswKQYJKoZIhvcNAQkBFhxwZXJzb25hbC1mcmVlbWFpbEB0aGF3dGUuY29tMB4XDTAw
MDgzMDAwMDAwMFoXDTA0MDgyNzIzNTk1OVowgZIxCzAJBgNVBAYTAlpBMRUwEwYDVQQIEwxXZXN0
ZXJuIENhcGUxEjAQBgNVBAcTCUNhcGUgVG93bjEPMA0GA1UEChMGVGhhd3RlMR0wGwYDVQQLExRD
ZXJ0aWZpY2F0ZSBTZXJ2aWNlczEoMCYGA1UEAxMfUGVyc29uYWwgRnJlZW1haWwgUlNBIDIwMDAu
OC4zMDCBnzANBgkqhkiG9w0BAQEFAAOBjQAwgYkCgYEA3jMypmPHCSVFPtJueCdngcXaiBmClw7j
RCmKYzUqbXA8+tyu9+50bzC8M5B/+TRxoKNtmPHDT6Jl2w36S/HW3WGl+YXNVZo1Gp2Sdagnrthy
+boC9tewkd4c6avgGAOofENCUFGHgzzwObSbVIoTh/+zm51JZgAtCYnslGvpoWkCAwEAAaNOMEww
KQYDVR0RBCIwIKQeMBwxGjAYBgNVBAMTEVByaXZhdGVMYWJlbDEtMjk3MBIGA1UdEwEB/wQIMAYB
Af8CAQAwCwYDVR0PBAQDAgEGMA0GCSqGSIb3DQEBBAUAA4GBADGxS0dd+QFx5fVTbF151j2YwCYT
YoEipxL4IpXoG0m3J3sEObr85vIk65H6vewNKjj3UFWobPcNrUwbvAP0teuiR59sogxYjTFCCRFs
sBpp0SsSskBdavl50OouJd2K5PzbDR+dAvNa28o89kTqJmmHf0iezqWf54TYyWJirQXGMYIB/jCC
AfoCAQEwgZowgZIxCzAJBgNVBAYTAlpBMRUwEwYDVQQIEwxXZXN0ZXJuIENhcGUxEjAQBgNVBAcT
CUNhcGUgVG93bjEPMA0GA1UEChMGVGhhd3RlMR0wGwYDVQQLExRDZXJ0aWZpY2F0ZSBTZXJ2aWNl
czEoMCYGA1UEAxMfUGVyc29uYWwgRnJlZW1haWwgUlNBIDIwMDAuOC4zMAIDBh0qMAkGBSsOAwIa
BQCggbowGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMDIwMTA5MTQx
NzQ1WjAjBgkqhkiG9w0BCQQxFgQUZ5iWPBjNgGGlvIYVC4x9G+xcMf8wWwYJKoZIhvcNAQkPMU4w
TDAKBggqhkiG9w0DBzAOBggqhkiG9w0DAgICAIAwDQYIKoZIhvcNAwICAUAwBwYFKw4DAgcwDQYI
KoZIhvcNAwICASgwBwYFKw4DAh0wDQYJKoZIhvcNAQEBBQAEgYCCZEcwCu/s7DiomjHlyULHf28G
HPbKHsxCcPACl6EEcMS58axM8gRhseXs/KKxXrN7f/WrylOkpE5qVlCrh29Di21wxBI2oYXv2glM
R0IHXmxB42T+dHqvOAsE23XtxQhA4IeaOpuxkYKMP5/Bdg9EdlxCKtFdQBzpacPidW9cpgAAAAAA
AA==

------=_NextPart_000_008F_01C19920.CA3579F0--
