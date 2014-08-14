MIME-Version: 1.0
In-Reply-To: <53E48CA3.2020500@redhat.com>
References: <CAK4r=d5PT_LRbSQgU3Jo35LLvaVgJ3+fpgGWPOitoAJOVZOjeQ@mail.gmail.com>
	<53D6085D.2030303@redhat.com>
	<CAK4r=d4wtwm+n=JyKrd7yrCqw-EjSoZagtDEMONUTz9acg2C3g@mail.gmail.com>
	<53E46F5F.1090709@redhat.com>
	<CAK4r=d4WjS78=rVp3kQx_EzroDMn-nBF8n9_JB4Fo3DU8cm8Ew@mail.gmail.com>
	<53E48CA3.2020500@redhat.com>
From: Vivek Satpute <vivekonline86@gmail.com>
Date: Thu, 14 Aug 2014 23:49:17 +0530
Message-ID: <CAK4r=d4oFk_-CaWJxd8Z2H2ZmGiaozb4kbzs44o-rE6GssWtjg@mail.gmail.com>
Content-Type: multipart/alternative; boundary=001a1133a0da92797405009af2c5
Subject: Re: [linux-lvm] How LVM root volumes gets mounted at boot time ?
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

--001a1133a0da92797405009af2c5
Content-Type: text/plain; charset=UTF-8

Yea.. I "udevadm info" is quite helpful. Thanks a much Peter. Appreciate
your help.


Thanks and Regards,
Vivek Satpute


On Fri, Aug 8, 2014 at 2:08 PM, Peter Rajnoha <prajnoha@redhat.com> wrote:

> On 08/08/2014 10:33 AM, Vivek Satpute wrote:
> > Thanks a much Peter. This really helped a lot :-)
> >
>
> You're welcome.
>
> BTW, if you want to see the contents of udev database, just call
> "udevadm info --export-db" on cmd line. I think only one of
> the paths from sysfs dir is mentioned there, but udev (and all clients
> using udev via libudev) knows about all the other sysfs aliases for this
> device.
>
> --
> Peter
>

--001a1133a0da92797405009af2c5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Yea.. I &quot;udevadm info&quot; is quite helpful. Thanks =
a much Peter. Appreciate your help.<div><br></div><div><br></div><div style=
>Thanks and Regards,</div><div style>Vivek Satpute</div></div><div class=3D=
"gmail_extra">

<br><br><div class=3D"gmail_quote">On Fri, Aug 8, 2014 at 2:08 PM, Peter Ra=
jnoha <span dir=3D"ltr">&lt;<a href=3D"mailto:prajnoha@redhat.com" target=
=3D"_blank">prajnoha@redhat.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">

<div class=3D"">On 08/08/2014 10:33 AM, Vivek Satpute wrote:<br>
&gt; Thanks a much Peter. This really helped a lot :-)<br>
&gt;<br>
<br>
</div>You&#39;re welcome.<br>
<br>
BTW, if you want to see the contents of udev database, just call<br>
&quot;udevadm info --export-db&quot; on cmd line. I think only one of<br>
the paths from sysfs dir is mentioned there, but udev (and all clients<br>
using udev via libudev) knows about all the other sysfs aliases for this<br=
>
device.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
Peter<br>
</font></span></blockquote></div><br></div>

--001a1133a0da92797405009af2c5--
