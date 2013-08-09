MIME-Version: 1.0
In-Reply-To: <5204D719.2060304@redhat.com>
References: <CAGDaZ_pgnZeWHrGO3_fQK92AQnoApGuf2Lq6rGNEGngf9p=UrA@mail.gmail.com>
	<52034E72.7050403@redhat.com> <52034F2A.1000608@redhat.com>
	<52034FEF.7070102@redhat.com>
	<CAGDaZ_qmdYDqaAGCfmLnnzppncm9eWbKko+sKOZFkg0ctVX2rg@mail.gmail.com>
	<5204D719.2060304@redhat.com>
From: Raymond Jennings <shentino@gmail.com>
Date: Fri, 9 Aug 2013 09:06:50 -0700
Message-ID: <CAGDaZ_qJCbqGfo3PP0GEE1VtxN9epZsL-JJO6jyPdvHy4Hw_fQ@mail.gmail.com>
Content-Type: multipart/alternative; boundary=20cf3079b590c81b2104e385f8ad
Subject: Re: [linux-lvm] Weird errors after fresh install
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
To: Peter Rajnoha <prajnoha@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

--20cf3079b590c81b2104e385f8ad
Content-Type: text/plain; charset=UTF-8

Thanks ^^

I meant though that I'd like to follow the upstream bug report with gcc


On Fri, Aug 9, 2013 at 4:48 AM, Peter Rajnoha <prajnoha@redhat.com> wrote:

> On 08/09/2013 02:33 AM, Raymond Jennings wrote:
> > If and when you guys post a bug report with gcc, could you post a copy
> > of it here?
> >
> > I plan to follow the bug myself
>
> So finally we get to the source of the problem.
> It's reported here:
> https://bugzilla.redhat.com/show_bug.cgi?id=995446
>
> The workaround we provide is to not use the "static"
> qualifier for the string that is malformed by that bug
> (and hence the optimizer is not touching it that much):
>
>
> https://git.fedorahosted.org/cgit/lvm2.git/commit/?id=2f61478436a7ebe058ffad3f92e1c4dada0805d0
>
> I'll update F19 shortly.
>
> Peter
>

--20cf3079b590c81b2104e385f8ad
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks ^^<div><br></div><div>I meant though that I&#39;d l=
ike to follow the upstream bug report with gcc</div></div><div class=3D"gma=
il_extra"><br><br><div class=3D"gmail_quote">On Fri, Aug 9, 2013 at 4:48 AM=
, Peter Rajnoha <span dir=3D"ltr">&lt;<a href=3D"mailto:prajnoha@redhat.com=
" target=3D"_blank">prajnoha@redhat.com</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On 08/09/2013 02:33 AM, Ra=
ymond Jennings wrote:<br>
&gt; If and when you guys post a bug report with gcc, could you post a copy=
<br>
&gt; of it here?<br>
&gt;<br>
&gt; I plan to follow the bug myself<br>
<br>
</div>So finally we get to the source of the problem.<br>
It&#39;s reported here:<br>
<a href=3D"https://bugzilla.redhat.com/show_bug.cgi?id=3D995446" target=3D"=
_blank">https://bugzilla.redhat.com/show_bug.cgi?id=3D995446</a><br>
<br>
The workaround we provide is to not use the &quot;static&quot;<br>
qualifier for the string that is malformed by that bug<br>
(and hence the optimizer is not touching it that much):<br>
<br>
<a href=3D"https://git.fedorahosted.org/cgit/lvm2.git/commit/?id=3D2f614784=
36a7ebe058ffad3f92e1c4dada0805d0" target=3D"_blank">https://git.fedorahoste=
d.org/cgit/lvm2.git/commit/?id=3D2f61478436a7ebe058ffad3f92e1c4dada0805d0</=
a><br>


<br>
I&#39;ll update F19 shortly.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
Peter<br>
</font></span></blockquote></div><br></div>

--20cf3079b590c81b2104e385f8ad--
