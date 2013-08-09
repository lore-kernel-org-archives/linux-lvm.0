MIME-Version: 1.0
In-Reply-To: <52034FEF.7070102@redhat.com>
References: <CAGDaZ_pgnZeWHrGO3_fQK92AQnoApGuf2Lq6rGNEGngf9p=UrA@mail.gmail.com>
	<52034E72.7050403@redhat.com> <52034F2A.1000608@redhat.com>
	<52034FEF.7070102@redhat.com>
From: Raymond Jennings <shentino@gmail.com>
Date: Thu, 8 Aug 2013 17:33:47 -0700
Message-ID: <CAGDaZ_qmdYDqaAGCfmLnnzppncm9eWbKko+sKOZFkg0ctVX2rg@mail.gmail.com>
Content-Type: multipart/alternative; boundary=089e011765a1ea325704e378efb7
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

--089e011765a1ea325704e378efb7
Content-Type: text/plain; charset=UTF-8

If and when you guys post a bug report with gcc, could you post a copy of
it here?

I plan to follow the bug myself.

Gcc: 4.8.1, for the record.


On Thu, Aug 8, 2013 at 12:59 AM, Peter Rajnoha <prajnoha@redhat.com> wrote:

> On 08/08/2013 09:56 AM, Peter Rajnoha wrote:
> > On 08/08/2013 09:53 AM, Peter Rajnoha wrote:
> >> We've nailed this down to a problem with gcc
> >> compiler and its optimisation. It happens if -O2 optimisation is used
> >> during compilation, but it does not happen with -O1 nor -O0. Also, we
> >> could not reproduce with gcc 4.7, but reproduced with 4.8.
>
> To get rid of these message until we find the workaround,
> please, set config {checks = 0} in your lvm.conf.
>
> Peter
>

--089e011765a1ea325704e378efb7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">If and when you guys post a bug report with gcc, could you=
 post a copy of it here?<div><br></div><div>I plan to follow the bug myself=
.</div><div><br></div><div>Gcc: 4.8.1, for the record.</div></div><div clas=
s=3D"gmail_extra">

<br><br><div class=3D"gmail_quote">On Thu, Aug 8, 2013 at 12:59 AM, Peter R=
ajnoha <span dir=3D"ltr">&lt;<a href=3D"mailto:prajnoha@redhat.com" target=
=3D"_blank">prajnoha@redhat.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">

<div class=3D"im">On 08/08/2013 09:56 AM, Peter Rajnoha wrote:<br>
&gt; On 08/08/2013 09:53 AM, Peter Rajnoha wrote:<br>
&gt;&gt; We&#39;ve nailed this down to a problem with gcc<br>
&gt;&gt; compiler and its optimisation. It happens if -O2 optimisation is u=
sed<br>
&gt;&gt; during compilation, but it does not happen with -O1 nor -O0. Also,=
 we<br>
&gt;&gt; could not reproduce with gcc 4.7, but reproduced with 4.8.<br>
<br>
</div>To get rid of these message until we find the workaround,<br>
please, set config {checks =3D 0} in your lvm.conf.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
Peter<br>
</font></span></blockquote></div><br></div>

--089e011765a1ea325704e378efb7--
