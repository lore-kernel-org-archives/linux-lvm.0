Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id lBILro28009159
	for <linux-lvm@redhat.com>; Tue, 18 Dec 2007 16:53:50 -0500
Received: from mexforward.lss.emc.com (mexforward.lss.emc.com [128.222.32.20])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id lBILrC2J011063
	for <linux-lvm@redhat.com>; Tue, 18 Dec 2007 16:53:12 -0500
Received: from hop04-l1d11-si02.isus.emc.com (HOP04-L1D11-SI02.isus.emc.com
	[10.254.111.55])
	by mexforward.lss.emc.com (Switch-3.2.5/Switch-3.1.7) with ESMTP id
	lBILr6xb014987
	for <linux-lvm@redhat.com>; Tue, 18 Dec 2007 16:53:06 -0500 (EST)
Received: from mailhub.lss.emc.com (nirah.lss.emc.com [10.254.144.13]) by
	hop04-l1d11-si02.isus.emc.com (Tablus Interceptor) for
	<linux-lvm@redhat.com>; Tue, 18 Dec 2007 16:53:06 -0500
Received: from corpussmtp3.corp.emc.com (corpussmtp3.corp.emc.com
	[10.254.64.53])
	by mailhub.lss.emc.com (Switch-3.2.5/Switch-3.1.7) with ESMTP id
	lBILqsl1020020
	for <linux-lvm@redhat.com>; Tue, 18 Dec 2007 16:53:03 -0500 (EST)
From: pham_cuong@emc.com
Content-class: urn:content-classes:message
MIME-Version: 1.0
Subject: RE: [linux-lvm] won't dual boot: 2 disks and LVM
Date: Tue, 18 Dec 2007 16:52:42 -0500
Message-ID: <7C6C00FDABF70949A0A5D4DD8A4DC2170474A356@CORPUSMX20A.corp.emc.com>
In-Reply-To: <1198010286.6637.10.camel@amd64.local>
References: <1197988092.29413.77.camel@veri.phy.umist.ac.uk><7C6C00FDABF70949A0A5D4DD8A4DC2170474A353@CORPUSMX20A.corp.emc.com>
	<1198010286.6637.10.camel@amd64.local>
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

There is a difference between changing the boot order from the BIOS vs.
[physically] removing the master HD.  Here's why:

In the former case, the BIOS boot order is at the lower-level (earlier)
and it will take effect before the boot loader exists in each drive.
Depending on your BIOS, the boot order can be fixed or priority-based
(most BIOSes support priority-based boot path).  Fixed order means that
only the specified boot order is used.  Priority-based boot order means
that the system will attempt the first boot path on the list, if failed,
or timed out, goes to the 2nd boot path.  BIOS boot order only changes
the order of which path to boot from first. It has no control over the
designation of which drive is detected and designated as drive 0 or
drive 1.  Boot.ini has this level of granularity, and more... Down to
the partition level (one below the disk level).

The act of removing the Master HD changes the HD designation at the
hardware level, and this in turn may affect how the system boots (for
non-SCSI only). Specifically, for your case the XP's boot.ini may
designate that XP is to be booted from the first disk (connected to
PR1), first paritition, and you've physically connect this drive as a
secondary/slave (SL) drive so XP will never boot when XP's boot loader
reads the boot.ini.  Upon either moving this drive to the primary (PR1)
connection, or change the boot.ini, the drive order for this drive is
changed from disk1 to disk0, so XP would see this drive and be able to
boot from it.  As you can see, in this case, changing the BIOS boot
order is inconsequential.

Regards,

Confucius

-----Original Message-----
From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com]
On Behalf Of cs
Sent: Tuesday, December 18, 2007 3:38 PM
To: LVM general discussion and development
Subject: RE: [linux-lvm] won't dual boot: 2 disks and LVM

