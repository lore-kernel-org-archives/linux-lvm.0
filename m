Received: from [10.34.131.16] (dhcp131-16.brq.redhat.com [10.34.131.16])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t0EEQ6TE022135
	for <linux-lvm@redhat.com>; Wed, 14 Jan 2015 09:26:07 -0500
Message-ID: <54B67C7E.6020404@redhat.com>
Date: Wed, 14 Jan 2015 15:26:06 +0100
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <54B619AE.6020704@shockmedia.nl>	<54B62A0C.9080800@redhat.com>	<54B64262.2030509@shockmedia.nl>	<54B65611.1090407@gmail.com>
	<54B66352.4010902@shockmedia.nl>
In-Reply-To: <54B66352.4010902@shockmedia.nl>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] determining snapshot overhead
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

Dne 14.1.2015 v 13:38 Bram Klein Gunnewiek napsal(a):
> On 01/14/2015 12:42 PM, Zdenek Kabelac wrote:
>> Dne 14.1.2015 v 11:18 Bram Klein Gunnewiek napsal(a):
>>> Thanks for your reply. I tested it out and it does not seem to work (lvm2
>>> version used is 2.02.98-6ubuntu2):
>>>
>>
>> yep - too old for this feature being supported.
> Ok, then we have to do it ourself since we don't want to go with backports /
> custom versions on our systems
>>
>>> lvcreate -n testvolume3 -L 1G vg
>>> lvcreate -n testvolume3_snapshot -s /dev/vg/testvolume3 -l100%ORIGIN
>>> dd if=/dev/zero of=/dev/vg/testvolume3 bs=1G count=1
>>>
>>> After this the snapshot is invalid:
>>>
>>> testvolume3_snapshot vg swi-I-s--   1.00g      testvolume3 100.00
>>>
>>> I checked out the lvm2 source code and found the methods cow_max_extents and
>>> _cow_max_size  in snapshot_manip.c. Do these methods calculate the exact max
>>> size of the snapshot meta data?
>>
>> yes.
>>
>> It's probably worth to note there has been some related kernel fixes for old
>> snaps - otherwise there has been theoretical path to create much bigger
>> snapshots then the origin size was - though it's  nearly impossible to reach
>> such state.
>
> Thanks again. I did some tests and calculations and it seems that the overhead
> is ~0.39% of the origin size when chunk sizes of 4KiB are used. Bigger chunk
> size means less overhead. If we use 0.5% of the origin space as meta data
> overhead we should be on the safe side I  think?

It cannot be defined as some 'percentage' value - as there are even 
combinations of LV sizes and extent size where the percentage might be over 
50%  (thought those are not really usable in real life).

lvm2 code is the only valid calculation how to estimate full max size of 
snapshot for various combinations of those parameters.

Zdenek



>
>
>> Zdenek
>>
>>
>>>
>>> On 01/14/2015 09:34 AM, Zdenek Kabelac wrote:
>>>> Dne 14.1.2015 v 08:24 Bram Klein Gunnewiek napsal(a):
>>>>> Hello,
>>>>>
>>>>> I am trying to create snapshots of thick volumes that can't break because
>>>>> they
>>>>> overflow (thin volumes are not an option right now). I can't find
>>>>> information
>>>>> on how to calculate (in advance) the metadata overhead of a snapshot when
>>>>> all
>>>>> blocks in the origin volume are changed (e.g. the snapshot is 100% full). Is
>>>>> there a way to do this?
>>>>
>>>>
>>>> Recent versions of lvm2  (let's say >= 111) are able to determine this size
>>>> automatically - just use: 'lvcreate -s -l100%ORIGIN vg/origin'
>>>>
>>>> Regards
>>>>
>>>> Zdenek
>>>>
>>>> _______________________________________________
>>>> linux-lvm mailing list
>>>> linux-lvm@redhat.com
>>>> https://www.redhat.com/mailman/listinfo/linux-lvm
>>>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>>
>>> _______________________________________________
>>> linux-lvm mailing list
>>> linux-lvm@redhat.com
>>> https://www.redhat.com/mailman/listinfo/linux-lvm
>>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>>
>>
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
