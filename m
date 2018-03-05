Date: Mon, 5 Mar 2018 10:59:27 -0600
From: David Teigland <teigland@redhat.com>
Message-ID: <20180305165926.GA20527@redhat.com>
References: <CABZYMH73Z+u05HrsqaOGighaav0Rb4TT4ttDmiB8Z6x1Xz20nA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABZYMH73Z+u05HrsqaOGighaav0Rb4TT4ttDmiB8Z6x1Xz20nA@mail.gmail.com>
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
To: Damon Wang <damon.devops@gmail.com>
Cc: linux-lvm@redhat.com

On Mon, Mar 05, 2018 at 04:37:58PM +0800, Damon Wang wrote:
> to SAN and provide a lun as lvm pv. Each vm gets a thin lv from lvm as root
> volume, and maybe some other thin lvs as data volume. So lvmlockd will
> assurance only one host will change metadata at same time, and lvmthin will
> provide thin provision.

thin lv's from the same thin pool cannot be used from different hosts
concurrently.  It's not because of lvm metadata, it's because of the way
dm-thin manages blocks that are shared between thin lvs.  This block
sharing/unsharing occurs as each read/write happens on the block device,
not on LV activation or any lvm command.

lvmlockd uses locks on the thin pool to enforce the dm-thin limitations.
If you manually remove the locks, you'll get a corrupted thin pool.

> But if want to live migrate the vm, it could be difficult since thin lv can
> only be exclusive active on one host, if you want to active on another
> host, the only way I find is use sanlock to release it manually. If you
> have a better way, please tell me and thanks a loooot !!!

I suggest trying https://ovirt.org

You need to release the lock on the source host after the vm is suspended,
and acquire the lock on the destination host before the vm is resumed.
There are hooks in libvirt to do this.  The LV shouldn't be active on both
hosts at once.  

Dave
