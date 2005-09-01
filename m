Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j81FTBV15849
	for <linux-lvm@redhat.com>; Thu, 1 Sep 2005 11:29:11 -0400
Received: from itsnt162.iowa.uiowa.edu (itsnt162.iowa.uiowa.edu
	[128.255.40.162])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j81FT4jA015845
	for <linux-lvm@redhat.com>; Thu, 1 Sep 2005 11:29:04 -0400
Content-class: urn:content-classes:message
MIME-Version: 1.0
Subject: RE: [linux-lvm] Moving space between logical volumes?
Date: Thu, 1 Sep 2005 10:28:57 -0500
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
	micalg=SHA1; boundary="----=_NextPart_000_0005_01C5AEDF.F52AA580"
Message-ID: <3BED18D345FC9245B8B26F4273CFFBAF0333FD33@IOWAEVS02.iowa.uiowa.edu>
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

------=_NextPart_000_0005_01C5AEDF.F52AA580
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Chris,

    Thanks for your reply. The logical volumes in question are ext3
filesystems. I did read the man page for lvreduce and its warning about
possible loss of data was what originally prompted me to ask for help.

    I do not want to resize the partition (they are all on the same
partition), so I am wondering if e2fsadm might do the trick? It looks like
you can shrink (and expand) logical volumes using e2fsadm with the
restriction that shrinking only works on unmounted filesystems (if I'm
reading the man page correctly). So... my current thought is as follows:

    * unmount the filesystems in question.
    * use 'tune2fs -O ^has_journal /dev/sda5' to turn off journaling
    * use 'e2fsadm -L -100G /dev/vg/lv1' to reduce lv1 by 100GB
    * use 'e2fsadm -L +100G /dev/vg/lv2' to increase lv2 by 100GB
    * use 'e2fsck -f /dev/sda5' to check the filesystems
    * use 'tune2fs -j /dev/sda5' to turn journaling back on
    * re-mount the filesystems

    It seems (from the man page for e2fsadm) that lvreduce/lvextend would
then not be needed. Is this true?

    I would like to feel more confident that this would actually work before
I jump in there and do it because I don't feel like looking for a new job if
it doesn't. ;-)

    Thanks,

-Howard
 

-----Original Message-----
From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com] On
Behalf Of Chris Osicki
Sent: Wednesday, August 31, 2005 4:28 PM
To: LVM general discussion and development
Subject: Re: [linux-lvm] Moving space between logical volumes?


Hi Howard

Your start point is "man lvreduce". Depending of the filesystem type
you're using you would have to find out how to resize the FS _before_
using lvreduce/lvextend. Depending on the FS type it may or may not be
possible to do it on a mounted FS. In worst case a boot from Rescue-CD
would be necessary == down-time.

You will have to do this:

	 resize (decrease size of) the file system on the huge_lvol
	 lvreduce huge_lvol
	 lvextend tight_lvol
	 resize (increase size of) the file system on the tight_lvol

LVols resizing was I think the first and most important motivation to
write LVM.
Good luck.

Regards,
Chris

On Wed, Aug 31, 2005 at 02:56:40PM -0500, Meadows, Howard T wrote:
> 
> I have a volume group with 4 logical volumes. One of the logical volumes
has
> a huge amount of space allocated to it, and another is running out of its
> space.
> 
> I am assuming there is a way to re-allocate space from the one with lots
of
> space to the one that is running out. I am nervous about using losing data
> with a reduce-extend combination of commands. Can someone who has done
this
> explain exactly how this is done (safely)?
> 
> Thanks,
> 
> -Howard
> 
> 
> =======================================================
> Howard Meadows                 howard-meadows@uiowa.edu
> ITS - SPA, Unix Systems Group              319-335-5519
> The University of Iowa                    Iowa City, IA
>  
> 



> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

-- 

Chris Osicki osk@osk.ch
Dipl. Informatik-Ing. HTL

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

------=_NextPart_000_0005_01C5AEDF.F52AA580
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
DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTA1MDkwMTE1Mjg1NlowIwYJKoZIhvcN
AQkEMRYEFIqVjKaLwaIiDu4ZWcnTB7gC0DSTMGcGCSqGSIb3DQEJDzFaMFgwCgYIKoZIhvcNAwcw
DgYIKoZIhvcNAwICAgCAMA0GCCqGSIb3DQMCAgFAMAcGBSsOAwIHMA0GCCqGSIb3DQMCAgEoMAcG
BSsOAwIaMAoGCCqGSIb3DQIFMHgGCSsGAQQBgjcQBDFrMGkwYjELMAkGA1UEBhMCWkExJTAjBgNV
BAoTHFRoYXd0ZSBDb25zdWx0aW5nIChQdHkpIEx0ZC4xLDAqBgNVBAMTI1RoYXd0ZSBQZXJzb25h
bCBGcmVlbWFpbCBJc3N1aW5nIENBAgMNwP0wegYLKoZIhvcNAQkQAgsxa6BpMGIxCzAJBgNVBAYT
AlpBMSUwIwYDVQQKExxUaGF3dGUgQ29uc3VsdGluZyAoUHR5KSBMdGQuMSwwKgYDVQQDEyNUaGF3
dGUgUGVyc29uYWwgRnJlZW1haWwgSXNzdWluZyBDQQIDDcD9MA0GCSqGSIb3DQEBAQUABIGAUJLp
epqLYkXzmVbsV+1ai6/LKBvq+31larHJ9eH5bOxwMN12P0nHeYDGDgfOHKPB1lM1z+aFyfVvE9tF
nPGz6JMXoz/ZLQGloaQ0kfGhlXQG0R0h49XM0cda7fDuCfwou5oyu0pDJRVMacE8eN7rV1XInzZ7
/j65UYC7bGXz7lIAAAAAAAA=

------=_NextPart_000_0005_01C5AEDF.F52AA580--
