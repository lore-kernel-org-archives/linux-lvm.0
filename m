Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j0B1Wjr05211
	for <linux-lvm@redhat.com>; Mon, 10 Jan 2005 20:32:45 -0500
Received: from alpha.geneseo.edu (alpha.geneseo.edu [137.238.1.190])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j0B1WjpT014718
	for <linux-lvm@redhat.com>; Mon, 10 Jan 2005 20:32:45 -0500
Received: from [137.238.1.104] (helo=mars.geneseo.edu)
	by alpha.geneseo.edu with esmtp (Exim 4.34) id 1CoAto-0001Eh-5L
	for linux-lvm@redhat.com; Mon, 10 Jan 2005 20:32:45 -0500
Received: from mars.geneseo.edu (localhost.localdomain [127.0.0.1])
	by mars.geneseo.edu (8.12.9/8.12.5) with ESMTP id j0B1WcRh007595
	for <linux-lvm@redhat.com>; Mon, 10 Jan 2005 20:32:38 -0500
Received: from localhost (valites@localhost)
	by mars.geneseo.edu (8.12.9/8.12.9/Submit) with ESMTP id j0B1WcED007592
	for <linux-lvm@redhat.com>; Mon, 10 Jan 2005 20:32:38 -0500
Date: Mon, 10 Jan 2005 20:32:38 -0500 (EST)
From: "Mark T. Valites" <valites@geneseo.edu>
Subject: Re: [linux-lvm] Problem Upgrading from LVM1 to LVM2
In-Reply-To: <Pine.LNX.4.44.0501100946370.855-100000@mars.geneseo.edu>
Message-ID: <Pine.LNX.4.44.0501102021140.5277-100000@mars.geneseo.edu>
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

On Mon, 10 Jan 2005, Mark T. Valites wrote:

> > Make sure you're using a recent version of LVM2.
>
> I see 2.00.33 is the most current. I'm using the 2.00.24-1 package
> provided in Debian testing - is it worth compiling the latest?

I stuck with 2.00.24-1 for now, but can easily change and might if I get a
chance tomorrow at work.

> > You'll need to restore your metadata from a backup using vgcfgrestore -
> > but first you need to work out which is the correct backup to restore
> > from, then use either lvm1 or lvm2 vgcfgrestore depending which format
> > that backup is in.

I was feeling brave and booted my lvm1 kernel, did a vgcfgbackup, then
booted back into my LVM2/dev_mapper kernel and did an vgcfgrestore. I was
encouraged that pvscan and vgscan picked up my volume, but actually
attempting to mount it failed:

myth:~# vgcfgrestore -M 1 music_vg
  Restored volume group music_vg

myth:~# pvscan
  PV /dev/hdg    is in exported VG music_vg [111.75 GB / 0    free]
  PV /dev/hdf    is in exported VG music_vg [111.79 GB / 0    free]
  Total: 2 [223.54 GB] / in use: 2 [223.54 GB] / in no VG: 0 [0   ]

myth:~# vgscan
  Reading all physical volumes.  This may take a while...
  Found exported volume group "music_vg" using metadata type lvm1

myth:~# mount /data/
mount: /dev/music_vg/music_lv is not a valid block device

myth:~# mount /data/
mount: /dev/music_vg/music_lv is not a valid block device

myth:~# vgimport music_vg
  Volume group "music_vg" successfully imported

myth:~# grep data /etc/fstab
/dev/music_vg/music_lv  /data   reiserfs        defaults        0       0

myth:~# vgchange -ay music_vg
  device-mapper ioctl cmd 9 failed: Invalid argument
  Couldn't load device 'music_vg-music_lv'.
  1 logical volume(s) in volume group "music_vg" now active

myth:~# mount /data/
mount: wrong fs type, bad option, bad superblock on /dev/music_vg/music_lv,
       or too many mounted file systems
       (could this be the IDE device where you in fact use
       ide-scsi so that sr0 or sda or so is needed?)

The last one scares me, but it's so close...!

myth:~# file /dev/mapper/music_vg-music_lv
/dev/mapper/music_vg-music_lv: block special (254/0)

myth:~# ls -l !$
ls -l /dev/mapper/music_vg-music_lv
brw-------  1 root root 254, 0 Jan 10 19:43 /dev/mapper/music_vg-music_lv

Where to now?

-Mark

-- 
Mark T. Valites
Unix Systems Analyst
Computing & Information Technology
SUNY Geneseo
>--))> >--))>
