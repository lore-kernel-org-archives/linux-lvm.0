Return-Path: <joe@66bassett.freeserve.co.uk>
Date: Wed, 3 Jan 2001 13:55:35 +0000
From: Joe Thornber <joe@66bassett.freeserve.co.uk>
Subject: Re: [linux-lvm] Another strange setup by a newbie, but strange oops resulted while trying vgextend/vgmerge!
Message-ID: <20010103135535.A1302@66bassett.freeserve.co.uk>
References: <20010103.13131495@dmitzlaff2.botschendv.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
In-Reply-To: <20010103.13131495@dmitzlaff2.botschendv.de>; from hackbyte@gmx.de on Wed, Jan 03, 2001 at 01:13:14PM +0000
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@sistina.com

> First, i ran into the same problems as reported before here on the list, 
> vgmerge and vgextend give me OOPS while extending the LE counter for the 
> VG.

Grab the latest code from the LVM_0-9-patches branch of cvs.  You will
need to repatch/build the kernel module as well as the userland tools.

> other patches? (CVS snapshots are no choice!)
Then wait for the next release which shouldn't be too long.

> Ok, next ->
> What the heck are you guy's doing? I use a native RH6.2 installation w/o 
> any updates/fixes (except for network security), using 2.2.17 and 2.2.18 
> kernel-tarballs (the ..17 patches works well on ..18, only a few rejects 
> which can easily inserted by hand;). But you CAN'T release a version that 
> does not work w/o telling users if they had to look at some dependencies! 
> (if there are some, remember i use a really clear RH6.2!)

???  
The lvm-2.2.17 and 2.2.18 patches apply cleanly to the vanilla
kernel + rawio.  The redhat kernel is almost certainly not a vanilla
kernel.

> reports and patches adressing this, but there's no help. And don't think 
> all your users, who want to use LVM, are able to use CVS snapshots (i 
> never use cvs snapshots on my server � release is release � features 
> against bugs;).

I don't think 0.9 is quite ready for production systems.  Maybe you
should play with 0.8.

- Joe
