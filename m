Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u441PDMD018212
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Tue, 3 May 2016 21:25:13 -0400
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CABAA63157
	for <linux-lvm@redhat.com>; Wed,  4 May 2016 01:25:11 +0000 (UTC)
Received: by mail-ig0-f174.google.com with SMTP id s8so35854514ign.0
	for <linux-lvm@redhat.com>; Tue, 03 May 2016 18:25:11 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1870050920.5354287.1462276845385.JavaMail.yahoo@mail.yahoo.com>
References: <1870050920.5354287.1462276845385.JavaMail.yahoo.ref@mail.yahoo.com>
	<1870050920.5354287.1462276845385.JavaMail.yahoo@mail.yahoo.com>
Date: Tue, 3 May 2016 21:25:11 -0400
Message-ID: <CALm7yL2kRJ0jUze5u0r8o+Qmg=aZCdc29s0NoqqWtAym4wKJ3Q@mail.gmail.com>
From: Mark Mielke <mark.mielke@gmail.com>
Content-Type: multipart/alternative; boundary=047d7bb03d7ecd57f50531fa1872
Subject: Re: [linux-lvm] thin handling of available space
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
To: matthew patton <pattonme@yahoo.com>, LVM general discussion and development <linux-lvm@redhat.com>

--047d7bb03d7ecd57f50531fa1872
Content-Type: text/plain; charset=UTF-8

On Tue, May 3, 2016 at 8:00 AM, matthew patton <pattonme@yahoo.com> wrote:

> > written as required. If the file system has particular areas
> > of importance that need to be writable to prevent file
> > system failure, perhaps the file system should have a way of
> > communicating this to the volume layer. The naive approach
> > here might be to preallocate these critical blocks before
> >  proceeding with any updates to these blocks, such that the
> > failure situations can all be "safe" situations,
> > where ENOSPC can be returned without a danger of the file
> > system locking up or going read-only.
>
> why all of a sudden does each and every FS have to have this added code to
> second guess the block layer? The quickest solution is to mount the FS in
> sync mode. Go ahead and pay the performance piper. It's still not likely to
> be bullet proof but it's a sure step closer.
>

Not all of a sudden. From "at work" perspective, LVM thinp as a technology
is relatively recent, and only recently being deployed in more places as we
migrate our systems from RHEL 5 to RHEL 6 to RHEL 7. I didn't consider
thinp an option before RHEL 7, and I didn't consider it stable even in RHEL
7 without significant testing on our part.

From an "at home" perspective, I have been using LVM thinp from the day it
was available in a Fedora release. The previous snapshot model was
unusable, and I wished upon a star that a better technology would arrive. I
tried BTRFS and while it did work - it was still marked as experimental, it
did not have the exact same behaviour as EXT4 or XFS from an applications
perspective, and I did encounter some early issues with subvolumes.
Frankly... I was happy to have LVM thinp, and glad that you LVM developers
provided it when you did. It is excellent technology from my perspective.
But, "at home", I was willing to accept some loose edge case behaviour. I
know when I use storage on my server at home, and if it fails, I can accept
the consequences for myself.

"At work", the situation is different. These are critical systems that I am
betting LVM on. As we begin to use it more broadly (after over a year of
success in hosting our JIRA + Confluence instances on local flash using LVM
thinp for much of the application data including PostgreSQL databases). I
am very comfortable with it from a "< 80% capacity" perspective. However,
every so often it passes 80%, and I have to raise the alarm, because I know
that there are edge cases that LVM / DM thinp + XFS don't handle quite so
well. It's never happened in production yet, but I've seen it happen many
times on designer desktops when they are using LVM, and they lock up their
system and require a system reboot to recover from.

I know there are smart people working on Linux, and smart people working on
LVM. Give the opportunity, and the perspective, I think the worst of these
cases are problems that deserve to be addressed, and probably that people
have been working on with or without my contributions to the subject.



