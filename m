Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j86FIPV29120
	for <linux-lvm@redhat.com>; Tue, 6 Sep 2005 11:18:25 -0400
Received: from itsnt162.iowa.uiowa.edu (itsnt162.iowa.uiowa.edu
	[128.255.40.162])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j86FIHcm021574
	for <linux-lvm@redhat.com>; Tue, 6 Sep 2005 11:18:17 -0400
Content-class: urn:content-classes:message
MIME-Version: 1.0
Subject: RE: [linux-lvm] Moving space between logical volumes?
Date: Tue, 6 Sep 2005 10:18:10 -0500
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
	micalg=SHA1; boundary="----=_NextPart_000_0005_01C5B2CC.44B5BA00"
Message-ID: <3BED18D345FC9245B8B26F4273CFFBAF033FBADA@IOWAEVS02.iowa.uiowa.edu>
From: "Meadows, Howard T" <howard-meadows@uiowa.edu>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

This is a multi-part message in MIME format.

------=_NextPart_000_0005_01C5B2CC.44B5BA00
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, 2005-09-06 at 9:22 AM, David Johnston wrote:

>
>e2fsadm is a front end for the LVM tools.  It simplifies things by doing
>the math for you, and by doing the steps in the correct order (which
>changes depending on whether you are growing or shrinking).
>
>If /dev/vg/lv1 and /dev/vg/lv2 are logical volumes, and you have ext3
>filesystems on them, all you need to do is this:
>
># Shrink lv1
>umount /dev/vg/lv1
>e2fsadm -L -100G /dev/vg/lv1
>mount /dev/vg/lv1
>
># Expand lv2
>umount /dev/vg/lv2
>e2fsadm -L +100G /dev/vg/lv2
>mount /dev/vg/lv2
>
>That's it.
>
>I'm concerned about your reference to /dev/sda5.  Is that your LVM
>partition?  If so, leave it alone.  From its name, it's clear that it is
>not a logical partition, so you can't use LVM tools to manipulate it.
>What's special about /dev/sda5 that makes you think you need to turn
>journaling off before you can resize /dev/vg/lv1?
>
>-DJ
>
>LVM vocabulary in newbie terms:
>	physical volume = a disk
>	logical volume  = a partition
>By extention,
>	lvresize = fdisk
>
>In reality, it's not that simple, but until you're comfortable with LVM,
>these simple definitions will steer you well.
>

David,

    Thanks very much for the information. 

    To clarify my present configuration, I'm including data from fdisk,
vgdisplay and lvdisplay for the two logical volumes I want to resize.

    From what I see, it sounds like I can use the commands you specified
(with the correct lv and vg names) and all should be well (with no loss of
data). If I could take advantage of your kindness just a little more, could
you look at my information below and confirm that those commands are
correct?

    Thanks VERY much,

-Howard

Here is the data:
=====================================

Data reported with fdisk p command:

Disk /dev/sda: 254 heads, 63 sectors, 44798 cylinders
Units = cylinders of 16002 * 512 bytes

   Device Boot    Start       End    Blocks   Id  System
/dev/sda1   *         1         3     23971+  83  Linux
/dev/sda2             4       259   2048256   83  Linux
/dev/sda3           260       514   2040255   82  Linux swap
/dev/sda4           515     44798 354316284    5  Extended
/dev/sda5           515       770   2048224+  8e  Linux LVM
/dev/sda6           771     32767 256007965+  8e  Linux LVM

=======================================

Output from vgdisplay command for 
volume group containing logical
volumes in question:

# vgdisplay /dev/storagevg
--- Volume group ---

VG Name               storagevg
VG Access             read/write
VG Status             available/resizable
VG #                  1
MAX LV                256
Cur LV                4
Open LV               4
MAX LV Size           2 TB
Max PV                256
Cur PV                2
Act PV                2
VG Size               585.88 GB
PE Size               32 MB
Total PE              18748
Alloc PE / Size       18208 / 569 GB
Free  PE / Size       540 / 16.88 GB
VG UUID               Ntjcgr-zTVs-Lp6e-Tvrj-HU9u-ZcCq-cY10Lv

====================================

Output from lvdisplay command for the logical
volume I want to reduce by 100 GB:

# lvdisplay /dev/storagevg/atdevel
--- Logical volume ---
LV Name                /dev/storagevg/atdevel
VG Name                storagevg
LV Write Access        read/write
LV Status              available
LV #                   1
# open                 1
LV Size                505 GB
Current LE             16160
Allocated LE           16160
Allocation             next free
Read ahead sectors     1024
Block device           58:4

=================================

Output from lvdisplay for logical 
volume I want to increase by 100 GB:

# lvdisplay /dev/storagevg/gcg
--- Logical volume ---
LV Name                /dev/storagevg/gcg
VG Name                storagevg
LV Write Access        read/write
LV Status              available
LV #                   4
# open                 1
LV Size                50 GB
Current LE             1600
Allocated LE           1600
Allocation             next free
Read ahead sectors     1024
Block device           58:1

===============================


------=_NextPart_000_0005_01C5B2CC.44B5BA00
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
DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTA1MDkwNjE1MTgwNFowIwYJKoZIhvcN
AQkEMRYEFK/X3/3MxKRiMRC3MZG6k9UIgVe0MGcGCSqGSIb3DQEJDzFaMFgwCgYIKoZIhvcNAwcw
DgYIKoZIhvcNAwICAgCAMA0GCCqGSIb3DQMCAgFAMAcGBSsOAwIHMA0GCCqGSIb3DQMCAgEoMAcG
BSsOAwIaMAoGCCqGSIb3DQIFMHgGCSsGAQQBgjcQBDFrMGkwYjELMAkGA1UEBhMCWkExJTAjBgNV
BAoTHFRoYXd0ZSBDb25zdWx0aW5nIChQdHkpIEx0ZC4xLDAqBgNVBAMTI1RoYXd0ZSBQZXJzb25h
bCBGcmVlbWFpbCBJc3N1aW5nIENBAgMNwP0wegYLKoZIhvcNAQkQAgsxa6BpMGIxCzAJBgNVBAYT
AlpBMSUwIwYDVQQKExxUaGF3dGUgQ29uc3VsdGluZyAoUHR5KSBMdGQuMSwwKgYDVQQDEyNUaGF3
dGUgUGVyc29uYWwgRnJlZW1haWwgSXNzdWluZyBDQQIDDcD9MA0GCSqGSIb3DQEBAQUABIGAOzh6
aAI5RuXUioJXi8nU+6ic+wrMLT4VTsyYyaJx2H/p57xtY6c6UvwJNZylFkWB6/m7QibJYMt4QRA+
8NMK1s8xDjeXy+OXrDqYvgFOmBwA7njV55xJopN1hY2fsh7z237IyuXs84306fPhO1Gi1EhONHU/
PuCa9kgxgcQT5DUAAAAAAAA=

------=_NextPart_000_0005_01C5B2CC.44B5BA00--
