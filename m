Received: from [10.40.200.108] (ovpn-200-108.brq.redhat.com [10.40.200.108])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v02KImGR024008
	for <linux-lvm@redhat.com>; Mon, 2 Jan 2017 15:18:48 -0500
References: <45f36905-feee-8fdf-8545-05d4937a95c1@knebb.de>
	<71b437e8-4aca-0b97-ebab-ee577418db94@redhat.com>
	<d33f570c-5ea4-5cdc-1737-931252b8ea5c@knebb.de>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <04816bc6-6474-241e-9465-34967e0e6164@redhat.com>
Date: Mon, 2 Jan 2017 21:18:46 +0100
MIME-Version: 1.0
In-Reply-To: <d33f570c-5ea4-5cdc-1737-931252b8ea5c@knebb.de>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] LVM filter ignored?
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

Dne 2.1.2017 v 20:20 knebb@knebb.de napsal(a):
> Hi,
>
>
>>> So I tried:
>>> filter = [ "r|sdb.*/|","a|drbd0/|","a|.*/|" ]
>>>
>>
>> Just check the 'comment' for filters in lvm.conf -
>> there is stated you should NOT mix  'r' & 'a' together
>> (there is even no need for this in 99.9999%)
>>
> Well....it writes "be careful mixing" but in the examples mixing is
> shown. Appeared not to be soooo important.

Yep looking at the example it's actually bad one ;) will be fixed.

>
>> - either use plain list of rejects  'r'
>> - or set 'white-list' with all 'a'  finished with 'r .*'
>>
>> To to be exact in your case:
>>
>> Use just:    [ "r|/dev/sdb|" ]
>>
> I set this not as you recommended and indeed it appears to be working,

When you reject a device - and then you accept everything - device will
be accepted via 'different' link/mknod whatever it finds...
And there are now many links to reference the same device.

When you just reject  sdb  - you will reject all it's symlink (implicit)
But when you then in the same filter row later  'accept'  sdb as some 
'/dev/disk-by...' you explicitly overrule this 'implicit' reject.

By default what is NOT reject is 'accepted' by default in sence 'it's been
not rejected' by any previous filter.

It's almost similar to having explicit 'a|.*|' at the end, but will not accept 
rejected 'implicit' symlinks ;)

OK - enough - I'm pretty sure noone can actually understand this :)

Clear message is -  use  either  WHITE-LIST,  or  plain REJECT LIST
follow this rule and you have always clear logic.

That's basically all you need ;)


> Thanks, even I do not have a clue what I did wrong as I remember I had
> it this way. But I moght be wrong as it did not work as I configured it.

As said - it's hard to explain :)
And no - I've not been designing this logic...

Regards

Zdenek
