Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.14])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id oB27YaFQ016411
	for <linux-lvm@redhat.com>; Thu, 2 Dec 2010 02:34:36 -0500
Received: from maude.comedia.it (mail.comedia.it [77.93.254.181])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oB27YQ4A022551
	for <linux-lvm@redhat.com>; Thu, 2 Dec 2010 02:34:26 -0500
Received: from localhost (localhost [127.0.0.1])
	by maude.comedia.it (Postfix) with ESMTP id B07B786F3B
	for <linux-lvm@redhat.com>; Thu,  2 Dec 2010 08:34:24 +0100 (CET)
Received: from maude.comedia.it ([127.0.0.1])
	by localhost (maude.comedia.it [127.0.0.1]) (amavisd-new, port 10025)
	with LMTP id f2-iVPjiW5hA for <linux-lvm@redhat.com>;
	Thu,  2 Dec 2010 08:34:19 +0100 (CET)
Date: Thu, 2 Dec 2010 08:34:19 +0100
From: Luca Berra <bluca@comedia.it>
Message-ID: <20101202073419.GC19274@maude.comedia.it>
References: <AANLkTim17Szku4aAzTkhv5kMR6dfu7qa7pwcy3YqYkxe@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <AANLkTim17Szku4aAzTkhv5kMR6dfu7qa7pwcy3YqYkxe@mail.gmail.com>
Subject: Re: [linux-lvm] LVM + LUKS - Can't mount encrypted LV
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Sat, Nov 13, 2010 at 03:21:35PM -0600, John Himpel wrote:
>I am running Fedora Rawhide as of 11/1/2010
>
>Steps taken:
>modprobe dm-crypt
>modprobe dm-mod
>cryptsetup luksOpen /dev/sdf6 F14    <-- /dev/sdf6 is the location of
>encrypted partition
>   Enter passphrase for /dev/sdf6:
>   <Entered passphrase here>
>vgscan
>  Reading all physical volumnes.  This may take a while...
>  Found volume group "vg_dubby" using metadata type lvm2
>vgchange -a y vg_dubby
>  3 logical volume(s) in volume group "vg_dubby" now active
>mount /dev/vg_dubby/lv_root /mnt/root
>  mount: unknown filesystem type 'crypto_LUKS'
>
a shot in the dark,
since everything seems correct until the mount command, i'd say it is
libblkid.

try
mount -t ext3 /dev/vg_dubby/lv_root /mnt/root
or
run blkid and note the output
remove /etc/blkid.tab (or /etc/blkid/blkid.tab)
run blkid and compare with output above
mount with the normal command
open a bz ticket :P

L.

-- 
Luca Berra -- bluca@comedia.it
