MIME-Version: 1.0
In-Reply-To: <20170824151914.GA21493@redhat.com>
References: <CALSgSusawY1CK0LtaCfX8jY34Q1td=3EpcAVRByvVoV19rwuNw@mail.gmail.com>
	<20170824151914.GA21493@redhat.com>
From: Ravi Hemnani <raviiihemnani@gmail.com>
Date: Fri, 25 Aug 2017 00:18:29 +0530
Message-ID: <CALSgSutKe8cmJRr43y2dd+c+e-D18g=m65i6wrQ8M7SHAPqBTA@mail.gmail.com>
Content-Type: multipart/alternative; boundary="001a11468fc84f17a105578446c8"
Subject: Re: [linux-lvm] How to compile lvm with lvmlockd
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
To: David Teigland <teigland@redhat.com>
Cc: linux-lvm@redhat.com

--001a11468fc84f17a105578446c8
Content-Type: text/plain; charset="UTF-8"

Hey,

Thank you for getting back on this. I was successfully able to complie
lvmlockd on ubuntu. Initializing lvmlockd is causing some issues especially
during first vgcreate in order to create global lock. I will pass on more
information on that soon.

On Thu, Aug 24, 2017 at 8:49 PM, David Teigland <teigland@redhat.com> wrote:

> On Tue, Aug 22, 2017 at 10:29:25PM +0530, Ravi Hemnani wrote:
> > Hey
> >
> > How to compile lvm with lvmlockd? I cant see any documentation related to
> > that. I want to use lvmlockd on ubuntu/debian. Any help is appreciated.
>
> You'll need packages for dlm and sanlock, and configure lvm with
> --enable-lvmlockd-sanlock --enable-lvmlockd-dlm.
>
> Dave
>



-- 
Thank you and Regards,

Ravi Hemnani.

--001a11468fc84f17a105578446c8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hey,<br><br></div>Thank you for getting back on this.=
 I was successfully able to complie lvmlockd on ubuntu. Initializing lvmloc=
kd is causing some issues especially during first vgcreate in order to crea=
te global lock. I will pass on more information on that soon. <br></div><di=
v class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Thu, Aug 24, 2017=
 at 8:49 PM, David Teigland <span dir=3D"ltr">&lt;<a href=3D"mailto:teiglan=
d@redhat.com" target=3D"_blank">teigland@redhat.com</a>&gt;</span> wrote:<b=
r><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex"><span class=3D"">On Tue, Aug 22, 2017 at 1=
0:29:25PM +0530, Ravi Hemnani wrote:<br>
&gt; Hey<br>
&gt;<br>
&gt; How to compile lvm with lvmlockd? I cant see any documentation related=
 to<br>
&gt; that. I want to use lvmlockd on ubuntu/debian. Any help is appreciated=
.<br>
<br>
</span>You&#39;ll need packages for dlm and sanlock, and configure lvm with=
<br>
--enable-lvmlockd-sanlock --enable-lvmlockd-dlm.<br>
<br>
Dave<br>
</blockquote></div><br><br clear=3D"all"><br>-- <br><div class=3D"gmail_sig=
nature" data-smartmail=3D"gmail_signature">Thank you and Regards,<br><br>Ra=
vi Hemnani.</div>
</div>

--001a11468fc84f17a105578446c8--
