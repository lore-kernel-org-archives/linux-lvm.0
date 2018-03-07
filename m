MIME-Version: 1.0
In-Reply-To: <20180305165926.GA20527@redhat.com>
References: <CABZYMH73Z+u05HrsqaOGighaav0Rb4TT4ttDmiB8Z6x1Xz20nA@mail.gmail.com>
	<20180305165926.GA20527@redhat.com>
From: Damon Wang <damon.devops@gmail.com>
Date: Wed, 7 Mar 2018 16:14:01 +0800
Message-ID: <CABZYMH5z4FE6b_DSuXp-L8gKmypthha3-16sEKf=E-R6b8764Q@mail.gmail.com>
Subject: Re: [linux-lvm] [lvmlockd] Refresh lvmlockd leases after sanlock
	changes
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
Content-Transfer-Encoding: 7bit
To: David Teigland <teigland@redhat.com>
Cc: linux-lvm@redhat.com

Hi Dave,

Thank you for your reply!

> thin lv's from the same thin pool cannot be used from different hosts
> concurrently.  It's not because of lvm metadata, it's because of the way
> dm-thin manages blocks that are shared between thin lvs.  This block
> sharing/unsharing occurs as each read/write happens on the block device,
> not on LV activation or any lvm command.

My plan is one vm has one thin lv as root volume, and each thin lv get its own
thin lv pool, Is this a way to avoid the problem of block share within
thin lv pool?

Besides, during migrating, libvirt will make sure only one host is
using (read/write) the lv,
and I'm trying to find a way to deactivate lv after migrating, so that
there's always
only one host has I/O on a thin lv.

> I suggest trying https://ovirt.org

I did some research on ovirt, there are two designs now
(https://github.com/oVirt/vdsm/blob/master/doc/thin-provisioning.md)
and I found it really relies on SPM host, once SPM host fails, all
vms' availability
will be influenced, which is we don't want to see.


> You need to release the lock on the source host after the vm is suspended,
> and acquire the lock on the destination host before the vm is resumed.
> There are hooks in libvirt to do this.  The LV shouldn't be active on both
> hosts at once.


 I did some experiments on this since I have read the libvirt migrate hook page
(https://libvirt.org/hooks.html#qemu_migration) and it seems useless.
I wrote a simple script and confirm that the hook execute process is:

on dest host, do "migrate begin", "prepare begin", "start begin",
"started begin"
after a while (usually a few seconds), on source host, do "stopped end" and
"release end"

In a word, it not provide a way to do some thing on the time of vm
suspend and resume. :(

Thanks!

Damon

P.S sorry that previous post is html format and is seems dropped by Mailman

2018-03-06 0:59 GMT+08:00 David Teigland <teigland@redhat.com>:
> On Mon, Mar 05, 2018 at 04:37:58PM +0800, Damon Wang wrote:
>> to SAN and provide a lun as lvm pv. Each vm gets a thin lv from lvm as root
>> volume, and maybe some other thin lvs as data volume. So lvmlockd will
>> assurance only one host will change metadata at same time, and lvmthin will
>> provide thin provision.
>
> thin lv's from the same thin pool cannot be used from different hosts
> concurrently.  It's not because of lvm metadata, it's because of the way
> dm-thin manages blocks that are shared between thin lvs.  This block
> sharing/unsharing occurs as each read/write happens on the block device,
> not on LV activation or any lvm command.
>
> lvmlockd uses locks on the thin pool to enforce the dm-thin limitations.
> If you manually remove the locks, you'll get a corrupted thin pool.
>
>> But if want to live migrate the vm, it could be difficult since thin lv can
>> only be exclusive active on one host, if you want to active on another
>> host, the only way I find is use sanlock to release it manually. If you
>> have a better way, please tell me and thanks a loooot !!!
>
> I suggest trying https://ovirt.org
>
> You need to release the lock on the source host after the vm is suspended,
> and acquire the lock on the destination host before the vm is resumed.
> There are hooks in libvirt to do this.  The LV shouldn't be active on both
> hosts at once.
>
> Dave
