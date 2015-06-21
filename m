Received: from [10.40.200.17] (ovpn-200-17.brq.redhat.com [10.40.200.17])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t5LGhDMb010927
	for <linux-lvm@redhat.com>; Sun, 21 Jun 2015 12:43:14 -0400
Message-ID: <5586E9A0.5030401@redhat.com>
Date: Sun, 21 Jun 2015 18:43:12 +0200
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <87lhff4u8l.fsf@gmail.com>	<CAE8gLhmgtXCy4gdG_HyNRg3NugFzUS_awcN-NFNqFvtOG_R7=A@mail.gmail.com>
	<877fqxehm2.fsf@gmail.com>
In-Reply-To: <877fqxehm2.fsf@gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] lvcreate - device not cleared Aborting. Failed to
 wipe start of new LV.
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

Dne 21.6.2015 v 07:49 csanyipal@gmail.com napsal(a):
> MegaBrutal <megabrutal@gmail.com> writes:
>
>> 2015-06-19 17:02 GMT+02:00  <csanyipal@gmail.com>:
>>> I'm not sure whether was on this system created the VG 'bubba' with lvm
>>> version 1, so maybe this issue is related to that fact that it was
>>> really created with lvm version 1?
>>
>> That your LVM library version is 1.02.90 (which is afaik the latest on
>> the Debian line), doesn't mean that you use LVM1 metadata. It is very
>> likely that you use LVM2. To check, you can see the output of "pvs"
>> ("Fmt" = "lvm2"), or you can check "file -Lks /dev/sda2" where the
>> output should start with "/dev/sda2: LVM2 PV (Linux Logical Volume
>> Manager)".

Unfortunately Debian is 'known' with it's own rewrite of lvm2 udev rules.
And those rules are not ack-ed by upstream and they are not correct.

The result is simple - the lvm2 tool is not properly synchronizing with device 
activation and is not able to clear device header.

> # pvs
>   PV         VG    Fmt  Attr PSize   PFree
>   /dev/sda2  bubba lvm2 a--  455.42g 425.22g
>
> # file -Lks /dev/sda2
> /dev/sda2: LVM2 PV (Linux Logical Volume Manager), UUID: \
>   SMvR2K-6Z3c-xCgd-jSR2-kb1A-15a2-3RiS6V, size: 489009346560
>
> Indeed, my LVM library version is lvm2.
>
>>> What is the solution for my problem?

Install upstream udev rules (and remove those provided by Debian package) -
but I've no idea what else will then break this way.

If you are not creating volumes too often - let's create LV without zeroing
and clear it yourself with i.e. 'dd' or run  mkfs.

'lvcreate -Zn....'


Regards

Zdenek