> What you're saying is that when mounting a block device the layer needs to
> expose a "thin-mode" attribute (or the sysdmin sets such a flag via
> tune2fs). Something analogous to mke2fs can "detect" LVM raid mode geometry
> (does that actually work reliably?).
>
> Then there has to be code in every FS block de-stage path:
> IF thin {
>   tickle block layer to allocate the block (aka write zeros to it? - what
> about pre-existing data, is there a "fake write" BIO call that does
> everything but actually write data to a block but would otherwise trigger
> LVM thin's extent allocation logic?)
>    IF success, destage dirty block to block layer ELSE
>    inform userland of ENOSPC
> }
>
> In a fully journal'd FS (metadata AND data) the journal could be 'pinned'
> and likewise the main metadata areas if for no other reason they are zero'd
> at onset and or constantly being written to. Once written to, LVM thin
> isn't going to go back and yank away an allocated extent.
>

Yes. This is exactly the type of solution I was thinking of including
pinning the journal! You used the correct terminology. I can read the terms
but not write them. :-)

You also managed to summarize it in only a few lines of text. As concepts
go, I think that makes it not-too-complex.

But, the devil is often in the details, and you are right that this is a
per-file system cost.

Balancing this, however, I am perhaps presuming that *all* systems will
eventually be thin volume systems, and that correct behaviour and highly
available behaviour will eventually require that *all* systems invest in
technology such as this. My view of the future is that fixed sized thick
partitions are very often a solution which is compromised from the start.
Most systems of significance grow over time, and the pressure to reduce
cost is real. I think we are taking baby steps to start, but that the
systems of the future will be thin volume systems. I see this as a problem
that needs to be understood and solved, except in the most limited of use
cases. This is my opinion, which I don't expect anybody to share.



> This at least should maintain FS integrity albeit you may end up in a
> situation where the journal can never get properly de-staged, so you're
> stuck on any further writes and need to force RO.
>

Interesting to consider. I don't see this as necessarily a problem - or
that it necessitates "RO" as a persistent state. For example, it would be
most practical if sufficient room was reserved to allow for content to be
removed, allowing for the file system to become unwedged and become "RW"
again. Perhaps there is always an edge case that would necessitate a
persistent "RO" state that requires the volume be extended to recover from,
but I think the edge case could be refined to something that will tend to
never happen?



> > just want a sanely behaving LVM + XFS...)
> IMO if the system admin made a conscious decision to use thin AND
> overprovision (thin by itself is not dangerous), it's up to HIM to actively
> manage his block layer. Even on million dollar SANs the expectation is that
> the engineer will do his job and not drop the mic and walk away. Maybe the
> "easiest" implementation would be a MD layer job that the admin can tailor
> to fail all allocation requests once extent count drops below a number and
> thus forcing all FS mounted on the thinpool to go into RO mode.
>

Another interesting idea. I like the idea of automatically shutting down
our applications or PostgreSQL database if the thin pool reaches an unsafe
allocation, such as 90% or 95%. This would ensure the integrity of the
data, at the expense of an outage. This is something we could implement
today. Thanks.



> But in any event it won't prevent irate users from demanding why the space
> they appear to have isn't actually there.


Users will always be irate. :-) I mostly don't consider that as a real
factor in my technical decisions... :-)

Thanks for entertaining this discussion, Matthew and Zdenek. I realize this
is an open source project, with passionate and smart people, whose time is
precious. I don't feel I have the capability of really contributing code
changes at this time, and I'm satisfied that the ideas are being considered
even if they ultimately don't get adopted. Even the mandatory warning about
snapshots exceeding the volume group size is something I can continue to
deal with using scripting and filtering. I mostly want to make sure that my
perspective is known and understood.


-- 
Mark Mielke <mark.mielke@gmail.com>

--047d7bb03d7ecd57f50531fa1872
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On T=
ue, May 3, 2016 at 8:00 AM, matthew patton <span dir=3D"ltr">&lt;<a href=3D=
"mailto:pattonme@yahoo.com" target=3D"_blank">pattonme@yahoo.com</a>&gt;</s=
pan> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">&gt; written=
 as required. If the file system has particular areas<br>
