Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j27KP5n01866
	for <linux-lvm@redhat.com>; Mon, 7 Mar 2005 15:25:05 -0500
Received: from marketview.co.nz (210-54-92-188.ipnets.xtra.co.nz
	[210.54.92.188])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j27KP3P3012834
	for <linux-lvm@redhat.com>; Mon, 7 Mar 2005 15:25:04 -0500
Message-ID: <422CB890.4050003@vilain.net>
Date: Tue, 08 Mar 2005 09:24:48 +1300
From: Sam Vilain <sam@vilain.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] lvm2 on raid5 speed, not so bad
References: <4226C7C8.10406@theserrs.net>
In-Reply-To: <4226C7C8.10406@theserrs.net>
Content-Transfer-Encoding: 7bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi there,

Satisfying yourself with benchmarks rather than just listening to
argumentative gits in mailing lists like myself is always good.  Let's look
at the result in a little more detail.

Firstly, you'll notice that the write performance of the RAID 5 array is
lower than for an individual disk.  This is expected, as for RAID 5 updates
the system needs to first read two sectors (real + parity), perform a little
calculation that modern processors can do quickly enough, and write the two
blocks out again.  A large cache can help sometimes, but usually only in
Benchmarks ;-).

The read access is of comparable speed - this is also expected.  Try
simulating a failure (one fun way is to power a device down with hdparm,
then unplug it :->), and see what happens with performance then.  Be
prepared to wait a long time while a massive array like this re-syncs.  You
should also be sure that you see what messages the system raises, and
satisfy yourself that you would notice if a failure happened (other than by
wondering why the system's running so slowly...;) )

I'm slightly surprised that the random seek performance is quite poor.
You'd expect to see a random seek time of almost 5 times the performance of
a single device with a 5 disk RAID5 array.  You may be encountering other
limitations there.

Also, bear in mind that different parts of discs have different transfer
rates and possibly even access times - one of the reasons that homogenous
arrays are a good idea.  All hard disks are constant angular velocity, and
afaik most use a constant bit density across the entire platter.  So, this
means at the rim of the disk the bits can be transferred faster.  Modern
devices seem to map this high performance region to the beginning of the
logical disk.

Sam.


Scott Serr wrote:
> Just to share some information...
> 
> Here is a "bonnie -s 1024" on a P4 2.4 with 512MB RAM.  The RAID5 is my 
> weirdo way of doing multiple RAID5 devices so that I can move things 
> around.  All 4 RAID5 meta devices are on the same 5 disks... 300GB SATA 
> and (4) 200GB PATA drives.
> 
> LVM2 over RAID5
>             -------Sequential Output-------- ---Sequential Input-- 
> --Random--
>             -Per Char- --Block--- -Rewrite-- -Per Char- --Block--- 
> --Seeks---
>          MB K/sec %CPU K/sec %CPU K/sec %CPU K/sec %CPU K/sec %CPU  /sec 
> %CPU
>        1024 16987 69.9 34777  7.4 16659  4.1 21532 86.4 49760  9.2 
> 470.7  1.7
> 
> 
> "Hot" SATA 300GB (Maxtor)
>             -------Sequential Output-------- ---Sequential Input-- 
> --Random--
>             -Per Char- --Block--- -Rewrite-- -Per Char- --Block--- 
> --Seeks---
>          MB K/sec %CPU K/sec %CPU K/sec %CPU K/sec %CPU K/sec %CPU  /sec 
> %CPU
>        1024 23553 96.2 62613 14.0 26123  5.1 22094 87.5 57233  6.9 
> 200.9  0.4
> 
> Forgot to mention that the RAID5 devices are 1024k "chunk-size".  
> Filesystem is reiserfs.
> 
> -Scott
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 


-- 
Sam Vilain, sam /\T vilain |><>T net, PGP key ID: 0x05B52F13
(include my PGP key ID in personal replies to avoid spam filtering)
