MIME-Version: 1.0
In-Reply-To: <53E46F5F.1090709@redhat.com>
References: <CAK4r=d5PT_LRbSQgU3Jo35LLvaVgJ3+fpgGWPOitoAJOVZOjeQ@mail.gmail.com>
	<53D6085D.2030303@redhat.com>
	<CAK4r=d4wtwm+n=JyKrd7yrCqw-EjSoZagtDEMONUTz9acg2C3g@mail.gmail.com>
	<53E46F5F.1090709@redhat.com>
From: Vivek Satpute <vivekonline86@gmail.com>
Date: Fri, 8 Aug 2014 14:03:50 +0530
Message-ID: <CAK4r=d4WjS78=rVp3kQx_EzroDMn-nBF8n9_JB4Fo3DU8cm8Ew@mail.gmail.com>
Content-Type: multipart/alternative; boundary=001a1133a0dac347ef05001a11cc
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

--001a1133a0dac347ef05001a11cc
Content-Type: text/plain; charset=UTF-8

Thanks a much Peter. This really helped a lot :-)


Regards


On Fri, Aug 8, 2014 at 12:04 PM, Peter Rajnoha <prajnoha@redhat.com> wrote:

> On 08/07/2014 08:20 PM, Vivek Satpute wrote:
> > Thanks a lot Peter for replying.
> >
> > I know that */sys/devices/virtual**/block/dm-0  *SysFsPath would get
> > created by block-layer when corresponding block device gets created.
> >
> > Actually I am looking for how below dependencies is getting created for
> > LVM volume by systemd:
> >
> > [root@host]# systemctl show dev-rhel_host-root.device
> > Id=dev-rhel_host-root.device
> > Names=dev-rhel_host-root.device
> > *Following=sys-devices-virtual-block-dm\x2d0.device
> > *
> > [...]
> > *SysFSPath=/sys/devices/virtual/block/dm-0*
> > *
> > *
> > /dev/rhel_host/root (path of LVM volume) is actually a symbolic link
> > pointing to /dev/dm-0, then how systemd recognize that
> > device dev-rhel_host-root.device
> > follows *sys-devices-virtual-block-dm\x2d0.device ?*
> > *
>
> Systemd can read this information from udev events (or udev database
> records).
> The information about all existing symlinks and their names, the dev node
> name
> ("kernel name") and related sysfs link is all recorded in udev database so
> systemd
> just makes the .device unit out of this information.
>
> --
> Peter
>

--001a1133a0dac347ef05001a11cc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks a much Peter. This really helped a lot :-)<div><br>=
</div><div><br></div><div>Regards</div></div><div class=3D"gmail_extra"><br=
><br><div class=3D"gmail_quote">On Fri, Aug 8, 2014 at 12:04 PM, Peter Rajn=
oha <span dir=3D"ltr">&lt;<a href=3D"mailto:prajnoha@redhat.com" target=3D"=
_blank">prajnoha@redhat.com</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"">On 08/07/2014 08:20 PM, Vive=
k Satpute wrote:<br>
&gt; Thanks a lot Peter for replying.<br>
&gt;<br>
</div>&gt; I know that */sys/devices/virtual**/block/dm-0 =C2=A0*SysFsPath =
would get<br>
<div class=3D"">&gt; created by block-layer when corresponding block device=
 gets created.<br>
&gt;<br>
&gt; Actually I am looking for how below dependencies is getting created fo=
r<br>
&gt; LVM volume by systemd:<br>
&gt;<br>
&gt; [root@host]# systemctl show dev-rhel_host-root.device<br>
&gt; Id=3Ddev-rhel_host-root.device<br>
&gt; Names=3Ddev-rhel_host-root.device<br>
</div>&gt; *Following=3Dsys-devices-virtual-block-dm\x2d0.device<br>
&gt; *<br>
&gt; [...]<br>
&gt; *SysFSPath=3D/sys/devices/virtual/block/dm-0*<br>
&gt; *<br>
<div class=3D"">&gt; *<br>
&gt; /dev/rhel_host/root (path of LVM volume) is actually a symbolic link<b=
r>
&gt; pointing to /dev/dm-0, then how systemd recognize that<br>
&gt; device dev-rhel_host-root.device<br>
</div>&gt; follows *sys-devices-virtual-block-dm\x2d0.device ?*<br>
&gt; *<br>
<br>
Systemd can read this information from udev events (or udev database record=
s).<br>
The information about all existing symlinks and their names, the dev node n=
ame<br>
(&quot;kernel name&quot;) and related sysfs link is all recorded in udev da=
tabase so systemd<br>
just makes the .device unit out of this information.<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
Peter<br>
</font></span></blockquote></div><br></div>

--001a1133a0dac347ef05001a11cc--
