Message-ID: <400F1035.40401@stevek.com>
From: Steve Kann <stevek@stevek.com>
MIME-Version: 1.0
References: <400C5158.2000000@stevek.com>
In-Reply-To: <400C5158.2000000@stevek.com>
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Re: Cannot create snapshots with kernel 2.4.24, lvm 1.0.4: Cannor
 allocate memory
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
Date: Wed Jan 21 18:51:02 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Hi List,

    Thanks to some helpful off-list help from someone on the list, I've 
found out that the trouble is related to using LVM with a HIMEM kernel.  
I have rebuilt a new kernel without himem support, and snapshots are now 
working.

    On the other hand, if I run this way, I'll have 3GB of memory 
basically sitting there doing not much else other than contributing to 
chassis heat.

    I also have to get the VFS-Lock patch in there (i'm building a 
patched kernel now to test it) before snapshots are really useful.

    So, does anyone either (a) know what the problem is, or (b) at least 
know where I should look to try and fix it?  I'm guessing that the 
problem has been solved at least by some of the commerical distros..

Thanks.

-SteveK


Steve Kann wrote:

>
>
> Hi,
>
>    I've seen some others on this (and other lists) who are having this 
> problem, but I haven't been able to find a solution.
>
>    I have a new box that I'd like to use with LVM.  This will be a 
> production fileserver.  I've installed debian woody on it, and 
> upgraded to the latest debian kernel, 2.4.24.  I'm using the lvm 1.0.4 
> tools.
>
>    Naturally, I'm spending this time before this box is in use to play 
> with LVM so I know how to do what I need to quickly before the fires 
> hit.  So, I've been able to happily create, grow, shrink, and remove 
> lv's, as well as create and remove VGs and PVs.
>
>    However, I cannot create a snapshot volume.
>
>    This is pretty much why I wanted to use LVM in the first place 
> (backing up a 400G active filesystem would be pretty impossible 
> otherwise).
>
>    The basic error I get is:
>
>  520  vgcreate -s 128M vg0 /dev/sda7
>  521  vgdisplay
>  522  lvcreate -L 256M  -nhome vg0
>
> u2:~# lvcreate -s -L128M -c 4k -nhomesnap /dev/vg0/home
> lvcreate -- WARNING: the snapshot will be automatically disabled once 
> it gets full
> lvcreate -- ERROR "Cannot allocate memory" creating VGDA for 
> "/dev/vg0/homesnap" in kernel
>
> Other snapshot creation attempts, all of which fail the same way:
>  525  lvcreate -s -L1M -nhomesnap /dev/vg0/home
>  526  lvcreate -s -L128M -c 1M -nhomesnap /dev/vg0/home
>
>
>    I've tried making a bunch of different volumes on which to base the 
> snapshot, as well as a number of different parameters for the snapshot 
> itself.  I thought that perhaps it couldn't handle snapshots that were 
> larger than a certain size, or snapshots of volumes that are beyond a 
> certain size, etc.
>
>    I should have plenty of memory:
> u2:~# free
>             total       used       free     shared    buffers     cached
> Mem:       4010744     111160    3899584          0      18444      58084
> -/+ buffers/cache:      34632    3976112
> Swap:      2097136          0    2097136
>
> If 3.8GB of Real, or 5.8 GB of virtual memory aren't actually enough 
> to create a 128MB snapshot of a 256Mb volume (I tried making it very 
> small!), then something must be very wrong!
>
> Any ideas?
>
>
>
