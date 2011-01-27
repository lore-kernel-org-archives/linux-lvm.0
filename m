Message-ID: <4D41E502.50001@redhat.com>
Date: Thu, 27 Jan 2011 22:34:58 +0100
From: Milan Broz <mbroz@redhat.com>
MIME-Version: 1.0
References: <061e0b45500b99a3f38b4bfa88a9a591.squirrel@webmail.rymdraket.net>
	<4D419C47.202@redhat.com>
	<0da3fe8e36b6a24fd47084e1c2c645b8.squirrel@webmail.rymdraket.net>
In-Reply-To: <0da3fe8e36b6a24fd47084e1c2c645b8.squirrel@webmail.rymdraket.net>
Content-Transfer-Encoding: 7bit
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
To: xake@rymdraket.net
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On 01/27/2011 06:55 PM, xake@rymdraket.net wrote:
> Thanks for your answear.
> 
>> On 01/27/2011 10:37 AM, xake@rymdraket.net wrote:
>>> I have a system with a script at bootup currently running something like
>>> "lvm pvscan && lvm vgscan && lvm vgchange -ay" all with the option
>>> "--config 'global { locking_dir = "/dev/.lvm" }'" since when the script
>>> runs /var/lock is not in a writeable state. --ignorelockingfailures is
>>> fine, but gives a message on stderr I do not want, but I still want to
>>> get
>>> other error messages so "2>/dev/null" is not an option.
>>
>> Use --sysinit instead of --ignorelockingfailure, no need to set that
>> locking dir at all in this phase.
>>
>> If you have some strange messages paste them here, --sysinit is exactly
>> here to handle read-only device boot problem.
>> (seems it is just poorly documented...)
>>
>> Moreover, pvscan and vgscan are NOOP here, because it updates
>> lvm cache, not possible on read-only system.
>>
>> All you want is probably:
>> /sbin/lvm vgchange -a y --sysinit
>>
>>
> 
> pvscan and vgscan does not support --sysinit, that is why I use

--sysinit is special switch which should handle system init

pvscan and vgscan on readonly system do nothing, just scan devices
and forgot output because cache cannot be updated.

With new udev systems vgscan --mknodes should be needed only when something
went wrong, all device nodes are now handled by udev rules.

(It was slightly different in old non-udev versions but it is history now,
lvm still can handle non-udev mode it but it is not the case here.)

> So pvscan and vgscan only updates /etc/lvm/cache, and since that directory
> is read-only they are supposed to be just NO-OP and could be omitted?

yes. But note that if you add _new_ device to system and lvm see old cache,
you have to run vgscan later and run another vgchange to activate newly
appeared device, see below.

> According to the manual page vgchange uses said cache if available, and
> needs vgscan to update it otherwise, does vgchange still use it with a RO
> mounted /etc (since vgscan cannot update said cache)?

> Or is "vgchange -ay --sysinit" enought to find everything and activate it
> for all occations that pvscan and vgscan covers, at least for newer
> versions of lvm2?

--sysinit should be used only very early in boot to activate system
devices needed for booting, later you should have another script
to activate other devices and optionally start monitoring for lvm
(used for mirror device handling).

Later is system root mounted read-write so you can issue normal
vgscan && vgchange.
(Usually this is done for iSCSI / network attached devices which
can be activated only after network is configured.)

> One one of my computers I am running Gentoo, and they do the same "pvscan
> && vgscan --mknodes && vgchange -ay" as I tried (my script is loosely
> based on theirs).

Well, I am not sure why Gentoo is doing this. --mknodes should not be needed.

(If you are using that locking_dir = "/dev/.lvm" consitently and controlled
way, which is the Gentoo case probably,  it can probably solve some
problems but I personally do not like that because it probably hides
some real problem in lvm interaction.)

> I do know it works fine on my test computer without pvscan, but placed it
> back there to be on the safe side, since I thought Gentoo had it for some
> reason, and no manual page told me convincingly what it really is good
> for.
> The vgscan was left too, because of that genkernel does not use
> udev/devtmpfs for its initramfs and thuse vgscan --mknodes needs to
> recreate the devicenodes for already activated volume groups, and I am
> somewhat afraid that the same issue may exist for the stuff I am currently
> playing with.

First, udev without devtmpfs cannot work reliably. And udev is preferred way
how to create device nodes for lvm in recent versions.

And udev in initramfs is known to work, the pivot root switch and
persistence of udev database after remount is also solved so nodes
should not disappear.

I am not advocating that you must use udev, I am just saying that all this
should work reliably during boot even in init ramdisk.

If you want to combine non-udev start with udev using later, or you
are supporting some special cases (like boot from CD and switch to
root rw snapshot) it can become complicated and it is possible you still
need these workarounds.

(I hope one day all this system boot thing will be handled better and
lvm will not need to scan for new devices itself so the whole internal
device cache disappears. Current state is still kind of compromise.)

Milan
