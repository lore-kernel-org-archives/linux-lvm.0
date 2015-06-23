Received: from [10.34.131.225] (dhcp131-225.brq.redhat.com [10.34.131.225])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t5N8igSB030611
	for <linux-lvm@redhat.com>; Tue, 23 Jun 2015 04:44:43 -0400
Message-ID: <55891C7A.4070902@redhat.com>
Date: Tue, 23 Jun 2015 10:44:42 +0200
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <87lhff4u8l.fsf@gmail.com>	<CAE8gLhmgtXCy4gdG_HyNRg3NugFzUS_awcN-NFNqFvtOG_R7=A@mail.gmail.com>	<877fqxehm2.fsf@gmail.com>	<CAE8gLhkCQ62uevA=0QQXhvSVpcg8Nz9s8PygfY=DT5KSM31E=g@mail.gmail.com>
	<877fqvt03o.fsf@gmail.com>
In-Reply-To: <877fqvt03o.fsf@gmail.com>
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

Dne 23.6.2015 v 08:22 csanyipal@gmail.com napsal(a):
> MegaBrutal <megabrutal@gmail.com> writes:
>
>> 2015-06-21 7:49 GMT+02:00 <csanyipal@gmail.com>:
>>> # lvcreate --verbose --size 10.10G -n var bubba
>>>    DEGRADED MODE. Incomplete RAID LVs will be processed.
>>
>> Hey, I just notice, your VG is in degraded mode. This is not a normal
>> condition and it can also cause unexpected things. Why is your VG
>> degraded? Does it have missing PVs?
>
> # vgdisplay -vvv
>   DEGRADED MODE. Incomplete RAID LVs will be processed.
>
> Indeed.
> I don't know why is mine VG degraded.
> How can I know does it have missing PVs?
> What can I do to fix this problem?

Hi

There is nothing to fix for a user in this case.

This message is only 'informational'  - probably it could be formulated 
somehow differently and less 'stressful'

Also it's location is currently wrong, since it's the 'activation' could which 
could recognize this case - however proper fix is not so trivial and will take 
time.

So basically - this message tells you - that command operates in mode it will
process  incomplete RAID LVs - and it likely should be printed only in case 
there IS some raid LV....

Regards

Zdenek
