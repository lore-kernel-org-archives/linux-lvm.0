Return-Path: <jeffrey.b.layton@lmco.com>
Date: Tue, 20 Feb 2001 09:45:16 -0500
From: Jeffrey B Layton <jeffrey.b.layton@lmco.com>
Message-id: <3A9282FC.104A2BFF@lmco.com>
MIME-version: 1.0
Content-transfer-encoding: 7BIT
Subject: [linux-lvm] Startup Script trouble in RH6.2
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hello,

   OK, the newbie did a little reading and a little experimentation :)
The old FAQ I had didn't mention anything about startup scripts
for RH, but the "new" one does. So, that's where I started.
   I've got a generic RH6.2 box except for a 2.2.18 kernel with
LVM patches installed (and a few other patches). For
experimenting purposes, I've got one volume group (vg1) and
one logical volume (home_vg1). I created the lvm script and
the symlinks as indicated in the FAQ (a symlink from
/etc/rc.d/rc3.d/S20lvm to /etc/rc.d/init.d/lvm). I've also put a
line in my fstab that looks like:

/dev/vg1/home_vg1   /home   ext2   noauto,defaults   1 1

   In RH, before entering run level 3, in the rc.sysinit script,
it scans for filesystems that can be checked (fsck). However,
since it hasn't reached rc3.d, lvm has not activated the VGs
nor the LVs. What I did to get around this was to modify
rc.sysinit. I'd rather not do this. Does anyone have any
suggestions how to get around this? (I'd rather not manually
mount the filesystems in rc.local or something like that).
However, if the suggested alternative is to modify rc.sysinit,
where in the script should I put the lvm startyp? Should it be
after loading the modules, but before adding the RAID devices?

TIA,

Jeff Layton
