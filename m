Return-Path: <cdw22@hermes.cam.ac.uk>
Date: Fri, 26 Jan 2001 21:13:08 +0000 (GMT)
From: Chris Wilson <cdw22@hermes.cam.ac.uk>
Subject: Re: [linux-lvm] Re: Keeping swap in the middle of the disk
In-Reply-To: <20010126144047.A16544@unpunk.com>
Message-ID: <Pine.SOL.4.21.0101262032440.19267-100000@green.csi.cam.ac.uk>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com
Cc: Greck Cannon <greck@unpunk.com>

Hi Greck,

On Fri, 26 Jan 2001, Greck Cannon wrote:

> On Fri, Jan 26, 2001 at 07:18:23PM +0000, Chris Wilson wrote:
> | 
> | - Use MD to do linear append of hda2, hda4 and hdc2, hdc4 then use LVM
> | with the md0 and md1. [Not tried this - and all the different versions of
> | MD look rather scary!]
> 
> This is exactly what I'm doing... well, the md part anyway.  md 0.90
> (stock in 2.4, a patch in 2.2) is very robust, and easy to configure.

Where does this live? Kernel 2.4 is nowhere near stable on my SMP system
(ethernet lasts a few hours before it gives up on IRQ's). There appears to
be an alpha patch for 2.2.17 at 
http://people.redhat.com/mingo/raid-patches/ and the kernel.org
pub/linux/daemons/raid/alpha is old too - neither will patch a clean
2.2.18 distribution. 

> I'm using matching priorities on the swap to stripe them, and sda4 and
> sdb4 are RAID-0.  Eventually I'll bind sda1 and sdb1 as RAID-0 with md
> as well, and give LVM /dev/md0 and /dev/md1 as PVs.

Let me know whether you have any success with that! If LVM is happy with
/dev/md0 as a PV then that might be the best solution for me (I could
probably do it all with MD but I like the idea of being able to add
another couple of disks down the line and add them to the same
mega-filesystem :) Course I'd have to get MD working first - what's wrong
with the MD that's included in 2.2.18? I've seen mention of 'nasties' and
'bugs' but no specifics.

> sda2 is / (just for ease of maintenance and repair) and I dunno WHAT I'm
> going to do with sdb2 yet.  Maybe I'll trust md to RAID-0 sda2 and sdb2
> together as /.
> 
> BTW, it's *really* nice to see someone else that still takes an interest
> in what used to be some of the basics of system performance.

:)

Chris

-- 
jakdaw@xmms.org
