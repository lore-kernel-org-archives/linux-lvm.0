Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p1FG7Lkn024676
	for <linux-lvm@redhat.com>; Tue, 15 Feb 2011 11:07:21 -0500
Received: from mail-bw0-f46.google.com (mail-bw0-f46.google.com
	[209.85.214.46])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p1FG78T8016341
	for <linux-lvm@redhat.com>; Tue, 15 Feb 2011 11:07:09 -0500
Received: by bwz15 with SMTP id 15so588115bwz.33
	for <linux-lvm@redhat.com>; Tue, 15 Feb 2011 08:07:08 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20110215134115.GA19353@redhat.com>
References: <AANLkTi=sSJiVJkqOojR7HUs=STDR1-wXNEqaHsv7smWP@mail.gmail.com>
	<20110214103112.4fb76864@bettercgi.com>
	<AANLkTimT06YazYy8LWGQY46X_uq9QN+XCSA9cLhwQWSB@mail.gmail.com>
	<20110214181448.GC5825@agk-dp.fab.redhat.com>
	<AANLkTinLKNDt9XypbmsTZBRUPuOZty710geV5ku-CR6V@mail.gmail.com>
	<20110215134115.GA19353@redhat.com>
Date: Tue, 15 Feb 2011 10:07:07 -0600
Message-ID: <AANLkTi=AyuuNrea0n3Dy9Lzu0=pm59Etd0n_rvCpM4Hz@mail.gmail.com>
From: Jeff <jlar310@gmail.com>
Content-Transfer-Encoding: quoted-printable
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

On Tue, Feb 15, 2011 at 7:41 AM, Mike Snitzer <snitzer@redhat.com> wrote:
> On Tue, Feb 15 2011 at =EF=BF=BD8:02am -0500,
> Jeff <jlar310@gmail.com> wrote:
>
>> On Mon, Feb 14, 2011 at 12:14 PM, Alasdair G Kergon <agk@redhat.com> wro=
te:
>> > The simple problem is that the code today does not distinguish between
>> > essential output (to stdout) and incidental output (to stdout).
>> >
>> > If I run 'pvs' I expect a list of PVs.
>> > If I run 'pvs --quiet' do I still expect to see that list?
>> >
>> > Today, there is no distinction: pvs output and the message you're want=
ing
>> > to suppress are the same category of message.
>>
>> Yes, there should be a difference between "do-something" commands and
>> "tell-me-something" commands. I hope there aren't too many cases where
>> that's a gray area.
>
> Ignoring the fact that we have a --quiet option for a moment, why is
> the additional output of the command(s) so problematic?

In short, the --quiet option isn't quiet.

In the case of lvcreate and lvremove it prints purely informational
confirmation messages to stdout. I find this somewhat inconsistent
with other linux commands that offer a --quiet option (rsync for
example).

It's not so much problematic as it is an issue of good design and
documentation. It's easy enough for me to send stdout to /dev/null in
my scripts, but that does run the risk of missing important
information in the case of unexpected results. What if the program
isn't so precise about sending error messages to stderr? Of course
that brings us back to the question of whether or not error-free cron
jobs should generate mail, which could be a matter of opinion. Mine
happens to be that they should not bother me unless there is a
problem.

As already stated, for commands such as lvcreate and lvremove where
the user is requesting the lvm system to "do something" and not "tell
me something" I think the --quiet option should actually make the
program be quiet, which it does not in the current implementation.

I am not a hard-core c developer and it's not likely that I would be
able to find the time to contribute trustworthy patches. If the
lvm-powers-that-be wish to ignore me, I can live with that. I simply
saw a potential improvement and chose to share my thoughts.

Jeff
