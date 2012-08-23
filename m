Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q7NFIBNp002811
	for <linux-lvm@redhat.com>; Thu, 23 Aug 2012 11:18:11 -0400
Received: from mail-ee0-f46.google.com (mail-ee0-f46.google.com [74.125.83.46])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q7NFI9mR005119
	for <linux-lvm@redhat.com>; Thu, 23 Aug 2012 11:18:10 -0400
Received: by eeil10 with SMTP id l10so324531eei.33
	for <linux-lvm@redhat.com>; Thu, 23 Aug 2012 08:18:09 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <39598.78.154.109.125.1345731038.squirrel@yellowside.org.uk>
References: <CAGQjrKZju5zQA9_cGtO+n0WRe2t6ZSJB+SKfr23+JJ3YzntgUQ@mail.gmail.com>
	<CAGQjrKYZw27r=xgB2DaBtap-jQ1oi-7_Ydw=3z+2kw4s_03hAA@mail.gmail.com>
	<39598.78.154.109.125.1345731038.squirrel@yellowside.org.uk>
Date: Thu, 23 Aug 2012 20:48:09 +0530
Message-ID: <CAGQjrKbLD0bwedMGQP58BzdyFsnACdXLiziHLbw=tStAhX4BsA@mail.gmail.com>
From: tariq wali <ganaiwali@gmail.com>
Content-Type: multipart/alternative; boundary=047d7b60525cf5d78b04c7f05d90
Subject: Re: [linux-lvm] lvextend NEVER works but screws up
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
To: lvm@beer.org.uk, LVM general discussion and development <linux-lvm@redhat.com>

--047d7b60525cf5d78b04c7f05d90
Content-Type: text/plain; charset=ISO-8859-1

 lvresize to extend an lvm ? how

also I cant create a new lvm don't have that much space and the to extend
the new one and it would mean downtime . don't think it's an issue with
filesystem tools , lvm has NEVER been consistent in my case .

On Thu, Aug 23, 2012 at 7:40 PM, Vic <lvm@beer.org.uk> wrote:

>
> > I wanted to use the free 42.7 G and allocate it to /bin-logs so this is
> > what I ran in order to extended
> >
> > # lvextend -L +42.7G -n /dev/vg0/logs
>
> Well, I usually use lvresize to do this job, but lvextend should be fine.
>
> I wouldn't put that "-n" in, though; mucking around with a filesystem that
> needs fscking and not doing so would seem to be asking for trouble...
>
> HTH
>
> Vic.
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>



-- 
*Tariq Wali.*

--047d7b60525cf5d78b04c7f05d90
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span class=3D"Apple-style-span" style=3D"color:rgb(34,34,=
34);font-family:arial,sans-serif;font-size:13px;background-color:rgb(255,25=
5,255)">=A0lvresize to extend an lvm ? how=A0</span><div><font class=3D"App=
le-style-span" color=3D"#222222" face=3D"arial, sans-serif"><br>
</font></div><div><font class=3D"Apple-style-span" color=3D"#222222" face=
=3D"arial, sans-serif">also I cant create a new lvm don&#39;t have that muc=
h space and the to extend the new one and it would mean downtime . don&#39;=
t think it&#39;s an issue with filesystem tools , lvm has NEVER been consis=
tent in my case .<br>
</font><br><div class=3D"gmail_quote">On Thu, Aug 23, 2012 at 7:40 PM, Vic =
<span dir=3D"ltr">&lt;<a href=3D"mailto:lvm@beer.org.uk" target=3D"_blank">=
lvm@beer.org.uk</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<div class=3D"im"><br>
&gt; I wanted to use the free 42.7 G and allocate it to /bin-logs so this i=
s<br>
&gt; what I ran in order to extended<br>
&gt;<br>
&gt; # lvextend -L +42.7G -n /dev/vg0/logs<br>
<br>
</div>Well, I usually use lvresize to do this job, but lvextend should be f=
ine.<br>
<br>
I wouldn&#39;t put that &quot;-n&quot; in, though; mucking around with a fi=
lesystem that<br>
needs fscking and not doing so would seem to be asking for trouble...<br>
<br>
HTH<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
Vic.<br>
</font></span><div class=3D"HOEnZb"><div class=3D"h5"><br>
_______________________________________________<br>
linux-lvm mailing list<br>
<a href=3D"mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br>
<a href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm" target=3D"_bl=
ank">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>
read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" target=
=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br>
</div></div></blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>=
<div dir=3D"ltr"><i style=3D"background-color:rgb(255,0,0);color:rgb(0,102,=
0)">Tariq Wali.</i><span><span style=3D"background-color:rgb(255,255,153)">=
</span></span><br>
</div><br>
</div></div>

--047d7b60525cf5d78b04c7f05d90--
