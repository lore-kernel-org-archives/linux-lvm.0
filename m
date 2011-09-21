Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p8LIWcEH031942
	for <linux-lvm@redhat.com>; Wed, 21 Sep 2011 14:32:39 -0400
Received: from mail-ey0-f174.google.com (mail-ey0-f174.google.com
	[209.85.215.174])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p8LIWaDb001773
	for <linux-lvm@redhat.com>; Wed, 21 Sep 2011 14:32:36 -0400
Received: by eya28 with SMTP id 28so1648926eya.33
	for <linux-lvm@redhat.com>; Wed, 21 Sep 2011 11:32:35 -0700 (PDT)
Sender: Gijs Boer <blizzeye@gmail.com>
Message-ID: <4E7A2DBC.4010701@bsnw.nl>
Date: Wed, 21 Sep 2011 20:32:28 +0200
From: Gijs <info@bsnw.nl>
MIME-Version: 1.0
References: <4E75F91D.4000601@bsnw.nl>
	<8f3368df-7c8b-4741-b859-d10e3eb56a24@email.android.com>
	<4E777DED.4090302@bsnw.nl> <20110919134814.72bd8c3d@bettercgi.com>
	<4E779C7F.9010507@bsnw.nl> <20110919154141.3ab847af@bettercgi.com>
In-Reply-To: <20110919154141.3ab847af@bettercgi.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] LVM pretends it has more space than it actually has
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Unfortunately I can't find all the old LVM configs that the system used. 
I was in the process of moving my root filesystem to the raid-5 array. 
Since I needed the root to be unmounted for that, I used a FC15 
USB-bootable rescue system to do the copying of the root to the raid-5 
array. And that's when things went wrong. Since the rescue system is 
pretty much run from memory, I don't have the LVM configs that were 
created when I was using the rescue system. I do have older configs that 
were created when I was creating the raid-5 array on the system itself, 
but those don't show anything wrong from what I can see. (and I guess 
that's correct, since nothing was wrong at that time)

I tried assembling/recreating an array on the PV-device, but that just 
gave me the error "mdadm: no raid-devices specified." So I can't really 
find an array on the LVM devices either.

Some info I got from the PV:
[root@poseidon ~]# pvdisplay -m /dev/md127
   --- Physical volume ---
   PV Name               /dev/md127
   VG Name               raid-5
   PV Size               3.64 TiB / not usable 0
   Allocatable           yes
   PE Size               4.00 MiB
   Total PE              952919
   Free PE               5252
   Allocated PE          947667
   PV UUID               ZmJtA4-cZBL-kuXT-53Ie-7o1C-7oro-uw5GB6

   --- Physical Segments ---
   Physical extent 0 to 714687:
     Logical volume      /dev/raid-5/data
     Logical extents     0 to 714687
   Physical extent 714688 to 714933:
     FREE
   Physical extent 714934 to 714953:
     Logical volume      /dev/raid-5/data
     Logical extents     947647 to 947666
   Physical extent 714954 to 719959:
     FREE
   Physical extent 719960 to 952918:
     Logical volume      /dev/raid-5/data
     Logical extents     714688 to 947646

The empty spaces inbetween are from LVs there were created before. And 
the 3rd segment is from when I tried to resize the data-LV to see if 
that made any difference. It obviously didn't since it was the PV that 
was actually too small, not the LV, which I figured out later.

 From what you say, it indeed sounds like I messed up some command that 
caused an array to be created on an LV, but I can't really find any 
evidence that I really did that. Is there any other explanation that LVM 
is acting this way? Is it perhaps possible to tell LVM to run of the 
configuration stored in /etc/lvm, instead of the metadata embedded on 
the PV?

There's also something that I don't understand. Why is it just the 
data-LV? I had a swap and root LV as well, and those activated just 
fine. Why would LVM have trouble activating the data-LV when it had no 
trouble activating the swap/root-LV?

On 19-9-2011 22:41, Ray Morris wrote:
> First, if at all possible make a copy of the underlying block
> device using dd or dd_rescue. Very often the most severe damage
> is done during the attempt at recovery.
>
> Then let's find the oldest back up copies on the LVM meta data to
> see if we can verify how things were set up when they were working.
> This will find metadata over 50 days old:
>
> find /etc/lvm/archive -mtime +50
>
> mainly what we're looking for is to see if any mdadm RAID devices
> were used as PVs at some point.
>
> Next try mdadm --assemble --readonly --assume-clean /dev/sdFOO to see
> if you can assemble an array using the lower level device (which is
> also marked as a PV right now). If it assembles, do:
> pvdisplay -m /dev/md0
> to see if it's a PV, and check to see if it has a filesystem.
>
> Based on the messages you got, it looks like /dev/md0 at one point
> was the PV, rather than being assembled from LVs.
