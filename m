Date: Wed, 10 Jan 2018 10:45:30 -0600
From: David Teigland <teigland@redhat.com>
Message-ID: <20180110164530.GC24129@redhat.com>
References: <bc1ccc58-1771-183b-2d40-1d8b198fb8b5@suse.com>
	<20180109160622.GB24472@redhat.com>
	<0c7ad5f6-0399-e890-0205-281c0b9b9405@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <0c7ad5f6-0399-e890-0205-281c0b9b9405@suse.com>
Subject: Re: [linux-lvm] The benefits of lvmlockd over clvmd?
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
To: Eric Ren <zren@suse.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On Wed, Jan 10, 2018 at 03:11:24PM +0800, Eric Ren wrote:
> > True, although it's never been tried anywhere near that many.  The main
> > point hiding behind the big number is that hosts are pretty much unaware
> > of each other, so adding more doesn't have any affect, and when somethi=
ng
> > happens to one, others are unaffected because they are unaware.
>=20
> The comments above is only talking about lvmlockd with sanlock, and it's
> because the different protocols/algorithms used by them: sanlock with Pax=
os,
> dlm with corosync, right?

right

> > > - lvmlockd has better design than clvmd. clvmd is command-line level
> > > based locking system, which means the =EF=BF=BDwhole LVM software wil=
l get
> > > hang if any LVM command gets dead-locking issue. However, lvmlockd
> > > is *resources* based cluster locking. The resources to protect is VG
> > > and LV so that the deadlock issue will be isolated inside the
> > > resource and operations on other VG/LV can still proceed.
>=20
> Is this point roughly true?

It's vague enough to pass I suppose, but I don't think comparing them in
terms of locking is very helpful, because clvmd is not really a locking
system, it's a parallel execution system.  Keep in mind we're generalizing
and largely discussing opinion here, so there are bound to be some valid
disagreements about this.

Using lvmlockd, lvm just acquires and releases simple locks around making
changes.  There's no notion of "nodes", no concept of remote/local.
Either a command gets a lock or it doesn't, not much else can happen or go
wrong, it's pretty trivial.

clvmd is vastly different: "all nodes" and remote/local nodes is the
central controlling idea.  Locks are not the main thing, the main thing is
running all commands in parallel everywhere.  There are endless ways
things can go wrong when trying to run commands in parallel on all nodes.
What's more, there's no point to it, since nothing actually needs to run
in parallel everywhere.

> > > But, I may be wrong in some points. Could you please help correct me =
and
> > > complete the benefit list?
> > To me the biggest benefit is the design and internal implementation, wh=
ich
> > I admit don't make for great marketing.  The design in general follows =
the
> > idea described above, in which hosts fundamentally operate unaware of
>=20
> Sorry, "the idea described above" by me?

No, the idea I described about sanlock not being affected by other nodes.

Dave
