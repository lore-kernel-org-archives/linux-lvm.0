Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.9])
	by int-mx03.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n8LGUMDX014003
	for <linux-lvm@redhat.com>; Mon, 21 Sep 2009 12:30:22 -0400
Received: from web51302.mail.re2.yahoo.com (web51302.mail.re2.yahoo.com
	[206.190.38.168])
	by mx1.redhat.com (8.13.8/8.13.8) with SMTP id n8LGUAXj011536
	for <linux-lvm@redhat.com>; Mon, 21 Sep 2009 12:30:11 -0400
Message-ID: <684876.38078.qm@web51302.mail.re2.yahoo.com>
Date: Mon, 21 Sep 2009 09:30:09 -0700 (PDT)
From: Jon Hardcastle <jd_hardcastle@yahoo.com>
In-Reply-To: <170fa0d20909210733p2e3e797cvb60af2e9bd153fda@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] Re: LVM and Raid5
Reply-To: Jon@eHardcastle.com,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: Michal Soltys <soltys@ziu.info>, Mike Snitzer <snitzer@gmail.com>
Cc: linux-raid@vger.kernel.org, Linux Raid Study <linuxraid.study@gmail.com>, linux-lvm@redhat.com

--- On Mon, 21/9/09, Mike Snitzer <snitzer@gmail.com> wrote:

> From: Mike Snitzer <snitzer@gmail.com>
> Subject: Re: LVM and Raid5
> To: "Michal Soltys" <soltys@ziu.info>
> Cc: "Linux Raid Study" <linuxraid.study@gmail.com>, linux-raid@vger.kerne=
l.org, linux-lvm@redhat.com
> Date: Monday, 21 September, 2009, 3:33 PM
> On Thu, Sep 17, 2009 at 8:37 AM,
> Michal Soltys <soltys@ziu.info>
> wrote:
> > Linux Raid Study wrote:
> >>
> >> Hello:
> >>
> >> Has someone experimented with LVM and Raid5
> together (on say, 2.6.27)?
> >> Is there any performance drop if LVM/Raid5 are
> combined vs Raid5 alone?
> >>
> >> Thanks for your inputs!
> >
> > Few things to consider when setting up LVM on MD
> raid:
> >
> > - readahead set on lvm device
> >
> > It defaults to 256 on any LVM device, while MD will
> set it accordingly to
> > the amount of disks present in the raid. If you do
> tests on a filesystem,
> > you may see significant differences due to that. YMMV
> depending on the type
> > of used benchmark(s).
> >
> > - filesystem awareness of underlying raid
> >
> > For example, xfs created on top of raid, will
> generally get the parameters
> > right (stripe unit, stripe width), but if it's xfs on
> lvm on raid, then it
> > won't - you will have to provide them manually.
> >
> > - alignment between LVM chunks and MD chunks
> >
> > Make sure that extent area used for actual logical
> volumes start at the
> > boundary of stripe unit - you can adjust the LVM's
> metadata size during
> > pvcreate (by default it's 192KiB, so with non-default
> stripe unit it may
> > cause issues, although I vaguely recall posts that
> current LVM is MD aware
> > during initialization). Of course LVM must itself
> start at the boundary for
> > that to make any sense (and it doesn't have to be the
> case - for example if
> > you use partitionable MD).
>=20
> All of the above have been resolved in recent LVM2
> userspace (2.02.51
> being the most recent release with all these
> addressed).=EF=BF=BD The last
> issue you mention (partitionable MD alignment offset) is
> also resolved
> when a recent LVM2 is coupled with Linux 2.6.31 (which
> provides IO
> Topology support).
>=20
> Mike
> --

When you say 'resolved' are we talking automatically? if so, when the volum=
es are created... etc etc?
-----------------------
N: Jon Hardcastle
E: Jon@eHardcastle.com
'Do not worry about tomorrow, for tomorrow will bring worries of its own.'
-----------------------





     =20
