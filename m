From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] RAID1/LVM lost my volume group
Message-Id: <20020305002147.A13751@sistina.com>
References: <3C83ADC8.50405@eecs.umich.edu>
MIME-Version: 1.0
In-Reply-To: <3C83ADC8.50405@eecs.umich.edu>; from cchamilt@eecs.umich.edu
    on Tue, Mar 05, 2002 at 01:24:24AM +0800
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
Date: Mon Mar  4 17:23:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Chris,

do you still have the metadata backup files in /etc/lvmconf/ ?
If yes, please send me all which belong to your missing VG for recovery
in private email to mge@sistina.com.

On Tue, Mar 05, 2002 at 01:24:24AM +0800, Chris Hamilton wrote:
> Hi, I have 4 drives set up as 2 RAID1s with a striped LVM across them.  
> 
> After rebooting a few times vgscan and vgchange have stopped finding my 
> volume group.
> The pv* tools confirm that the physical volumes are still intact. 
>  Everytime I try to call
> vgcfgrestore or really any vg tool, they segfault if I specify the group.
> 
> I have been using 2.4.19-pre1-ac1, 2.4.19-pre2-ac2 on a glibc 2.2.4 
> system with lvm 1.03.
> The filesystem is (was) ext3.  Is there any way to get this recovered? 
>  Why could it have happened?
> 
> If I do have to start from zero, is there a recommended RAID 10-like 
> configuration for LVM I can use?  My goal is to have 10 reliability and 
> snapshots for backup.
> 
> Thanks,
> Chris Hamilton
> 
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
