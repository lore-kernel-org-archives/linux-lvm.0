From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Problems with LVM 1.0.6
Message-ID: <20030225161700.B832@sistina.com>
References: <003b01c2dc43$f93d7830$0900a8c0@pcbas>
Mime-Version: 1.0
In-Reply-To: <003b01c2dc43$f93d7830$0900a8c0@pcbas>; from weblists@gmx.net on Mon, Feb 24, 2003 at 09:33:22PM +0100
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
Date: Tue Feb 25 09:23:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Feb 24, 2003 at 09:33:22PM +0100, Bas wrote:
> Hi there,
> 
> I'm using LVM 1.0.6 on 2.4.20 with devfs 1.99.17. I used LVM on 2 disks,
> with two different VG's.
> 
> It wasn't possible for me to create an LV as soon as it reached minor number
> 16. I seem to have deleted the output of this command, but it was "No such
> device or address". I deleted the other VG and it's LV's and recreated the
> LV and it worked.

Could it be that there was an old node still around from an unclean
volume group removal ?

"rm -r /dev/rootvg; vgmknodes" should clean this up for you in case it
happens again.

> 
> My setup is this:
> 1 on-board SCSI (Adaptec 7880) controller with one disk - sda.
> 1 PCI Adaptec 2940UW controller with one disk - sdb.
> 
> sda, Like sdb has 2 partitions. PV's were created on the second partitions.
> sda2 was rootvg, sdb2 was vg00. A couple of logical volumes with minor
> numbers 0-3 where on vg00, the rest was on rootvg.
> 
> pvdisplay -v /dev/sda2
> --- Physical volume ---
> PV Name               /dev/scsi/host0/bus0/target0/lun0/part2
> VG Name               rootvg
> PV Size               8.45 GB [17719695 secs] / NOT usable 16.19 MB [LVM:
> 130 KB]
> PV#                   1
> PV Status             available
> Allocatable           yes
> Cur LV                12
> PE Size (KByte)       16384
> Total PE              539
> Free PE               275
> Allocated PE          264
> PV UUID               l7p6er-GiqY-mYAW-Awsi-zB0h-CFUp-o9fga6
> 
> I wonder why 16.19MB would not be usable, since system/kernel/* logging
> doesn't report anything about failing disks.
> PE size is 16MB.

Because you choose to have a PE size of 16384K and LVM reserves at least 1
PE for future metadata extension.

Not to worry about with 8G ;)

> 
> Thanks,
> Bas.
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
