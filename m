Return-Path: <greck@unpunk.com>
From: Greck Cannon <greck@unpunk.com>
Date: Fri, 26 Jan 2001 21:16:05 -0500
Message-ID: <20010126211605.A19952@unpunk.com>
References: <20010126144047.A16544@unpunk.com> <Pine.SOL.4.21.0101262032440.19267-100000@green.csi.cam.ac.uk>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.SOL.4.21.0101262032440.19267-100000@green.csi.cam.ac.uk>; from cdw22@hermes.cam.ac.uk on Fri, Jan 26, 2001 at 09:13:08PM +0000
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
Cc: cdw22@hermes.cam.ac.uk

On Fri, Jan 26, 2001 at 09:13:08PM +0000, Chris Wilson wrote:
| 
| Hi Greck,
| 
| Where does this live? Kernel 2.4 is nowhere near stable on my SMP system
| (ethernet lasts a few hours before it gives up on IRQ's). There appears to
| be an alpha patch for 2.2.17 at 
| http://people.redhat.com/mingo/raid-patches/ and the kernel.org
| pub/linux/daemons/raid/alpha is old too - neither will patch a clean
| 2.2.18 distribution. 

Yeah, the old software RAID code in stock 2.2 is fairly evil... here's
a link to the announcement from mingo about a RAID 0.90 patch against
2.2.18:

http://marc.theaimsgroup.com/?l=linux-raid&m=97932083031328&w=2

[aside] I really like the mailing list archives here.

| 
| Let me know whether you have any success with that! If LVM is happy with
| /dev/md0 as a PV then that might be the best solution for me (I could
| probably do it all with MD but I like the idea of being able to add
| another couple of disks down the line and add them to the same
| mega-filesystem :) Course I'd have to get MD working first - what's wrong
| with the MD that's included in 2.2.18? I've seen mention of 'nasties' and
| 'bugs' but no specifics.

I'll keep you posted... there's no reason I should have any issues with
it.  I've actually had LVM + RAID 0.90 up and running several times on
other machines, but have inevitably run into one of the various problems
that ends in a panic, so I'm taking a vacation.

As far as "nasties" in the old RAID code, I think mostly it's just that:
OLD.  RAID 0.90 has been out for a very long time now.  Not exactly sure
why it hasn't been rolled into 2.2 yet, although I'm sure the linux-kernel
archives hold the answer.

--greck

-- 
to be bored, visit http://unpunk.com/~greck/
---------------------------
