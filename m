Return-Path: <joe@66bassett.freeserve.co.uk>
Date: Mon, 26 Feb 2001 20:39:33 +0000
From: Joe Thornber <joe@66bassett.freeserve.co.uk>
Subject: Re: [linux-lvm] LVM and *bad* performance (no striping)
Message-ID: <20010226203933.B2504@66bassett.freeserve.co.uk>
References: <m2snl1phy5.fsf@isnogud.escape.de>
Mime-Version: 1.0
In-Reply-To: <m2snl1phy5.fsf@isnogud.escape.de>; from urs@isnogud.escape.de on Mon, Feb 26, 2001 at 04:44:34PM +0100
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Feb 26, 2001 at 04:44:34PM +0100, Urs Thuermann wrote:
> I tried to use LVM today using Linux 2.4.2 and it mostly works like I
> expected.  But the performance is unacceptably bad:

Every now and then someone posts to the list claiming LVM performance
is really bad.  We go off and try it and find the overhead is
typically less than 1%.

Normally people are trying to stripe to two partitions on the same
device, but you aren't.

Is any one else on the list seeing a similar performance hit ?

- Joe

> 
>     isnogud:/root# fdisk -l /dev/sda|grep sda5
>     /dev/sda5            80       399   2570368+  8e  Linux LVM
>     isnogud:/root# pvcreate /dev/sda5
>     pvcreate -- physical volume "/dev/sda5" successfully created
>     
>     isnogud:/root# vgcreate vg0 /dev/sda5
>     vgcreate -- INFO: using default physical extent size 4 MB
>     vgcreate -- INFO: maximum logical volume size is 255.99 Gigabyte
>     vgcreate -- doing automatic backup of volume group "vg0"
>     vgcreate -- volume group "vg0" successfully created and activated
>     
>     isnogud:/root# lvcreate -n test /dev/vg0 -L 300M
>     lvcreate -- doing automatic backup of "vg0"
>     lvcreate -- logical volume "/dev/vg0/test" successfully created
>     
>     isnogud:/root# time dd if=/dev/sda5 of=/dev/null count=100000
>     100000+0 records in
>     100000+0 records out
>     
>     real    0m6.720s
>     user    0m0.300s
>     sys     0m0.970s
>     isnogud:/root# time dd if=/dev/vg0/test of=/dev/null count=100000
>     100000+0 records in
>     100000+0 records out
>     
>     real    0m41.851s
>     user    0m0.350s
>     sys     0m2.250s
> 
> When making an ext2 filesystem on /dev/sda5 or /dev/vg0/test
> respectivley, the performance of cp'ing, grep'ing all files and rm'ing
> all files, seems to be comparable.  But why is the performance of
> reading the block device with dd so bad?
> 
> 
> urs
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> 
