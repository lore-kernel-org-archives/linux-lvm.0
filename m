Date: Fri, 27 Aug 1999 15:18:54 -0400 (EDT)
From: "S. Ryan Quick" <ryan@phaedo.com>
Subject: Re: [linux-lvm] Revised petition WAS: LVM in stock kernel!?
In-Reply-To: <4.2.0.58.19990827105807.01065710@204.151.72.2>
Message-ID: <Pine.LNX.3.96.990827150707.23961E-100000@aristotle.phaedo.com>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mats Wichmann <mats@laplaza.org>
Cc: linux-lvm@msede.com

-----BEGIN PGP SIGNED MESSAGE-----

On Fri, 27 Aug 1999, Mats Wichmann wrote:

> This is not quite the same concept as snapshot filesystems, although you
> can certainly use it for reliable backups (quiescent filesystems!).  With a 
> spare
> disk you can even use lv and a floating mirror disk to help back up several 
> mirrored
> devices - attach it to one mirror, sync up, detach and backup, attach to 
> another
> mirror, sync, etc.


Now you're with me . . .


> 
> Snapshots (at least the concept that Veritas has described to the world) 
> let you
> freeze the state of a filesystem as a read-only image while the filesystem 
> itself
> remains live, but without breaking any mirrors and leaving yourself 
> temporarily in
> an unmirrored state.  All you really need is to be able to freeze a pointer 
> to the
> metadata, and set the FS into a state such that no disk block can be modified,
> instead it's always copied on write.  Requires suitable filesystem support, of
> course.  Those extra blocks are released only when you're done with the 
> snapshot.
> Snapshots can live for as long as you want, and there can be several of them
> active, as long as you have disk space that is.


Yeah, ever since Iposted that first message I feared a vxfs backlash when it wasn't what I intended.
There are some problems with Veritas concept of snapshots anyway, one of which is that on a vxfs
filesystem on a volume with dirty region logging, then snapping a mirror does not really leave the
new snap fs as "clean" as you might want it to.  This has to dowith the write ordering to the dirty
region log on the inital fs... you'l find on large filesystems (>100GB or so that I've noticed anyway), 
that active data on the primary
volume will cause so much writing to the volume log that the snap extent information hardly gets consulted
and the end result can be a snapshot backup of the active filesystem (since vxfs snapshot consults a changelog as
it performs the backup), not the snapped filesystem.  I hope
to avoid this problem in the Linux LVM by having some sort of volume log write ordering, or maybe including
the (for lack of a better term) dirty-region log as a mirror on the snap volume.  This is different from
the vxfs model mainly because my intention is to be able to essentially create snap mirrors of LVs
as most of the data I work with doesn't exist on filesystems anyway.

> 
> 

%                                                       %%%%%%%%%%
%%           S. Ryan Quick                               %%%%%%%%%
%%%           UNIX Systems Engineer                       %%%%%%%%
%%%%           Phaedo Consulting, Inc. -- Exec VP          %%%%%%%
%%%%%                                                       %%%%%%
%%%%%%         www.phaedo.com/ryan/  ryan@phaedo.com         %%%%%
%%%%%%%       ------------ PGP FingerPrint -------------      %%%%
%%%%%%%%  CF 19 6B BA 31 8E B8 8E  20 DF 4F 2B 2E 69 81 F5     %%%
%%%%%%%%%     ------------------------------------------        %%
%%%%%%%%%%                                                       %

-----BEGIN PGP SIGNATURE-----
Version: 2.6.3a
Charset: noconv

iQCVAwUBN8bkoPUYDAQiV+tNAQE7xAP/VNGd6GEIdMMFdx5FxxwxRe0Lm6QOnGOV
lj5/wnbx+zCf0XaVfavmZhWDAhmzXmYHCBcWx53PEMRI1sa3Pn/VONhQQtjW5h8+
ZkY7Qf2IZc/b+C9Z7abFa9OvI3Ub28HJkK67lCzfzG4Tsyuk2FS2dHX1ojdttEeb
mgC1DpeOByk=
=AMPT
-----END PGP SIGNATURE-----
