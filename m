Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.10])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id oAFI4Rsi013666
	for <linux-lvm@redhat.com>; Mon, 15 Nov 2010 13:04:27 -0500
Received: from mail-gw0-f46.google.com (mail-gw0-f46.google.com [74.125.83.46])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oAFI4ECR021900
	for <linux-lvm@redhat.com>; Mon, 15 Nov 2010 13:04:15 -0500
Received: by gwj17 with SMTP id 17so1231164gwj.33
	for <linux-lvm@redhat.com>; Mon, 15 Nov 2010 10:04:14 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <AANLkTimzHm_zhG97cpCnnAO_mTDzEnftDGB=OQ8G-417@mail.gmail.com>
References: <AANLkTi=+iwZLBxZFzhb++KMevOy55QJrg9xg9Ey2w_kX@mail.gmail.com>
	<4CDDBF95.9040104@q7.com> <4CDDCF7E.4070006@q7.com>
	<AANLkTik5soU2jrS+MpDbAO6PBTEw-Qy-gtUiiyrXkEgs@mail.gmail.com>
	<4CDDE2CE.90907@bmsi.com>
	<AANLkTimzHm_zhG97cpCnnAO_mTDzEnftDGB=OQ8G-417@mail.gmail.com>
Date: Tue, 16 Nov 2010 03:04:13 +0900
Message-ID: <AANLkTim1zCpfUUvdSgSievdxmRP38NHKOvJOQq8J38r_@mail.gmail.com>
From: Romeo Theriault <romeo.theriault@maine.edu>
Content-Type: multipart/alternative; boundary=0016e64347da8cae5e04951b4487
Subject: Re: [linux-lvm] advice for curing terrible snapshot performance?
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

--0016e64347da8cae5e04951b4487
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Nov 16, 2010 at 02:52, chris (fool) mccraw <gently@gmail.com> wrote:

> On Fri, Nov 12, 2010 at 16:58, Stuart D Gathman <stuart@bmsi.com> wrote:
> > On 11/12/2010 07:17 PM, chris (fool) mccraw wrote:
> >> still curious about Zumastor--does anyone use this in production?
> > Zumastor would not speed up a single snapshot.  It solves the problem of
> > supporting multiple (as in lots of) snapsnots with the same performance
> > as a single snapshot (so that taking a snap every 5mins becomes
> > practical).
>
> I realize this.  like i said, we can probably eat the performance hit
> for a single snapshot, but more than one is just not workable so far.
>
>
Found another interesting post about LVM perf with snapshots.

http://www.mysqlperformanceblog.com/2009/02/05/disaster-lvm-performance-in-snapshot-mode/




-- 
Romeo Theriault

--0016e64347da8cae5e04951b4487
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Tue, Nov 16, 2010 at 02:52, chris (fool) mccr=
aw <span dir=3D"ltr">&lt;<a href=3D"mailto:gently@gmail.com">gently@gmail.c=
om</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex;">
<div class=3D"im">On Fri, Nov 12, 2010 at 16:58, Stuart D Gathman &lt;<a hr=
ef=3D"mailto:stuart@bmsi.com">stuart@bmsi.com</a>&gt; wrote:<br>
&gt; On 11/12/2010 07:17 PM, chris (fool) mccraw wrote:<br>
&gt;&gt; still curious about Zumastor--does anyone use this in production?<=
br>
&gt; Zumastor would not speed up a single snapshot. =A0It solves the proble=
m of<br>
&gt; supporting multiple (as in lots of) snapsnots with the same performanc=
e<br>
&gt; as a single snapshot (so that taking a snap every 5mins becomes<br>
&gt; practical).<br>
<br>
</div>I realize this. =A0like i said, we can probably eat the performance h=
it<br>
for a single snapshot, but more than one is just not workable so far.<br><b=
r></blockquote><div><br></div><div>Found another interesting post about LVM=
 perf with snapshots.</div><div><br></div><div><a href=3D"http://www.mysqlp=
erformanceblog.com/2009/02/05/disaster-lvm-performance-in-snapshot-mode/">h=
ttp://www.mysqlperformanceblog.com/2009/02/05/disaster-lvm-performance-in-s=
napshot-mode/</a>=A0</div>
</div><br><br clear=3D"all"><br>-- <br>Romeo Theriault<br><br>

--0016e64347da8cae5e04951b4487--
