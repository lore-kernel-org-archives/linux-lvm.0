From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] recovering a bad physical volume
Message-ID: <20020719064133.GA1184@tykepenguin.com>
References: <20020717072144.GD11802@tykepenguin.com> <Pine.SOL.4.44.0207190109110.18116-100000@green.csi.cam.ac.uk>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.SOL.4.44.0207190109110.18116-100000@green.csi.cam.ac.uk>
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
Date: Fri Jul 19 01:41:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Jul 19, 2002 at 01:16:39AM +0100, Matthew Johnson wrote:
> On Wed, 17 Jul 2002, Patrick Caulfield wrote:
> 
> > Hmm, that message is a bit odd. Check that the partition sizes really do match
> > what LVM thinks they ought to be. vgcfgrestore -ll -n <vg> will show you this.
> >
> > If the sizes match up and the disk is OK there's no reason why the filesystem
> > shouldn't mount.
> >
> 
> OK, I ran that, and that PV has 756 extents, and 746*4096*1024 is
> 3170893824. From fdisk, (end sector - start sector)*1008*512 the partition
> is 3176054784, a difference of 5160960, or 10 cylinders. Now, I'm sure I
> copied the values for the partition sizes back in fine - but possibly I
> accidentally made that one 10 too large.
> 
> Now, on that drive I had <hde5 hde6 hde7> in the extended partition. I
> wanted to reduce hde5 in size, and insert hde8 between 5 & 6, then add
> that to the lvm. With fdisk, you have to delete, then re-add 5 as the
> smaller size. Unfortunately when you do that it renumbers 6 & 7 to 5 & 6.
> Hence to keep the correct partition numbers (I don't know how to change
> where a vg looks for its pvs for example) You have to delete them all, and
> add them in number, not location, order.
> 
> Since hde7 worked fine, I assume the end cylinder of hde6 is correct, and
> if I just move the start cylinder up 10, then that will then work. Is
> there a better way to do this than with fdisk? since I'll have to delete
> them all again and then create them, to keep the numbering correct.

Other than fdisk and parted I don't know of any other way of doing it. and parted
works in MB/GB rather than cylinders so I doubt you'd get the control you need
here.

Don't worry about the partition numbers being the same, LVM doesn't care what the
partitions are called, as long as it can find the PV metadata (which contains a
UUID)and a complete PV somewhere it should be able to activate the VG. LVM is
designed to cope with things like SCSI devices which rename themselves if you move
them around of the SCSI chain so IDE partitions that do the same will be no
problem.

-- 

patrick
