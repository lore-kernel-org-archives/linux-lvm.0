Subject: Re: [linux-lvm] LVM 1.0.7, kernel 2.4.21 and snapshots over ext3 filesystem
Message-ID: <12023-88653@sneakemail.com>
References: <BC28A9E979C56C44BCBC2DED313A4470017E83E8@bond.ncl.ac.uk>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BC28A9E979C56C44BCBC2DED313A4470017E83E8@bond.ncl.ac.uk>
From: "Wolfgang Weisselberg" <uzx87lvfmukwc001@sneakemail.com>
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
Date: Fri Jul  4 15:59:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

C R Ritson C.R.Ritson-at-newcastle.ac.uk |LVM Mailinglist linux-lvm/Allow| wrote 45 lines:

> > My bet is that you first patched the kernel for VFS-lock and
> > *then* patched the kernel for LVM.  This undoes (parts of)
> > the VFS-lock.  The reason is as follows:

> That is strange - my exprience with kernel 2.4.20 and LVM 1.0.7 was as
> follows:

> Attempting to apply the VFS-lock patch AFTER the LVM generated patch
> gives me an un-compilable tree with with unresolved reverences to
> fsync_dev_lockfs and unlockfs.

I have compiled quite a few kernels exactly after my cheatsheet
(from at least 2.4.21-rc1 up to my currently running 2.4.21-lvm)
and it works.  At times I may have to hand-patch because of
trivial changes to get the VFS-lock patch in, but ... that's it.

> On one test machine I am running a 2.4.20 kernel in which the VFS-lock
> patch was applied BEFORE the LVM patch. Here, I am taking a snapshot at

> Would Heinz care to comment on these two apparently conflicting results?

It MIGHT be that LVM 1.0.7 is in sync (or at least not damaging)
to the VFS-lock patch for 2.4.20.  I *have* had problems in the
past (I tried VFS-lock and the LVM and it failed), but I cannot
vouch that they are there for kernel 2.4.20/LVM 1.0.7.

-Wolfgang
