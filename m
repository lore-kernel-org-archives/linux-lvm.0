From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Reclaim free space
Message-ID: <20031218230029.C18654@sistina.com>
References: <3FE21CA1.6040201@onsitetech.com>
Mime-Version: 1.0
In-Reply-To: <3FE21CA1.6040201@onsitetech.com>; from ib@onsitetech.com on Thu, Dec 18, 2003 at 01:31:13PM -0800
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
Date: Thu Dec 18 16:06:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Dec 18, 2003 at 01:31:13PM -0800, Ian Burrell wrote:
> How do I reclaim the free space when a logical volume is reduced?  I am 
> using a volume group on one physical volume and three logical volumes.
> 
> I wanted to split off /usr/local and give it some space from reducing 
> another volume.  I shrank the existing logical volume with "ext2fsadm". 

Hi Ian,

did e2fsadm display some error ?
That would explain that you didn't get more free space in the VG,
because the LV won't be reduced in that case.

I guess with 'allocated space' you mean the sum of the filesystem space.
Check with "tune2fs -l ..." what the actual filesystem sizes are
and how that fits the LV sizses (vgdisplay -v / lvdisplay -v /dev/VG/LV).

>   After, the volume group had the same amount of free space as before. 
> I went ahead and created the new LV in that free space but would like to 
> make it bigger.  Now "vgdisplay" shows the volume group as being 
> completely full.  Except the allocated space for the logical volumes are 
> less than the total space.
> 
>   - Ian
> 
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

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
