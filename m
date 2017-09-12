MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Wed, 13 Sep 2017 01:15:06 +0200
From: Gionatan Danti <g.danti@assyoma.it>
In-Reply-To: <dc2f993c-6a90-ff8d-6d06-e629ac4931a4@redhat.com>
References: <418002318.647314.1505245480415.ref@mail.yahoo.com>
	<418002318.647314.1505245480415@mail.yahoo.com>
	<4dcfc4a557e98e0f98c6a1d568538d07@assyoma.it>
	<41419c78-953e-cb78-ade7-c9fc611a92fb@redhat.com>
	<d994dea1f0b3a800cc8d546bf8d9214f@assyoma.it>
	<dc2f993c-6a90-ff8d-6d06-e629ac4931a4@redhat.com>
Message-ID: <c6bc164dd29fce956b2af7d4cd9077a6@assyoma.it>
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
To: Zdenek Kabelac <zkabelac@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

> There could be a simple answer and complex one :)
> 
> I'd start with simple one - already presented here -
> 
> when you write to INDIVIDUAL thin volume target - respective dn thin
> target DOES manipulate with single btree set - it does NOT care there
> are some other snapshot and never influnces them -
> 
> You ask here to heavily 'change' thin-pool logic - so writing to THIN
> volume A  can remove/influence volume B - this is very problematic for
> meny reasons.
> 
> We can go into details of BTree updates  (that should be really
> discussed with its authors on dm channel ;)) - but I think the key
> element is capturing the idea the usage of thinLV A does not change
> thinLV B.
> 
> 
> ----
> 
> 
> Now to your free 'reserved' space fiction :)
> There is NO way to decide WHO deserves to use the reserve :)
> 
> Every thin volume is equal - (the fact we call some thin LV snapshot
> is user-land fiction - in kernel all thinLV are just equal -  every
> thinLV reference set of thin-pool chunks)  -
> 
> (for late-night thinking -  what would be snapshot of snapshot which
> is fully overwritten ;))
> 
> So when you now see that all thinLVs  just maps set of chunks,
> and all thinLVs can be active and running concurrently - how do you
> want to use reserves in thin-pool :) ?
> When do you decide it ?  (you need to see this is total race-lend)
> How do you actually orchestrate locking around this single point of 
> failure ;) ?
> You will surely come with and idea of having reserve separate for every 
> thinLV ?
> How big it should actually be ?
> Are you going to 'refill' those reserves  when thin-pool gets emptier ?
> How you decide which thinLV deserves bigger reserves ;) ??
> 
> I assume you can start to SEE the whole point of this misery....
> 
> So instead -  you can start with normal thin-pool - keep it simple in 
> kernel,
> and solve complexity in user-space.
> 
> There you can decide - if you want to extend thin-pool...
> You may drop some snapshot...
> You may fstrim mounted thinLVs...
> You can kill volumes way before the situation becomes unmaintable....

Ok, this is an answer I totally accept: if enable per-lv used and 
reserved space is so difficult in the current thinp framework, don't do 
it.

Thanks to taking the time to explain (on late night ;))

> All you need to accept is - you will kill them at 95% -
> in your world with reserves it would be already reported as 100% full,
> with totally unknown size of reserves :)

Minor nitpicking: I am not speaking about "reserves" to use when free 
space is low, but about "reserved space" - ie: per-volume space which 
can not be used by any other object.

One question: in a previous email you shown how a threshold can be set 
to deny new volume/snapshot creation. How can I do that? What LVM 
version I need?

Thanks.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
