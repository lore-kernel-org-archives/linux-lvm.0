Date: Thu, 24 Aug 2000 08:30:01 -0400
From: Peter Green <pcg@gospelcom.net>
Subject: Re: [linux-lvm] LVM and sw RAID1
Message-ID: <20000824083001.E7996@gospelcom.net>
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

Okay, I've installed 2.4.0-test6 with the exact same results. Stock lvm
tools give ``invalid partition type 0x83'' for /dev/md0, my altered tools
give no errors for pvcreate, but nothing shows up in pvscan.

> I for one am using 2.4.0-test5 with LVM 0.8final on sw-Raid Lv.5 wihout any
> problems so far, my pvcreate behaved like it should.

Could it be a LVM+RAIDn problem where n != 5?

/pg
-- 
Peter Green : Gospel Communications Network, SysAdmin : pcg@gospelcom.net
---
Feel free to contact me (flames about my english and the useless of this
driver will be redirected to /dev/null, oh no, it's full...).
(Michael Beck, describing the PC-speaker sound device)
