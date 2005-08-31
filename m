Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j7VJurV15858
	for <linux-lvm@redhat.com>; Wed, 31 Aug 2005 15:56:53 -0400
Received: from itsnt171.iowa.uiowa.edu (itsnt171.iowa.uiowa.edu
	[128.255.83.12])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j7VJukhd012711
	for <linux-lvm@redhat.com>; Wed, 31 Aug 2005 15:56:47 -0400
Content-class: urn:content-classes:message
MIME-Version: 1.0
Date: Wed, 31 Aug 2005 14:56:40 -0500
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
	micalg=SHA1; boundary="----=_NextPart_000_00AA_01C5AE3C.31ADC630"
Message-ID: <3BED18D345FC9245B8B26F4273CFFBAF0333F999@IOWAEVS02.iowa.uiowa.edu>
From: "Meadows, Howard T" <howard-meadows@uiowa.edu>
Subject: [linux-lvm] Moving space between logical volumes?
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

This is a multi-part message in MIME format.

------=_NextPart_000_00AA_01C5AE3C.31ADC630
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit


I have a volume group with 4 logical volumes. One of the logical volumes has
a huge amount of space allocated to it, and another is running out of its
space.

I am assuming there is a way to re-allocate space from the one with lots of
space to the one that is running out. I am nervous about using losing data
with a reduce-extend combination of commands. Can someone who has done this
explain exactly how this is done (safely)?

Thanks,

-Howard


=======================================================
Howard Meadows                 howard-meadows@uiowa.edu
ITS - SPA, Unix Systems Group              319-335-5519
The University of Iowa                    Iowa City, IA
 


