Message-ID: <4017E699.5020703@gene.concordia.ca>
From: Chris Beck <cbeck@gene.concordia.ca>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM Snapshots for remote archiving.
References: <4016EE45.1050300@gene.concordia.ca> <1075246162.25365.16.camel@david.internal.NorcrossGroup.com>
In-Reply-To: <1075246162.25365.16.camel@david.internal.NorcrossGroup.com>
Content-Transfer-Encoding: quoted-printable
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Wed Jan 28 11:44:02 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: linux-lvm@sistina.com

I guess I am misunderstanding how a snapshot volume works, I kinda=20
thought it would be this mythical transaction log - disk writes need to=20
be stored somewhere while the original volume is frozen and I was hoping=20
that I could move the whole thing around like any other file.

I was hoping to avoid rsync/rdiff because the snapshot volume itself was=20
a list of differences over the last 24 hours.

It is whispered that Greg Freemyer was heard, on or about 1/27/2004 6:29=20
PM to say:

>On Tue, 2004-01-27 at 18:03, Chris Beck wrote:
> =20
>
>>Hi!  I've been looking through the archives and I can't see anything=20
>>addressing my issue.  Probably because I didn't look hard enough.
>>
>>I want to use 24-hour snap shots as an archival tool.
>>I have 2 identical file servers, one primary and one as an off-site=20
>>mirror.  I'd like the primary system to generate a transaction log that=
=20
>>rolls over every 24-hours and gets transmitted to the remote site. =20
>>After 7 days on the remote site, the log gets triggered so the remote i=
s=20
>>always 7 days out of sync but with the last 6 days logs ready to go.   =
I=20
>>could have it auto update on arrival, but I was thinking that allowing =
a=20
>>week for someone to realize that they deleted something vital would be =
a=20
>>good thing(TM) - standard archiving stuff I guess.
>>
>>Do you think that lvm snapshot volumes are a simple and convenient way=20
>>of doing this?  Does this make sense at all?
>>
>>Thanks,
>>Chris
>>   =20
>>
>
>The above transaction log is new to me.  I have seen that done with
>databases, but not with generic fileservers.
>
>If I was trying to accomplish what I think are your goals, I would use
>rdiff-backup.
>
>I don't know the syntax offhand, but the process would be:
>
>Create snapshot
>mount snapshot as /snap
>rdiff-backup /snap //backup_server/snap=20
>rdiff-backup --delete_older_than 7-days //backup_server
>
>rdiff-backup uses technology similar to rsync to ensure only the deltas
>are sent between the servers.  (ie. first check datestamps etc. to see
>if file changed.  If so, use md5sums to isolate what parts of the file
>changed and send them between the servers.)
>
>It maintains a current copy of the source files, and a series of diffs
>to go backwards to older versions of the files.  In the above it would
>keep a max of 7 diffs per file.  If you wanted to restore from 7 days
>prior, rdiff-backup would internally have to apply all 7 diffs, one
>after another.
>
>rdiff-backup has lots of other features/capabilities.
>
>Also, it uses ssh to encrypt all data between the servers, so it is also
>fairly secure.
>
>The only problems I have with rdiff-backup are:
>
>1) ACL and EA support is only in the Unstable release, but they seem to
>be working fine
>
>2) rdiff-backup is written in python and when an unhandled error occurs,
>it dumps out a stack trace.  To see what the problem is you have to go
>thru the stack trace and the code.  Not to bad if you have some
>programming skills.  If not, the mailing list is fairly responsive.
>
>There is a wiki at
>http://rdiff-backup.solutionsfirst.com.au/index.php?RdiffBackupWiki
>
>Greg
> =20
>

--=20
Chris Beck / Y.A.B.A. / Fungal Genomics
CFSG / Concordia University
"La loi dans sa majestueuse =C3=A9galit=C3=A9, interdit =C3=A0 tous, aux =
riches comme
aux pauvres de dormir sous les ponts, de coucher dans la rue et de voler
du pain." -- Anatole France (Les Lys Rouge - 1894)
