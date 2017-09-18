MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Mon, 18 Sep 2017 21:07:12 +0200
From: Gionatan Danti <g.danti@assyoma.it>
In-Reply-To: <20170918185551.GB6025@redhat.com>
References: <da37558c-157c-3817-ca59-96202f615be9@assyoma.it>
	<20170918185551.GB6025@redhat.com>
Message-ID: <3c3eefcc34a6d322b790d91f63cb9d95@assyoma.it>
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
To: David Teigland <teigland@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Il 18-09-2017 20:55 David Teigland ha scritto:
> It's definitely an irritation, and I described a configurable 
> alternative
> here that has not yet been implemented:
> 
> https://bugzilla.redhat.com/show_bug.cgi?id=1465974
> 
> Is this the sort of topic where we should start making use of
> https://github.com/lvmteam/lvm2/issues ?

Hi, the proposed solution on BZ entry seems somewhat too "invasive" to 
me.
I think it generally is a good idea to warn the users about possibly 
unexptected behavior (ie: full pool).

However, for the specific use-case of taking read-only snapshots, 
something as simple as "--silencepoolsizewarn" flag (or similar 
configuration variable) would do the trick without distrupting 
legitimate warnings.

Regards.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
