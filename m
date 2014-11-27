Received: from o.ww.redhat.com (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id sARCqJlW008690
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NO)
	for <linux-lvm@redhat.com>; Thu, 27 Nov 2014 07:52:23 -0500
Message-ID: <54771E83.2090003@redhat.com>
Date: Thu, 27 Nov 2014 13:52:19 +0100
From: Heinz Mauelshagen <heinzm@redhat.com>
MIME-Version: 1.0
References: <alpine.DEB.2.02.1411242255300.12886@jlaw-desktop.mno.stratus.com>	<CAJCQCtQauJQkKjYL6-hxYkquCHL2yXSo4034jfiJxUPO7Nw2dQ@mail.gmail.com>
	<20141126082055.72680602@jlaw-desktop.mno.stratus.com>
In-Reply-To: <20141126082055.72680602@jlaw-desktop.mno.stratus.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] LVM RAID1 syncing component
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


With DM/LVM it is always the last images added when converting (to)
raid1; see "lvs -a".

If you for instance convert from linear to raid1 with "lvconvert -m1 
--type raid1  $LV",
the second (and last) device named /dev/$VG/${LV}_rimage_1 will be 
resynchronized
from the first /dev/$VG/${LV}_rimage_0 (i.e. the former linear device).

As mentioned below, the copy_percent aka sync_percent tells you how far 
the sync process got
unless 100% when it's finished.

-- lvmguy


On 11/26/2014 02:20 PM, Joe Lawrence wrote:
> On Tue, 25 Nov 2014 22:42:38 -0700
> Chris Murphy <lists@colorremedies.com> wrote:
>
>> On Mon, Nov 24, 2014 at 9:07 PM, Joe Lawrence <joe.lawrence@stratus.com> wrote:
>>> Does anyone know how its possible to determine which side of an LVM RAID 1
>>> is the stale partner during RAID resync?
>>>
>>> In ordinary MD RAID, I believe you can check
>>> /sys/block/md0/md/dev-XXX/state, but LVM RAID seems to hide those files
>>> when leveraging the MD code.  I've looked though pvs/vgs/lvs manpages, but
>>> can't figure anything out there either.
>> Rather indirectly: iotop which will show you which devices are mostly
>> being read from and written to.
>>
>> # lvs -a -o copy_percent
>> Anything less than 100% is syncing. I think.
>>
> >From the manpages I see the following attribute bits:
>
> * lvs, lv_attr bit Volume Health: (p)artial
> * vgs, vg_attr bit (p)artial: one or more physical volumes belonging
>         to the volume group are missing from the system
> * pvs, pv_attr bit (m)issing
>
> along with the lvs copy_percent (is this similar to sync_percent) that
> you mentioned.  That's about it.
>
> Since there seems to be no real underlying MD device, I'm assuming that
> ioctls are out of the question as well.
>
> -- Joe
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
