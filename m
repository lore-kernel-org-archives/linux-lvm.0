Message-ID: <5F2C72E5CC01D511BE3D0008C75B9AD8039A2DAB@RDGEXH03>
From: Jon Lacey <Jon.Lacey@exprogroup.com>
Subject: RE: [linux-lvm] Help configuring LVM
MIME-Version: 1.0
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
Date: Thu Feb  6 06:04:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

Heinz, thanks for your help.

I have decided to take your advice, re having / on a logical volume.

I have created a volume group with my other three drives, then created
logical volumes and copied over /usr /home /var. I will see how this goes.

Thanks for your help.

Jon L.

-----Original Message-----
From: Heinz J . Mauelshagen [mailto:mauelshagen@sistina.com] 
Sent: 06 February 2003 10:49
To: linux-lvm@sistina.com
Subject: Re: [linux-lvm] Help configuring LVM


Jon,

having root on a logical volume needs an initrd which causes hassle in
case soemthing goes wrong at boot and you don't have an emergency boot media
with all necessary sw (i.e. LVM etc.) on it.
It is doable but there's traps.

Having a relatively large root filesystem doesn't make that much sense IRT
backups and system resilience (one smaller filesystem fails and you
just repair that one rather than everything).
Split filesystems and have /, /home, /usr, /opt, /tmp, /var, ... seperately
to achive this. Having a 100MB root is sufficient and there's no need to
have it on an logical volume then.


That said and assuming you still want to go for it, you need to roughly
do the followoing (say your VG is named "system" and your rot LV "root"):

- set the partition type of /dev/hd[b-d]1 to Linux LVM (0x8E)

- pvcreate /dev/hd[b-d]1

- vgcreate system /dev/hd[b-d]1

- use vgdisplay to find out the total number of free PEs in the VG "system"
  and replace $Free_PE by that amount below

- lvcreate -n root -l $Free_PE system

- make a filesystem of your choice on /dev/system/root

- mount it somewhere

- copy all files from / over to your /dev/system/root filesystem

- create an inital ram disk using mkinitrd (not familiar if that comes
  with slackware) or lvmcreate_initrd (which comes with LVM)

- setup your lilo/grub configuration to be able to boot you system with
  the new initrd you created in the previous step

- change /etc/fstab in the /dev/system/root filesystem to reflect that
  filesystem as root

- try to boot with root on /dev/system/root

- _IF_ that works

  - change the partiton type of /dev/hda3 tp Linux LVM

  - pvcreate /dev/hda3

  - vgextend system /dev/hda3


Now you should have /dev/hda3 and /dev/hd[b-d]1 in volume group "system"
with the capacity of /dev/hda3 still free for new LVs or extension
of /dev/system/root.

Don't forget to take backups (in particular of /etc/lvmconf/*) !

Regards,
Heinz    -- The LVM Guy --


On Tue, Feb 04, 2003 at 09:00:26AM -0000, Jon Lacey wrote:
> Hi, I have looked at the HOWTO's and FAQ's and cannot seem to solve my
> problem, maybe it's me.
> 
>  
> 
> I do not seem, while installing Slackware 8, to be able to build LVM into
> the install, so I was hoping to be able to do a minimal install and then
add
> a logical volume and move me data.
> 
>  
> 
> I have installed Slackware (a very basic setup) as:
> 
> /dev/hda1 100 MB mounted as /boot
> 
> /dev/hda2 200 MB as Swap
> 
> /dev/hda3 800MB mounted as /
> 
>  
> 
> I have three more drives, all 1 GIG drives. /dev/hdb1 /dev/hdc1 /dev/hdd1 
> 
> What I would like to do is to amalgamate them all into one large volume,
> include /dev/hda3 as part of the volume and have it all mounted as /
> 
>  
> 
> So I hope to end up with a volume group, say vg1, consisting of a single
> volume, say vol1, copy data over from /dev/hda3 and then mount vol1 as /
> 
>  
> 
> Is there anywhere I can go to see an example of doing this/ or can someone
> help.
> 
>  
> 
>  
> 
> Thanks
> 
> Jon L.
> 
> 
> ----------------------------------------------------------------------
> Important Notice: 
> The information in this email is confidential and may be
legally-privileged.  
> If you have reason to believe you are not the intended recipient, any
disclosure, 
> copying, distribution or any action taken or omitted to be taken in
reliance on 
> it is prohibited and may be unlawful and you are requested to contact the
sender 
> urgently and dispose of this email 
> -----------------------------------------------------------exp.

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
=-

_______________________________________________
linux-lvm mailing list
linux-lvm@sistina.com
http://lists.sistina.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
 

 


 
