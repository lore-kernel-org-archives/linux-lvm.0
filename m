From: Jan Niehusmann <list039@gondor.com>
Subject: Re: [linux-lvm] pvmove hangs
Message-ID: <20030818120601.GA12309@gondor.com>
References: <20030816102005.GA12916@gondor.com> <20030816195606.B25758@uk.sistina.com> <20030817231415.GA4328@gondor.com> <20030818124515.A29420@uk.sistina.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20030818124515.A29420@uk.sistina.com>
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
Date: Mon Aug 18 07:07:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Aug 18, 2003 at 12:45:15PM +0100, Alasdair G Kergon wrote:
> Please confirm which kernel you are using, and the device-mapper
> patch(es) you applied.  [patches/linux-2.4.2?* from the 1.00.02
> device-mapper tarball?]

It's 2.4.21, and yes, both linux-2.4.21-devmapper-ioctl.patch and
linux-2.4.21-VFS-lock.patch from the 1.00.02 tarball are applied.

> Some more diagnostics:
>   check that you have 'activation = 1' and 'level = 7' in the log{}
>   section of lvm.conf and if not, recreate a problem pvmove application log 
>   (The you put on the web seems incomplete)

I have level = 7, but not activation = 1. I'll try it again later, when
I'm back at the console... don't want to hang the computer via ssh :-)

> Use dmsetup to see what's going on:
>   run 'dmsetup ls' to get a list of internal device names,
>   then 'dmsetup -v table <device_name_shown_in_ls>' 
> on all the relevant ones (e.g. vgraid-lvol5*)

I had a look at these and didn't see anything unusual, but I'll check
again carefully.

> After all the interruptions you've had, check the /dev/vgraid/lvol5 
> symlink (->/dev/mapper/vgraid-lvol5) & destination major/minor is 
> still right.

lvol5 was mounted when the problems started (errors on ls on that
partition), so it's surely not a symlink problem, as the kernel doesn't
access a mounted device via the symlink.

> Check the current metadata (with vgcfgbackup) still looks right.
> [Does it show pvmove(s) in progress, or is it clean again?]

When pvmove hangs, vgcfgbackup shows the pvmove in progress, even after
CTRL-C (which is expected), and pvmove --abort doesn't work at all, as I
said. 
So I always had to restore LVM2 to a sane state with vgcfgrestore. After
that, I reboot and get LVM back up running cleanly. Even lvol5 was not
damaged, because the garbage on the logical volume never got written to
the underlying device, and vgcfgrestore removed all traces of the
incomplete pvmove.

Jan
