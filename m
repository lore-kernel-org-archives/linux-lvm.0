Return-Path: <greck@unpunk.com>
From: Greck Cannon <greck@unpunk.com>
Date: Fri, 26 Jan 2001 14:40:47 -0500
Message-ID: <20010126144047.A16544@unpunk.com>
References: <Pine.SOL.4.21.0101261903030.19267-100000@green.csi.cam.ac.uk>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.SOL.4.21.0101261903030.19267-100000@green.csi.cam.ac.uk>; from cdw22@hermes.cam.ac.uk on Fri, Jan 26, 2001 at 07:18:23PM +0000
Subject: [linux-lvm] Re: Keeping swap in the middle of the disk
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Jan 26, 2001 at 07:18:23PM +0000, Chris Wilson wrote:
| 
| - Use MD to do linear append of hda2, hda4 and hdc2, hdc4 then use LVM
| with the md0 and md1. [Not tried this - and all the different versions of
| MD look rather scary!]

This is exactly what I'm doing... well, the md part anyway.  md 0.90
(stock in 2.4, a patch in 2.2) is very robust, and easy to configure.
LVM on the other hand, is still kind of a mess of incompatible versions
and some serious bugs... I'm biding my time on production equipment.

   Device Boot    Start       End    Blocks   Id  System
/dev/sda1             1       532   4273258+  83  Linux
/dev/sda2           533       550    144585   83  Linux
/dev/sda3           551       583    265072+  82  Linux swap
/dev/sda4           584      1115   4273290   fd  Linux raid autodetect

   Device Boot    Start       End    Blocks   Id  System
/dev/sdb1             1       532   4273258+  83  Linux
/dev/sdb2           533       550    144585   83  Linux
/dev/sdb3           551       583    265072+  82  Linux swap
/dev/sdb4           584      1115   4273290   fd  Linux raid autodetect

I'm using matching priorities on the swap to stripe them, and sda4 and
sdb4 are RAID-0.  Eventually I'll bind sda1 and sdb1 as RAID-0 with md
as well, and give LVM /dev/md0 and /dev/md1 as PVs.

sda2 is / (just for ease of maintenance and repair) and I dunno WHAT I'm
going to do with sdb2 yet.  Maybe I'll trust md to RAID-0 sda2 and sdb2
together as /.

BTW, it's *really* nice to see someone else that still takes an interest
in what used to be some of the basics of system performance.

--greck

-- 
to be bored, visit http://unpunk.com/~greck/
---------------------------
