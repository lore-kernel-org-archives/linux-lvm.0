Date: Thu, 24 Aug 2000 15:39:14 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] LVM and sw RAID1
Message-ID: <20000824153914.B28825@colombina.comedia.it>
Reply-To: bluca@comedia.it
References: <20000823162957.B8398@gospelcom.net> <20000824111944.A974@guldukat.muon> <20000824083001.E7996@gospelcom.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20000824083001.E7996@gospelcom.net>; from pcg@gospelcom.net on Thu, Aug 24, 2000 at 08:30:01AM -0400
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

good it seems you found the first bug in lvm_dir_cache

the second bug is in a function called something like 
pv_check_all_pv it tries to remove all block devices that are part
of an md device, finds none and removes the md device.

obviously this check is not needed unless you have a raid partition
of type 0x8e, or you use full disks.

good luck

L.

P.S. i noticed the result of this routines varies depending with
system configuration, at one particular point pv_check_all_pv did
segfault on me, i removed a disk an it did work :(

i suggest someone reviews that code.
On Thu, Aug 24, 2000 at 08:30:01AM -0400, Peter Green wrote:
> also sprach nils:
> > On Wed, 23.08.00, Peter Green <pcg@gospelcom.net> wrote:
> > >   (pcg@dmna) ~> uname -a
> > >   Linux dmna 2.4.0-0.21 #2 Wed Aug 23 11:46:12 EDT 2000 i686 unknown
> > 
> > I'm a bit confused. Shouldnt the kernel-version be something like
> > "2.4.0-testN" instead of "2.4.0-0.21"?
> 
> Okay, I've installed 2.4.0-test6 with the exact same results. Stock lvm
> tools give ``invalid partition type 0x83'' for /dev/md0, my altered tools
> give no errors for pvcreate, but nothing shows up in pvscan.
> 
> > I for one am using 2.4.0-test5 with LVM 0.8final on sw-Raid Lv.5 wihout any
> > problems so far, my pvcreate behaved like it should.
> 
> Could it be a LVM+RAIDn problem where n != 5?



-- 
Luca Berra -- bluca@comedia.it
    Communication Media & Services S.r.l.
