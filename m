Date: Thu, 24 Aug 2000 07:59:10 -0400
From: Peter Green <pcg@gospelcom.net>
Subject: Re: [linux-lvm] LVM and sw RAID1
Message-ID: <20000824075910.C7996@gospelcom.net>
References: <20000823162957.B8398@gospelcom.net> <20000824111944.A974@guldukat.muon>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20000824111944.A974@guldukat.muon>; from nils@muon.de on Thu, Aug 24, 2000 at 11:19:44AM +0200
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

also sprach nils:
> On Wed, 23.08.00, Peter Green <pcg@gospelcom.net> wrote:
> >   (pcg@dmna) ~> uname -a
> >   Linux dmna 2.4.0-0.21 #2 Wed Aug 23 11:46:12 EDT 2000 i686 unknown
> 
> I'm a bit confused. Shouldnt the kernel-version be something like
> "2.4.0-testN" instead of "2.4.0-0.21"?

It's a RedHat kernel from rawhide.

> I for one am using 2.4.0-test5 with LVM 0.8final on sw-Raid Lv.5 wihout any
> problems so far, my pvcreate behaved like it should.

Hrm, I might try the stock kernel instead. Usually, RedHat does fairly good
things with any patches they add to their kernel, but this might be a case
in which they've done something naughty.

Thanks for the pointers!

/pg
-- 
Peter Green : Gospel Communications Network, SysAdmin : pcg@gospelcom.net
---
/*
 * Oops. The kernel tried to access some bad page. We'll have to
 * terminate things with extreme prejudice.
*/
die_if_kernel("Oops", regs, error_code);
(From linux/arch/i386/mm/fault.c)				   
