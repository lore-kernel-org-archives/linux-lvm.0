Return-Path: <lembark@wrkhors.com>
Message-ID: <3AB2FDB7.6A285C47@wrkhors.com>
Date: Sat, 17 Mar 2001 00:01:27 -0600
From: Steven Lembark <lembark@wrkhors.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] *** ANNOUNCEMENT *** LVM 0.9.1 Beta 6 available at 
 www.sistina.com
References: <E14duXV-0006Vi-00@whittlesey.cl.cam.ac.uk>
Content-Transfer-Encoding: 7bit
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
To: linux-lvm@sistina.com

> [ Is there a version for easy parsing by perl scripts ? ]

use m{blah}sg  to grab the thing as a single string and 
grab the portions you want, e.g.,

	my @whatever = $foo = /whatever/gs;

allows whatever to contain '.' that will match newlines.

> 
> worsdell:~: cat /proc/lvm/global
> LVM driver version 0.9.1_beta6 (12/03/2001)
> 
> Total:  1 VG  2 PVs  3 LVs (3 LVs open 3 times)
> 
> Global: 7275 bytes malloced   IOP version: 10   0:03:02 active
> 
> VG:  vg01  [2 PV, 3 LV/3 open]  PE Size: 4096 KB
>   Usage [KB/PE]: 1593344 /389 total  516096 /126 used  1077248 /263 free
>   PVs: [AA] part1                  1044480 /255       516096 /126       528384
> /129
>        [AA] part6                   548864 /134            0 /0         548864
> /134
>     LVs: [AWDL  ] tmp                         106496 /26       1x open
>          [AWDL  ] repl                        307200 /75       1x open
>          [AWDL  ] scratch                     102400 /25       1x open
> worsdell:~:
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm

-- 
 Steven Lembark                                   2930 W. Palmer St.
                                                 Chicago, IL  60647
 lembark@wrkhors.com                                   800-762-1582
