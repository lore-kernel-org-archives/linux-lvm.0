From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Migration to lvm on a new HDD
Message-ID: <20031007153045.A25676@sistina.com>
References: <20031007125916.GA3999@tangerine.coulon.evette>
Mime-Version: 1.0
In-Reply-To: <20031007125916.GA3999@tangerine.coulon.evette>; from jean-luc.coulon@wanadoo.fr on Tue, Oct 07, 2003 at 02:59:16PM +0200
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
Date: Tue Oct  7 08:44:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Jean-Luc,

if you essentially want to replace your old disk with the new one (which might be
bigger as well ?), you need to "pvcreate /dev/hdb2", vgextend the existing vg00
with it (vgextend vg00 /dev/hdb2) and move all LVM data over using 
"pvmove /dev/hda2". After that you remove your hda from the system
("vgreduce vg00 /dev/hda2" before you shutdown), make the new disk the master
and boot. In your bootscript, vgscan should already get started and that
takes care of the changing device nodes for you.

Don't forget to have a backup of your data in case something goes wrong.

Regards,
Heinz    -- The LVM Guy --


On Tue, Oct 07, 2003 at 02:59:16PM +0200, Jean-Luc Coulon (f5ibh) wrote:
> Hi,
> 
> I've a new HDD it is mounted as slave.
> I plan to use it with LVM and use it as the master device.
> 
> Today, I boot linux from /dev/hda
> The new disk has a linux /boot partition as /dev/hdb1 and a lvm  
> partition as /dev/hdb2.
> 
> I've created the volume group called vg00 and the logical volumes I  
> need (var, home, root...) on  /dev/hda2.
> 
> When I will move the disk from slave to master, it will change its  
> partition name from hdb to hda but the devices in /dev (/dev/vg00/ 
> something) are hosted by the old disk.
> 
> Do I've to copy the /dev/vg00 so well?
> 
> Do I've to edit something else than the /tc/fstab to have a bootable  
> system on the new disk?
> 
> ---
> Regards
> 		- Jean-Luc
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

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
