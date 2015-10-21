Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t9L4UqRZ001870
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Wed, 21 Oct 2015 00:30:52 -0400
Received: from mail-ig0-f196.google.com (mail-ig0-f196.google.com
	[209.85.213.196])
	by mx1.redhat.com (Postfix) with ESMTPS id B09DB8C1B1
	for <linux-lvm@redhat.com>; Wed, 21 Oct 2015 04:30:45 +0000 (UTC)
Received: by igbzj1 with SMTP id zj1so4223652igb.0
	for <linux-lvm@redhat.com>; Tue, 20 Oct 2015 21:30:45 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 21 Oct 2015 01:41:01 +0100
Message-ID: <CAMJSjjtjxuw7RPitBau4nXb+bqE-d9kf41uY41v9OSttV-G3Dw@mail.gmail.com>
From: Mark Ballard <markjballard@googlemail.com>
Content-Type: multipart/alternative; boundary=089e01176cadfa7190052292a15c
Subject: [linux-lvm] LVM pages at TLDP
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
To: alewis@rackable.com
Cc: linux-lvm@redhat.com

--089e01176cadfa7190052292a15c
Content-Type: text/plain; charset=UTF-8

Dear alewis

May I make a suggestion that may make a small improvement to your helpful
pages on LVM at The Linux Documentation Project?

I found your pages while searching for help on snapshots and mirrors in the
hope that I might find a foolproof way of moving the encrypted lvm disk on
my desktop to a safe place - from where it can still be booted! - while I
upgrade the O/S. (There are good reasons for this, from my perspective*).

Your documentation page, "Taking a backup using snapshots" (
http://www.tldp.org/HOWTO/LVM-HOWTO/snapshots_backup.html), helpfully
describes how to create the snapshot.

Then, however, you say ' I assume you will have a more sophisticated backup
strategy than this!', which I would say is an unwelcome assumption for
documentaion on how to backup. I would rather you assumed I where not at
all sophisticated and had very little clue about what I was going to do
next. That was indeed  why I was reading your documenation page in the
first place.

So I do want to do a sophisticated backup. But I don't know how. I have a
vague understanding that there might be some use in creating a tar ball of
a snapshot, rather than, say, simply making a tar ball of a partition. But
I would hope to find some explanation of the options that are available at
this point and which are advisible for different purposes - with the
reasons spelt out. That is why I have come here from the man pages. I
would, for example, suspect that my best option at this point might be to
dd the snapshot to my secondary drive. But if I did that, would it be a
snapshot of a volume group, or just one lv within a vg? Would then I need
to do a snapshot for each lv in my vg? Why not do a snapshot of a pv? And
most importantly, if I used dd to copy my logical volume, would I be
foolish to do it while my my o/s was running off it)? Or would I be
expected to run off a live disk or something in order to perform the
operation? I am anyway kind of surprised that lvm doesn't have a tool to
render a snapshot into a fully-fledged copy on another disk. Wouldn't
lvconvert do this? Perhaps something like rsync is the most sensible, even
after creating a snapshot. But then why would you bother creating a
snapshot for a backup then, and not simply rsync each lv? And while we are
on the subject, I had thought mirror might do this job, but the man pages
weren't much help to me, and I've found scant info on it elsewhere.

So thank you for getting me this far. I reckon I'll sleep on it.

mballard.

* The reasons are twofold. While it seemed that a snapshot or mirror might
be the way to do it, the description of snapshots in the lvm man pages is
atrocious. I was fortunately led to your page on snapshot backups by the
Ubuntu wiki, which has a refreshingly comprehensible description of
snapshots: https://wiki.ubuntu.com/Lvm

(it's author, flimm, should be encouraged, begged, paid or forced to write
the manpages imho. But flimm doesn't have a public email address - his
Ubuntu wiki points those searching for a contact address to
https://launchpad.net/~flimm, which says his address is not public. The lvm
manpages meanwhile have no address on them at all. They are presumably
unmanaged? And I guess users are irrelevant nowadays, so contact is not
necessary?).

Pre-briefed by flimms Wiki, your brief discussion on setting up a snapshot
was a helpful and informative digression, and it was easy to follow your
instructions at this point. (The thing that is not readily apparent, and
which is explained none too well in most of the standard documentation is
that snapshots do not get allocated their own dedicated physical space such
as an lv or a partition. This is unintuitive behaviour when you are used to
specifying some physical location for something to be dumped).

Secondly, (to be the long-winded article, and in case user experience
stories are of any use to you - if not, I hope you switched off before you
got here): I had resized partitions, physical and logical volumes some
while ago, despite reading some text somewhere that advised lvm couldn't
really cope with such an operation and would have to be setup afresh or it
would run like an old dog. It has seemed to be running like an old dog ever
since. But it is an old dog anyway, and I also needed to upgrade my o/s.
But I cannot interrupt my work. So I needed to find a way to recreate my
current installation on a secondary disk - and to be able to continue
working from it in the interim and further, in the event of a mishap -
while I wiped my main disk and installed a fresh lvm and o/s.

And no the RedHat documenation isn't much help on this either. That looks
like it was written for enterprise-class petrol heads. Probably not much
use for anyone on bicycle power.