&gt; of importance that need to be writable to prevent file<br>
&gt; system failure, perhaps the file system should have a way of<br>
</span><span class=3D"">&gt; communicating this to the volume layer. The na=
ive approach<br>
&gt; here might be to preallocate these critical blocks before<br>
&gt;=C2=A0 proceeding with any updates to these blocks, such that the<br>
&gt; failure situations can all be &quot;safe&quot; situations,<br>
&gt; where ENOSPC can be returned without a danger of the file<br>
&gt; system locking up or going read-only.<br>
<br>
</span>why all of a sudden does each and every FS have to have this added c=
ode to second guess the block layer? The quickest solution is to mount the =
FS in sync mode. Go ahead and pay the performance piper. It&#39;s still not=
 likely to be bullet proof but it&#39;s a sure step closer.<br></blockquote=
><div><br></div><div>Not all of a sudden. From &quot;at work&quot; perspect=
ive, LVM thinp as a technology is relatively recent, and only recently bein=
g deployed in more places as we migrate our systems from RHEL 5 to RHEL 6 t=
o RHEL 7. I didn&#39;t consider thinp an option before RHEL 7, and I didn&#=
39;t consider it stable even in RHEL 7 without significant testing on our p=
art.</div><div><br></div><div>From an &quot;at home&quot; perspective, I ha=
ve been using LVM thinp from the day it was available in a Fedora release. =
The previous snapshot model was unusable, and I wished upon a star that a b=
etter technology would arrive. I tried BTRFS and while it did work - it was=
 still marked as experimental, it did not have the exact same behaviour as =
EXT4 or XFS from an applications perspective, and I did encounter some earl=
y issues with subvolumes. Frankly... I was happy to have LVM thinp, and gla=
d that you LVM developers provided it when you did. It is excellent technol=
ogy from my perspective. But, &quot;at home&quot;, I was willing to accept =
some loose edge case behaviour. I know when I use storage on my server at h=
ome, and if it fails, I can accept the consequences for myself.</div><div><=
br></div><div>&quot;At work&quot;, the situation is different. These are cr=
itical systems that I am betting LVM on. As we begin to use it more broadly=
 (after over a year of success in hosting our JIRA + Confluence instances o=
n local flash using LVM thinp for much of the application data including Po=
stgreSQL databases). I am very comfortable with it from a &quot;&lt; 80% ca=
pacity&quot; perspective. However, every so often it passes 80%, and I have=
 to raise the alarm, because I know that there are edge cases that LVM / DM=
 thinp + XFS don&#39;t handle quite so well. It&#39;s never happened in pro=
duction yet, but I&#39;ve seen it happen many times on designer desktops wh=
en they are using LVM, and they lock up their system and require a system r=
eboot to recover from.</div><div><br></div><div>I know there are smart peop=
le working on Linux, and smart people working on LVM. Give the opportunity,=
 and the perspective, I think the worst of these cases are problems that de=
serve to be addressed, and probably that people have been working on with o=
r without my contributions to the subject.</div><div><br></div><div>=C2=A0<=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex">
What you&#39;re saying is that when mounting a block device the layer needs=
 to expose a &quot;thin-mode&quot; attribute (or the sysdmin sets such a fl=
ag via tune2fs). Something analogous to mke2fs can &quot;detect&quot; LVM r=
aid mode geometry (does that actually work reliably?).<br>
<br>
Then there has to be code in every FS block de-stage path:<br>
IF thin {<br>
=C2=A0 tickle block layer to allocate the block (aka write zeros to it? - w=
hat about pre-existing data, is there a &quot;fake write&quot; BIO call tha=
t does everything but actually write data to a block but would otherwise tr=
igger LVM thin&#39;s extent allocation logic?)<br>
=C2=A0 =C2=A0IF success, destage dirty block to block layer ELSE<br>
=C2=A0 =C2=A0inform userland of ENOSPC<br>
}<br>
<br>
In a fully journal&#39;d FS (metadata AND data) the journal could be &#39;p=
inned&#39; and likewise the main metadata areas if for no other reason they=
 are zero&#39;d at onset and or constantly being written to. Once written t=
o, LVM thin isn&#39;t going to go back and yank away an allocated extent.<b=
r></blockquote><div><br></div><div>Yes. This is exactly the type of solutio=
n I was thinking of including pinning the journal! You used the correct ter=
minology. I can read the terms but not write them. :-)</div><div><br></div>=
<div>You also managed to summarize it in only a few lines of text. As conce=
pts go, I think that makes it not-too-complex.</div><div><br></div><div>But=
, the devil is often in the details, and you are right that this is a per-f=
ile system cost.</div><div><br></div><div>Balancing this, however, I am per=
haps presuming that *all* systems will eventually be thin volume systems, a=
nd that correct behaviour and highly available behaviour will eventually re=
quire that *all* systems invest in technology such as this. My view of the =
future is that fixed sized thick partitions are very often a solution which=
 is compromised from the start. Most systems of significance grow over time=
