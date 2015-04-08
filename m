MIME-Version: 1.0
In-Reply-To: <552443F7.8080207@redhat.com>
References: <CAKEq5nvhrnJ9Cir70jb8uqmcV42AT2sqGh_qNpo7-rCAu4Gd-A@mail.gmail.com>
	<552443F7.8080207@redhat.com>
Date: Wed, 8 Apr 2015 10:47:42 -0500
Message-ID: <CAKEq5nuS7vs02WjHq-dKiW-8iApT=vUqMFKWD8a=XSiHvNOotQ@mail.gmail.com>
From: Michael Schmidt <schmidmt@gmail.com>
Content-Type: multipart/alternative; boundary=001a11c21b4c9e2f6d0513387335
Subject: Re: [linux-lvm] Tagging LVs with Python Bindings
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
To: tasleson@redhat.com, LVM general discussion and development <linux-lvm@redhat.com>

--001a11c21b4c9e2f6d0513387335
Content-Type: text/plain; charset=UTF-8

Much appreciated. I'll integrated your fix into the build I have.

I looked through Bugzilla and didn't see anything and decided it would be
more straight forward to ask if there was an existing method to solve the
problem before suggesting it was a bug.

-Mike Schmidt

On Tue, Apr 7, 2015 at 3:54 PM, Tony Asleson <tasleson@redhat.com> wrote:

> On 04/06/2015 12:08 PM, Michael Schmidt wrote:
> > Hi all,
> >
> > While working with the Python bindings and attempting to add tags to
> > logical volume lvm_vg_write seems not to be called. This means if add_tag
> > is called and the virtual group handle is closed the tags disappear.
>
> Thanks for reporting this!
>
> > The
> > action in _liblvm_lvm_vg_add_tag solves this by calling lvm_vg_write on
> the
> > handle itself. Since the lv handle does not seem to have access to it's
> vg
> > handle I added a method to the vg just to trigger a write:
>
> The python bindings were written with the expectation that the state
> changes would be saved automatically.  So adding a call for the user to
> issue a write on the vg goes against the overall design.
>
> ...
>
> > My question is: is there a better way to accomplish this?
>
> In this case we should issue the lvm_vg_write in the add/remove tag
> calls for the lv.  The lv structure has a pointer to the parent vg in
> the python binding.
>
> I submitted a patch which does this and improves the unit test to test
> for this.
>
> Any bugzilla submitted for this?
>
> Regards,
> Tony
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>



-- 
Michael T Schmidt | schmidmt.com | duality.io

--001a11c21b4c9e2f6d0513387335
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Much appreciated. I&#39;ll integrated your fix into the bu=
ild I have.=C2=A0<br><br>I looked through Bugzilla and didn&#39;t see anyth=
ing and decided it would be more straight forward to ask if there was an ex=
isting method to solve the problem before suggesting it was a bug.<div><br>=
</div><div>-Mike Schmidt</div></div><div class=3D"gmail_extra"><br><div cla=
ss=3D"gmail_quote">On Tue, Apr 7, 2015 at 3:54 PM, Tony Asleson <span dir=
=3D"ltr">&lt;<a href=3D"mailto:tasleson@redhat.com" target=3D"_blank">tasle=
son@redhat.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><spa=
n class=3D"">On 04/06/2015 12:08 PM, Michael Schmidt wrote:<br>
&gt; Hi all,<br>
&gt;<br>
&gt; While working with the Python bindings and attempting to add tags to<b=
r>
&gt; logical volume lvm_vg_write seems not to be called. This means if add_=
tag<br>
&gt; is called and the virtual group handle is closed the tags disappear.<b=
r>
<br>
</span>Thanks for reporting this!<br>
<span class=3D""><br>
&gt; The<br>
&gt; action in _liblvm_lvm_vg_add_tag solves this by calling lvm_vg_write o=
n the<br>
&gt; handle itself. Since the lv handle does not seem to have access to it&=
#39;s vg<br>
&gt; handle I added a method to the vg just to trigger a write:<br>
<br>
</span>The python bindings were written with the expectation that the state=
<br>
changes would be saved automatically.=C2=A0 So adding a call for the user t=
o<br>
issue a write on the vg goes against the overall design.<br>
<br>
...<br>
<span class=3D""><br>
&gt; My question is: is there a better way to accomplish this?<br>
<br>
</span>In this case we should issue the lvm_vg_write in the add/remove tag<=
br>
calls for the lv.=C2=A0 The lv structure has a pointer to the parent vg in<=
br>
the python binding.<br>
<br>
I submitted a patch which does this and improves the unit test to test<br>
for this.<br>
<br>
Any bugzilla submitted for this?<br>
<br>
Regards,<br>
Tony<br>
<br>
_______________________________________________<br>
linux-lvm mailing list<br>
<a href=3D"mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br>
<a href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm" target=3D"_bl=
ank">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>
read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" target=
=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div class=
=3D"gmail_signature"><div dir=3D"ltr">Michael T Schmidt | <a href=3D"http:/=
/schmidmt.com" target=3D"_blank">schmidmt.com</a> | <a href=3D"http://duali=
ty.io" target=3D"_blank">duality.io</a></div></div>
</div>

--001a11c21b4c9e2f6d0513387335--
