Return-Path: <Heinz.Mauelshagen@Sistina.com>
Date: Tue, 24 Jul 2001 16:38:00 +0200
From: "Heinz J . Mauelshagen" <mge@Sistina.com>
Subject: Re: [linux-lvm] pb with pvcreate and partition tables
Message-ID: <20010724163800.B19059@sistina.com>
References: <3B5D127D.E932FDD1@atix.de>
Mime-Version: 1.0
In-Reply-To: <3B5D127D.E932FDD1@atix.de>; from julien@atix.de on Tue, Jul 24, 2001 at 08:15:25AM +0200
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
To: linux-lvm@Sistina.com

Julien,

hda16 == hdb?

Something with your /dev setup looks strange.


On Tue, Jul 24, 2001 at 08:15:25AM +0200, Julien Baboud wrote:
> hi,
> 
>  I use LVM with the 0.9 beta 7 on a SuSE 7.1 distrib and
>  i've encoutered a pb with pvcreate on a partition that is set to the
> LVM type (and was another type before, which is the source of the pb).
> Here is
> the output of the command i used :
> 
>  %pvcreate /dev/hda16 
> 
>  pvcreate -- device "/dev/hda16" has a partition table 
>  pvcreate [-d|--debug] [-f[f]|--force [--force]] [-h|--help] [-y|--yes]
>          [-v|--verbose] [-V|--version] PhysicalVolume
> [PhysicalVolume...]
> 
> 
> and the -f option show me the same output.
> 
>  I don't know if it's a pb with LVM or with fdisk wich i use to set the
> type of the partitions, but i would appreciate if any could tell me a 
> solution to correct this.
> 
> 
>  tanx.
>  julien, for ATIX
> 
>  join the LVM Republic
> ------------------------
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
