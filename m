From: Bradley M Alexander <storm@tux.org>
Subject: [linux-lvm] Repairing LVM installations 
Message-ID: <20021030173134.GA29676@sonsofthunder.yi.org>
Mime-Version: 1.0
Content-Disposition: inline
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
Date: Wed Oct 30 11:32:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Oct 28, 2002 at 08:02:24AM -0500, Bradley Alexander wrote:

> > > There might be a slight chance to get it back, if you have an LVM
> > > metadata backup at hand (/etc/lvmconf/vg00.conf) and use vgcfgrestore
> > > to restore it to the physical volume.
> > 
> > I tried this and when I tried listing the file, I got the same
> > consistency error message:
> > 
> > [defiant /etc/lvmconf]# vgcfgrestore -f /etc/lvmconf/vg00.conf.2.old -l
> > -n vg00
> > vgcfgrestore -- ERROR "vg_cfgrestore(): pv_check_consistency" restoring
> > volume group "vg00"
> 
> "pvcreate -ff ..." on the PV first.

Okay, I tried this, it was successful

> Well, if the vgcfgrestore brings your VG back it is still questionable what
> data is toasted. If any the move won't help either and you want to
> go for your backup media :(

The issue I am running into is that when I try to rebuild the lvm from
scratch, I have been getting some strange errors. The base directories of
the system are in / (including /, /usr, /lib, etc). LVM 1.0.5 is compiled
into the kernel, not as modules.

I did the pvcreate -ff on each PV, then did a vgcreate vg00, and activated.
Messages kept popping up about "Can't find module /dev/lvm" and "Can't find
module /dev/vg00" and "invalidate: busy buffer". I finally got it to create 
the vg, created my partitions, then started restoring from backup. After over 
an hour of restoring, I had everything back to pretty much where I wanted it.
Did a CTRL-D to go back to multiuser mode, and it wound up rebooting. When it
came back up, the vgchange -a y vg00 told me that vg00 did not exist. How
can I rebuild my volume group and get the data to stay on the machine? 

Sorry for the vagueness of the post, but I am not sitting in front of the
machine, and since the home directories do not exist, I can't ssh in to get
the exact messages. But the pvs, lvs and partitions were in place, why is
this not persistent through a reboot?

Thanks,
--Brad
