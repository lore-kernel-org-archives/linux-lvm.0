Return-Path: <root@srv.sistina.com>
Date: Mon, 16 Jul 2001 13:27:55 +0200
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] q: lvm with kernel 2.4.4-suse and 2.4.6
Message-ID: <20010716132755.B11625@sistina.com>
References: <16210000.995201807@czerny>
Mime-Version: 1.0
In-Reply-To: <16210000.995201807@czerny>; from cognac@toppoint.de on Sun, Jul 15, 2001 at 02:56:47PM +0200
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

On Sun, Jul 15, 2001 at 02:56:47PM +0200, Andreas Czerniak wrote:
> Dear,
> 
> i use a suse 2.4.4-suse (4GB) kernel with lvm-0.9.1_beta7 on a i386.
> 
> I update the kernel to 2.4.6 with included lvm-0.9.1_beta2. I download the 
> latest version beta7 and patch the kernel (beta7 and get_hardsect_size 
> patch). The lvm is compiled in the kernel and now, when i boot the new 
> kernel, lvm can't find any of lvm-partitions.

In order to run Beta 7 tools you need to update your kernel as well.

Please follow INSTALL and PATCHES/README instructions.

> 
> under 2.4.4-suse i have:
> lvscan -- 6 active logical volumes
> 
> Is there a way to verbose/debug the lvm disk scan during the boottime ?
> 
> Regards,
> 			Andreas.
> ---------------------------------------------------------------------------
> Andreas Czerniak                                         cognac@toppoint.de
> Kiel - FRG            May the source be with you.       Fax: +49-431-678454
> PGPkey: http://wwwkeys.nl.pgp.net:11371/pks/lookup?op=get&search=0xEDB224EC
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

-- 

Regards,
Heinz    -- The LVM Guy --

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
