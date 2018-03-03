Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 521AA620A5
	for <linux-lvm@redhat.com>; Sat,  3 Mar 2018 18:32:28 +0000 (UTC)
Received: from smtp2.signet.nl (smtp2.signet.nl [83.96.147.103])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id ECCC083F63
	for <linux-lvm@redhat.com>; Sat,  3 Mar 2018 18:32:26 +0000 (UTC)
Received: from webmail.dds.nl (app2.dds.nl [81.21.136.118])
	by smtp2.signet.nl (Postfix) with ESMTP id B415D40C2BE0
	for <linux-lvm@redhat.com>; Sat,  3 Mar 2018 19:32:25 +0100 (CET)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Sat, 03 Mar 2018 19:32:25 +0100
From: Xen <list@xenhideout.nl>
In-Reply-To: <eea26091-40e7-8f31-e4ba-dfab059f3d70@redhat.com>
References: <1438f48b-0a6d-4fb7-92dc-3688251e0a00@assyoma.it>
	<fa8b9d2e-6f1f-d201-263a-48178815a055@assyoma.it>
	<2f9c4346d4e9646ca058efdf535d435e@xenhideout.nl>
	<f934657c1724caba1c432cace2f0ca69@assyoma.it>
	<5df13342-8c31-4a0b-785e-1d12f0d2d9e8@redhat.com>
	<e12f977563bfccf0a2a39aa3e53b9cf4@assyoma.it>
	<b1b73e21196be7c50daa098b2724880a@xenhideout.nl>
	<6dd12ab9-0390-5c07-f4b7-de0d8fbbeacf@redhat.com>
	<3831e817d7d788e93a69f20e5dda1159@xenhideout.nl>
	<0ab1c4e1-b15e-b22e-9455-5569eeaa0563@redhat.com>
	<51faeb921acf634609b61bff5fd269d4@xenhideout.nl>
	<4b4d56ef-3127-212b-0e68-00b595faa241@redhat.com>
	<bd9a12f33412163e9c65b4a9b78eeb4f@xenhideout.nl>
	<6dd3a268-8a86-31dd-7a0b-dd08fdefdd55@redhat.com>
	<9142007eeb745a0f4774710b7c007375@assyoma.it>
	<eea26091-40e7-8f31-e4ba-dfab059f3d70@redhat.com>
Message-ID: <1dd5a899e554d5cdc41de41dfa4dde4a@xenhideout.nl>
Subject: Re: [linux-lvm] Snapshot behavior on classic LVM vs ThinLVM
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

Zdenek Kabelac schreef op 28-02-2018 22:43:

> It still depends - there is always some sort of 'race' - unless you
> are willing to 'give-up' too early to be always sure, considering
> there are technologies that may write many GB/s...

That's why I think it is only possible for snapshots.

> You can use rootfs with thinp - it's very fast for testing i.e. 
> upgrades
> and quickly revert back - just there should be enough free space.

That's also possible with non-thin.

> Snapshot are using space - with hope that if you will 'really' need 
> that space
> you either add this space to you system - or you drop snapshots.

And I was saying back then that it would be quite easy to have a script 
that would drop bigger snapshots first (of larger volumes) given that 
those are most likely less important and more likely to prevent thin 
pool fillup, and you can save more smaller snapshots this way.

So basically I mean this gives your snapshots a "quotum" that I was 
asking about.

Lol now I remember.

You could easily give (by script) every snapshot a quotum of 20% of full 
volume size, then when 90% thin target is reached, you start dropping 
volumes with the largest quotum first, or something.

Idk, something more meaningful than that, but you get the idea.

You can calculate the "own" blocks of the snapshot and when the pool is 
full you check for snapshots that have surpassed their quotum, and the 
ones that are past their quotas in the largest numbers you drop first.

> But as said - with today 'rush' of development and load of updates -
> user do want to try 'new disto upgrade' - if it works - all is fine -
> if it doesn't let's have a quick road back -  so using thin volume for
> rootfs is pretty wanted case.

But again, regular snapshot of sufficient size does the same thing, you 
just have to allocate for it in advance, but for root this is not really 
a problem.

Then no more issue with thin-full problem.

I agree, less convenient, and a slight bit slower, but not by much for 
this special use case.

> There are also some on going ideas/projects - one of them was to have
> thinLVs with priority to be always fully provisioned - so such thinLV
> could never be the one to have unprovisioned chunks....

That's what ZFS does... ;-).

> Other was a better integration of filesystem with 'provisioned' 
> volumes.

That's what I was talking about back then...............
