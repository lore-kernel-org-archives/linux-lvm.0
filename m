From: Peter Hjalmarsson <xake@rymdraket.net>
Date: Fri, 28 Jan 2011 09:53:32 +0100
In-Reply-To: <4D41E502.50001@redhat.com>
References: <061e0b45500b99a3f38b4bfa88a9a591.squirrel@webmail.rymdraket.net>
	<4D419C47.202@redhat.com>
	<0da3fe8e36b6a24fd47084e1c2c645b8.squirrel@webmail.rymdraket.net>
	<4D41E502.50001@redhat.com>
Content-Transfer-Encoding: 7bit
Message-ID: <1296204813.2417.55.camel@ferra.local>
Mime-Version: 1.0
Subject: Re: [linux-lvm] lvm, config and commandline
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Milan Broz <mbroz@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

tor 2011-01-27 klockan 22:34 +0100 skrev Milan Broz:
> On 01/27/2011 06:55 PM, xake@rymdraket.net wrote:
> With new udev systems vgscan --mknodes should be needed only when something
> went wrong, all device nodes are now handled by udev rules.
> 
> (It was slightly different in old non-udev versions but it is history now,
> lvm still can handle non-udev mode it but it is not the case here.)
> 

Well, in gentoo they are facing one of those places where --mknodes is
needed. This is because genkernel (the distribution-provided tool to
generate kernel and initrd) does not use udev/devtmpfs for its
initrd/initramfs but busybox mdev (which AFAIK is supposed to works like
udev) and for some reason the device nodes created by vgchange in the
initrd are not recreated when the system itself runs udev (and uses
devtmpfs if available in kernel). so vgscan --mknodes needs to recreate
all those device nodes. And the question is if Gentoo ever can drop it,
as they are very forgiving on how you want to prepare and use your
initrd.

> > So pvscan and vgscan only updates /etc/lvm/cache, and since that directory
> > is read-only they are supposed to be just NO-OP and could be omitted?
> 
> yes. But note that if you add _new_ device to system and lvm see old cache,
> you have to run vgscan later and run another vgchange to activate newly
> appeared device, see below.
> 

If there is no cache does vgchange do its own vgscan?
Why I ask is because in the genkernel initrd they do "vgscan && vgchange
-ay" and for me it seems to work even with only "vgchange -ay" if I have
root-on-lvm.
The system I am experimenting a script for will not have root-on-lvm and
will probably run its first pass of vgchange on a ro / with old cache.


It may be an idea to have vgchange ignore cache on --sysinit, this
because if your system for example has the following ordering for lvm
and mounting:

1. initrd activates the volume group root lives on by name and mounts it
ro
2. initscript issues vgchange --sysinit and uses cache
from /etc/lvm/cache
3. system runs fsck on everything in fstab (that is local devices)
4. system mounts root rw
4. system mounts everything else from fstab (not needing network)
 

Then here if you have more then one volume group, and have had to do
some maintains from live media or alike not updating the cache,
involving changing what hard disks/device nodes the volume groups lives
on. Then after step 2 all volume groups may not have been activated for
later mounting in step 3.
Unless vgscan is issues and can update cache. Or --sysinit ignores
cache. Or you can work around this by removing /etc/lvm/cache/.cache
before / is remounted ro during shutdown, but tha is if vgchange does
the scan anyway.

> > According to the manual page vgchange uses said cache if available, and
> > needs vgscan to update it otherwise, does vgchange still use it with a RO
> > mounted /etc (since vgscan cannot update said cache)?
> 
> > Or is "vgchange -ay --sysinit" enought to find everything and activate it
> > for all occations that pvscan and vgscan covers, at least for newer
> > versions of lvm2?
> 
> --sysinit should be used only very early in boot to activate system
> devices needed for booting, later you should have another script
> to activate other devices and optionally start monitoring for lvm
> (used for mirror device handling).
> 

Gentoo does how I described above and the starts the monitoring/polling
later on, and I see Fedora does too. Albeit both distributions scripts
for starting the monitoring/polling seems bloated (doing
"for vg in `vgs` ; do vgchange --monitor y --poll y $vg ; done"
(note: no "-a") which does the same as just a
"vgchange --monitor y --poll y"
as both will not do anything for a vg not already activated, and thus
already in cache so a "vgs" is just an extra unnecessary step).


> > One one of my computers I am running Gentoo, and they do the same "pvscan
> > && vgscan --mknodes && vgchange -ay" as I tried (my script is loosely
> > based on theirs).
> 
> Well, I am not sure why Gentoo is doing this. --mknodes should not be needed.
> 
> (If you are using that locking_dir = "/dev/.lvm" consitently and controlled
> way, which is the Gentoo case probably,  it can probably solve some
> problems but I personally do not like that because it probably hides
> some real problem in lvm interaction.)
> 

Like that fact that they are not using udev/devtmpfs in the genkernel
initrd and may sometimes need "vgscan --mknodes --sysinit"? I bet Gentoo
at least needs this even if genkernel is fixed, only to cover some
corner cases of user configurations where the device nodes needs to be
created. One of the downsides to allow the massive amounts of
configurations they do.




> > I do know it works fine on my test computer without pvscan, but placed it
> > back there to be on the safe side, since I thought Gentoo had it for some
> > reason, and no manual page told me convincingly what it really is good
> > for.
> > The vgscan was left too, because of that genkernel does not use
> > udev/devtmpfs for its initramfs and thuse vgscan --mknodes needs to
> > recreate the devicenodes for already activated volume groups, and I am
> > somewhat afraid that the same issue may exist for the stuff I am currently
> > playing with.
> 
> First, udev without devtmpfs cannot work reliably. And udev is preferred way
> how to create device nodes for lvm in recent versions.
> 

Gentoo uses udev on devtmpfs as standard if the kernel has devtmpfs
enabled. However the initrd uses as mentioned before mdev from busybox
instead.

> And udev in initramfs is known to work, the pivot root switch and
> persistence of udev database after remount is also solved so nodes
> should not disappear.
> 


When I experiment with Gentoo/genkernel I found that if I use devtmpfs
instead of mdev, then it seems like the device nodes does not disappear.


> (I hope one day all this system boot thing will be handled better and
> lvm will not need to scan for new devices itself so the whole internal
> device cache disappears. Current state is still kind of compromise.)
> 

Mee too.;)

> Milan

Thanks for your comments, I think I start to get the idea of how this
thing works.
