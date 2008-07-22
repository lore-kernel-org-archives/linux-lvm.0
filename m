Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m6MGMGTf003697
	for <linux-lvm@redhat.com>; Tue, 22 Jul 2008 12:22:16 -0400
Received: from py-out-1112.google.com (py-out-1112.google.com [64.233.166.177])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m6MGM6S9026091
	for <linux-lvm@redhat.com>; Tue, 22 Jul 2008 12:22:06 -0400
Received: by py-out-1112.google.com with SMTP id a29so927418pyi.0
	for <linux-lvm@redhat.com>; Tue, 22 Jul 2008 09:22:06 -0700 (PDT)
Message-ID: <b072968d0807220922s4187314es136605041c26c9ae@mail.gmail.com>
Date: Tue, 22 Jul 2008 18:22:05 +0200
From: "David Robinson" <zxvdr.au@gmail.com>
Subject: Re: [linux-lvm] Wisdom of multiple disks in one VG
In-Reply-To: <1216674096.7888.5.camel@corn.betterworld.us>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <1216674096.7888.5.camel@corn.betterworld.us>
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

On Mon, Jul 21, 2008 at 11:01 PM, Ross Boylan <ross@biostat.ucsf.edu> wrote:
> If I have a Volume Group with partitions from 2 different physical disks
> on it, and I confine my logical volumes to particular physical disks,
> will I be able to recover the logical volumes on disk 1 if disk 2 fails?

If you ensure that a LV doesn't span PVs then a failure of one PV
would leave the remaining LV intact. You would need to be very careful
to ensure that a LV doesn't span multiple PVs thou.

You can recover the LV on the working disk by activating the VG in
partial mode (its usually the -P option. iirc "vgchange -ay -P"), or
even remove the missing PV (vgchange --removemissing, or something
like that). If you activate the VG in partial mode then any read
requests to missing extents will return zeros (or errors?). The man
pages describe this further. Note that an inconsistent VG will not be
activated automatically, you will need to manually activate it with
-P.

If your disks are likely to fail and you are concered about this then
you are probably better off keeping separate VGs. If you need LVs
larger than what a single disk can provide and therefore need to span
disks then obviously they need to be in the same VG.

If the root filesystem is on a LV (which is the default for
Fedora/RHEL) I wouldn't recommend having two PVs in its VG. This is
simply because if one PV dies then your VG will be inconsistent
(missing a PV) and your system won't boot correctly (because the VG
won't be activated at boot time). Its not a good idea to add SAN and
local storage to the same VG for this reason.

> I have several disks, but they are all different sizes and so don't seem
> like good candidates for a scheme with redundancy (e.g., RAID 5).
> Because of my concern that combining disks into the same volume group
> would mean a failure of 1 would effectively wipe them all out, I have so
> far used separate VG's for each disk.  However, this is awkward.

You could add them all into one VG if you wish, but this would be even
more awkward - you would need to ensure that each LV resides on a
single PV.

> So, my general question is what the best approach would be in this
> situation, multiple disks of much different sizes.  The existing disks
> all have separate VG's on them.  The biggest disk is empty so far.

Do you need a single large filesystem that spans disks? Do you have a
proper disaster recovery plan (eg, backups)?

--Dave
