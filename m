Return-Path: <cognac@toppoint.de>
Date: Sun, 15 Jul 2001 14:56:47 +0200
From: Andreas Czerniak <cognac@toppoint.de>
Message-ID: <16210000.995201807@czerny>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Subject: [linux-lvm] q: lvm with kernel 2.4.4-suse and 2.4.6
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Dear,

i use a suse 2.4.4-suse (4GB) kernel with lvm-0.9.1_beta7 on a i386.

I update the kernel to 2.4.6 with included lvm-0.9.1_beta2. I download the 
latest version beta7 and patch the kernel (beta7 and get_hardsect_size 
patch). The lvm is compiled in the kernel and now, when i boot the new 
kernel, lvm can't find any of lvm-partitions.

under 2.4.4-suse i have:
lvscan -- 6 active logical volumes

Is there a way to verbose/debug the lvm disk scan during the boottime ?

Regards,
			Andreas.
---------------------------------------------------------------------------
Andreas Czerniak                                         cognac@toppoint.de
Kiel - FRG            May the source be with you.       Fax: +49-431-678454
PGPkey: http://wwwkeys.nl.pgp.net:11371/pks/lookup?op=get&search=0xEDB224EC
