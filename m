Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.7])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o6CLPbcj029153
	for <linux-lvm@redhat.com>; Mon, 12 Jul 2010 17:25:37 -0400
Received: from mail-wy0-f174.google.com (mail-wy0-f174.google.com
	[74.125.82.174])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o6CLPRTF021273
	for <linux-lvm@redhat.com>; Mon, 12 Jul 2010 17:25:28 -0400
Received: by wyf23 with SMTP id 23so4346407wyf.33
	for <linux-lvm@redhat.com>; Mon, 12 Jul 2010 14:25:26 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20100710155031.GA26290@agk-dp.fab.redhat.com>
References: <AANLkTikfqJRdgmf2ib9pz23p2IAz-fogXaSzfCv0tgEB@mail.gmail.com>
	<1278722281.8612.37@raydesk1.bettercgi.com>
	<Pine.LNX.4.64.1007092051070.29512@bmsred.bmsi.com>
	<20100710155031.GA26290@agk-dp.fab.redhat.com>
Date: Mon, 12 Jul 2010 17:25:26 -0400
Message-ID: <AANLkTimXTmPteemyFlPERIadySao43fL11eUdeTPUD_d@mail.gmail.com>
From: Michael Closson <closms@gmail.com>
Content-Type: multipart/alternative; boundary=00504502d0b92a874f048b376420
Subject: Re: [linux-lvm] efficiently copying snapshot data.
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
To: LVM general discussion and development <linux-lvm@redhat.com>

--00504502d0b92a874f048b376420
Content-Type: text/plain; charset=ISO-8859-1

OK but can the two snapshots exist on different physical machines?

On Sat, Jul 10, 2010 at 11:50 AM, Alasdair G Kergon <agk@redhat.com> wrote:

> On Fri, Jul 09, 2010 at 09:01:02PM -0400, Stuart D. Gathman wrote:
> > Copy to a regular LV on the target system, and then do some dmsetup
> > and metadata magic to turn the LV (which is a copy of a COW table) into a
> > snapshot of the master LV with the COW already populated.
>
> > I don't think such a utility exists.
>
> lvconvert -s  does this, regardless of what the man page might lead you
> to believe!
>
> Alasdair
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

--00504502d0b92a874f048b376420
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

OK but can the two snapshots exist on different physical machines?<br><br><=
div class=3D"gmail_quote">On Sat, Jul 10, 2010 at 11:50 AM, Alasdair G Kerg=
on <span dir=3D"ltr">&lt;<a href=3D"mailto:agk@redhat.com">agk@redhat.com</=
a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex;"><div class=3D"im">On Fri, Jul 09, 2010 at 0=
9:01:02PM -0400, Stuart D. Gathman wrote:<br>
&gt; Copy to a regular LV on the target system, and then do some dmsetup<br=
>
&gt; and metadata magic to turn the LV (which is a copy of a COW table) int=
o a<br>
&gt; snapshot of the master LV with the COW already populated.<br>
<br>
&gt; I don&#39;t think such a utility exists.<br>
<br>
</div>lvconvert -s =A0does this, regardless of what the man page might lead=
 you<br>
to believe!<br>
<font color=3D"#888888"><br>
Alasdair<br>
</font><div><div></div><div class=3D"h5"><br>
_______________________________________________<br>
linux-lvm mailing list<br>
<a href=3D"mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br>
<a href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm" target=3D"_bl=
ank">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>
read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" target=
=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br>
</div></div></blockquote></div><br>

--00504502d0b92a874f048b376420--
