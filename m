Message-ID: <0da3fe8e36b6a24fd47084e1c2c645b8.squirrel@webmail.rymdraket.net>
In-Reply-To: <4D419C47.202@redhat.com>
References: <061e0b45500b99a3f38b4bfa88a9a591.squirrel@webmail.rymdraket.net>
	<4D419C47.202@redhat.com>
Date: Thu, 27 Jan 2011 18:55:02 +0100
From: xake@rymdraket.net
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: xake@rymdraket.net, LVM general discussion and development <linux-lvm@redhat.com>

Thanks for your answear.

> On 01/27/2011 10:37 AM, xake@rymdraket.net wrote:
>> I have a system with a script at bootup currently running something like
>> "lvm pvscan && lvm vgscan && lvm vgchange -ay" all with the option
>> "--config 'global { locking_dir = "/dev/.lvm" }'" since when the script
>> runs /var/lock is not in a writeable state. --ignorelockingfailures is
>> fine, but gives a message on stderr I do not want, but I still want to
>> get
>> other error messages so "2>/dev/null" is not an option.
>
> Use --sysinit instead of --ignorelockingfailure, no need to set that
> locking dir at all in this phase.
>
> If you have some strange messages paste them here, --sysinit is exactly
> here to handle read-only device boot problem.
> (seems it is just poorly documented...)
>
> Moreover, pvscan and vgscan are NOOP here, because it updates
> lvm cache, not possible on read-only system.
>
> All you want is probably:
> /sbin/lvm vgchange -a y --sysinit
>
>

pvscan and vgscan does not support --sysinit, that is why I use
--ignorelockingfailures, and AFAICT the message is pvscan/vgscan telling
me that /var/lock is not writeable and then ignores it (and I think at
least vgscan should have --sysinit, because some setups may need "vgscan
--mknodes").

So pvscan and vgscan only updates /etc/lvm/cache, and since that directory
is read-only they are supposed to be just NO-OP and could be omitted?
According to the manual page vgchange uses said cache if available, and
needs vgscan to update it otherwise, does vgchange still use it with a RO
mounted /etc (since vgscan cannot update said cache)?

Or is "vgchange -ay --sysinit" enought to find everything and activate it
for all occations that pvscan and vgscan covers, at least for newer
versions of lvm2?


I really do not know what is needed to get get a fully working and
flexible LVM from sysinit, the manuals are sometimes somewhat unclear on
what parts needs what, and the only how-to I found was at least three
years old and it seems like it has happened stuff since then.
One one of my computers I am running Gentoo, and they do the same "pvscan
&& vgscan --mknodes && vgchange -ay" as I tried (my script is loosely
based on theirs).
I do know it works fine on my test computer without pvscan, but placed it
back there to be on the safe side, since I thought Gentoo had it for some
reason, and no manual page told me convincingly what it really is good
for.
The vgscan was left too, because of that genkernel does not use
udev/devtmpfs for its initramfs and thuse vgscan --mknodes needs to
recreate the devicenodes for already activated volume groups, and I am
somewhat afraid that the same issue may exist for the stuff I am currently
playing with.
