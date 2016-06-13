Received: from [10.34.131.9] (dhcp131-9.brq.redhat.com [10.34.131.9])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u5D8mLRw020113
	for <linux-lvm@redhat.com>; Mon, 13 Jun 2016 04:48:22 -0400
References: <alpine.LRH.2.02.1606092320290.5953@inet.itmo.dyndns.org>
	<f8db9f60-3250-1a34-4517-1bf9fe43f700@redhat.com>
	<alpine.LRH.2.02.1606101349530.5953@inet.itmo.dyndns.org>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <071a8257-8361-ce13-e338-876a219539fb@redhat.com>
Date: Mon, 13 Jun 2016 10:48:21 +0200
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.02.1606101349530.5953@inet.itmo.dyndns.org>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] corruption on reattaching cache
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

Dne 10.6.2016 v 12:51 Markus Mikkolainen napsal(a):
>
> could there atleast be some kind of a warning if the reattaching will result
> in you destroying your filesystem? or possibly make the "--splitcache" warn
> that this is a debug feature and the result might be bad?
>

I'll try to provide some fixing commit to let reattach without
zeroing require  -Zn with lvconvert.


> basically NOTHING suggested to me that i might be doing something that could
> destroy my filesystem.

Yep

>
>> Dne 9.6.2016 v 22:24 Markus Mikkolainen napsal(a):
>>>  I seem to have hit the same snag as Mark describes in his post.
>>>
>>>  https://www.redhat.com/archives/linux-lvm/2015-April/msg00025.html
>>>
>>>  with kernel 4.4.6 I detached (--splitcache) a writeback cache from a
>>>  mounted
>>>  lv which was then synchronized and detached. Then I reattached it and
>>>  shortly
>>>  detached it again. What was interesting is that after the second detach it
>>>  synchronized AGAIN starting from 100% , and then I started getting
>>>  filesystem
>>>  errors. I immediately shutdown, and forced an fsck , and didnt lose that
>>>  much
>>>  data, but still had some stuff to correct.
>>>
>>>  It looked to me like a detached cache, being reattached will retain all
>>>  cached
>>>  data on it, even though it was supposed to be written to the backing disk,
>>>  and
>>>  then instead of marking it clean on attaching, it will continue serving
>>>  old
>>>  data from the cache.
>>>
>>
>>
>> Yes - known issue,  --splitcache is rather for 'debugging' purposes.
>> Use --uncache  and create new cache when needed.
>>
>> Splitted cache needs to be cleared on reattachment - but that needs further
>> code rework.
>>
>> The idea behind is - we want to support 'offline' writeback of data as ATM
>> cache target doesn't work well if there is any disk error - i.e. cache is in
>> writeback mode and has 'error' sector - you can't clean such cache...
>>
>> Regards
>>
>> Zdenek
>>
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>
>>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
