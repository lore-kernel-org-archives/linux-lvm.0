Return-Path: <jpar@blueyonder.co.uk>
From: "Julian Parker" <jpar@blueyonder.co.uk>
Date: Thu, 21 Jun 2001 22:07:09 +0100
Message-ID: <NEBBKEDBELPFPCIHAEHNIEDNCBAA.jpar@blueyonder.co.uk>
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_0001_01C0FA9E.83F7B640"
Return-Path: jpar@blueyonder.co.uk
Subject: [linux-lvm] Logical Volume Manager 0.9.1_beta7
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
List-Id: <linux-lvm.redhat.com>
To: Linux-LVM@Sistina.com

This is a multi-part message in MIME format.

------=_NextPart_000_0001_01C0FA9E.83F7B640
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Apologies for mailing out of the blue but I'm not sure how to go about
this.

I'm using the LVM software, very nice it is too :-) but I'm having a
couple of issues and I was wondering if they were bugs or if I was
using the software incorrectly. If there is another person I should be
reporting this to, please let me know

1/ pvcreate cannot use whole disks as referred to in the man pages.
pvcreate /dev/hde reports that the partition table exists, this was
removed using the dd command; dd if/dev/zero of/dev/hde bs=512k
count=1
I can't change the partition table to have 8e because there is not one
there so I got round it by createing one single partition for the
whole disk and modifying that partition to use Linux LVM. see below.

# fdisk -l /dev/hde

Disk /dev/hde: 16 heads, 63 sectors, 38792 cylinders
Units = cylinders of 1008 * 512 bytes

   Device Boot    Start       End    Blocks   Id  System
/dev/hde1             1     38792  19551136+  8e  Linux LVM

This is the same with different type of disk, I only tested with IDE
disks if that actually makes a difference.


2/ I have modified a logical volume to be read only and deactivated it
but when using lvchange to reactivate, it won't work.

# lvdisplay /dev/vgdata/oracle
- --- Logical volume ---
LV Name                /dev/vgdata/oracle
VG Name                vgdata
LV Write Access        read only
LV Status              NOT available
LV #                   4
# open                 0
LV Size                1 GB
Current LE             256
Allocated LE           256
Allocation             next free
Read ahead sectors     120
Block device           58:4

# lvchange -v -a y /dev/vgdata/oracle
lvchange -- locking logical volume manager
lvchange -- checking logical volume name
lvchange -- checking volume group existence
lvchange -- checking for active volume group "vgdata"
lvchange -- reading volume group data of "vgdata" from disk(s)
lvchange -- checking consistency of "vgdata"
lvchange -- checking logical volume "/dev/vgdata/oracle" existence
lvchange -- getting index of logical volume "/dev/vgdata/oracle" in
volume group "vgdata"
lvchange -- getting status of "/dev/vgdata/oracle" from VGDA in kernel
lvchange -- changing logical volume "/dev/vgdata/oracle" in VGDA of
kernel
lvchange -- ERROR "Operation not permitted" couldn't open logical
volume "/dev/vgdata/oracle"



Kind Regards,


Jules

- -----
Good judgement comes from experience,
And often experience comes from bad judgement.



-----BEGIN PGP SIGNATURE-----
Version: PGP Personal Edition 6.0.2

iQA/AwUBOzJh/JIQSDu8ZJkNEQIgTQCeMaw2vpsFCNPoLiuSrZYGAUWJplsAoLll
6joWcPA2bqD9tSAxG1ItYIdU
=e50K
-----END PGP SIGNATURE-----


------=_NextPart_000_0001_01C0FA9E.83F7B640
Content-Type: application/ms-tnef;
	name="winmail.dat"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename="winmail.dat"

