Received: from [10.34.130.160] (dhcp130-160.brq.redhat.com [10.34.130.160])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t8F8fCeP000470
	for <linux-lvm@redhat.com>; Tue, 15 Sep 2015 04:41:13 -0400
References: <55F70C58.5010205@windriver.com> <55F71650.7070907@redhat.com>
	<55F71D24.9010903@windriver.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <55F7D9A8.5020005@redhat.com>
Date: Tue, 15 Sep 2015 10:41:12 +0200
MIME-Version: 1.0
In-Reply-To: <55F71D24.9010903@windriver.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Any way to speed up activation of volumes with
	snapshots?
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

Dne 14.9.2015 v 21:16 Chris Friesen napsal(a):
> On 09/14/2015 12:47 PM, Zdenek Kabelac wrote:
>> Dne 14.9.2015 v 20:05 Chris Friesen napsal(a):
>>> Hi,
>>>
>>> I'm running a 3.10 kernel with LVM 2.02.95.
>>>
>>> I'm running into a problem where activating snapshots can take quite a long
>>> time, roughly one minute per 25GB of delta between the snapshot and the origin
>>> volume.  (See below for my test procedure.)
>>>
>>> I realize that my kernel/LVM aren't exactly bleeding edge, and I wondering
>>> whether more recent versions have done anything to speed up the activation
>>> process (like maybe making it more lazy-loaded rather than reading in a bunch
>>> of data up-front).
>>>
>>> If anyone is aware of such improvements, I'd appreciate it if you could point
>>> me at the appropriate changes.
>>
>> Hi
>>
>> There is NO way to accelerate your existing setup, other then placing delta on
>> SSD - the format of snapshot was meant to be used 'temporarily' - i.e. until
>> you
>> take backup of LV - but not for long-term multi-gigabyte case.
>>
>> This is major mis-use of this 'snapshot' feature - which repeats over and
>> over...
>>
>> If you want to use long-living snapshots - you need to use thin-provisioning,
>
> Thanks for the quick response.
>
> Presumably we would still have multi-GB of delta between the original volume
> and the snapshot, so what would make the activation of a thin-provisioned
> snapshot faster?  Is the metadata stored differently?

If you don't mind dropping existing snapshot and creating new 'old-snapshot' - 
using larger block size (i.e.  32K  (or even more) instead of 4K) may improve 
speed of disk reading noticeable (at the price of copying larger chunks when 
modifying disk blocks - depends on use-case)....

And if you don't mind replacing your ancient kernel and trying some newer one 
- there have been some 'read' order improvement for this old-snapshot target 
made as well - so you may at least try if there will be any noticeable change
(actually would be interesting just to get report how much faster it boots 
when you only exchange kernel for a boot - you don't have to use it - just 
measure boot speed)

Zdenek
