Date: Thu, 24 Aug 2000 21:00:20 +0200
From: Nils Juergens <nils@muon.de>
Subject: Re: [linux-lvm] LVM and sw RAID1
Message-ID: <20000824210020.A2073@guldukat.muon>
References: <20000823162957.B8398@gospelcom.net> <20000824111944.A974@guldukat.muon> <20000824083001.E7996@gospelcom.net>
Mime-Version: 1.0
In-Reply-To: <20000824083001.E7996@gospelcom.net>; from pcg@gospelcom.net on Thu, Aug 24, 2000 at 08:30:01AM -0400
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

On Thu, 24.08.00, Peter Green <pcg@gospelcom.net> wrote:
> 
> Could it be a LVM+RAIDn problem where n != 5?
> 

I'm not sure. I just tried raid1 on my setup and was able to use
pvcreate without (obvious) problems...

-----------------------------------------------------------------------
sisko:~# pvcreate -v /dev/md1
pvcreate -- locking logical volume manager
pvcreate -- checking physical volume name "/dev/md1"
pvcreate -- getting physical volume size
pvcreate -- checking partition type
pvcreate -- creating new physical volume
pvcreate -- setting up physical volume for /dev/md1 with 79746048 sectors
pvcreate -- writing physical volume data to disk "/dev/md1"
pvcreate -- physical volume "/dev/md1" successfully created
pvcreate -- unlocking logical volume manager
-----------------------------------------------------------------------

but then i find lvm reports the wrong size on that pv, it actually
reports the size to be the same as on the other pv (/dev/md0)

------------------------------------------------------------------------
sisko:~# pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- ACTIVE   PV "/dev/md0" of VG "raidvolumes" [38.02 GB / 16.02 GB free]
pvscan -- inactive PV "/dev/md1"  is in no VG  [38.03 GB]
pvscan -- total: 2 [76.05 GB] / in use: 1 [38.03 GB] / in no VG: 1 [38.03 GB]
------------------------------------------------------------------------

/dev/md1 should be about 1.2 GB, not 38 GB.

I now remeber i also had troubles with vgchange which had to do with
vg_check_online_all_pv(). I applied a _very_dirty_ hack to get around the
problem (which i think only works because i just use raid-devices as
pv's so use at own risk :)) )

-----------------------------------------------------------------------
--- vgchange.c.orig     Thu Aug 24 20:24:38 2000
+++ vgchange.c  Thu Jul 27 20:48:09 2000
@@ -343,7 +343,7 @@
             if ( opt_v > 0) printf ( "%s -- checking if all physical volumes "
                                      "of volume group \"%s\" are available\n",
                                      cmd, vg_name);
-            if ( ( ret = vg_check_online_all_pv ( vg, &pv_offl,
+            if ( ! ( ret = vg_check_online_all_pv ( vg, &pv_offl,
                                                   &pv_incons)) < 0) {
                if ( ret == -LVM_EPV_READ_PV_CREATE_NAME_FROM_KDEV_T) {
                      fprintf ( stderr, "%s -- ERROR: can't get name(s) of "
-----------------------------------------------------------------------

have fun,

Nils
-- 
 >   Nils Juergens  | nils@muon.de | icq 7090774   <
 >    Yes, Sir. Deathmatch _is_ a marketing term   <
 >        for "online brainstorming session"       <
