Message-Id: <4.2.0.58.19990827105807.01065710@204.151.72.2>
Date: Fri, 27 Aug 1999 11:12:04 -0600
From: Mats Wichmann <mats@laplaza.org>
Subject: Re: [linux-lvm] Revised petition WAS: LVM in stock kernel!?
In-Reply-To: <Pine.LNX.3.96.990827113200.23961B-100000@aristotle.phaedo.
 com>
References: <199908270338.VAA23939@webber.adilger.net>
Mime-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com


>
>I've been able to succesully mirror lvs using the raid0 implmentation 
>along with LVM since I started using it.
>As for the snapshot backup, in a nutshell, you simply mark a stale mirror 
>(or break the mirror temporarily),
>and set ADSM to back up the logical volume directly (works fine, and 
>quickly)  Again, I've been using the Linux
>adsm client for almost 2 years now (pays to be an insider with IBM 
>hehehe), and once LVM came out I immediately
>began testing LV backups.  True, a data restore requires a complete 
>rebuild of the mirror, but the client will
>get it.  In some situations this is not optimal (e.g. if you have a 
>filesystem using the LV), but in the case
>of raw LV access (e.g. Sybase/Oracle/DB2), it works well.

This is not quite the same concept as snapshot filesystems, although you
can certainly use it for reliable backups (quiescent filesystems!).  With a 
spare
disk you can even use lv and a floating mirror disk to help back up several 
mirrored
devices - attach it to one mirror, sync up, detach and backup, attach to 
another
mirror, sync, etc.

Snapshots (at least the concept that Veritas has described to the world) 
let you
freeze the state of a filesystem as a read-only image while the filesystem 
itself
remains live, but without breaking any mirrors and leaving yourself 
temporarily in
an unmirrored state.  All you really need is to be able to freeze a pointer 
to the
metadata, and set the FS into a state such that no disk block can be modified,
instead it's always copied on write.  Requires suitable filesystem support, of
course.  Those extra blocks are released only when you're done with the 
snapshot.
Snapshots can live for as long as you want, and there can be several of them
active, as long as you have disk space that is.
