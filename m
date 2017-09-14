Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 115696A332
	for <linux-lvm@redhat.com>; Thu, 14 Sep 2017 03:19:38 +0000 (UTC)
Received: from smtp2.signet.nl (smtp2.signet.nl [83.96.147.103])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2AAE2C04B924
	for <linux-lvm@redhat.com>; Thu, 14 Sep 2017 03:19:36 +0000 (UTC)
Received: from webmail.dds.nl (app2.dds.nl [81.21.136.118])
	by smtp2.signet.nl (Postfix) with ESMTP id 0542240C3A52
	for <linux-lvm@redhat.com>; Thu, 14 Sep 2017 05:19:34 +0200 (CEST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Thu, 14 Sep 2017 05:19:34 +0200
From: Xen <list@xenhideout.nl>
In-Reply-To: <38678f22-b471-8f6d-4820-a36b81a02b5b@redhat.com>
References: <76b114ca-404b-d7e5-8f59-26336acaadcf@assyoma.it>
	<0c6c96790329aec2e75505eaf544bade@assyoma.it>
	<8fee43a1-dd57-f0a5-c9de-8bf74f16afb0@gmail.com>
	<7d0d218c420d7c687d1a17342da5ca00@xenhideout.nl>
	<6e9535b6-218c-3f66-2048-88e1fcd21329@redhat.com>
	<2cea88d3e483b3db671cc8dd446d66d0@xenhideout.nl>
	<f00db013-56a5-87f5-dd98-37d603ea1b9b@redhat.com>
	<9115414464834226be029dacb9b82236@xenhideout.nl>
	<50f67268-a44e-7cb7-f20a-7b7e15afde3a@redhat.com>
	<5cb21c879cfff0b1916e823b85d35909@xenhideout.nl>
	<87a619a2-cefc-3b4e-a709-0906053503e9@redhat.com>
	<bd0c1d0e-172a-f6c1-039f-8724dc8d007e@assyoma.it>
	<1da2cfbb-4443-b8fa-8a61-55a8c6574db7@redhat.com>
	<1539b0efb711bf19c78a9fc509f37d42@xenhideout.nl>
	<38678f22-b471-8f6d-4820-a36b81a02b5b@redhat.com>
Message-ID: <f742b78daf28845fa5c58d980fbcbfd6@xenhideout.nl>
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
To: linux-lvm@redhat.com

Zdenek Kabelac schreef op 13-09-2017 21:17:

> Please if you can show the case where the current upstream thinLV
> fails and you lose your data - we can finally start to fix something.

Hum, I can only say "I owe you one" on this.

I mean to say it will have to wait, but I hope to get to this at some 
point.

> I'm still unsure what problem you want to get resolved from pretty
> small group of people around dm/lvm2 - do you want from us to rework
> kernel page-cache ?
> 
> I'm simply still confused what kind action you expect...
> 
> Be specific with real world example.

I think Brassow Jonathan's idea is very good to begin with (thank you 
sir ;-)).

I get that you say that kernel space solution is impossible to implement 
(apart from not crashing the system, and I get that you say that this is 
no longer the case) because checking several things would prolong 
execution paths considerably, is what you say.

And I realize that any such thing would need asynchronous checking and 
updating some values and then execution paths that need to check for 
such things which I guess could indeed by rather expensive to actually 
execute.

I mean the only real kernel experience I have was trying to dabble with 
filename_lookup and path_lookupat or whatever it was called. I mean 
inode path lookups, which is a bit of the same thing. And indeed even a 
single extra check would have incurred a performance overhead.

I mean the code to begin with differentiated between fast lookup and 
slow lookup and all of that.

And particularly the fast lookup was not something you'd want to mess 
with, etc.

But I absolutely have no issue to begin with I want to say with 
asynchronous 'intervention' even if it is not byte accurate, as you say 
in the other email.

And I get that you prefer user-space tools doing the thing...

And you say there that this information is hard to mine.

And that the "thin_ls" tool does that.

It's just that I don't want it to be 'random' and depending on your 
particular random sysadmin doing the right thing in isolation of all 
other random sysadmins having to do the right thing all in isolation of 
each other all writing the same code.

At the very least if you recognise your responsibility, which you are 
doing now, we can have a bit of a framework that is delivered by 
upstream LVM so the thing comes out more "fully fleshed" and sysadmins 
have less work to do, even if they still have to customize the scripts 
or anything.

Most ideal thing would definitely be something you "set up" and then the 
thing takes care of itself, ie. you only have to input some values and 
constraints.

But intervention in forms of "fsfreeze" or whatever is very personal, I 
get that.

And I get that previously auto-unmounting also did not really solve 
issues for everyone.

So a general interventionalist policy that is going to work for everyone 
is hard to get.

So the only thing that could work for everyone is if there is actually a 
block on new allocations. If that is not possible, then indeed I agree 
that a "one size fits all" approach is hardly possible.

Intervention is system-specific.

Regardless at least it should be easy to ensure that some constraints 
are enforced, that's all I'm asking.

Regards, (I'll respond further in the other email).
