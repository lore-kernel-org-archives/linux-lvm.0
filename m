From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Question on shared storage volumes.
Message-ID: <20030710113012.C23240@sistina.com>
References: <3F0D2788.76BB0BCB@in.ibm.com>
Mime-Version: 1.0
In-Reply-To: <3F0D2788.76BB0BCB@in.ibm.com>; from sachinp@in.ibm.com on Thu, Jul 10, 2003 at 02:14:56PM +0530
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
Date: Thu Jul 10 04:32:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Sachin,

after M1 died, you should run "vgscan ; vgchange -ay HA_VG" on M2
to activate the VG there.


On Thu, Jul 10, 2003 at 02:14:56PM +0530, Sachin Sant wrote:
> I have a SCSI storage unit shared between two machines M1 and M2. On one
> of the machine M1 i create a volume group HA_VG , create a LV vol1 and
> filesystem using the LV vol1.
> 
> --- >vgcreate HA_VG /dev/sdd /dev/sde /dev/sdf
> --- >lvcreate -i 3 -I 8 -L 100 -n vol1 HA_VG
> --- >mkfs /dev/HA_VG/vol1
> --- >mount /dev/HA_VG/vol1 /mnt
> 
> Now for some reason machine M1 dies and the VG is not exported. Using
> the second machine M2 if i try to forcefully import the vg , vgimport
> command coredumps.
> 
> --- >vgimport -f HA_VG /dev/sdd /dev/sde /dev/sdf
> Segmentation fault
> 
> Should vgimport coredump here. I guess this is not the right way to
> recove the VG . [ I can recover the VG on machine M2 using vgscan /
> vgchange -a y HA_VG ]
> 
> I believe the problem might be with the following piece of code in
> vgimport.c
> 
> strncpy ( vg_name_this,
>           pv_this[0]->vg_name,
>           strlen ( pv_this[0]->vg_name) - strlen ( EXPORTED));

Right, it shouldn't get there, because the VG wasn't exported.

> 
> Here the difference between strlen will be calculated as -1 in the above
> senario.
> 
> May be the right way would be just print a error message instead of a
> core dump.
> 
> Just let me know your thoughts. 
> 
> -Sachin
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
