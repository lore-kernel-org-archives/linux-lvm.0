Date: Tue, 16 Oct 2001 10:55:33 +0200
From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] replace bad hard disc
Message-ID: <20011016105533.A4318@sistina.com>
References: <110278234233.20011015163039@difi.de>
Mime-Version: 1.0
In-Reply-To: <110278234233.20011015163039@difi.de>; from Stefan.Onken@difi.de on Mon, Oct 15, 2001 at 04:30:39PM +0200
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

Stefan,

add a new hard drive to your system and create (at least) an LVM partition
(Type 0x8E) on it. Let's call the new one /dev/sde1 and your flaky one
/dev/sdd1 just for the purpose of this example.

Then:

pvcreate /dev/sde1
vgextend Stonki2 /dev/sde1
pvmove /dev/sdd1 /dev/sde1
vgreduce Stonki2 /dev/sdd1

After this went ok you can uninstall the flaky drive from your system
and start to disassemble it in order to create some nice wallclocks ;-)

In case pvmove complains about read errors and stops before moving all
data over, please come back to me for further help.

Regards,
Heinz    -- The LVM Guy --

On Mon, Oct 15, 2001 at 04:30:39PM +0200, Stefan Onken wrote:
> Hello,
> 
>  I already looked in the How-to and FAQ, but I do not find any
>  step by step tutorial to change a bad hard disc in a LVM System.
> 
>  I have two hard discs, 100 Gig + 60 Gig with reiserfs. The 60gig
>  hard drive has some bad blocks, so I would like to replace it
>  with a new hard disc. May anyone please be so kind and give me a
>  helping hand for this problem....
>  
> linux:~ # lvscan
> lvscan -- ACTIVE            "/dev/Stonki2/LV_Stonki2" [150.59 GB]
> lvscan -- 1 logical volumes with 150.59 GB total in 1 volume group
> lvscan -- 1 active logical volumes
> 
> 
> 
> linux:~ # lvdisplay /dev/Stonki2/LV_Stonki2
> --- Logical volume ---
> LV Name                /dev/Stonki2/LV_Stonki2
> VG Name                Stonki2
> LV Write Access        read/write
> LV Status              available
> LV #                   1
> # open                 1
> LV Size                150.59 GB
> Current LE             38550
> Allocated LE           38550
> Allocation             next free
> Read ahead sectors     120
> Block device           58:0
> 
> 
> thanks anyway...
> 
> cu
> 
> stonki
> 
> 
> -- 
> The More I See, The More I Know. The More I Know, The Less I Understand
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

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
