Received: from [10.36.4.232] (vpn1-4-232.ams2.redhat.com [10.36.4.232])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q2HKpfbI032153
	for <linux-lvm@redhat.com>; Sat, 17 Mar 2012 16:51:41 -0400
Message-ID: <4F64F95C.3040105@redhat.com>
Date: Sat, 17 Mar 2012 21:51:40 +0100
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <CA+6TzyL_vM717b7Atw+Y9zN4tHeAqoisYmTwUAmJxPeB+zzv1w@mail.gmail.com>
	<4F645D81.3010002@redhat.com>
	<20120317161220.GA12111@agk-dp.fab.redhat.com>
	<1332005463.13726.2.camel@maxim-laptop>
In-Reply-To: <1332005463.13726.2.camel@maxim-laptop>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] lvm fails when /proc/devices contains "-1 smblk"
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
To: linux-lvm@redhat.com

Dne 17.3.2012 18:31, Maxim Levitsky napsal(a):
> On Sat, 2012-03-17 at 16:12 +0000, Alasdair G Kergon wrote: 
>>> Dne 16.3.2012 07:28, John Mesmon napsal(a):
>>>> Block devices:
>>>>  -1 smblk
>>
>> That's outside the range of valid major numbers and surely shouldn't be getting
>> exposed to userspace in /proc/devices.
>>
>> static struct mtd_blktrans_ops sm_ftl_ops = {
>>         .name           = "smblk",
>>         .major          = -1,
>>
>> Why's -1 being used?
>>
>> Alasdair
> 
> Woops. I accidentally assigned it 4096 major.
> I probably thought that it will get me dynamic major number, sorry!
> Will fix soon!
> 


So I've made couple experiments, and it seem that numbers printed via
/proc/devices  are actually not reflecting kernel reality.


It seems that if the kernel driver uses i.e. 'major == -4290'
then  cat /proc/devices  shows exactly this number (-4290).

But the device physically appears with major 3902.
So obviously kernel masks 0xfff and it's using it as unsigned number.

I'll update lvm code to go with same logic - while probably giving a user
warning, the major number used for device is not correct (so they could fixed
just like in smblk case).

Also I guess kernel patch which would fix this behavior might be useful as
well, but lvm needs to work with old kernels anyway.

Zdenek
