Return-Path: <austin@coremetrics.com>
Message-ID: <85063BBE668FD411944400D0B744267A481B2B@AUSMAIL>
From: "Gonyou, Austin" <austin@coremetrics.com>
Subject: RE: [linux-lvm] Installed the lvm on the Red Hat 7.1 then what to
	 do now
Date: Wed, 27 Jun 2001 10:12:00 -0500
MIME-Version: 1.0
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
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

fdisk /dev/[hs]d[a-z][1-9]
t 1
8e
(repeat for all partitions you've created on a disk which doesn't have data
on it)
w
pvcreate /dev/[hs]d[a-z][1-9]
vgcreate /dev/xxx1 /dev/xxx2 /dev/xxx3 volgroup
lvcreate -L6000M -ix -I16 -n volname volgroup
mkfs.xfs /dev/volgroup/volname
-- 
Austin Gonyou
Systems Architect, CCNA
Coremetrics, Inc.
Phone: 512-796-9023
email: austin@coremetrics.com 

> -----Original Message-----
> From: RAGHVENDRA SHUKLA [mailto:rshukla@prl.ernet.in]
> Sent: Wednesday, June 27, 2001 5:43 AM
> To: linux-lvm@sistina.com
> Subject: [linux-lvm] Installed the lvm on the Red Hat 7.1 then what to
> do now
> 
> 
> 
> Hello ,
>         I have installed the lvm in the Red hat 7.1 ( kernel 
> 2.4 , with
>         kernel enabled as lvm ( in kernel ) , installed the lvm , also
>         created one physical volume , But i am confused as my 
> df gives 
>       
>     Filesystem 1k-blocks Used Available Use% Mounted on 
>         /dev/hda5 4870252 3272660 1350196 71% / 
>         /dev/hda2 23333 2468 19661 11% /boot
> 	/dev/hda6 2624792   2124756    366700  85% /var 
> 
> 
> is i will be able to change the size of / or /var or /boot partition,
> are they hardcore partition . What i want is  i want to make
> /home , /var , /boot ,/ all resizeable , please clearify. I 
> am confused
> 
> 
> Regards
> Raghav
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> 
