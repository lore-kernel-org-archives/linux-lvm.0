From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] LVM and resize
Message-ID: <20031007155317.D25676@sistina.com>
References: <002701c38c15$b72cbc30$0201a8c0@ray1>
Mime-Version: 1.0
In-Reply-To: <002701c38c15$b72cbc30$0201a8c0@ray1>; from brad.p@frisurf.no on Mon, Oct 06, 2003 at 04:25:39PM +0200
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
Date: Tue Oct  7 09:06:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Looks like you are caught IRT to shrinking, because of the fsck errors.

If you're still able to mount the filesystem, you definitely want to take a backup
first in order to preserve as much of your files as possible.

Aftwards (presumably you can add another >=120g drive to your VG with vgextend) you
want to try moving the data off to that other disk using "pvmove -i ...", then
removing the failing one (vgreduce).

Using device-mapper/LVM2, which enables you to remove the drive in question
(removing LVs allocated to that drive as well), doesn't help you here, presumably
you just have that one huge Logical Volume.

Regards,
Heinz    -- The LVM Guy --

On Mon, Oct 06, 2003 at 04:25:39PM +0200, Reidar Westvik wrote:
> Hi,
> 
> I don't know if my question in something that Sistina supports, but i need some pointers to make this work.
> 
> We're running a Slackware 9.0 server with kernel 2.5.64 (gcc ver. 2.95.3 20010315) also on this server we have a LVM volume of 1TB spread over 120GB IDE disks. Now, it seems like one of the harddrives has failed in some way. Filesystem on the volume is EXT3.
> 
> When i mount the volume syslog says: "kernel: EXT3-fs warning: mounting fs with errors, running e3fschk is recommended" So i've unmounted the volume and run e2fschk on the LVM volume. After a long wait (2 days in fact) the server hangs, when its checking the part of the volume that is on hdf. The box just dies, and only a powercycle will bring it back up again. The syslogs displays the following info:
> "kernel: hdf: dma_timer_expiry: dma status == 0x61"
> "kernel: hdf: (__ide_dma_test_irq) called while not waiting""
> 
> These are the last events of syslog before it's starts to reboot.
> 
> Now, after what i've read the way to deal with this issue without loss of data is to shrink the volume with aprox. 120gb (there is enough free space) and then exclude the defective drive from the logical volume and its physical groups, and then add a healthy disk for so to increase the volume back to its original size.
> 
> However LVM resize tools will not allow resizing of a volume that has a filsystem marked with errors. And if i try to force the resize the server hangs. I have tryed to resize with both "e2fsadm" and "resize2fs" but they both have problem resizing since it has errors.
> 
> So this kinda puts me back to basics, is there a way for me to remove this disk without loosing data on the volume ?
> 
> All awnsers are very much apriciated! :)
> 
> Best Regards
> Reidar

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
