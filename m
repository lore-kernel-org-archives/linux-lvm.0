Return-Path: <darren_young@yahoo.com>
Message-ID: <20010506173613.78224.qmail@web10805.mail.yahoo.com>
Date: Sun, 6 May 2001 10:36:13 -0700 (PDT)
From: Darren Young <darren_young@yahoo.com>
Subject: RE: [linux-lvm] Can't pvcreate second partition...
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Funny, I had the same issue at the same time. I
created /dev/hdb7 with fdisk and then a pvcreate just
after. pvcreate stated that the dev didn't exist.
Reboot fixed the problem. This could be a problem for
machines already up in production with small windows
for restarts. Why is this necessary and will it become
a "non-issue" in future releases? If this will be
necessary forever, then some simple planning would
solve the problem, at least on new installations. Any
way around this?

On another note, I have a customer running Oracle that
wishes to move to a LVM configuration. They are
extremely reliant on the machine being up and it's
very active. Is LVM at a point where I can safely
install it on a critical system? Loaded question, I
know, but I need some honest feedback.

I finally have it up and running on two machines and
to those that have developed it, it's really freakin'
cool.

An off topic question, but I think this is the best
place to start. How could one build "network logical
volumes"? Let's say I have 5 machines running LVM and
each one has a 10G /export volume. I want to take all
the export volumes off each machine and create one
large "network volume" of 50G. Then, from each client
I would like to mount that volume at /bignet or
something. Maybe if it could do a pseudo raid across
the 5 machines. If machine a went down, then data
could be gotten from another one since it's striped. I
know I could do read only redundancy with NFS, but i'd
like to be able to write. I think MS calls their
solution to this type of scenario DFS. Something like
this around for UNIX? Specifically Linux, but also
Solaris. Any pointers or suggestions would be great.

Darren Young


-----Original Message-----
From: linux-lvm-admin@sistina.com
[mailto:linux-lvm-admin@sistina.com]On
Behalf Of Glenn Shannon
Sent: Friday, May 04, 2001 6:14 PM
To: linux-lvm@sistina.com
Subject: Re: [linux-lvm] Can't pvcreate second
partition...


"Diehl, Jeffrey" wrote:

> Hi all.
>
> I'm new to LVM, but think I understad it, at
least... <grin>
>
> Anyway, I'm trying to setup the first VG but can't
seem to build my PV's.
> The transcript of what I did is at the bottom of
this message.
>
> As you can see, I was able to do pvcreate on
/dev/sdc2, but not on
> /dev/sdc3.  These partitions are on a hardware
raid5.
>
> Am I missing something?
>
> Thanx,
> Mike Diehl,
> Network Monitoring Tool Devl.
> 284-3137
> jdiehl@sandia.gov
>
> Script started on Fri May  4 07:33:56 2001
> [root@filmore /mnt]# fdisk /dev/sdc
>
> The number of cylinders for this disk is set to
30945.
> There is nothing wrong with that, but this is larger
than 1024,
> and could in certain setups cause problems with:
> 1) software that runs at boot time (e.g., LILO)
> 2) booting and partitioning software from other OSs
>    (e.g., DOS FDISK, OS/2 FDISK)
>
> Command (m for help): p
>
> Disk /dev/sdc: 255 heads, 63 sectors, 30945
cylinders
> Units = cylinders of 16065 * 512 bytes
>
>    Device Boot    Start       End    Blocks   Id 
System
> /dev/sdc1             1     15472 124278808+  8e 
Unknown
> /dev/sdc2         15473     15476     32130   8e 
Unknown
> /dev/sdc3         15477     15480     32130   8e 
Unknown
> /dev/sdc4         15481     15484     32130   8e 
Unknown
>
> Command (m for help): w
> The partition table has been altered!
>
> Calling ioctl() to re-read partition table.
> Re-read table failed with error 16: Device or
resource busy.
> Reboot your system to ensure the partition table is
updated.
>
> WARNING: If you have created or modified any DOS 6.x
> partitions, please see the fdisk manual page for
additional
> information.
> Syncing disks.
>
> [root@filmore /mnt]# pvcreate /dev/sdc2
> pvcreate -- physical volume "/dev/sdc2" successfully
created
>
> [root@filmore /mnt]# pvcreate /dev/sdc3
> pvcreate -- can't open physical volume "/dev/sdc3"
to get its size
>
> pvcreate [-d|--debug] [-f[f]|--force [--force]]
[-h|--help] [-y|--yes]
>         [-v|--verbose] [-V|--version] PhysicalVolume
[PhysicalVolume...]
>
> Script done on Fri May  4 07:34:33 2001
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm

Can you try rebooting and trying the pvcreate again? I
suspect that it was
because the partition table was unable to be updated.

Glenn

_______________________________________________
linux-lvm mailing list
linux-lvm@sistina.com
http://lists.sistina.com/mailman/listinfo/linux-lvm

__________________________________________________
Do You Yahoo!?
Yahoo! Auctions - buy the things you want at great prices
http://auctions.yahoo.com/
