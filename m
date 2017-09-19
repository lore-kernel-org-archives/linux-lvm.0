References: <603627203.4607722.1505769042298.ref@mail.yahoo.com>
	<603627203.4607722.1505769042298@mail.yahoo.com>
	<3ff234d4-fbe3-64dc-2ae6-4566d69a8038@assyoma.it>
	<b38f582d-fdc8-0825-29fb-f1684dcba8ab@redhat.com>
	<20170919141429.GA1454@redhat.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <31adccf8-e7b9-e10c-11a3-0035c46c735e@redhat.com>
Date: Tue, 19 Sep 2017 17:30:44 +0200
MIME-Version: 1.0
In-Reply-To: <20170919141429.GA1454@redhat.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Option to silence "WARNING: Sum of all thin volume
 sizes exceeds the size of thin pool"
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
To: LVM general discussion and development <linux-lvm@redhat.com>, David Teigland <teigland@redhat.com>
Cc: Gionatan Danti <g.danti@assyoma.it>

Dne 19.9.2017 v 16:14 David Teigland napsal(a):
> On Tue, Sep 19, 2017 at 01:11:09PM +0200, Zdenek Kabelac wrote:
>> IMHO the most convenient in my eyes is a usage of some sort of 'envvar'
>> LVM_SUPPRESS_POOL_WARNINGS....
> 
> I think we're looking at the wrong thing.  The root problem is what we're
> warning about, not that the warning is being printed.  It doesn't make
> sense to warn about the inherent nature of things.  When peole create a
> linear LV, we don't print a warning that it's not redundant.  By warning
> that the pool is overprovisioned, we also mislead people into thinking
> that this is what they should worry about, when in fact it's free space in
> the pool which is the real thing to worry about.  So I think the message
> should be dropped and replaced with something more useful.
>
The main purpose of the Warning is to really warn user there is NOT configured 
auto-extension of thin-pool (so no threshold is setup) - so thin-pool is not 
set-up in 'preferred' way  (so when user counts with the fact the thin-pool 
can grow and auto-extension is enabled - the warning is not printed).

I think it's really useful to give this information to the user - since from 
my experience with users - many of them are simply unaware of the fact when 
they take 3 snapshots they may need  3x more space of the origin volume.

So in the case users do want to have 'critical' volumes always 'safe' from 
out-of-space condition - the message tells them when pool can't cover all 
space for all thins.

Even in this list - people tend to think it is really an easy to just drop 
snapshots like with old-snaps and they even think it will happen auto-magically.

So IMHO we are better to give user really good info about what is going on.
Once we provide more secure mechanism - we may possibly change the time and 
actual printed message.

Skilled user just ignores the message - so is the major problem with it ?

Is it the 'severity' -  so the message should be prefixed with "NOTE:" instead 
of  "WARNING:"    (log_warn() -> log_print_unless_quite())

We have number of similar messages for other cases, so it's relatively common 
in lvm2 to give some guidance messages to users - just this one gets some 
extra tension (i.e. we can open similar discussion about handling duplicates 
cases)

Regards

Zdenek
