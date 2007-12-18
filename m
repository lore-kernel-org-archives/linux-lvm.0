Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id lBIKAbA9032754
	for <linux-lvm@redhat.com>; Tue, 18 Dec 2007 15:10:37 -0500
Received: from mexforward.lss.emc.com (mexforward.lss.emc.com [128.222.32.20])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id lBIKA5vc003725
	for <linux-lvm@redhat.com>; Tue, 18 Dec 2007 15:10:05 -0500
Received: from hop04-l1d11-si01.isus.emc.com (HOP04-L1D11-SI01.isus.emc.com
	[10.254.111.54])
	by mexforward.lss.emc.com (Switch-3.2.5/Switch-3.1.7) with ESMTP id
	lBIK9xHo027632
	for <linux-lvm@redhat.com>; Tue, 18 Dec 2007 15:09:59 -0500 (EST)
Received: from mailhub.lss.emc.com (uraeus.lss.emc.com [10.254.144.14]) by
	hop04-l1d11-si01.isus.emc.com (Tablus Interceptor) for
	<linux-lvm@redhat.com>; Tue, 18 Dec 2007 15:09:59 -0500
Received: from corpussmtp4.corp.emc.com (corpussmtp4.corp.emc.com
	[10.254.64.54])
	by mailhub.lss.emc.com (Switch-3.2.5/Switch-3.1.7) with ESMTP id
	lBIK9jgi016273
	for <linux-lvm@redhat.com>; Tue, 18 Dec 2007 15:09:57 -0500 (EST)
From: pham_cuong@emc.com
Content-class: urn:content-classes:message
MIME-Version: 1.0
Subject: RE: [linux-lvm] won't dual boot: 2 disks and LVM
Date: Tue, 18 Dec 2007 15:09:04 -0500
Message-ID: <7C6C00FDABF70949A0A5D4DD8A4DC2170474A354@CORPUSMX20A.corp.emc.com>
In-Reply-To: <7C6C00FDABF70949A0A5D4DD8A4DC2170474A353@CORPUSMX20A.corp.emc.com>
References: <1197988092.29413.77.camel@veri.phy.umist.ac.uk>
	<7C6C00FDABF70949A0A5D4DD8A4DC2170474A353@CORPUSMX20A.corp.emc.com>
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

FYI:   

I have servers and even laptop configured to multi-boot with RHEL, SuSE
Linux, Vmware Workstation (laptop only), Vmware ESX 3.5,  W2K3EE-X32,
W2K3EE-X64, and XP Pro w/o any problem.  You just have to know the
behavior of each OS you want to install in a multiboot environment.

If you need offline help, write to my email at khongphutu@yahoo.com

Regards.



-----Original Message-----
From: pham, cuong 
Sent: Tuesday, December 18, 2007 2:53 PM
To: 'LVM general discussion and development'
Subject: RE: [linux-lvm] won't dual boot: 2 disks and LVM

 Michael,

No. There are several issues here, and the discussion in this email
chain mixes thing up.

This has nothing to do with WinXP vs LVM.

It has to do with the way WinXP want to install vs. the way you want to
install.  In all case, you will lose to XP.  More specifcally, it has to
do with the way Windows XP works with primary and secondary disks, and
with the way XP works with partitions in each disk.

What you want to do is wrong for your intended purpose.  You can not
install XP onto a slave disk in a multidisk host SUSEQUENT TO installing
other Oses on the primary disk, without data loss, since XP would want
to write data to a useable partition of the primary disk (after it
formats the [first] paritition on the primary disk) regardless of
whether you want to install the rest of the OS onto a partition on the
primary disk or onto a partition of the secondary disk.  This is why you
have to install XP first, so that the boot info is saved.  Once XP is
successfully installed, you then can install other non-Windows Oses
either:

A.  On the same partition of the same disk (some Oses)
B.  On a different partition of the same disk
C.  On a different partition of a different disk.

If you'd done this, then the Primary disk contains 1 or more partitions,
one of which is designated for XP, as recorded in the hidden system file
in the root directory of the primary drive, in the partition you've
designated to XP at the time of installation.  For most people, the
entire primary disk would be used, so the partition would be the first
partition.  This partition would have the size less than or equaled to
the entire raw disk.  Windows would, by default, designate this as "C:"
drive.  The "boot.ini" file would look like this:

[operating system]
Multi(1)disk(0)rdisk(0)partition(1)\WINNT="Microsoft Windows XP
Professional" /noexecute=Alwaysoff /fastdetect
Multi(1)disk(1)rdisk(0)partition(1)\WINNT="Microsoft Windows 2003-X64
Enterprise  Edition" /noexecute=Alwaysoff /fastdetect

Upon a system boot, XP reads this boot.ini and display a menu of boot
options within Windows.

If you want to reinstall XP onto the 2nd/secondary disk, XP still have
to write severla hidden system files onto a [NTFS]-formatted partition
on the primary disk anyway; one of which is the boot.ini file.  If there
is another non-Windows, non-DOS, or previous incompatible Windows OS
exists, XP will format that partition and wipe out the ther OS.  This is
why you always have to install [Windows] XP first before installing
other non-Windows Oses.

You should not care about whether Fedora exists in the primary or
secondary disk.
Instead, you want to install XP on the primary disk first, then install
Fedore or whatever, on the secondary disk.  This is the way XP is
designed to work.  Other Oses just have to to work around XP when it
comes to multiboot.


Good luck.

Confucius.





-----Original Message-----
From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com]
On Behalf Of michael
Sent: Tuesday, December 18, 2007 9:28 AM
To: linux-lvm@redhat.com
Subject: [linux-lvm] won't dual boot: 2 disks and LVM

I'm looking for a solution for (re-)installing WinXP on my slave disk
when I have Fedora and LVM on the master disk. In the past I've opened
up the box and unplugged the Fedora/LVM disk in order for WinXP to
install okay. But this seems much too drastic. Even swapping disk order
(in BIOS) doesn't help - WinXP installation sits there "forever" when
checking current config.

Whilst I cannot find any definite reference stating "MS WinXP cannot
handle LVM" it does seem to be the culprit. 

Anybody got any such definitive references or other help?

Thanks, Michael

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
