From: "Jean-Luc Coulon (f5ibh)" <jean-luc.coulon@wanadoo.fr>
Subject: =?iso-8859-1?B?UmWg?=
	=?iso-8859-1?Q?=3A?= [linux-lvm] Migration to lvm on a new HDD
Message-ID: <20031007190434.GA1479@tangerine.coulon.evette>
References: <20031007125916.GA3999@tangerine.coulon.evette> <20031007153045.A25676@sistina.com>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
Date: Tue Oct  7 14:05:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; format="Flowed"; delsp="Yes"; charset="utf-8"
To: linux-lvm@sistina.com
Cc: Mauelshagen@Sistina.com

Heinz,

Thanks for the reply.

In fact, I'm migrating from non LVM HDD to a bigger LVM one.
I've created the vg and the needed lv's.
I've copied all the files from the old disk to the right lv on the new  
hdd.
I've updated the /etc/fstab on the new hdd to reflect the new  
'partionning' scheme.
I've built the initrd and setup a grub entry for booting the new hdd  
(still as slave).

Here is the grub block used:

title  Debian 3.0, GNU/Linux 2.4.22 - LVM
root (hd1,1)
kernel (hd1,0)/vmlinuz-2.4.22 root=/dev/vg00/root_lv reboot=warm
initrd (hd1,0)/initrd-lvm-2.4.22.gz


The system begin to boot with the message:

vgscan -- reading all physical volumes
vgscan -- found inactive volume group vg00
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created.

vgchange -- volume group "vg00" successfully activated

then:

cannot open root device "vg00/root_lv" or 00:00
please append a correct "root=" boot option.

and kernel panic ..

Any idea?

---
Regards
	Jean-Luc



Le 07.10.2003 15:30, Heinz J . Mauelshagen a �crit�:
> 
> Jean-Luc,
> 
> if you essentially want to replace your old disk with the new one
> (which might be
> bigger as well ?), you need to "pvcreate /dev/hdb2", vgextend the
> existing vg00
> with it (vgextend vg00 /dev/hdb2) and move all LVM data over using
> "pvmove /dev/hda2". After that you remove your hda from the system
> ("vgreduce vg00 /dev/hda2" before you shutdown), make the new disk  
> the
> master
> and boot. In your bootscript, vgscan should already get started and
> that
> takes care of the changing device nodes for you.
> 
> Don't forget to have a backup of your data in case something goes
> wrong.
> 
> Regards,
> Heinz    -- The LVM Guy --
> 
> 
> On Tue, Oct 07, 2003 at 02:59:16PM +0200, Jean-Luc Coulon (f5ibh)
> wrote:
> > Hi,
> >
> > I've a new HDD it is mounted as slave.
> > I plan to use it with LVM and use it as the master device.
> >
> > Today, I boot linux from /dev/hda
> > The new disk has a linux /boot partition as /dev/hdb1 and a lvm
> > partition as /dev/hdb2.
> >
> > I've created the volume group called vg00 and the logical volumes I
> 
> > need (var, home, root...) on  /dev/hda2.
> >
> > When I will move the disk from slave to master, it will change its
> > partition name from hdb to hda but the devices in /dev (/dev/vg00/
> > something) are hosted by the old disk.
> >
> > Do I've to copy the /dev/vg00 so well?
> >
> > Do I've to edit something else than the /tc/fstab to have a  
> bootable
> 
> > system on the new disk?
> >
> > ---
> > Regards
> > 		- Jean-Luc
> >
> >
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
> *** Software bugs are stupid.
>     Nevertheless it needs not so stupid people to solve them ***
> 
> =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
> =-=-=-=-=-
> 
> Heinz Mauelshagen                                 Sistina Software
> Inc.
> Senior Consultant/Developer                       Am Sonnenhang 11
>                                                   56242  
> Marienrachdorf
>                                                   Germany
> Mauelshagen@Sistina.com                           +49 2626 141200
>                                                        FAX 924446
> =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=- 
> =-=-=-=-=-
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
