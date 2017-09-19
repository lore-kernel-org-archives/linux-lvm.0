MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Tue, 19 Sep 2017 19:38:57 +0200
From: Gionatan Danti <g.danti@assyoma.it>
In-Reply-To: <31adccf8-e7b9-e10c-11a3-0035c46c735e@redhat.com>
References: <603627203.4607722.1505769042298.ref@mail.yahoo.com>
	<603627203.4607722.1505769042298@mail.yahoo.com>
	<3ff234d4-fbe3-64dc-2ae6-4566d69a8038@assyoma.it>
	<b38f582d-fdc8-0825-29fb-f1684dcba8ab@redhat.com>
	<20170919141429.GA1454@redhat.com>
	<31adccf8-e7b9-e10c-11a3-0035c46c735e@redhat.com>
Message-ID: <962c483c2c797470d812db8a47090257@assyoma.it>
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
To: Zdenek Kabelac <zkabelac@redhat.com>
Cc: David, Teigland <teigland@redhat.com>, LVM general discussion and development <linux-lvm@redhat.com>

Il 19-09-2017 17:30 Zdenek Kabelac ha scritto:
> The main purpose of the Warning is to really warn user there is NOT
> configured auto-extension of thin-pool (so no threshold is setup) - so
> thin-pool is not set-up in 'preferred' way  (so when user counts with
> the fact the thin-pool can grow and auto-extension is enabled - the
> warning is not printed).
> 
> I think it's really useful to give this information to the user -
> since from my experience with users - many of them are simply unaware
> of the fact when they take 3 snapshots they may need  3x more space of
> the origin volume.

Right, but the "skilled admin" need a command line 
parameter/configuration variable to silence this warning...

> So in the case users do want to have 'critical' volumes always 'safe'
> from out-of-space condition - the message tells them when pool can't
> cover all space for all thins.
> 
> Even in this list - people tend to think it is really an easy to just
> drop snapshots like with old-snaps and they even think it will happen
> auto-magically.
> 
> So IMHO we are better to give user really good info about what is going 
> on.
> Once we provide more secure mechanism - we may possibly change the
> time and actual printed message.
> 
> Skilled user just ignores the message - so is the major problem with it 
> ?

... because this auto-trains our eyes to automatically ignore warning 
messages - which is a very bad thing IMHO.
Moreover, as the warning is emitted on STDERR, ignoring it can be 
error-prone, especially in cron scripts (ie: 2>/dev/null, which is 
*really* bad when it destroys/hides important error messages).

> Is it the 'severity' -  so the message should be prefixed with "NOTE:"
> instead of  "WARNING:"    (log_warn() -> log_print_unless_quite())

I second this.

> We have number of similar messages for other cases, so it's relatively
> common in lvm2 to give some guidance messages to users - just this one
> gets some extra tension (i.e. we can open similar discussion about
> handling duplicates cases)

True, and I really appreciate that and the "don't let users destroy its 
data" reasoning. However, when the users feel his was sufficiently 
warned about thin pool fullness, we should provide a mean to silence 
this (expected) error. After all, this is not due to erroneous thin pool 
use. Rather, overprovisioning and snapshots are the main motivation for 
the very existance of thin pool.

Thanks.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
