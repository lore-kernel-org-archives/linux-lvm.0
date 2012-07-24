MIME-Version: 1.0
Sender: fvzwieten@gmail.com
In-Reply-To: <20120724131517.GA3165@redhat.com>
References: <CALVifsZrOo+D7nWpO3gKd87B1=Sn_F3PQy377etCb8p90=twow@mail.gmail.com>
	<CALVifsY2ZUNUZFEAUB1ASWbEXX_q3TP0g6aX60Te0A6D-8=+FA@mail.gmail.com>
	<20120724131517.GA3165@redhat.com>
Date: Tue, 24 Jul 2012 16:21:55 +0200
Message-ID: <CALVifsY0zh1YA214sMc9tU=ukd1VQWzYVnmnpPgScfNeSiF6Dw@mail.gmail.com>
From: Fred van Zwieten <fvzwieten@vxcompany.com>
Content-Type: multipart/alternative; boundary=f46d044304ee9a994404c59415f8
Subject: Re: [linux-lvm] Snapshot limit?
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
To: Mike Snitzer <snitzer@redhat.com>
Cc: "linux-lvm@redhat.com" <linux-lvm@redhat.com>

--f46d044304ee9a994404c59415f8
Content-Type: text/plain; charset=UTF-8

I agree, but that doesn't answer my questions ;-)

Met vriendelijke groeten,
*
Fred van Zwieten
*
*Enterprise Open Source Services*
*
Consultant*
*(vrijdags afwezig)*

*VX Company IT Services B.V.*
*T* (035) 539 09 50 mobiel (06) 41 68 28 48
*F* (035) 539 09 08
*E* fvzwieten@vxcompany.com
*I*  www.vxcompany.com



On Tue, Jul 24, 2012 at 3:15 PM, Mike Snitzer <snitzer@redhat.com> wrote:

> On Mon, Jul 23 2012 at  5:00am -0400,
> Fred van Zwieten <fvzwieten@vxcompany.com> wrote:
>
> > O, I forgot: I am using LVM2 on RHEL 6.3. That is LVM2 version 2.02.87.
> >
> > Met vriendelijke groeten,
> > *
> > Fred van Zwieten
> > *
> > *Enterprise Open Source Services*
> > *
> > Consultant*
> > *(vrijdags afwezig)*
> >
> > *VX Company IT Services B.V.*
> > *T* (035) 539 09 50 mobiel (06) 41 68 28 48
> > *F* (035) 539 09 08
> > *E* fvzwieten@vxcompany.com
> > *I*  www.vxcompany.com
> >
> >
> >
> > On Mon, Jul 23, 2012 at 10:52 AM, Fred van Zwieten
> > <fvzwieten@vxcompany.com>wrote:
> >
> > > Hi,
> > >
> > > I would like to know is there is a limit on the amount of snapshots one
> > > can take from a single LV.
> > >
> > > I have a single LV with a very low changerate, but I have a retention
> > > requirement of about 150 readonly snapshots for it. Is it is at all
> > > possible, will there be a performance hit?
> > >
> > > Fred
> > > **
>
> You definitely want to make use of the snapshots provided via the new
> thinp target (NOTE: thinp is still tech preview in RHEL6.3).
>

--f46d044304ee9a994404c59415f8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

I agree, but that doesn&#39;t answer my questions ;-)<br clear=3D"all"><br>=
Met vriendelijke groeten,<br><b><br><font style=3D"color:rgb(51,102,255)" c=
olor=3D"#000099">Fre</font><font style=3D"color:rgb(51,102,255)" color=3D"#=
000099">d van Zwieten</font><br style=3D"color:rgb(51,102,255)">

</b>
<div><font color=3D"#3333ff"><span style=3D"COLOR:rgb(0,0,153)"><b style=3D=
"color:rgb(51,102,255)">Enterprise Open Source Services</b><br></span></fon=
t></div>

<div><b><br><span style=3D"color:rgb(51,102,255)">Consultant</span></b><br>=
<font size=3D"1"><i>(vrijdags afwezig)</i></font></div>
<div><br><b><span style=3D"COLOR:rgb(255,0,0)">VX Company IT Services B.V.<=
/span></b><br><span style=3D"COLOR:rgb(0,0,153)"><b><span style=3D"COLOR:rg=
b(255,0,0)">T</span></b><span style=3D"color:rgb(255,255,255)">=C2=A0<span =
style=3D"color:rgb(51,102,255)">(035) 539 09 50 mobiel (06) 41 68 28 48</sp=
an></span></span><span style=3D"color:rgb(51,102,255)"></span><br style=3D"=
COLOR:rgb(0,0,153)">

