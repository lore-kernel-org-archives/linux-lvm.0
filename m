Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r75Fgk5n006332
	for <linux-lvm@redhat.com>; Mon, 5 Aug 2013 11:42:47 -0400
Received: from mail-lb0-f172.google.com (mail-lb0-f172.google.com
	[209.85.217.172])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r75Fgj3j015363
	for <linux-lvm@redhat.com>; Mon, 5 Aug 2013 11:42:45 -0400
Received: by mail-lb0-f172.google.com with SMTP id o7so2238892lbv.31
	for <linux-lvm@redhat.com>; Mon, 05 Aug 2013 08:42:44 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <51FF69EF.7060303@redhat.com>
References: <CAETiKr-D5XPJ5oB+Pn2HOMAUNONrQ6Y-3L=XWNtppQSePx2bdg@mail.gmail.com>
	<51FF6818.5000801@redhat.com> <51FF69EF.7060303@redhat.com>
Date: Mon, 5 Aug 2013 11:42:44 -0400
Message-ID: <CAHEKYV6QReZzCGBhaXei+t4EVDjsQNmrhuiV-3msOM+46VSY4g@mail.gmail.com>
From: Mauricio Tavares <raubvogel@gmail.com>
Subject: Re: [linux-lvm] Linux LVM online shrinking :(
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Mon, Aug 5, 2013 at 5:01 AM, Zdenek Kabelac <zkabelac@redhat.com> wrote:
> Dne 5.8.2013 10:53, Zdenek Kabelac napsal(a):
>
>> Dne 1.8.2013 11:00, DILIP KURUMANGHAT napsal(a):
>>>
>>> Hi Team,
>>>
>>> You might already have come across this stuff many a times.
>>>
>>> I am sending this query as to why LVM is not supporting online shrink.
>>> How is that AIX can do the shrink but not in our best Linux.
>>>
>>> Is there a big difference i the underlying architecture which prevents us
>>> from
>>> an online shrink?
>>>
>>
>> You are asking this question on a wrong mailing list.
>>
>> LVM2 of course does fully support online device shrink.
>>
>> The other side of story is - there is no filesystem I'd know about which
>> would be supporting online shrinking.  The fact is - it's pretty hard
>
>
> Except for btrfs - which on the other hand doesn't need  lvm2.
> So if you need something shrinkable online - try to go with btrfs.
>
      btrfs is not the only one; I just cannot remember of the ones
you can use with lvm2. I mean, ext(1,2,3,4) do not like to be sized
down live and just like btrfs, zfs and jfs2 (at least on AIX) do not
need lvm2. But, you can use jfs in linux.

Ok, I need coffee.


> Zdenek
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
