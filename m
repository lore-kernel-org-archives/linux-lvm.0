Date: Thu, 28 Sep 2000 18:32:43 +0200
From: Christoph Hellwig <hch@caldera.de>
Subject: Re: [linux-lvm] current lvm function questions
Message-ID: <20000928183243.B14386@ns.lst.de>
References: <39D14B6C.4C9F6C26@us.oracle.com>
Mime-Version: 1.0
In-Reply-To: <39D14B6C.4C9F6C26@us.oracle.com>; from dbrower@us.oracle.com on Tue, Sep 26, 2000 at 06:20:44PM -0700
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Brower <dbrower@us.oracle.com>
Cc: linux-lvm@msede.com

On Tue, Sep 26, 2000 at 06:20:44PM -0700, David Brower wrote:
> Area 1:  Stable device naming.
> 
> Is there a way in Linux to get a stable name for a
> disk that survive reconfiguration and discovery 
> randomization?

There are lots ...

 a) use scsidev(2) (for scsi disks only)
 b) use devfs
 c) use the linux software raid driver
 d) use a hardware raid controller that has it's
    own devfs-like naming scheme (ami, compaq)
 e) use lvm - also it does not use UUIDs yet,
    vgscan should detect all pvs of a vg.
 f) mount you disk by-label instead of by-device
    (LABEL: or UUID: entries in /etc/fstab)

> Specifically, if a pv/vg/lv is created on /dev/sda6, and 
> a subsequent reconfig has that partition show up as 
> /dev/sdb3, does it still show up as /dev/lvname?

It should. (but it's called /dev/vgname/lvname)

> 
> 2.  Raw device access
> 
> Can lvm volumes be accessed as raw devices?  If so, how?

Yes - in Linux 2.4 (or 2.2 w/ patches) you can simply bind
a raw device to any blockdevice. See raw(8) for details.
The device name will be /dev/raw/X

> Is there /dev/rlvname?

Nope.

	Christoph

-- 
Always remember that you are unique.  Just like everyone else.
