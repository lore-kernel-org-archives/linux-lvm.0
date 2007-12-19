Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id lBJA0AUe011753
	for <linux-lvm@redhat.com>; Wed, 19 Dec 2007 05:00:10 -0500
Received: from anchor-post-33.mail.demon.net (anchor-post-33.mail.demon.net
	[194.217.242.91])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id lBJ9xns4015667
	for <linux-lvm@redhat.com>; Wed, 19 Dec 2007 04:59:49 -0500
Received: from dyn-62-56-118-152.dslaccess.co.uk ([62.56.118.152]
	helo=amd64.lan)
	by anchor-post-33.mail.demon.net with esmtpa (AUTH miasmic)
	(Exim 4.67) id 1J4viO-000MGb-Bs
	for linux-lvm@redhat.com; Wed, 19 Dec 2007 09:59:48 +0000
Subject: RE: [linux-lvm] won't dual boot: 2 disks and LVM
From: cs <cs@networkingnewsletter.org.uk>
In-Reply-To: <7C6C00FDABF70949A0A5D4DD8A4DC2170474A356@CORPUSMX20A.corp.emc.com>
References: <1197988092.29413.77.camel@veri.phy.umist.ac.uk>
	<7C6C00FDABF70949A0A5D4DD8A4DC2170474A353@CORPUSMX20A.corp.emc.com>
	<1198010286.6637.10.camel@amd64.local>
	<7C6C00FDABF70949A0A5D4DD8A4DC2170474A356@CORPUSMX20A.corp.emc.com>
Date: Wed, 19 Dec 2007 09:59:28 +0000
Message-Id: <1198058368.3859.10.camel@amd64.local>
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

On Tue, 2007-12-18 at 16:52 -0500, pham_cuong@emc.com wrote:
> There is a difference between changing the boot order from the BIOS vs.
> [physically] removing the master HD.  Here's why:
> 
> In the former case, the BIOS boot order is at the lower-level (earlier)
> and it will take effect before the boot loader exists in each drive.
> Depending on your BIOS, the boot order can be fixed or priority-based
> (most BIOSes support priority-based boot path).  Fixed order means that
> only the specified boot order is used.  Priority-based boot order means
> that the system will attempt the first boot path on the list, if failed,
> or timed out, goes to the 2nd boot path.  BIOS boot order only changes
> the order of which path to boot from first. It has no control over the
> designation of which drive is detected and designated as drive 0 or
> drive 1.  Boot.ini has this level of granularity, and more... Down to
> the partition level (one below the disk level).
> 
> The act of removing the Master HD changes the HD designation at the
> hardware level, and this in turn may affect how the system boots (for
> non-SCSI only). Specifically, for your case the XP's boot.ini may
> designate that XP is to be booted from the first disk (connected to
> PR1), first paritition, and you've physically connect this drive as a
> secondary/slave (SL) drive so XP will never boot when XP's boot loader
> reads the boot.ini.  Upon either moving this drive to the primary (PR1)
> connection, or change the boot.ini, the drive order for this drive is
> changed from disk1 to disk0, so XP would see this drive and be able to
> boot from it.  As you can see, in this case, changing the BIOS boot
> order is inconsequential.
> 
> Regards,
> 
> Confucius

useful stuff but I'm still unsure why if I change the order in BIOS then
(when I had it working a bit) it would start the XP boot sequence (and
not the GRUB from master) but then hang indefinitely...
