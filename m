Date: Thu, 27 Sep 2001 07:39:05 -0400
From: Jeff Layton <jeffrey.b.layton@lmco.com>
Subject: Re: [linux-lvm] Disk Died - Ideas?
Message-id: <3BB30FD9.853E39DA@lmco.com>
MIME-version: 1.0
Content-transfer-encoding: 7BIT
References: <3BB09C88.8234FDE4@lmco.com> <20010925110909.D392@turbolinux.com>
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
To: linux-lvm@sistina.com

Andreas Dilger wrote:

> On Sep 25, 2001  11:02 -0400, Jeff Layton wrote:
> >    Well, of course, the last disk gave up the ghost (lots of SCSI
> > errors, machine will not boot without unplugging drives from
> > machine). I'm pretty sure you can guess what I'm going to ask :)
> > Can I just unplug the last drive, bring the system up, don't run
> > fsck on lvol1, mount lvol1, and try to pull as much data as I can
> > off what's left of the filesystem? If this works, then I can just
> > redo the PVs, the VGs, and the LVOLs and recreate the filesystem
> > and move over what data I can recover.
>
> Two ways to do it.  I _think_ the latest release of EVMS will allow you
> to have partial LVs like this.  Are you sure that the LV was using space
> on the last PV?  If so it is less likely to work.
>
> The other alternative is to take the output from "pvdata -avP <dev>" on
> each remaining disk, and manually "dd" out the data from each disk.  If
> the LV was mostly consecutive PEs, then it will be easy, otherwise a lot
> of work (you may want to write a tool if so).
>
> PE 0 data starts at (pe_on_disk.start + pe_on_disk.size), and is in chunks
> of PE size.  The pvdata output will tell you which PE numbers belonged to
> your LV, so let's say on the first PV this LV starts at PE 10, you want:
>
> (pe_on_disk.start + pe_on_disk.size) + 10 * pe_size = byte offset of LV
>
> This will probably be at least a multiple of 1024, but maybe 4096 (larger
> will make for faster dd).  Then, for the number of consecutive PEs on disk:
>
> count=<number of consecutive IN ORDER PEs> * pe_size / 1024 = consecutive kB
>
> dd if=/dev/pv1 of=<backup> bs=1024 skip=<offset #1 in kB> count=<count #1>
>
> Do the same thing for the next set of consecutive PEs, with:
>
> dd if=/dev/pv1 of=<backup> bs=1024 skip=<offset #2 in kB> \
>         seek=<count #1> count=<count #2>
>
> dd if=/dev/pv1 of=<backup> bs=1024 skip=<offset #3 in kB> \
>         seek=<count #1 + count #2> count=<count #3>

Andreas,

   Sorry the late follow-up. I follow you so far (I think). The next step
after copy these "blocks" using dd to some backup device is to
rebuild the filesystem on the disks and then copy back the data
from the backup device using dd (just reverse the procedure).
Is this correct? (Sorry the novice question but I want to be sure I
have the correct steps before trying this).
   Thanks very much for your help!

Jeff


>
>
> >    Oh, by the way, this filesystem had no backups. The powers
> > to be claimed they were working on a backup solution for us,
> > but they didn't get one in place by the time this drive died. I know,
> > I know. I screamed very loudly, made lots of enemies internally,
> > but still no backups were ever done.
>
> Never trust anyone w.r.t backups.  I got burned this way as well.  Also
> make sure they have a RESTORE system, and not just a BACKUP system (i.e.
> make sure they can get your data back from tape).
>
> Cheers, Andreas
> --
> Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
>                  \  would they cancel out, leaving him still hungry?"
> http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