On Tue, 2007-12-18 at 14:52 -0500, pham_cuong@emc.com wrote:
>  Michael,
> 
> No. There are several issues here, and the discussion in this email
> chain mixes thing up.
> 
> This has nothing to do with WinXP vs LVM.
> 
> It has to do with the way WinXP want to install vs. the way you want
to
> install.  In all case, you will lose to XP.  More specifcally, it has
to
> do with the way Windows XP works with primary and secondary disks, and
> with the way XP works with partitions in each disk.
> 
> What you want to do is wrong for your intended purpose.  You can not
> install XP onto a slave disk in a multidisk host SUSEQUENT TO
installing
> other Oses on the primary disk, without data loss, since XP would want
> to write data to a useable partition of the primary disk (after it
> formats the [first] paritition on the primary disk) regardless of
> whether you want to install the rest of the OS onto a partition on the
> primary disk or onto a partition of the secondary disk.  This is why
you
> have to install XP first, so that the boot info is saved.  Once XP is
> successfully installed, you then can install other non-Windows Oses
> either:
> 
> A.  On the same partition of the same disk (some Oses)
> B.  On a different partition of the same disk
> C.  On a different partition of a different disk.
> 
> If you'd done this, then the Primary disk contains 1 or more
partitions,
> one of which is designated for XP, as recorded in the hidden system
file
> in the root directory of the primary drive, in the partition you've
> designated to XP at the time of installation.  For most people, the
> entire primary disk would be used, so the partition would be the first
> partition.  This partition would have the size less than or equaled to
> the entire raw disk.  Windows would, by default, designate this as
"C:"
> drive.  The "boot.ini" file would look like this:
> 
> [operating system]
> Multi(1)disk(0)rdisk(0)partition(1)\WINNT="Microsoft Windows XP
> Professional" /noexecute=Alwaysoff /fastdetect
> Multi(1)disk(1)rdisk(0)partition(1)\WINNT="Microsoft Windows 2003-X64
> Enterprise  Edition" /noexecute=Alwaysoff /fastdetect
> 
> Upon a system boot, XP reads this boot.ini and display a menu of boot
> options within Windows.
> 
> If you want to reinstall XP onto the 2nd/secondary disk, XP still have
> to write severla hidden system files onto a [NTFS]-formatted partition
> on the primary disk anyway; one of which is the boot.ini file.  If
there
> is another non-Windows, non-DOS, or previous incompatible Windows OS
> exists, XP will format that partition and wipe out the ther OS.  This
is
> why you always have to install [Windows] XP first before installing
> other non-Windows Oses.
> 
> You should not care about whether Fedora exists in the primary or
> secondary disk.
> Instead, you want to install XP on the primary disk first, then
install
> Fedore or whatever, on the secondary disk.  This is the way XP is
> designed to work.  Other Oses just have to to work around XP when it
> comes to multiboot.
> 
> 
> Good luck.

Yes, I may be confusing myself! I had in the past unhooked my master HD
(with Linux and a "smaller so it only fits on 1 disk" LVM) and then
stuck XP on the other HD. 

Many moons later (ie now) and with both HDs hooked up, I can boot into
XP from the GRUB menu. Then I tried to update the XP installation using
the provided (with mobo) Intel CD (to get networking working and some
other things (can't recall off top of head) during which process it had
to reboot a few times and during one of these it hung "forever".

So I then tried to reinstall XP (still with both HDs hooked up) and it
hangs during the installation (I'd need to do it again to see where, but
it had got past asking what the product key was)

I was accusing LVM since I couldn't recall such probs with non-LVM dual
boot installations but it may be that for them I always had either used
master HD for XP or had unhooked other HDs. I must admit I'm still lost
as to why the XP reinstall hangs - I was presuming it was looking at all
filesystems/partitions and getting stuck

I think people are suggesting that if I unhook the master HD (but why do
i really have to do that rather than swapping, in BIOS, the boot
order???), having ensured I've nothing on slave HD that I want to  keep,
and then sticking XP in one partion, then putting all HDs back in the
machine and setting up the GRUB map/rootnoverify options accordingly?

Thanks, Michael

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
