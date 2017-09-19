Date: Tue, 19 Sep 2017 09:14:29 -0500
From: David Teigland <teigland@redhat.com>
Message-ID: <20170919141429.GA1454@redhat.com>
References: <603627203.4607722.1505769042298.ref@mail.yahoo.com>
	<603627203.4607722.1505769042298@mail.yahoo.com>
	<3ff234d4-fbe3-64dc-2ae6-4566d69a8038@assyoma.it>
	<b38f582d-fdc8-0825-29fb-f1684dcba8ab@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b38f582d-fdc8-0825-29fb-f1684dcba8ab@redhat.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Gionatan Danti <g.danti@assyoma.it>

On Tue, Sep 19, 2017 at 01:11:09PM +0200, Zdenek Kabelac wrote:
> IMHO the most convenient in my eyes is a usage of some sort of 'envvar'
> LVM_SUPPRESS_POOL_WARNINGS....

I think we're looking at the wrong thing.  The root problem is what we're
warning about, not that the warning is being printed.  It doesn't make
sense to warn about the inherent nature of things.  When peole create a
linear LV, we don't print a warning that it's not redundant.  By warning
that the pool is overprovisioned, we also mislead people into thinking
that this is what they should worry about, when in fact it's free space in
the pool which is the real thing to worry about.  So I think the message
should be dropped and replaced with something more useful.