--089e01176cadfa7190052292a15c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div>Dear alewis<br><br></div>May I make a sugge=
stion that may make a small improvement to your helpful pages on LVM at The=
 Linux Documentation Project?<br><br></div>I found your pages while searchi=
ng for help on snapshots and mirrors in the hope that I might find a foolpr=
oof way of moving the encrypted lvm disk on my desktop to a safe place - fr=
om where it can still be booted! - while I upgrade the O/S. (There are good=
 reasons for this, from my perspective*).<br><br></div>Your documentation p=
age, &quot;Taking a backup using snapshots&quot; (<a href=3D"http://www.tld=
p.org/HOWTO/LVM-HOWTO/snapshots_backup.html">http://www.tldp.org/HOWTO/LVM-=
HOWTO/snapshots_backup.html</a>), helpfully describes how to create the sna=
pshot.<br><br><div>Then, however, you say &#39;
          I assume you will have a more sophisticated backup strategy than
          this!&#39;, which I would say is an unwelcome assumption for docu=
mentaion on how to backup. I would rather you assumed I where not at all so=
phisticated and had very little clue about what I was going to do next. Tha=
t was indeed=C2=A0 why I was reading your documenation page in the first pl=
ace.<br><br></div><div>So I do want to do a sophisticated backup. But I don=
&#39;t know how. I have a vague understanding that there might be some use =
in creating a tar ball of a snapshot, rather than, say, simply making a tar=
 ball of a partition. But I would hope to find some explanation of the opti=
ons that are available at this point and which are advisible for different =
purposes - with the reasons spelt out. That is why I have come here from th=
e man pages. I would, for example, suspect that my best option at this poin=
t might be to dd the snapshot to my secondary drive. But if I did that, wou=
ld it be a snapshot of a volume group, or just one lv within a vg? Would th=
en I need to do a snapshot for each lv in my vg? Why not do a snapshot of a=
 pv? And most importantly, if I used dd to copy my logical volume, would I =
be foolish to do it while my my o/s was running off it)? Or would I be expe=
cted to run off a live disk or something in order to perform the operation?=
 I am anyway kind of surprised that lvm doesn&#39;t have a tool to render a=
 snapshot into a fully-fledged copy on another disk. Wouldn&#39;t lvconvert=
 do this? Perhaps something like rsync is the most sensible, even after cre=
ating a snapshot. But then why would you bother creating a snapshot for a b=
ackup then, and not simply rsync each lv? And while we are on the subject, =
I had thought mirror might do this job, but the man pages weren&#39;t much =
help to me, and I&#39;ve found scant info on it elsewhere.<br></div><div><b=
r></div><div>So thank you for getting me this far. I reckon I&#39;ll sleep =
on it.<br><br clear=3D"all"></div><div><div><div><div><div><div class=3D"gm=
ail_signature">mballard.<br><br></div><div class=3D"gmail_signature">* The =
reasons are twofold. While it seemed that a snapshot or mirror might be the=
 way to do it, the description of snapshots in the lvm man pages is atrocio=
us. I was fortunately led to your page on snapshot backups by the Ubuntu wi=
ki, which has a refreshingly comprehensible description of snapshots: <a hr=
ef=3D"https://wiki.ubuntu.com/Lvm">https://wiki.ubuntu.com/Lvm</a><br><br>(=
it&#39;s author, flimm, should be encouraged, begged, paid or forced to wri=
te the manpages imho. But flimm doesn&#39;t have a public email address - h=
is Ubuntu wiki points those searching for a contact address to <a href=3D"h=
ttps://launchpad.net/~flimm">https://launchpad.net/~flimm</a>, which says h=
is address is not public. The lvm manpages meanwhile have no address on the=
m at all. They are presumably unmanaged? And I guess users are irrelevant n=
owadays, so contact is not necessary?).<br><br>Pre-briefed by flimms Wiki, =
your brief discussion on setting up a snapshot was a helpful and informativ=
e digression, and it was easy to follow your instructions at this point. (T=
he thing that is not readily apparent,
 and which is explained none too well in most of the standard=20
documentation is that snapshots do not get allocated their own dedicated
 physical space such as an lv or a partition. This is unintuitive=20
behaviour when you are used to specifying some physical location for someth=
ing to be dumped).<br><div><br></div>Secondly, (to be the long-winded artic=
le, and in case user experience stories are of any use to=20
you - if not, I hope you switched off before you got here): I had resized p=
artitions, physical and=20
logical volumes some while ago, despite reading some text somewhere that
 advised lvm couldn&#39;t really cope with such an operation and would have=
=20
to be setup afresh or it would run like an old dog. It has seemed to be run=
ning like an old dog ever=20
since. But it is an old dog anyway, and I also needed to upgrade my o/s.
 But I cannot interrupt my work. So I needed to find a way to recreate=20
my current installation on a secondary disk - and to be able to continue
 working from it in the interim and further, in the event of a mishap -=20
while I wiped my main disk and installed a fresh lvm and o/s.<br><br></div>=
<div class=3D"gmail_signature">And no the RedHat documenation isn&#39;t muc=
h help on this either. That looks like it was written for enterprise-class =
petrol heads. Probably not much use for anyone on bicycle power.<br></div><=
/div>
</div></div></div></div></div>

--089e01176cadfa7190052292a15c--
