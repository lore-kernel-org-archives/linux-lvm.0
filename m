MIME-Version: 1.0
References: <CAB5m+-G_sxm1SGOHc=f-kYOYnfnG+EOa1DmDSdY46NXQsX72tQ@mail.gmail.com>
	<dc535785-8408-6f82-1af6-fbed596141cc@redhat.com>
	<CAB5m+-F78BJYr-jVerNqAW-h8ZPSmt=hmG9FCigRVFk3KXC2yA@mail.gmail.com>
	<efff92af-60d9-fed7-4418-6f252994d781@redhat.com>
In-Reply-To: <efff92af-60d9-fed7-4418-6f252994d781@redhat.com>
From: Far Had <farhadk.it@gmail.com>
Date: Sat, 1 Dec 2018 16:14:15 +0330
Message-ID: <CAB5m+-GyXYnSPxLszT7sRhLmHm4gwSGixkT2V821wAUCnnhSbA@mail.gmail.com>
Content-Type: multipart/alternative; boundary="0000000000000c06e8057bf54568"
Subject: Re: [linux-lvm] lvm.conf backup section
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
To: zkabelac@redhat.com
Cc: linux-lvm@redhat.com

--0000000000000c06e8057bf54568
Content-Type: text/plain; charset="UTF-8"

How does it *make sure* that I've backup files younger than 10 days old?
What if I delete those files?

On Wed, Nov 28, 2018 at 3:54 PM Zdenek Kabelac <zkabelac@redhat.com> wrote:

> Dne 28. 11. 18 v 13:18 Far Had napsal(a):
> > Thanks for the response,
> > but I still don't get the point. Assume that I use same names for my
> VGs, In
> > this case if I do for example:
> > /retain_days = 10/
> > and
> > /retain_min = 15/
> > in lvm.conf file, what is the system's behaviour when archiving backup
> files?
> > Please explain specifically.
>
> Hi
>
> Archive file should be kept for at least 10 days, and there should be kept
> at
> least 15 archive files.
>
> So in better example:
>
> If you have i.e. many files generated daily - this makes sure you should
> have
> files at least 10 days back as well  (otherwise it could happen you could
> have
> backup only from last few recent commands)
>
> If you run lvm2 modifying commands very occasionally - you should still
> have
> at least 15 historical archives  (otherwise it could happen you could have
> very few archives if any....)
>
> As you can see both are 'arming' at slightly different work flow.
>
> Regards
>
> Zdenek
>

--0000000000000c06e8057bf54568
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">How does it <u>make sure</u>=C2=A0that I&#39;ve backup fil=
es younger than 10 days old? What if I delete those files?</div><br><div cl=
ass=3D"gmail_quote"><div dir=3D"ltr">On Wed, Nov 28, 2018 at 3:54 PM Zdenek=
 Kabelac &lt;<a href=3D"mailto:zkabelac@redhat.com">zkabelac@redhat.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Dne 28. 11. 18 v 13:18 =
Far Had napsal(a):<br>
&gt; Thanks for the response,<br>
&gt; but I still don&#39;t get the point. Assume that I use same names for =
my VGs, In <br>
&gt; this case if I do for example:<br>
&gt; /retain_days =3D 10/<br>
&gt; and<br>
&gt; /retain_min =3D 15/<br>
&gt; in lvm.conf file, what is the system&#39;s behaviour when archiving ba=
ckup files? <br>
&gt; Please explain specifically.<br>
<br>
Hi<br>
<br>
Archive file should be kept for at least 10 days, and there should be kept =
at <br>
least 15 archive files.<br>
<br>
So in better example:<br>
<br>
If you have i.e. many files generated daily - this makes sure you should ha=
ve <br>
files at least 10 days back as well=C2=A0 (otherwise it could happen you co=
uld have <br>
backup only from last few recent commands)<br>
<br>
If you run lvm2 modifying commands very occasionally - you should still hav=
e <br>
at least 15 historical archives=C2=A0 (otherwise it could happen you could =
have <br>
very few archives if any....)<br>
<br>
As you can see both are &#39;arming&#39; at slightly different work flow.<b=
r>
<br>
Regards<br>
<br>
Zdenek<br>
</blockquote></div>

--0000000000000c06e8057bf54568--
