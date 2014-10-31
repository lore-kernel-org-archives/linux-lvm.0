Message-ID: <54539A35.9050601@redhat.com>
Date: Fri, 31 Oct 2014 15:18:29 +0100
From: Peter Rajnoha <prajnoha@redhat.com>
MIME-Version: 1.0
References: <CANHNcP9F=xab3SDarH7X4hrVNY9Mg8aFHvAnBqn0QvfiM-4Hwg@mail.gmail.com>	<54535811.3050906@redhat.com>
	<54535B0B.50700@redhat.com>
	<CANHNcP8vR-AJ7j9fkoWKLgSjX6Vgx4JiTCh=h4B=ftVRySag2w@mail.gmail.com>
In-Reply-To: <CANHNcP8vR-AJ7j9fkoWKLgSjX6Vgx4JiTCh=h4B=ftVRySag2w@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] vgscan can't see LVM volumes on QEMU image
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
Content-Type: text/plain; charset="us-ascii"
To: roman.mashak@gmail.com
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On 10/31/2014 02:00 PM, Roman Mashak wrote:
> Hi,
> 
> 2014-10-31 5:48 GMT-04:00 Zdenek Kabelac <zkabelac@redhat.com>:
> [skip]
>>> I'm mostly sure noone has added support for  nbd devices to lvm2.
>>>
>>> look into  /etc/lvm/lvm.conf and  add in device section  something like:
>>>
>>> types = [ "nbd", 16 ]
>>>
>>
>>
>> Ahh ignore this please - I've been having wrong impression it's something
>> new for qcow, but nbd is standard already support network block device.
>>
>> So  what is the disk layout of your qcow ?
> It has two partitions, root and swap.
> 
>> It's purely whole PV ?
> 
>> Have you tried  to disable 'lvmetad' ?
> After I disabled the daemon, vgscan has found the volume group on the
> image and I could mount it;however I observed that after the vgscan
> has completed, lvmetad has started running back again (probably it
> doesn't hurt).

OK, so that's certainly a problem with pvscan not run from udev for
nbd devices at proper time - we still need to fix this - we haven't
covered this yet properly. It needs special treatment like we do
in /lib/udev/rules.d/69-dm-lvm-metad.rules for MD and loop devs.

The lvmetad running back - have you also disabled lvmetad in lvm.conf
(use_lvmetad=0)?


>> What is the lvm2 version in use here ?
> 
> Where can I find this information?
> 

Just run "lvm version"

-- 
Peter
