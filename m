Return-Path: <cdw22@hermes.cam.ac.uk>
Date: Fri, 26 Jan 2001 19:57:13 +0000 (GMT)
From: Chris Wilson <cdw22@hermes.cam.ac.uk>
Subject: Re: [linux-lvm] Keeping swap in the middle of the disk
In-Reply-To: <20010126113640.K3333@jadzia.collab.net>
Message-ID: <Pine.SOL.4.21.0101261953190.19267-100000@green.csi.cam.ac.uk>
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
To: Jos Visser <josv@osp.nl>
Cc: linux-lvm@sistina.com, jakdaw@xmms.org

On Fri, 26 Jan 2001, Jos Visser wrote:

> Hi Chris,
> 
> The setup you describe will work. Use pvcreate to make hda2, hda4, hdc2
> and hdc2 into physical volumes, and group them into one volume group
> (using vgcreate/vgextend as appropriate). Then create one big logical
> volume in that vg. 

If I do this then surely it either ends up striping across all four
partitions (so each disk would be continually seeking from one partition
to another) or not do any striping at all?

> However, I must say that placing the swap area's in the middle of the
> disk strikes me as somewhat overkill. I dare venture that this is almost

I guess so... it looks like I'm gonna end up with it at one end of the
disk.

> never necessary nowadays. Theoretically you are right, but the
> things modern disk drives and operating systems do to minimise disk
> I/O's make it kinda hard to predict what will be going on anyways.
> Optimising swapping is optimising at the wrong level of the storage
> hierarchy anyway. And, on another note, it might be more worthwhile to
> make sure the ReiserFS journal is in the middle of the disk, since that
> is most definitely a hot spot in the file system.
> 
> ++Jos
> 

Cheers,

Chris

-- 
jakdaw@xmms.org
