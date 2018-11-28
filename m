MIME-Version: 1.0
References: <CAB5m+-G_sxm1SGOHc=f-kYOYnfnG+EOa1DmDSdY46NXQsX72tQ@mail.gmail.com>
	<dc535785-8408-6f82-1af6-fbed596141cc@redhat.com>
In-Reply-To: <dc535785-8408-6f82-1af6-fbed596141cc@redhat.com>
From: Far Had <farhadk.it@gmail.com>
Date: Wed, 28 Nov 2018 15:48:15 +0330
Message-ID: <CAB5m+-F78BJYr-jVerNqAW-h8ZPSmt=hmG9FCigRVFk3KXC2yA@mail.gmail.com>
Content-Type: multipart/alternative; boundary="000000000000c9e508057bb88e77"
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

--000000000000c9e508057bb88e77
Content-Type: text/plain; charset="UTF-8"

Thanks for the response,
but I still don't get the point. Assume that I use same names for my VGs,
In this case if I do for example:
*retain_days = 10*
and
*retain_min = 15*
in lvm.conf file, what is the system's behaviour when archiving backup
files? Please explain specifically.

On Wed, Nov 28, 2018 at 2:35 PM Zdenek Kabelac <zkabelac@redhat.com> wrote:

> Dne 28. 11. 18 v 10:51 Far Had napsal(a):
> > Hi
> > There are two parameters in lvm.conf which I don't understand the exact
> > meaning of.
> >
> > 1. retain_min
> > 2. retain_days
> >
> > What do "*the minimum number of archive files you wish to keep*" and
> "*minimum
> > time you wish to keep an archive file for*" mean?
> > Is there any auto deletion mechanism for backup archives?
>
> Hi
>
>
> There is kept history for 'created' VGs, where you can specify how many
> and for how long archives for individual VG you want to store.
>
> This works reasonably well if you use 'same VG names' all the time.
>
> However - when you use lvm2 on some testing machine where the VG name is
> essentially some random hash md5 lengthy string - you will sooner or later
> end
> with gazillion archive files in your /etc/lvm/archive directory.
>
> In this case it's admins responsibility to prune VG archive files that are
> no
> longer necessary.
>
> lvm2 has no idea if the VG named like: "myvg01320982woicdo8uagcd97wghcd"
> will be still ever needed again - so such archives are kept mostly
> forever....
>
> Every command you run which modifies metadata of particular VG does care
> only
> about that particular VG and it's archives.
>
> Hopefully this explains it.
>
> Regards
>
> Zdenek
>

--000000000000c9e508057bb88e77
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks for the response,<div>but I still don&#39;t get the=
 point. Assume that I use same names for my VGs, In this case if I do for e=
xample:</div><div><i>retain_days =3D 10</i></div><div>and</div><div><i>reta=
in_min =3D 15</i></div><div>in lvm.conf file, what is the system&#39;s beha=
viour when archiving backup files? Please explain specifically.</div></div>=
<br><div class=3D"gmail_quote"><div dir=3D"ltr">On Wed, Nov 28, 2018 at 2:3=
5 PM Zdenek Kabelac &lt;<a href=3D"mailto:zkabelac@redhat.com">zkabelac@red=
hat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Dne 28. 11. =
18 v 10:51 Far Had napsal(a):<br>
&gt; Hi<br>
&gt; There are two parameters in lvm.conf which I don&#39;t understand the =
exact <br>
&gt; meaning of.<br>
&gt; <br>
&gt; 1. retain_min<br>
&gt; 2. retain_days<br>
&gt; <br>
&gt; What do &quot;*the minimum number of archive files you wish to keep*&q=
uot; and &quot;*minimum <br>
&gt; time you wish to keep an archive file for*&quot; mean?<br>
&gt; Is there any auto deletion mechanism for backup archives?<br>
<br>
Hi<br>
<br>
<br>
There is kept history for &#39;created&#39; VGs, where you can specify how =
many<br>
and for how long archives for individual VG you want to store.<br>
<br>
This works reasonably well if you use &#39;same VG names&#39; all the time.=
<br>
<br>
However - when you use lvm2 on some testing machine where the VG name is <b=
r>
essentially some random hash md5 lengthy string - you will sooner or later =
end <br>
with gazillion archive files in your /etc/lvm/archive directory.<br>
<br>
In this case it&#39;s admins responsibility to prune VG archive files that =
are no <br>
longer necessary.<br>
<br>
lvm2 has no idea if the VG named like: &quot;myvg01320982woicdo8uagcd97wghc=
d&quot;<br>
will be still ever needed again - so such archives are kept mostly forever.=
...<br>
<br>
Every command you run which modifies metadata of particular VG does care on=
ly <br>
about that particular VG and it&#39;s archives.<br>
<br>
Hopefully this explains it.<br>
<br>
Regards<br>
<br>
Zdenek<br>
</blockquote></div>

--000000000000c9e508057bb88e77--
