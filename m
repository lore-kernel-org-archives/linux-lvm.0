Date: Sun, 1 Oct 2000 10:01:51 +0000
From: Heinz J. Mauelshagen <Heinz.Mauelshagen@t-online.de>
Subject: Re: [linux-lvm] need help to recover my system
Message-ID: <20001001100151.A3571@srv.t-online.de>
Reply-To: Mauelshagen@Sistina.com
References: <39D6A94C.3C40B982@attglobal.net>
Mime-Version: 1.0
In-Reply-To: <39D6A94C.3C40B982@attglobal.net>; from seawolf@attglobal.net on Sat, Sep 30, 2000 at 11:02:36PM -0400
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Les Hazelton <seawolf@attglobal.net>
Cc: linux-lvm@msede.com

On Sat, Sep 30, 2000 at 11:02:36PM -0400, Les Hazelton wrote:
> I had a Mandrake 7.1 system running the 2.2.17 kernel with LVM and
> reiserfs patches applied.  I have a 15Gb partition on /dev/hdc5 which
> was one large PV. It supports one VG which has the logical volumes for
> /usr, /home, /var, etc... Everything except /boot and / which were on
> the hda drive as plain ext2 file systems.
> 
> I decided to move the root partition "/" to a logical volume on hdc5 and
> all was going well until I deleted it from the ext2 system on hda6.

How did you do that?
Did you create an inital ram disk to load the lvm driver and activate
the volume group?
Otherwise you can't access your volume group(s) anyway from the /boot
booted kernel.

> So
> now I have a perfectly good Linux system contained on the hdc5 PV which
> I can't access.
> 
> I have test system (Mandrake 7.2-b) on the hda drive.  It has the
> 2.4.0-0.22 kernel distributed my Mandrake and I have been attempting to
> recover using that system.  The problem is I keep getting these errors:
> 
> ------------------------------------------------------------------------------
> pvscan -- reading all physical volumes (this may take a while...)
> pvscan -- ERROR "pv_read_all_pv(): lvm_dir_cache" reading physical
> volumes

This error means, that no (compatible) entries could be found either
in /proc/partitions or, if /proc/partitions doesn't exist, in /dev.

Please check that these sources are valid on your Mandrake 7.2-b test system
and retry.

>  
> [root@farpt1 /root]# vgscan -v
> vgscan -- removing "/etc/lvmtab" and "/etc/lvmtab.d"
> vgscan -- reading all physical volumes (this may take a while...)
> vgscan -- no volume groups found
> -------------------------------------------------------------------------------
> 
> I was going to try a pvcreate for /dev/hdc5  but thought it would wipe
> the partition clean and I don't want to start over if there is *any*
> hope of recovering it.
> 
> Please, if anyone knows a way to recover this volume,  I would be
> extremely grateful for the help.
> 
> Les Hazelton

-- 

Regards,
Heinz      -- The LVM guy --

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Bartningstr. 12
                                                  64289 Darmstadt
                                                  Germany
Mauelshagen@Sistina.com                           +49 6151 7103 86
                                                       FAX 7103 96
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