, and the pressure to reduce cost is real. I think we are taking baby steps=
 to start, but that the systems of the future will be thin volume systems. =
I see this as a problem that needs to be understood and solved, except in t=
he most limited of use cases. This is my opinion, which I don&#39;t expect =
anybody to share.</div><div><br></div><div>=C2=A0</div><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex">
This at least should maintain FS integrity albeit you may end up in a situa=
tion where the journal can never get properly de-staged, so you&#39;re stuc=
k on any further writes and need to force RO.<br></blockquote><div><br></di=
v><div>Interesting to consider. I don&#39;t see this as necessarily a probl=
em - or that it necessitates &quot;RO&quot; as a persistent state. For exam=
ple, it would be most practical if sufficient room was reserved to allow fo=
r content to be removed, allowing for the file system to become unwedged an=
d become &quot;RW&quot; again. Perhaps there is always an edge case that wo=
uld necessitate a persistent &quot;RO&quot; state that requires the volume =
be extended to recover from, but I think the edge case could be refined to =
something that will tend to never happen?</div><div><br></div><div>=C2=A0</=
div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex"><span class=3D"">
&gt; just want a sanely behaving LVM + XFS...)<br></span>IMO if the system =
admin made a conscious decision to use thin AND overprovision (thin by itse=
lf is not dangerous), it&#39;s up to HIM to actively manage his block layer=
. Even on million dollar SANs the expectation is that the engineer will do =
his job and not drop the mic and walk away. Maybe the &quot;easiest&quot; i=
mplementation would be a MD layer job that the admin can tailor to fail all=
 allocation requests once extent count drops below a number and thus forcin=
g all FS mounted on the thinpool to go into RO mode.<br></blockquote><div><=
br></div><div>Another interesting idea. I like the idea of automatically sh=
utting down our applications or PostgreSQL database if the thin pool reache=
s an unsafe allocation, such as 90% or 95%. This would ensure the integrity=
 of the data, at the expense of an outage. This is something we could imple=
ment today. Thanks.</div><div><br></div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">
But in any event it won&#39;t prevent irate users from demanding why the sp=
ace they appear to have isn&#39;t actually there.</blockquote></div><div><b=
r></div><div>Users will always be irate. :-) I mostly don&#39;t consider th=
at as a real factor in my technical decisions... :-)</div><div><br></div><d=
iv>Thanks for entertaining this discussion, Matthew and Zdenek. I realize t=
his is an open source project, with passionate and smart people, whose time=
 is precious. I don&#39;t feel I have the capability of really contributing=
 code changes at this time, and I&#39;m satisfied that the ideas are being =
considered even if they ultimately don&#39;t get adopted. Even the mandator=
y warning about snapshots exceeding the volume group size is something I ca=
n continue to deal with using scripting and filtering. I mostly want to mak=
e sure that my perspective is known and understood.</div><div><br></div><di=
v><br></div>-- <br><div class=3D"gmail_signature">Mark Mielke &lt;<a href=
=3D"mailto:mark.mielke@gmail.com" target=3D"_blank">mark.mielke@gmail.com</=
a>&gt;<br><br></div>
</div></div>

--047d7bb03d7ecd57f50531fa1872--
