Subject: Re: [linux-lvm] ext3 slash
From: Geoff Dolman <geoff.dolman@cimr.cam.ac.uk>
In-Reply-To: <1054893913.11446.24.camel@lupin>
References: <1054888476.11446.8.camel@lupin>
	 <20030606104650.A26768@sistina.com>  <1054893913.11446.24.camel@lupin>
Content-Transfer-Encoding: 7bit
Message-Id: <1054895724.11446.30.camel@lupin>
Mime-Version: 1.0
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
Date: Fri Jun  6 05:36:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

On Fri, 2003-06-06 at 11:05, Geoff Dolman wrote:
> On Fri, 2003-06-06 at 09:46, Heinz J . Mauelshagen wrote:
> > On Fri, Jun 06, 2003 at 09:34:37AM +0100, Geoff Dolman wrote:
> > > Hi
> > > 
> > > I have installed a machine with a /boot in a normal partition and all
> > > other partitions including / on ext3 logical volumes.
> > > (Red Hat 9/lvm 1.0.3).
> > > 
> > > I want to snapshot dump these partitions but I didn't realise at the
> > > time of the install that I would have to patch the kernel to be able to
> > > do this with ext3 filing systems.
> > > I don't want to have to do this so I migrated the partitions to ext2
> > > using tune2fs and changed fstab.
> > > 
> > > In the case of / and /var I booted into rescue mode from cd to run
> > > tune2fs against those volumes read-only.
> > > 
> > > When I rebooted the machine I got a panic because there was no journal
> > > found on /. Rebooting into rescue mode and restoring the journal on
> > > slash cures this problem.
> > > 
> > > How can I change the slash volume from ext3 to ext2? As I mentioned I
> > > edited fstab so there must be some other record somewhere telling the
> > > kernel that slash is ext3 but what? Do I need to make a new initrd.img?
> > 
> > Check if your lilo/grub entry contains a "rootfstype=" entry and change that
> > if it says ext3.
> > 
> 
> 
> No - unfortunately not - all I have is
> 
> title Red Hat Linux (2.4.20-18.9smp)
>         root (hd0,0)
>         kernel /vmlinuz-2.4.20-18.9smp ro root=/dev/Volume00/slash
>         initrd /initrd-2.4.20-18.9smp.img
> 
> and a similar entry for UP.

More Information:

On a test machine I have just booted from cd into rescue mode and tried
to use lvmcreate_initrd.img to make a new initrd.img after changing / to
ext2.
I got cpio not enough space on device as an error message even though
the machine is nowhere near full on any filesystem including /tmp.

I then tried using mkinitrd to do the same thing and edited grub and
rebooted. This has worked with the minor inconvenience of having to do
an fsck when the machine rebooted.

-- 
Geoff Dolman <geoff.dolman@cimr.cam.ac.uk>
