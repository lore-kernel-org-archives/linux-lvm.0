Return-Path: <josv@osp.nl>
Date: Fri, 26 Jan 2001 11:36:40 -0800
From: Jos Visser <josv@osp.nl>
Subject: Re: [linux-lvm] Keeping swap in the middle of the disk
Message-ID: <20010126113640.K3333@jadzia.collab.net>
References: <Pine.SOL.4.21.0101261903030.19267-100000@green.csi.cam.ac.uk>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.SOL.4.21.0101261903030.19267-100000@green.csi.cam.ac.uk>; from cdw22@hermes.cam.ac.uk on Fri, Jan 26, 2001 at 07:18:23PM +0000
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
Cc: lvm-devel@sistina.com, jakdaw@xmms.org

Hi Chris,

The setup you describe will work. Use pvcreate to make hda2, hda4, hdc2
and hdc2 into physical volumes, and group them into one volume group
(using vgcreate/vgextend as appropriate). Then create one big logical
volume in that vg. 

However, I must say that placing the swap area's in the middle of the
disk strikes me as somewhat overkill. I dare venture that this is almost
never necessary nowadays. Theoretically you are right, but the
things modern disk drives and operating systems do to minimise disk
I/O's make it kinda hard to predict what will be going on anyways.
Optimising swapping is optimising at the wrong level of the storage
hierarchy anyway. And, on another note, it might be more worthwhile to
make sure the ReiserFS journal is in the middle of the disk, since that
is most definitely a hot spot in the file system.

++Jos

And thus it came to pass that Chris Wilson wrote:
(on Fri, Jan 26, 2001 at 07:18:23PM +0000 to be exact)

> 
> Hi folks...
> 
>    I'll start off by saying that I'm new to LVM and have only started
> playing with it this afternoon. Unfortunatly, already I'm frustrated. Let
> me explain my situation:
> 
> I've just bought a pair of 46 gig UDMA 100 IDE disks and I'd like to
> stripe data across them for speed. I'd also like to have some swap
> space. Naturally I'd like this too to be fast, the linux kernel already
> stripes data across swap partitions with the same priority - so problem
> solved, one partition on each drive. Now the problem - in order to keep
> seek times down for the swap partitions, it's got to sit in the middle of
> the disk (so average distance from the disk-head to the swap partition is
> low).
> 
> Each disk is partitioned as follows:
> 
>   hda1     hda2      hda3     hda4
> <32 meg> <22 gig> <256 meg> <22 gig>
> 
> The two drives are hda and hdc. I'd hoped it might be possible to create a
> Logical Volume from hda2 and hda4, and one from hdc2 and hdc4. Then use
> them as Physical Volumes to create an 88gig Logical Volume for my reiser
> filesystem. It would appear that I cannot do this with LVM (pvcreate
> appears to check that the devices are not logical volumes).
> 
> My options after trying quite a few things and typing to 'roadrunner
> lewis@sistina.com' on IRC appear to be:
> - Move the swap partition to one end of the disk and live with higher seek
> times.
> - Not bother striping across the two disks
> - Stripe across all 4 partitions [sloooow...]
> - Use MD to do linear append of hda2, hda4 and hdc2, hdc4 then use LVM
> with the md0 and md1. [Not tried this - and all the different versions of
> MD look rather scary!]
> 
> Please someone tell me there's another way!!! Surely this isn't such an
> unreasonable request?
> 
> Cheers,
> 
> Chris Wilson
> 
> -- 
> jakdaw@xmms.org
> 
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm

-- 
What's real, is worth it...
