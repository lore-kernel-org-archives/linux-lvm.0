Return-Path: <cdw22@hermes.cam.ac.uk>
Date: Fri, 26 Jan 2001 19:18:23 +0000 (GMT)
From: Chris Wilson <cdw22@hermes.cam.ac.uk>
Message-ID: <Pine.SOL.4.21.0101261903030.19267-100000@green.csi.cam.ac.uk>
MIME-Version: 1.0
Subject: [linux-lvm] Keeping swap in the middle of the disk
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
To: lvm-devel@sistina.com, linux-lvm@sistina.com

Hi folks...

   I'll start off by saying that I'm new to LVM and have only started
playing with it this afternoon. Unfortunatly, already I'm frustrated. Let
me explain my situation:

I've just bought a pair of 46 gig UDMA 100 IDE disks and I'd like to
stripe data across them for speed. I'd also like to have some swap
space. Naturally I'd like this too to be fast, the linux kernel already
stripes data across swap partitions with the same priority - so problem
solved, one partition on each drive. Now the problem - in order to keep
seek times down for the swap partitions, it's got to sit in the middle of
the disk (so average distance from the disk-head to the swap partition is
low).

Each disk is partitioned as follows:

  hda1     hda2      hda3     hda4
<32 meg> <22 gig> <256 meg> <22 gig>

The two drives are hda and hdc. I'd hoped it might be possible to create a
Logical Volume from hda2 and hda4, and one from hdc2 and hdc4. Then use
them as Physical Volumes to create an 88gig Logical Volume for my reiser
filesystem. It would appear that I cannot do this with LVM (pvcreate
appears to check that the devices are not logical volumes).

My options after trying quite a few things and typing to 'roadrunner
lewis@sistina.com' on IRC appear to be:
- Move the swap partition to one end of the disk and live with higher seek
times.
- Not bother striping across the two disks
- Stripe across all 4 partitions [sloooow...]
- Use MD to do linear append of hda2, hda4 and hdc2, hdc4 then use LVM
with the md0 and md1. [Not tried this - and all the different versions of
MD look rather scary!]

Please someone tell me there's another way!!! Surely this isn't such an
unreasonable request?

Cheers,

Chris Wilson

-- 
jakdaw@xmms.org
