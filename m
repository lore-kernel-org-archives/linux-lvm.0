Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id lBIKcprs021335
	for <linux-lvm@redhat.com>; Tue, 18 Dec 2007 15:38:51 -0500
Received: from anchor-post-36.mail.demon.net (anchor-post-36.mail.demon.net
	[194.217.242.86])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id lBIKcUjt025964
	for <linux-lvm@redhat.com>; Tue, 18 Dec 2007 15:38:30 -0500
Received: from dyn-62-56-75-159.dslaccess.co.uk ([62.56.75.159] helo=amd64.lan)
	by anchor-post-36.mail.demon.net with esmtpa (AUTH miasmic)
	(Exim 4.67) id 1J4jCv-0005MF-Lx
	for linux-lvm@redhat.com; Tue, 18 Dec 2007 20:38:29 +0000
Subject: RE: [linux-lvm] won't dual boot: 2 disks and LVM
From: cs <cs@networkingnewsletter.org.uk>
In-Reply-To: <7C6C00FDABF70949A0A5D4DD8A4DC2170474A353@CORPUSMX20A.corp.emc.com>
References: <1197988092.29413.77.camel@veri.phy.umist.ac.uk>
	<7C6C00FDABF70949A0A5D4DD8A4DC2170474A353@CORPUSMX20A.corp.emc.com>
Date: Tue, 18 Dec 2007 20:38:06 +0000
Message-Id: <1198010286.6637.10.camel@amd64.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, 2007-12-18 at 14:52 -0500, pham_cuong@emc.com wrote:
>  Michael,
> 
> No. There are several issues here, and the discussion in this email
> chain mixes thing up.
> 
> This has nothing to do with WinXP vs LVM.
> 
> It has to do with the way WinXP want to install vs. the way you want to
> install.  In all case, you will lose to XP.  More specifcally, it has to
> do with the way Windows XP works with primary and secondary disks, and
> with the way XP works with partitions in each disk.
> 
> What you want to do is wrong for your intended purpose.  You can not
> install XP onto a slave disk in a multidisk host SUSEQUENT TO installing
> other Oses on the primary disk, without data loss, since XP would want
> to write data to a useable partition of the primary disk (after it
> formats the [first] paritition on the primary disk) regardless of
> whether you want to install the rest of the OS onto a partition on the
> primary disk or onto a partition of the secondary disk.  This is why you
> have to install XP first, so that the boot info is saved.  Once XP is
> successfully installed, you then can install other non-Windows Oses
> either:
> 
> A.  On the same partition of the same disk (some Oses)
> B.  On a different partition of the same disk
> C.  On a different partition of a different disk.
> 
> If you'd done this, then the Primary disk contains 1 or more partitions,
> one of which is designated for XP, as recorded in the hidden system file
> in the root directory of the primary drive, in the partition you've
> designated to XP at the time of installation.  For most people, the
> entire primary disk would be used, so the partition would be the first
> partition.  This partition would have the size less than or equaled to
> the entire raw disk.  Windows would, by default, designate this as "C:"
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
> on the primary disk anyway; one of which is the boot.ini file.  If there
> is another non-Windows, non-DOS, or previous incompatible Windows OS
> exists, XP will format that partition and wipe out the ther OS.  This is
> why you always have to install [Windows] XP first before installing
> other non-Windows Oses.
> 
> You should not care about whether Fedora exists in the primary or
> secondary disk.
> Instead, you want to install XP on the primary disk first, then install
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
