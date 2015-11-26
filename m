Received: from [10.34.130.160] (dhcp130-160.brq.redhat.com [10.34.130.160])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tAQE7r2L016046
	for <linux-lvm@redhat.com>; Thu, 26 Nov 2015 09:07:53 -0500
References: <5654335A.5050702@manchester.ac.uk>
	<22100.38142.696227.209012@quad.stoffel.home>
	<5656DEFB.7020602@manchester.ac.uk>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <56571238.70206@redhat.com>
Date: Thu, 26 Nov 2015 15:07:52 +0100
MIME-Version: 1.0
In-Reply-To: <5656DEFB.7020602@manchester.ac.uk>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Problems creating/converting large logical volume
	to RAID1
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

Dne 26.11.2015 v 11:29 Tony Arnold napsal(a):
> John,
>
> On 24/11/15 16:49, John Stoffel wrote:
>
>> Can I make a suggestion to you?  Instead of trying to do the mirroring
>> in LVM, build yourself an MD mirror, then layer LVM ontop of that
>> instead.  You get nice seperation.
>>
>> You can also take that /dev/sdb3, make it into an MD RAID1 array with
>> just one device, add it into the VG, then move the LVs onto the new
>> device.  Once that's done, you remove the sda3 from the VG, then add
>> it into the MD device.  Something like this...
>>
>>> mdadm --create /dev/md1 --level=1 --raid-devices=2 /dev/sdb3 missing
>>> cat /proc/mdstat
>>> pvcreate -v /dev/md1
>>> vgextend -v vg0 /dev/md1
>>> pvmove -v sda3
>>> vgreduce -v vg0 sda3
>>> mdadm --add /dev/md0 /dev/sda3
>>> cat /proc/mdstat
>>
>> And you will now be mirrored, etc.
>
> Thanks for your suggestion which I have now implemented. The pvmove took
> a few hours (1.5TB to move!) and then also some more hours while the
> mirror set synchronised. But it's all done and I now have my volumes
> mirrored.
>
> I'm still curious though why the LVM based RAID1 didn't work. I'll just
> have to stay curious!

4.1  & 4.2  kernel has broken RAID

DO NOT USE  (at least with lvm2 - but since the flaw there is md driver
I assume mdadm is affected as well)

Switch to 4.3 please.

Regards

Zdenek
