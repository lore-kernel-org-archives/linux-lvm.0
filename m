Return-Path: <weissel@netcologne.de>
From: Wolfgang Weisselberg <weissel@netcologne.de>
Date: Wed, 4 Jul 2001 02:43:04 +0200
Subject: Re: [linux-lvm] HowTo: EIDE/ATA-100 + RAID 1 + LVM
Message-ID: <20010704024304.A8019@tiger.bigcats.invalid>
References: <03b201c0fff4$aa4007c0$01e6a8c0@oulx> <20010628222856.E16466@dragon.blacknet.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20010628222856.E16466@dragon.blacknet.de>; from bock@blacknet.de on Thu, Jun 28, 2001 at 10:28:56PM +0200
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

Hi, Goetz!

Goetz Bock (bock@blacknet.de) wrote 80 lines:

>   (2x)RAM /dev/hd[ac]2  swap    putting swap onto raid does not make
>                                 sence to me. The 2.4.x kernel NEEDS

Swap on RAID will not give you speed (it will slow you rather),
but a HD failure will not crash the server, because suddenly
the swap has gone.  And without stability even over the loss of
a HD -- what is RAID worth?  Speed you can gain by striping
partitions -- at the cost of having to hope that all HDs
survive, instead of a quorum as with RAID.

-Wolfgang
