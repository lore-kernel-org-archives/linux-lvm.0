Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i6SFwAa18582
	for <linux-lvm@redhat.com>; Wed, 28 Jul 2004 11:58:10 -0400
Received: from mochilla.bms.com (usintout01.bms.com [165.89.129.231])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i6SFw9e1005711
	for <linux-lvm@redhat.com>; Wed, 28 Jul 2004 11:58:09 -0400
Received: from meusmsg05 ([127.0.0.1])
	by mochilla.bms.com (iPlanet Messaging Server 5.2 HotFix 1.21 (built
	Sep 8 2003)) with ESMTP id <0I1K00L0FKBFCP@mochilla.bms.com> for
	linux-lvm@redhat.com; Wed, 28 Jul 2004 15:57:15 +0000 (GMT)
Received: from bms.com (A069890.hpw.stf.bms.com [140.176.175.174])
	by meusmsg05.net.bms.com
	(iPlanet Messaging Server 5.2 HotFix 1.21 (built Sep  8 2003))
	with ESMTPA id <0I1K0009DKBFF8@meusmsg05.net.bms.com> for
	linux-lvm@redhat.com; Wed, 28 Jul 2004 15:57:15 +0000 (GMT)
Date: Wed, 28 Jul 2004 11:57:09 -0400
From: Anu Matthew <anu.matthew@bms.com>
In-reply-to: <20040727231026.D639874913@hormel.redhat.com>
Message-id: <4107CCD5.5010405@bms.com>
MIME-version: 1.0
Content-transfer-encoding: 7BIT
References: <20040727231026.D639874913@hormel.redhat.com>
Subject: [linux-lvm] Re: linux-lvm Digest, Vol 5, Issue 12
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; format="flowed"; charset="us-ascii"
To: linux-lvm@redhat.com

Wayne,

1) I guess it is sane.

2) Look at rc.sysinit. What you want to do is to bring the raiddevices 
before the volume groups are activated. Assuming you are running AS3.0 
and have mdadm installed, add a line like: (Around line no. 328).

# LVM initialization
if [ -f /etc/lvmtab ]; then
    [ -e /proc/lvm ] || modprobe lvm-mod > /dev/null 2>&1
    if [ -e /proc/lvm -a -x /sbin/vgchange ]; then
        action $"Special raiddevice startup for `hostname` " mdadm 
--assemble --scan
        action $"Setting up Logical Volume Management:" /sbin/vgscan && 
/sbin/vgchange -a y
    fi
fi

Move onto mdadm, raidtools are deprecated, unless you are on RHEL 2.1

--HTH
./AM

linux-lvm-request@redhat.com wrote:

>Send linux-lvm mailing list submissions to
>	linux-lvm@redhat.com
>
>To subscribe or unsubscribe via the World Wide Web, visit
>	https://www.redhat.com/mailman/listinfo/linux-lvm
>or, via email, send a message with subject or body 'help' to
>	linux-lvm-request@redhat.com
>
>You can reach the person managing the list at
>	linux-lvm-owner@redhat.com
>
>When replying, please edit your Subject line so it is more specific
>than "Re: Contents of linux-lvm digest..."
>
>
>Today's Topics:
>
>   1. Sanity check - Raid 0+1 solution (Wayne Pascoe)
>   2. vgexports-Parameters. (Ronald Laszlob)
>   3. Re: LVM2 and RAID 1 not working on Fedora Core 2 (Zachary Hamm)
>   4. Device mapper error ioctl cmd 9. What is this? (Nathan Richardson)
>   5. Change PV size? (Michael Bellears)
>   6. Re: Change PV size? (Luca Berra)
>   7. RE: Change PV size? (Michael Bellears)
>   8. Re: LVM2 and RAID 1 not working on Fedora Core 2
>      (Patrick Caulfield)
>   9. pvscan fails  (Frank Mohr)
>
>
>----------------------------------------------------------------------
>
>Message: 1
>Date: Fri, 23 Jul 2004 14:48:08 +0100 (BST)
>From: "Wayne Pascoe" <lists-june2004@penguinpowered.org>
>Subject: [linux-lvm] Sanity check - Raid 0+1 solution
>To: linux-lvm@redhat.com
>Message-ID:
>	<9644.195.50.100.20.1090590488.squirrel@webmail.penguinpowered.org>
>Content-Type: text/plain;charset=iso-8859-1
>
>Hi all,
>
>I think I've found a solution that will provide for our Raid 0+1
>needs, and I'd just like to bounce it off of people for a sanity
>check... I would like to explore EVMS, but Red Hat will not be
>including it in the current version of AS (3). The same goes for LVM2
>I believe. So I need to try and make this work with LVM1, or admit I
>was wrong about this and go the Veritas route. I really don't want to
>admit I was wrong just yet :D
>
>I've started with a fresh RHEL AS installation (thanks to pxeboot and
>kickstart, this is easy enough). My base system is all installed on 1
>disk (/dev/sda), leaving me 5 to play with.
>
>I've then done the following:
>
>Created a 10GB partition on sdb, sdc, sdd and sde with a type of fd
>(Linux raid autodetect). I've then created two RAID-1 devices in
>/etc/raidtab, and used mkraid to create the raid devices.
>
>Next, I've used
>vgscan
>pvcreate /dev/md0 /dev/md1
>vgcreate vol01 /dev/md0 /dev/md1
>lvcreate -i 2 -I 64 -n data01 -L6G vol01
>mkfs.ext3 /dev/vol01/data01
>mkdir /data01
>mount /dev/vol01/data01 /data01
>
>I then get a usable filesystem that I can copy things to. Next, I
>unmounted the filesystem, and expanded it to 19G. When I remounted the
>filesystem, it still looks healthy. I then attempted to copy 24GB of
>data to the disk, and it barfed at 19GB, as expected. All files that
>_were_ successfully copied looked healthy and checksums matched the
>source files. So it looks like the expanded volume worked.
>
>I then added /dev/vol01/data01  /data01  ext3   defaults  0 0 to
>/etc/fstab and rebooted. My LVM volume was still there at boot time.
>The only problem is that after the reboot, /proc/mdstat doesn't appear
>to have my raid devices listed. I've seen this before, where if they
>are not mounted at boot time, they do not appear in /proc/mdstat. If I
>manually raidstart /dev/md0; raidstart /dev/md1, then they appear in
>/proc/mdstat.
>
>So where I am now :)
>
>1. Is this sane ? I figure that I can loose any 1 disk, and my volumes
>will still be ok. Is that correct ?
>
>2. Can anyone advise how to bring the raid devices up at boot time,
>since mounting the volume that is made up of these devices does not
>appear to do the trick.
>
>The biggest downside I can see to this solution is that I _HAVE_ to
>assign the whole disk to the mirror at the beginning of my process.
>Unlike with VxVM, I can't have part of a disk mirrored, and another
>part of that disk part of a striped array, and still maintain the
>ability to resize the mirrored part of the disk.
>
>Having said that, disk is a lot cheaper than VxVM licences, and I
>should be able to justify this solution.
>
>Can anyone confirm, deny, or change my mind on these points ?
>
>  
>
