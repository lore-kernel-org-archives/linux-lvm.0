Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m420llnF023850
	for <linux-lvm@redhat.com>; Thu, 1 May 2008 20:47:47 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m420lbQe030769
	for <linux-lvm@redhat.com>; Thu, 1 May 2008 20:47:37 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.13.6/8.13.6) with ESMTP id m420lWCe011579
	for <linux-lvm@redhat.com>; Thu, 1 May 2008 20:47:32 -0400
Received: from localhost (localhost [127.0.0.1])
	by bmsred.bmsi.com (8.13.5/8.13.6) with ESMTP id m420lUdB026798
	for <linux-lvm@redhat.com>; Thu, 1 May 2008 20:47:32 -0400
Date: Thu, 1 May 2008 20:47:30 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] F7 will not boot after running backup w/snapshot
In-Reply-To: <481A2947.9070907@Media-Brokers.com>
Message-ID: <Pine.LNX.4.44.0805012041160.26700-100000@bmsred.bmsi.com>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

ZZZZOn Thu, 1 May 2008, Charles Marcus wrote:

> In Gerry's scenario here, if the snapshot volume had NOT been on a ram 
> disk, would he have had the problem he had or not?

Here is the snip from Fedora/RHEL for activating the VG containing
the root filesystem (note: kernel modules and lvm command are contained in
initrd filesystem, and do not depend on /lib/modules/...):

...
echo "Loading dm-mod.ko module"
insmod /lib/dm-mod.ko
echo "Loading dm-mirror.ko module"
insmod /lib/dm-mirror.ko
echo "Loading dm-zero.ko module"
insmod /lib/dm-zero.ko
echo "Loading dm-snapshot.ko module"
insmod /lib/dm-snapshot.ko
echo Making device-mapper control node
mkdmnod
mkblkdevs
echo Scanning logical volumes
lvm vgscan --ignorelockingfailure
echo Activating logical volumes
lvm vgchange -ay --ignorelockingfailure  rootvg
...

This will fail if any of the physical volumes are missing.  More logic
in initrd is required to boot with missing PVs.

So yes, a ram disk is guaranteed to be missing on reboot, and thus to 
fail in the RH/Fedora distros.  There is no problem taking snapshots
of the root fs otherwise.  If there is a robust way to reduce 
missing PVs automagically in the above script from initrd, Fedora could
use the contribution.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
