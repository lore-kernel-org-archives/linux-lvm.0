From: Wolfgang Weisselberg <weissel@netcologne.de>
Subject: Re: [linux-lvm] questions
Message-ID: <20011111205626.D3781@tiger.bigcats.invalid>
References: <20011106000923.B3409@bunuel.tii.matav.hu> <20011108021452.B5485@tiger.bigcats.invalid> <20011108091932.A12401@sistina.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20011108091932.A12401@sistina.com>; from mauelshagen@sistina.com on Thu, Nov 08, 2001 at 09:19:32AM +0100
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
Date: Sun Nov 11 14:28:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi, Heinz!

Heinz J . Mauelshagen (mauelshagen@sistina.com) wrote 75 lines:

> On Thu, Nov 08, 2001 at 02:14:52AM +0100, Wolfgang Weisselberg wrote:
> > Magosanyi Arpad (mag@bunuel.tii.matav.hu) wrote 14 lines:

> > > What would you check on disk related to snapshots? 

> > There shall be no snapshot of a snapshot.  (Yes, I have that
> > right here on my disk.  Can't remove the snapshot-of-snapshot
> > (segfault), can't remove the snapshot (under snapshot)).

> Wolfgang,

> with which LVM version do you have trouble removing snapshots?

As far as I can see/remember, all from 1.0 up to the current
(2001-11-11) CVS.  Specially at least:
lvm-1.0
lvm-1.0.1_rc4_2001_10_14        (CVS)
lvm-1.0.1_rc4_2001_10_23        (CVS)
lvm-1.0.1_rc4_2001_10_30        (CVS)
lvm-1.0.1_rc4_2001_11_11        (CVS)

> Which compiler did you use to compile LVM? With or without optimization?

SuSE's gcc-2.95.2-98 for their 7.0:
$ gcc -v
Reading specs from /usr/lib/gcc-lib/i486-suse-linux/2.95.2/specs
gcc version 2.95.2 19991024 (release)

Optimization is as the CVS says, i.e. off for newer ones.

The LVs were created over the time, but mostly before 0.9;
the system was converted to IOP11 as part of the upgrade to 1.0.

lvscan says something very... interesting:

|$ lvscan
|lvscan -- ACTIVE   Original "/dev/main_vg/amanda_holding_disk" [6.00 GB]
|lvscan -- ACTIVE            "/dev/main_vg/usr_src_packages" [1.22 GB]
|lvscan -- ACTIVE   Original "/dev/main_vg/usr" [3.00 GB]
|lvscan -- ACTIVE            "/dev/main_vg/home" [1.00 GB]
|[... snip a couple OK ones ...]
|lvscan -- ACTIVE            "/dev/main_vg/usr_local_games_Heroes3" [392.00 MB]
|lvscan -- inactive Original "/dev/main_vg/SCHROTT2" [51.19 MB] of /dev/main_vg/amanda_holding_disk
|lvscan -- ACTIVE   Original "/dev/main_vg/SCHROTT4" [51.19 MB] of /dev/main_vg/amanda_holding_disk
|lvscan -- ACTIVE   Original "/dev/main_vg/var_lib_amanda" [300.00 MB]
|lvscan -- inactive Snapshot "/dev/main_vg/SCHROTT1" [19.69 MB] of /dev/main_vg/SCHROTT2
|lvscan -- ACTIVE   Snapshot "/dev/main_vg/SCHROTT3" [287.44 MB] of /dev/main_vg/SCHROTT4
|lvscan -- 23 logical volumes with 23.82 GB total in 1 volume group
|lvscan -- 21 active / 2 inactive logical volumes

The /dev/main_vg/SCHROTT[1-4] are the failed snapshots.
At least one of them was against /dev/main_vg/usr, but they
became snapped against /dev/main_vg/amanda_holding_disk.

SCHROTT[13] segfault on lvremove:
|lvremove -- do you really want to remove "/dev/main_vg/SCHROTT1"? [y/n]: y
|<1> lv_release -- CALLED with /dev/main_vg/SCHROTT1
|<22> lv_check_name -- CALLED with lv_name: "/dev/main_vg/SCHROTT1"
|<333> lvm_check_chars -- CALLED with name: "/dev/main_vg/SCHROTT1"
|<333> lvm_check_chars -- LEAVING with ret: 0
|<333> vg_check_name -- CALLED with VG: main_vg
|<4444> lvm_check_chars -- CALLED with name: "main_vg"
|<4444> lvm_check_chars -- LEAVING with ret: 0
|<333> vg_check_name -- LEAVING with ret: 0
|<22> lv_check_name -- LEAVING with ret: 0
|<1> lv_release -- after search for /dev/main_vg/SCHROTT1
|<1> lv_release -- /dev/main_vg/SCHROTT1 found
|Segmentation fault

and SCHROTT[24] won't allow to be removed.

At the moment it's even worse: 
lvm-1.0.1_rc4_2001_11_11's vgscan is unable to scan the VGs
completely, it sees about 1/3, then segfaults, but the (old)
1.0 executable (same library!) works.  Funny enough, once the
system is up & running, it works...

> > Does the snapshot point to the correct device?  (Happened to
> > me, too.  Usually after an (unrelated?) crash.  No idea how
> > to check -- but all Devices Under Snapshot shall have at
> > least 1 snapshot.)

> Do you mean, that a snapshot didn't refer to the correct device after
> a crash any longer?

Bingo.  Exactly that.
Then I was able to rename them, but not able to remove them.
Sometimes (seldom) I could, but that was not repeatable.

Note that these crashes were most likely *not* the fault of lvm,
and did not occur while an lvm-operation was running.

Do you need a dump/dd/whatever?  Just tell me, I'll try my
best to provide you with the data.

> > Does the persistent snapshot-map look like it could work on
> > that device claims to be against? (bigger than the device
> > in question?)

> ?

Assume you have a snapshot of 1GB.  Assume the claimed original
is 400M.  Since you cannot produce a snapshot larger than the
original, this looks like an invalid snapshot, doesn't it?

> > Ability to turn persistent snapshots into non-persistent ones
> > (cleaned up after reboot) -- so that rogue ones can be
> > removed during a reboot.

> Well, this wouldn't make a difference because just the copy on write
> exception tables would be removed but the rest of the snapshots metadata
> where still in place making it most likely still impossible to remove it
> in case we have a real bug related here.

True enough.  Probably we need an interface to the metadata,
so the user can (at his own risk!) change them.  Sorta like
fdisk or debugfs.

-Wolfgang
