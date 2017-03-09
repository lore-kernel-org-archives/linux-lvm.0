Received: from [10.34.130.176] (dhcp130-176.brq.redhat.com [10.34.130.176])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v29BkUIo024100
	for <linux-lvm@redhat.com>; Thu, 9 Mar 2017 06:46:31 -0500
References: <4f9b8bba-d219-fca3-3b48-41e732044021@suse.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <1ffc3903-4d55-ee1e-c58c-6fd3ea723856@redhat.com>
Date: Thu, 9 Mar 2017 12:46:29 +0100
MIME-Version: 1.0
In-Reply-To: <4f9b8bba-d219-fca3-3b48-41e732044021@suse.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] is it right to specify '-l' with all the free PE in
 VG when creating a thin pool?
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

Dne 9.3.2017 v 12:12 Eric Ren napsal(a):
> Hello,
>
> I find that it will fail to create a thin pool with all the free PE in VG as
> follows:
>
> # pvs
>   PV         VG   Fmt  Attr PSize   PFree
>   /dev/sdb        lvm2 ---  200.00g 200.00g
> # vgcreate vgtest /dev/sdb
>   Volume group "vgtest" successfully created
> # pvdisplay
>   --- Physical volume ---
>   PV Name               /dev/sdb
>   VG Name               vgtest
>   PV Size               200.00 GiB / not usable 32.00 MiB
>   Allocatable           yes
>   PE Size               4.00 MiB
>   Total PE              51192
>   Free PE               51192
>   Allocated PE          0
>   PV UUID               JD74c2-R4zZ-cgs5-c5Ty-1abQ-cf7l-gdSxzz
> # lvcreate -l 51192 --thinpool thinpool0 vgtest
>   Volume group "vgtest" has insufficient free space (51167 extents): 51192
> required.
>
> while it works when specifying '-l' this way:
>
> # lvcreate -l 100%FREE --thinpool thinpool0 vgtest
>   Logical volume "thinpool0" created.
>
> Is this something by design? or something may be wrong?
> I can replicate this on both:

Hi

Yes this is by DESIGN

When you specify '-l|-L'  you specify size of 'dataLV'  (logical size)
But then you need some more space for 'metadata' LVs (_tmeta & _pmspare)

-l100%FREE figure this automagically and reduces size a bit to fit in metadata LV.


Some 'future' version of lvm2 may support something like '--physicalsize' 
which will be 'a total size used for every allocation made by command).


Regards

Zdenek