------=_NextPart_000_00AA_01C5AE3C.31ADC630
Content-Type: application/x-pkcs7-signature;
	name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename="smime.p7s"

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIII0TCCAlkw
ggHCoAMCAQICAw3A/TANBgkqhkiG9w0BAQQFADBiMQswCQYDVQQGEwJaQTElMCMGA1UEChMcVGhh
d3RlIENvbnN1bHRpbmcgKFB0eSkgTHRkLjEsMCoGA1UEAxMjVGhhd3RlIFBlcnNvbmFsIEZyZWVt
YWlsIElzc3VpbmcgQ0EwHhcNMDUwMTA2MTk1MTEyWhcNMDYwMTA2MTk1MTEyWjBKMR8wHQYDVQQD
ExZUaGF3dGUgRnJlZW1haWwgTWVtYmVyMScwJQYJKoZIhvcNAQkBFhhob3dhcmQtbWVhZG93c0B1
aW93YS5lZHUwgZ8wDQYJKoZIhvcNAQEBBQADgY0AMIGJAoGBALtadGHIDYu1jheNdgOpaJ5sT2Ld
+KUZE/jkQ68Aj3Zq+GqlPTndmJgiyld2LjrDynZMWZ4v732hiYSGnMaPUCHf3sDRzcjpUT4eKlrA
uzdrFCxMoCWRfeQ4hfFsrmE5K5C43qSjbHhFJHa8iF8pepHo7vwg2OFGGwvaYrlwHX7LAgMBAAGj
NTAzMCMGA1UdEQQcMBqBGGhvd2FyZC1tZWFkb3dzQHVpb3dhLmVkdTAMBgNVHRMBAf8EAjAAMA0G
CSqGSIb3DQEBBAUAA4GBAFKxH5zT/V4CACIukuCK74bnNDylWzyHvgXV4JhMqShtA4umPtGb05/X
9ZI44zOlXCJ1XDtHOPDj2bha4j7XJGQYk+VBwGGKTpoNhWVOvtvj9J8+LsMpG8zASnmSflTh2l/T
FiviX3JgxGHnvT5vMGML4hI9P6pqb5PbUAdV+Tp3MIIDLTCCApagAwIBAgIBADANBgkqhkiG9w0B
AQQFADCB0TELMAkGA1UEBhMCWkExFTATBgNVBAgTDFdlc3Rlcm4gQ2FwZTESMBAGA1UEBxMJQ2Fw
ZSBUb3duMRowGAYDVQQKExFUaGF3dGUgQ29uc3VsdGluZzEoMCYGA1UECxMfQ2VydGlmaWNhdGlv
biBTZXJ2aWNlcyBEaXZpc2lvbjEkMCIGA1UEAxMbVGhhd3RlIFBlcnNvbmFsIEZyZWVtYWlsIENB
MSswKQYJKoZIhvcNAQkBFhxwZXJzb25hbC1mcmVlbWFpbEB0aGF3dGUuY29tMB4XDTk2MDEwMTAw
MDAwMFoXDTIwMTIzMTIzNTk1OVowgdExCzAJBgNVBAYTAlpBMRUwEwYDVQQIEwxXZXN0ZXJuIENh
cGUxEjAQBgNVBAcTCUNhcGUgVG93bjEaMBgGA1UEChMRVGhhd3RlIENvbnN1bHRpbmcxKDAmBgNV
BAsTH0NlcnRpZmljYXRpb24gU2VydmljZXMgRGl2aXNpb24xJDAiBgNVBAMTG1RoYXd0ZSBQZXJz
b25hbCBGcmVlbWFpbCBDQTErMCkGCSqGSIb3DQEJARYccGVyc29uYWwtZnJlZW1haWxAdGhhd3Rl
LmNvbTCBnzANBgkqhkiG9w0BAQEFAAOBjQAwgYkCgYEA1GnX1LCUZFtx6UfYDFG26nKRsIRefS0N
j3sS34UldSh0OkIsYyeflXtL734Zhx2G6qPduc6WZBrCFG5ErHzmj+hND3EfQDimAKOHePb5lIZe
rerAXnbr2RSjXW56fAylS1V/Bhkpf56aJtVquzgkCGqYx7Hao5iR/Xnb5VrEHLkCAwEAAaMTMBEw
DwYDVR0TAQH/BAUwAwEB/zANBgkqhkiG9w0BAQQFAAOBgQDH7JJ+Tvj1lqVnYiqk8E0RYNBvjWBY
Yawmu1I1XAjPMPuoSpaKH2JCI4wXD/S6ZJwXrEcp352YXtJsYHFcoqzceePnbgBHH7UNKOgCneSa
/RP0ptl8sfjcXyMmCZGAc9AUG95DqYMl8uacLxXK/qarigd1iwzdUYRr5PjRzneigTCCAz8wggKo
oAMCAQICAQ0wDQYJKoZIhvcNAQEFBQAwgdExCzAJBgNVBAYTAlpBMRUwEwYDVQQIEwxXZXN0ZXJu
IENhcGUxEjAQBgNVBAcTCUNhcGUgVG93bjEaMBgGA1UEChMRVGhhd3RlIENvbnN1bHRpbmcxKDAm
BgNVBAsTH0NlcnRpZmljYXRpb24gU2VydmljZXMgRGl2aXNpb24xJDAiBgNVBAMTG1RoYXd0ZSBQ
ZXJzb25hbCBGcmVlbWFpbCBDQTErMCkGCSqGSIb3DQEJARYccGVyc29uYWwtZnJlZW1haWxAdGhh
d3RlLmNvbTAeFw0wMzA3MTcwMDAwMDBaFw0xMzA3MTYyMzU5NTlaMGIxCzAJBgNVBAYTAlpBMSUw
IwYDVQQKExxUaGF3dGUgQ29uc3VsdGluZyAoUHR5KSBMdGQuMSwwKgYDVQQDEyNUaGF3dGUgUGVy
c29uYWwgRnJlZW1haWwgSXNzdWluZyBDQTCBnzANBgkqhkiG9w0BAQEFAAOBjQAwgYkCgYEAxKY8
VXNV+065yplaHmjAdQRwnd/p/6Me7L3N9VvyGna9fww6YfK/Uc4B1OVQCjDXAmNaLIkVcI7dyfAr
hVqqP3FWy688Cwfn8R+RNiQqE88r1fOCdz0Dviv+uxg+B79AgAJk16emu59l0cUqVIUPSAR/p7bR
PGEEQB5kGXJgt/sCAwEAAaOBlDCBkTASBgNVHRMBAf8ECDAGAQH/AgEAMEMGA1UdHwQ8MDowOKA2
oDSGMmh0dHA6Ly9jcmwudGhhd3RlLmNvbS9UaGF3dGVQZXJzb25hbEZyZWVtYWlsQ0EuY3JsMAsG
A1UdDwQEAwIBBjApBgNVHREEIjAgpB4wHDEaMBgGA1UEAxMRUHJpdmF0ZUxhYmVsMi0xMzgwDQYJ
KoZIhvcNAQEFBQADgYEASIzRUIPqCy7MDaNmrGcPf6+svsIXoUOWlJ1/TCG4+DYfqi2fNi/A9BxQ
IJNwPP2t4WFiw9k6GX6EsZkbAMUaC4J0niVQlGLH2ydxVyWN3amcOY6MIE9lX5Xa9/eH1sYITq72
6jTlEBpbNU1341YheILcIRk13iSx0x1G/11fZU8xggLPMIICywIBATBpMGIxCzAJBgNVBAYTAlpB
MSUwIwYDVQQKExxUaGF3dGUgQ29uc3VsdGluZyAoUHR5KSBMdGQuMSwwKgYDVQQDEyNUaGF3dGUg
UGVyc29uYWwgRnJlZW1haWwgSXNzdWluZyBDQQIDDcD9MAkGBSsOAwIaBQCgggG8MBgGCSqGSIb3
DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTA1MDgzMTE5NTY0MFowIwYJKoZIhvcN
AQkEMRYEFPqeb9Nil0jdKBM5phWqZZTxLhP6MGcGCSqGSIb3DQEJDzFaMFgwCgYIKoZIhvcNAwcw
DgYIKoZIhvcNAwICAgCAMA0GCCqGSIb3DQMCAgFAMAcGBSsOAwIHMA0GCCqGSIb3DQMCAgEoMAcG
BSsOAwIaMAoGCCqGSIb3DQIFMHgGCSsGAQQBgjcQBDFrMGkwYjELMAkGA1UEBhMCWkExJTAjBgNV
BAoTHFRoYXd0ZSBDb25zdWx0aW5nIChQdHkpIEx0ZC4xLDAqBgNVBAMTI1RoYXd0ZSBQZXJzb25h
bCBGcmVlbWFpbCBJc3N1aW5nIENBAgMNwP0wegYLKoZIhvcNAQkQAgsxa6BpMGIxCzAJBgNVBAYT
AlpBMSUwIwYDVQQKExxUaGF3dGUgQ29uc3VsdGluZyAoUHR5KSBMdGQuMSwwKgYDVQQDEyNUaGF3
dGUgUGVyc29uYWwgRnJlZW1haWwgSXNzdWluZyBDQQIDDcD9MA0GCSqGSIb3DQEBAQUABIGAh2fF
oKSrTHS98bR1eBWsewZAvVXapc8usGfChPUuN+CMYrtyzejCH8soA9jatmCpkfy1SnH6YqaAqzu2
TTityTJoBqc+VZdF6+JlgUiUwqY9lu6icFCg042fHSH2UT8iVxDP7xT5wr1gFgaOXo6VG6HQOf8M
uo1MfRCjghn9HJYAAAAAAAA=

------=_NextPart_000_00AA_01C5AE3C.31ADC630--