<span style=3D"COLOR:rgb(0,0,153)"><b><span style=3D"COLOR:rgb(255,0,0)">F<=
/span></b>=C2=A0<span style=3D"color:rgb(51,102,255)">(035) 539 09 08</span=
></span><br style=3D"COLOR:rgb(0,0,153)"><span style=3D"COLOR:rgb(0,0,153)"=
><b style=3D"COLOR:rgb(255,0,0)">E</b><span style=3D"color:rgb(51,102,255)"=
>=C2=A0</span></span><a style=3D"color:rgb(51,102,255)" href=3D"mailto:fvzw=
ieten@vxcompany.com" target=3D"_blank">fvzwieten@vxcompany.com</a><br style=
=3D"COLOR:rgb(0,0,153)">

<span style=3D"COLOR:rgb(0,0,153)"><b style=3D"COLOR:rgb(255,0,0)">I</b>=C2=
=A0=C2=A0</span><a style=3D"color:rgb(51,102,255)" href=3D"http://www.vxcom=
pany.com/" target=3D"_blank">www.vxcompany.com</a></div><br>
<br><br><div class=3D"gmail_quote">On Tue, Jul 24, 2012 at 3:15 PM, Mike Sn=
itzer <span dir=3D"ltr">&lt;<a href=3D"mailto:snitzer@redhat.com" target=3D=
"_blank">snitzer@redhat.com</a>&gt;</span> wrote:<br><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex">

On Mon, Jul 23 2012 at =C2=A05:00am -0400,<br>
<div>Fred van Zwieten &lt;<a href=3D"mailto:fvzwieten@vxcompany.com" target=
=3D"_blank">fvzwieten@vxcompany.com</a>&gt; wrote:<br>
<br>
</div><div>&gt; O, I forgot: I am using LVM2 on RHEL 6.3. That is LVM2 vers=
ion 2.02.87.<br>
&gt;<br>
&gt; Met vriendelijke groeten,<br>
</div>&gt; *<br>
&gt; Fred van Zwieten<br>
&gt; *<br>
&gt; *Enterprise Open Source Services*<br>
&gt; *<br>
&gt; Consultant*<br>
&gt; *(vrijdags afwezig)*<br>
&gt;<br>
&gt; *VX Company IT Services B.V.*<br>
&gt; *T* (035) 539 09 50 mobiel (06) 41 68 28 48<br>
&gt; *F* (035) 539 09 08<br>
&gt; *E* <a href=3D"mailto:fvzwieten@vxcompany.com" target=3D"_blank">fvzwi=
eten@vxcompany.com</a><br>
&gt; *I* =C2=A0<a href=3D"http://www.vxcompany.com" target=3D"_blank">www.v=
xcompany.com</a><br>
<div>&gt;<br>
&gt;<br>
&gt;<br>
&gt; On Mon, Jul 23, 2012 at 10:52 AM, Fred van Zwieten<br>
&gt; &lt;<a href=3D"mailto:fvzwieten@vxcompany.com" target=3D"_blank">fvzwi=
eten@vxcompany.com</a>&gt;wrote:<br>
&gt;<br>
&gt; &gt; Hi,<br>
&gt; &gt;<br>
&gt; &gt; I would like to know is there is a limit on the amount of snapsho=
ts one<br>
&gt; &gt; can take from a single LV.<br>
&gt; &gt;<br>
&gt; &gt; I have a single LV with a very low changerate, but I have a reten=
tion<br>
&gt; &gt; requirement of about 150 readonly snapshots for it. Is it is at a=
ll<br>
&gt; &gt; possible, will there be a performance hit?<br>
&gt; &gt;<br>
&gt; &gt; Fred<br>
</div>&gt; &gt; **<br>
<br>
You definitely want to make use of the snapshots provided via the new<br>
thinp target (NOTE: thinp is still tech preview in RHEL6.3).<br>
</blockquote></div><br>

--f46d044304ee9a994404c59415f8--
