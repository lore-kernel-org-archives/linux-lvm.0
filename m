Date: Fri, 8 Sep 2000 00:46:40 +0200
From: "Andi Kleen" <ak@suse.de>
Subject: Re: [linux-lvm] LVM support for LILO
Message-ID: <20000908004640.A24191@gruyere.muc.suse.de>
References: <20000907234301.B21294@gruyere.muc.suse.de> <200009072239.QAA09511@lynx.turbolabs.com>
Mime-Version: 1.0
In-Reply-To: <200009072239.QAA09511@lynx.turbolabs.com>; from adilger@turbolinux.com on Thu, Sep 07, 2000 at 04:39:39PM -0600
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andreas Dilger <adilger@turbolinux.com>
Cc: Andi Kleen <ak@suse.de>, Linux LVM mailing list <linux-lvm@msede.com>, idsfa@visi.com

On Thu, Sep 07, 2000 at 04:39:39PM -0600, Andreas Dilger wrote:
> Andi Kleen, you write:
> > I did some similar work. I implemented an LVM_BMAP ioctl for LVM that
> > simply translates a given block to a (dev_t, blocknr in dev). lilo 
> > simply does a normal FIOBMAP and then calls LVM_BMAP for every block
> > it gets. When the dev_t ever changes it complains loudly. Then it does
> > its normal work with the resulting blocks.
> 
> Do you have the corresponding patches to LILO?  Have you ever tried
> submitting them to the LILO maintainers?

I hacked lilo, but I never tested them really because I didn't have a spare
HD to experiment with the changed PV format at that time (I noticed the
problem with the PV format only after I did that work :-()  You can have
the untested patches if you want.  From visual inspection the translated
blocks looked ok.

A full solution requires more work, e.g. at least a LV flag so that
LVM can urge the user to rerun lilo after a *move. Support in lilo for LVs
spread over multiple devices would also be nice (I just cheated by requiring
it all on a single device) 


> 
> > It works ok. The only problem is that a standard PV cannot be used for
> > booting, because it does leave any space for a MBR (it probably needs 
> > a PV format revision that simply leaves 4K free) 
> 
> I think if you make a partition on your boot disk (even if it is the
> full size of the disk), then you will have enough space for a MBR.  No
> need to change LVM formats.  You can use full-disk PVs if you want for
> your other disks, but it quiets the boot process down a bit if you have
> a partition on the disk (or at least it complained the last time I tried
> a full-disk PV).

It just does not make much sense then, because with a DOS partition table
you can as well have a partition based /boot


-Andi
