Received: from localhost (dhcp-100-19-150.bos.redhat.com [10.16.19.150])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p1FDfGFE019502
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NO)
	for <linux-lvm@redhat.com>; Tue, 15 Feb 2011 08:41:16 -0500
Date: Tue, 15 Feb 2011 08:41:15 -0500
From: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20110215134115.GA19353@redhat.com>
References: <AANLkTi=sSJiVJkqOojR7HUs=STDR1-wXNEqaHsv7smWP@mail.gmail.com>
	<20110214103112.4fb76864@bettercgi.com>
	<AANLkTimT06YazYy8LWGQY46X_uq9QN+XCSA9cLhwQWSB@mail.gmail.com>
	<20110214181448.GC5825@agk-dp.fab.redhat.com>
	<AANLkTinLKNDt9XypbmsTZBRUPuOZty710geV5ku-CR6V@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <AANLkTinLKNDt9XypbmsTZBRUPuOZty710geV5ku-CR6V@mail.gmail.com>
Subject: Re: [linux-lvm] lvcreate and lvremove --quiet option is not quiet
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

On Tue, Feb 15 2011 at  8:02am -0500,
Jeff <jlar310@gmail.com> wrote:

> On Mon, Feb 14, 2011 at 12:14 PM, Alasdair G Kergon <agk@redhat.com> wrote:
> > The simple problem is that the code today does not distinguish between
> > essential output (to stdout) and incidental output (to stdout).
> >
> > If I run 'pvs' I expect a list of PVs.
> > If I run 'pvs --quiet' do I still expect to see that list?
> >
> > Today, there is no distinction: pvs output and the message you're wanting
> > to suppress are the same category of message.
> 
> Yes, there should be a difference between "do-something" commands and
> "tell-me-something" commands. I hope there aren't too many cases where
> that's a gray area.

Ignoring the fact that we have a --quiet option for a moment, why is
the additional output of the command(s) so problematic?
