Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u5AApYo7004407
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Fri, 10 Jun 2016 06:51:34 -0400
Received: from inet.itmo.dyndns.org (nblzone-210-178.nblnetworks.fi
	[83.145.210.178])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 34B7F461C1
	for <linux-lvm@redhat.com>; Fri, 10 Jun 2016 10:51:32 +0000 (UTC)
Date: Fri, 10 Jun 2016 13:51:26 +0300 (EEST)
From: Markus Mikkolainen <itm@kabuto.fi>
In-Reply-To: <f8db9f60-3250-1a34-4517-1bf9fe43f700@redhat.com>
Message-ID: <alpine.LRH.2.02.1606101349530.5953@inet.itmo.dyndns.org>
References: <alpine.LRH.2.02.1606092320290.5953@inet.itmo.dyndns.org>
	<f8db9f60-3250-1a34-4517-1bf9fe43f700@redhat.com>
MIME-Version: 1.0
Sender: <itm@itmo.dyndns.org>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: mark@xwax.org


could there atleast be some kind of a warning if the reattaching will 
result in you destroying your filesystem? or possibly make the 
"--splitcache" warn that this is a debug feature and the result might be 
bad?

basically NOTHING suggested to me that i might be doing something that 
could destroy my filesystem.

> Dne 9.6.2016 v 22:24 Markus Mikkolainen napsal(a):
>>  I seem to have hit the same snag as Mark describes in his post.
>>
>>  https://www.redhat.com/archives/linux-lvm/2015-April/msg00025.html
>>
>>  with kernel 4.4.6 I detached (--splitcache) a writeback cache from a
>>  mounted
>>  lv which was then synchronized and detached. Then I reattached it and
>>  shortly
>>  detached it again. What was interesting is that after the second detach it
>>  synchronized AGAIN starting from 100% , and then I started getting
>>  filesystem
>>  errors. I immediately shutdown, and forced an fsck , and didnt lose that
>>  much
>>  data, but still had some stuff to correct.
>>
>>  It looked to me like a detached cache, being reattached will retain all
>>  cached
>>  data on it, even though it was supposed to be written to the backing disk,
>>  and
>>  then instead of marking it clean on attaching, it will continue serving
>>  old
>>  data from the cache.
>> 
>
>
> Yes - known issue,  --splitcache is rather for 'debugging' purposes.
> Use --uncache  and create new cache when needed.
>
> Splitted cache needs to be cleared on reattachment - but that needs further 
> code rework.
>
> The idea behind is - we want to support 'offline' writeback of data as ATM
> cache target doesn't work well if there is any disk error - i.e. cache is in 
> writeback mode and has 'error' sector - you can't clean such cache...
>
> Regards
>
> Zdenek
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
>