eJ8+IgkVAQaQCAAEAAAAAAABAAEAAQeQBgAIAAAA5AQAAAAAAADoAAEIgAcAGAAAAElQTS5NaWNy
b3NvZnQgTWFpbC5Ob3RlADEIAQ2ABAACAAAAAQABAAEGgAMADgAAANEHBgAVABYABwAAAAQAFAEB
A5AGAOwEAAAiAAAACwACAAAAAAALACMAAAAAAAMAJgABAAAACwApAAEAAAALACsAAQAAAAIBMQAB
AAAACgEAAFBDREZFQjA5AAEAAgCCAAAAAAAAADihuxAF5RAaobsIACsqVsIAAFBTVFBSWC5ETEwA
AAAAAAAAAE5JVEH5v7gBAKoAN9luAAAAQzpcV0lORE9XU1xMb2NhbCBTZXR0aW5nc1xBcHBsaWNh
dGlvbiBEYXRhXE1pY3Jvc29mdFxPdXRsb29rXG91dGxvb2sucHN0ABgAAAAAAAAAS5VlXkPU1BGk
MQBgl9lHqcKBAAAAAAAAGAAAAAAAAABLlWVeQ9TUEaQxAGCX2UepwoAAABAAAAAbfSJ/bmbVEaQy
AGCX2UepIwAAAExvZ2ljYWwgVm9sdW1lIE1hbmFnZXIgMC45LjFfYmV0YTcAAAADADYAAQAAAB4A
cAABAAAAIwAAAExvZ2ljYWwgVm9sdW1lIE1hbmFnZXIgMC45LjFfYmV0YTcAAAIBcQABAAAAFgAA
AAHA+pYeVn8ifR1mbhHVpDIAYJfZR6kAAAIBHQwBAAAAGwAAAFNNVFA6SlBBUkBCTFVFWU9OREVS
LkNPLlVLAAALAAEOAAAAAEAABg4AcrQclvrAAQIBCg4BAAAAGAAAAAAAAABLlWVeQ9TUEaQxAGCX
2UepwoAAAAsAHw4AAAAAAwAAfAUAAAALAAGACCAGAAAAAADAAAAAAAAARgAAAAADhQAAAAAAAAMA
A4AIIAYAAAAAAMAAAAAAAABGAAAAABCFAAAAAAAAAwAHgAggBgAAAAAAwAAAAAAAAEYAAAAAUoUA
ACdqAQAeAAmACCAGAAAAAADAAAAAAAAARgAAAABUhQAAAQAAAAQAAAA5LjAAHgAKgAggBgAAAAAA
wAAAAAAAAEYAAAAANoUAAAEAAAABAAAAAAAAAB4AC4AIIAYAAAAAAMAAAAAAAABGAAAAADeFAAAB
AAAAAQAAAAAAAAAeAAyACCAGAAAAAADAAAAAAAAARgAAAAA4hQAAAQAAAAEAAAAAAAAACwANgAgg
BgAAAAAAwAAAAAAAAEYAAAAAgoUAAAEAAAALADqACCAGAAAAAADAAAAAAAAARgAAAAAOhQAAAAAA
AAMAPIAIIAYAAAAAAMAAAAAAAABGAAAAABGFAAAAAAAAAwA9gAggBgAAAAAAwAAAAAAAAEYAAAAA
GIUAAAAAAAALAF2ACCAGAAAAAADAAAAAAAAARgAAAAAGhQAAAAAAAAMAXoAIIAYAAAAAAMAAAAAA
AABGAAAAAAGFAAAAAAAAAgH4DwEAAAAQAAAAS5VlXkPU1BGkMQBgl9lHqQIB+g8BAAAAEAAAAEuV
ZV5D1NQRpDEAYJfZR6kCAfsPAQAAAIIAAAAAAAAAOKG7EAXlEBqhuwgAKypWwgAAUFNUUFJYLkRM
TAAAAAAAAAAATklUQfm/uAEAqgA32W4AAABDOlxXSU5ET1dTXExvY2FsIFNldHRpbmdzXEFwcGxp
Y2F0aW9uIERhdGFcTWljcm9zb2Z0XE91dGxvb2tcb3V0bG9vay5wc3QAAAADAP4PBQAAAAMADTT9
NwAAAgF/AAEAAAA1AAAAPE5FQkJLRURCRUxQRlBDSUhBRUhOSUVETkNCQUEuanBhckBibHVleW9u
ZGVyLmNvLnVrPgAAAACJ7g==

------=_NextPart_000_0001_01C0FA9E.83F7B640--
