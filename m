Return-Path: <josv@osp.nl>
Date: Fri, 1 Jun 2001 11:04:12 +0200
From: Jos Visser <josv@osp.nl>
Subject: Re: [linux-lvm] changing SCSI IDs ?
Message-ID: <20010601110412.H620@jadzia.josv.com>
References: <m2bso894wn.fsf@isnogud.escape.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <m2bso894wn.fsf@isnogud.escape.de>; from urs@isnogud.escape.de on Fri, Jun 01, 2001 at 06:54:00AM +0200
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

A vgscan will scan all drives and correlate the information correctly.
The actual disk device names (SCSI id's) do not matter. The LVM header
of each PV contains volume group identification information (name and a
unique identifier) that allows it to gather all disks of a VG together.
The header does *not* contain the actual device file names, only which
VG the disk belongs to and what its sequence number within the VG is...

++Jos

And thus it came to pass that Urs Thuermann wrote:
(on Fri, Jun 01, 2001 at 06:54:00AM +0200 to be exact)

> Will my LVs continue to work, if the device names and minor device
> numbers of my SCSI disks change?
> 
> I have installed a new 9GB SCSI drive which will eventually replace
> two of my older 4.3GB drives.  I want to make the new drive a single
> PV.  This is roughly what I plan to do:
> 
>     pvcreate /dev/sdd1
>     vgcreate vg0 /dev/sdd1
>     lvcreate -n 0 vg0
>     lvcreate -n 1 vg0
>     ...
>     
>     mount /dev/vg0/0 /mnt
>     tar clS -C / -f - . | tar xp -C /mnt -f -
>     umount /dev/vg0/0
>     
>     mount /dev/vg0/1 /mnt
>     tar clS -C /usr -f - . | tar xp -C /mnt -f -
>     umount /dev/vg0/1
>     ...
>     
>     vi /etc/fstab	# change device names from /dev/sd... to /dev/vg0/...
>     shutdown -h now
> 
>     remove /dev/sda and /dev/sdb, change SCSI IDs, so that
>     the former sdd becomes sda and
>     the former sdc becomes sdb.
> 
> 
> Will this work?  Or will vgscan find a VG which uses the PV on
> /dev/sdd1 as created with vgcreate?  This wouldn't work since
> /dev/sdd1 is now /dev/sda1.
> 
> 
> urs
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

-- 
If you do what you've always done,
You get what you've always gotten...
