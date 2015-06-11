Received: from [10.34.131.225] (dhcp131-225.brq.redhat.com [10.34.131.225])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t5B7kpbR029772
	for <linux-lvm@redhat.com>; Thu, 11 Jun 2015 03:46:52 -0400
Message-ID: <55793CEA.7000500@redhat.com>
Date: Thu, 11 Jun 2015 09:46:50 +0200
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <CAAYit8QCcaGvb5QPw_Xuk+oavthHR1c32oB0GsGd+Ypk0rPtRg@mail.gmail.com>	<55704119.4000606@redhat.com>	<CAAYit8T2YTHCrGf2rPYdQUTQOGn3uZVQkEkJ-DCbj+9iovRw+g@mail.gmail.com>	<55715811.8020706@redhat.com>	<CAAYit8Q9f+u0FFjR9h6ssUUpZwxwnV5k1rbYeUATMaDn0Un35g@mail.gmail.com>	<557541A5.8050808@redhat.com>
	<CAAYit8SO2vwZa3o-ZTTZX=a9=SUafM16FuB8gQHCMDrk-Sw__Q@mail.gmail.com>
In-Reply-To: <CAAYit8SO2vwZa3o-ZTTZX=a9=SUafM16FuB8gQHCMDrk-Sw__Q@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] libdm cannot swap names between two child volumes
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
To: linux-lvm@redhat.com

Dne 11.6.2015 v 04:54 M.H. Tsai napsal(a):
> 2015-06-08 15:17 GMT+08:00 Zdenek Kabelac <zkabelac@redhat.com>:
>> It doesn't really matter here what you could confirm here - there is a race
>> you can't avoid - i.e. udev is completely 'independent' and may execute
>> trigger udev rules at any random point in time or some other command may try
>> to open device in parallel (i.e. 'dd')
>> So the only way how to ensure there is no such race - is to deactivate such
>> device (which should be possible - since as you said - noone has it open)
>> Also remember - activation routine is 'separate' from command code - as it
>> could run on a completely different node - so you cannot 'validate' from
>> command code there is no user of a device on 'activation' node unless device
>> is locally active.
>> Thus going through the proper sequence of steps and allowing udev to
>> properly synchronize (i.e. you should not 'mix'  activation & deactivation
>> under same cookie) is clearly the best way how to achieve your desired goal.
>
> Hi,
>
> Sorry for opening this question again. I could image the potential problem in
> name swapping. But does that mean, It's even unrecommended to rename
> an active device, although the target name are not used? The renaming path
> in LVM is not suggested ?
>
> ## this is not recommended
> # lvchange -ay vg1/lv1
> # lvrename vg1/lv1 vg1/lv2
>
> ## do this instead
> # lvchange -an vg1/lv1
> # lvrename vg1/lv1 vg1/lv2

Rename is fine as long as you are not reusing names while devices are still 
active.

Check which devices names are reported by i.e. mount after you rename a device 
- keep devices mounted and do rename like this:

lvcreate lv1
mkfs,mount lv1
lvrename lv1 -> lv2
lvcreate lv3
mkfs,mount lv3
lvrename lv3 -> lv1

Check 'mount' result or /proc/self/mountinfo

So doing such 'live' rename may lead to major confusion of system admin - 
since those device names might be completely different from reality in your 
/dev dir.

Zdenek
