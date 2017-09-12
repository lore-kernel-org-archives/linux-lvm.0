References: <418002318.647314.1505245480415.ref@mail.yahoo.com>
	<418002318.647314.1505245480415@mail.yahoo.com>
	<4dcfc4a557e98e0f98c6a1d568538d07@assyoma.it>
	<41419c78-953e-cb78-ade7-c9fc611a92fb@redhat.com>
	<d994dea1f0b3a800cc8d546bf8d9214f@assyoma.it>
	<dc2f993c-6a90-ff8d-6d06-e629ac4931a4@redhat.com>
	<c6bc164dd29fce956b2af7d4cd9077a6@assyoma.it>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <9ba4086d-db8a-da37-9f65-a0eb055e089e@redhat.com>
Date: Wed, 13 Sep 2017 01:31:41 +0200
MIME-Version: 1.0
In-Reply-To: <c6bc164dd29fce956b2af7d4cd9077a6@assyoma.it>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Reserve space for specific thin logical volumes
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
To: Gionatan Danti <g.danti@assyoma.it>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Dne 13.9.2017 v 01:15 Gionatan Danti napsal(a):
>> There could be a simple answer and complex one :)
>>
>> I'd start with simple one - already presented here -
> There you can decide - if you want to extend thin-pool...
>> You may drop some snapshot...
>> You may fstrim mounted thinLVs...
>> You can kill volumes way before the situation becomes unmaintable....
> 
> Ok, this is an answer I totally accept: if enable per-lv used and reserved 
> space is so difficult in the current thinp framework, don't do it.

It's not just about 'complexity' in frame work.
You would lose all the speed as well.
You would significantly raise-up  memory requirement.

There is very good reason complex tools like  'thin_ls' are kept in user-space 
  outside of kernel   - with  'dm'  we tend to have simpler kernel logic
and complexity should stay in user-space.

And of course - as pointed out - the size of your 'reserve' is so vague  :) 
and could potentially present major portion of you whole thin-pool size 
without any extra benefit (as obviously any reserve could be too small unless 
you 'reach' fully provisioned state :)

i.e. example:
10G thinLV  with  1G chunks -  single byte write may require full 1G chunk...
so do you decide to keep 10 free chunks in reserves ??


>> All you need to accept is - you will kill them at 95% -
>> in your world with reserves it would be already reported as 100% full,
>> with totally unknown size of reserves :)
> 
> Minor nitpicking: I am not speaking about "reserves" to use when free space is 
> low, but about "reserved space" - ie: per-volume space which can not be used 
> by any other object.
> 
> One question: in a previous email you shown how a threshold can be set to deny 
> new volume/snapshot creation. How can I do that? What LVM version I need?

Supposedly:

lvmconfig --typeconfig full --withversion

         # Available since version 2.2.89.
         thin_pool_autoextend_threshold=70


However there were some bugs and fixes - and validation for not allowing to 
create new thins - so do not try anything below 169 and if you can
go with 173....


Regards

Zdenek
