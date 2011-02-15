Received: from localhost (dhcp-100-19-150.bos.redhat.com [10.16.19.150])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p1FH4kdB026151
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NO)
	for <linux-lvm@redhat.com>; Tue, 15 Feb 2011 12:04:46 -0500
Date: Tue, 15 Feb 2011 12:04:45 -0500
From: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20110215170445.GA20233@redhat.com>
References: <AANLkTi=sSJiVJkqOojR7HUs=STDR1-wXNEqaHsv7smWP@mail.gmail.com>
	<20110214103112.4fb76864@bettercgi.com>
	<AANLkTimT06YazYy8LWGQY46X_uq9QN+XCSA9cLhwQWSB@mail.gmail.com>
	<20110214181448.GC5825@agk-dp.fab.redhat.com>
	<AANLkTinLKNDt9XypbmsTZBRUPuOZty710geV5ku-CR6V@mail.gmail.com>
	<20110215134115.GA19353@redhat.com>
	<AANLkTi=AyuuNrea0n3Dy9Lzu0=pm59Etd0n_rvCpM4Hz@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <AANLkTi=AyuuNrea0n3Dy9Lzu0=pm59Etd0n_rvCpM4Hz@mail.gmail.com>
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
Content-Type: text/plain; charset="iso-8859-1"
To: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, Feb 15 2011 at 11:07am -0500,
Jeff <jlar310@gmail.com> wrote:

> On Tue, Feb 15, 2011 at 7:41 AM, Mike Snitzer <snitzer@redhat.com> wrote:
> > On Tue, Feb 15 2011 at =EF=BF=BD8:02am -0500,
> > Jeff <jlar310@gmail.com> wrote:
> >
> >> On Mon, Feb 14, 2011 at 12:14 PM, Alasdair G Kergon <agk@redhat.com> w=
rote:
> >> > The simple problem is that the code today does not distinguish betwe=
en
> >> > essential output (to stdout) and incidental output (to stdout).
> >> >
> >> > If I run 'pvs' I expect a list of PVs.
> >> > If I run 'pvs --quiet' do I still expect to see that list?
> >> >
> >> > Today, there is no distinction: pvs output and the message you're wa=
nting
> >> > to suppress are the same category of message.
> >>
> >> Yes, there should be a difference between "do-something" commands and
> >> "tell-me-something" commands. I hope there aren't too many cases where
> >> that's a gray area.
> >
> > Ignoring the fact that we have a --quiet option for a moment, why is
> > the additional output of the command(s) so problematic?
>=20
> In short, the --quiet option isn't quiet.
>=20
> In the case of lvcreate and lvremove it prints purely informational
> confirmation messages to stdout. I find this somewhat inconsistent
> with other linux commands that offer a --quiet option (rsync for
> example).
>=20
> It's not so much problematic as it is an issue of good design and
> documentation. It's easy enough for me to send stdout to /dev/null in
> my scripts, but that does run the risk of missing important
> information in the case of unexpected results. What if the program
> isn't so precise about sending error messages to stderr?

well lvm _should_ send all errors to stderr.

> As already stated, for commands such as lvcreate and lvremove where
> the user is requesting the lvm system to "do something" and not "tell
> me something" I think the --quiet option should actually make the
> program be quiet, which it does not in the current implementation.

Noted, definitely an lvm short-coming.

> I am not a hard-core c developer and it's not likely that I would be
> able to find the time to contribute trustworthy patches. If the
> lvm-powers-that-be wish to ignore me, I can live with that. I simply
> saw a potential improvement and chose to share my thoughts.

Not ignoring you at all.  This should get cleaned up.  I was just
pointing out that --quiet not actually being quiet isn't a showstopper
at the moment -- so such a janitorial audit can be deferred.

Thanks for the report,
Mike
