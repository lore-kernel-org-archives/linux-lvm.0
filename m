MIME-Version: 1.0
In-Reply-To: <537AFE2A.50704@redhat.com>
References: <CAA-yaus6NpUkJYr3k9FSJ9KOiPQt2E+KdhK1D-dht7zgewAezQ@mail.gmail.com>
	<537AFE2A.50704@redhat.com>
From: David Wittman <dwittman@gmail.com>
Date: Tue, 20 May 2014 10:37:50 -0500
Message-ID: <CAA-yautpYCJ3GkHdDkovoMm+m-6JOo=2L9CUFdF+EY0HPdaLNw@mail.gmail.com>
Content-Type: multipart/alternative; boundary=20cf3005dd2acae21604f9d6aae2
Subject: Re: [linux-lvm] Setting readahead for Logical Volumes via udev
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

--20cf3005dd2acae21604f9d6aae2
Content-Type: text/plain; charset=UTF-8

Hey Peter,

Thanks for the response. I've previously tried the "change" action, and
adding the specifier for the DM_ACTIVATION environment variable had no
effect. I'm also aware of the capability to set the readahead on a
per-volume basis, but I'm looking for a solution which handles setting
these values at boot time and/or volume creation time.

Dave


On Tue, May 20, 2014 at 2:03 AM, Peter Rajnoha <prajnoha@redhat.com> wrote:

> On 05/19/2014 05:58 PM, David Wittman wrote:
> > Hey all,
> >
> > I'm having an issue tuning the readahead value for my Logical Volumes
> > via udev. In short, I'm trying to create a rule that sets the readahead
> > attribute for each of my Logical Volumes at boot time or upon the
> > creation of a new volume. udev seems like the perfect place to do this,
> > but for some reason or another LVM seems to be overriding these settings.
> >
> > Here's the udev rule I'm using, followed by an example:
> >
> > ```
> > # cat /etc/udev/rules.d/83-readahead.rules
> > # Set the readahead on non-spinning disks to 8kb (16 512b sectors)
> > ACTION=="add", KERNEL=="dm-*", ATTR{queue/rotational}=="0",
> > ATTR{bdi/read_ahead_kb}="8"
> >
>
> Try ACTION=="change", KERNEL=="dm-*", ENV{DM_ACTIVATION}=="1", ATTR ....
>
> Anyway, there's direct way to set the readahead value using LVM tools with:
>   lvcreate/lvchange -r/--readahead (see man lvcreate and lvchange for more
> info).
>
> --
> Peter
>

--20cf3005dd2acae21604f9d6aae2
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hey Peter,<div><br></div><div>Thanks for the response. I&#=
39;ve previously tried the &quot;change&quot; action, and adding the specif=
ier for the DM_ACTIVATION environment variable had no effect. I&#39;m also =
aware of the capability to set the readahead on a per-volume basis, but I&#=
39;m looking for a solution which handles setting these values at boot time=
 and/or volume creation time.</div>

<div><br></div><div>Dave</div></div><div class=3D"gmail_extra"><br><br><div=
 class=3D"gmail_quote">On Tue, May 20, 2014 at 2:03 AM, Peter Rajnoha <span=
 dir=3D"ltr">&lt;<a href=3D"mailto:prajnoha@redhat.com" target=3D"_blank">p=
rajnoha@redhat.com</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"">On 05/19/2014 05:58 PM, Davi=
d Wittman wrote:<br>
&gt; Hey all,<br>
&gt;<br>
&gt; I&#39;m having an issue tuning the readahead value for my Logical Volu=
mes<br>
&gt; via udev. In short, I&#39;m trying to create a rule that sets the read=
ahead<br>
&gt; attribute for each of my Logical Volumes at boot time or upon the<br>
&gt; creation of a new volume. udev seems like the perfect place to do this=
,<br>
&gt; but for some reason or another LVM seems to be overriding these settin=
gs.<br>
&gt;<br>
&gt; Here&#39;s the udev rule I&#39;m using, followed by an example:<br>
&gt;<br>
&gt; ```<br>
&gt; # cat /etc/udev/rules.d/83-readahead.rules<br>
&gt; # Set the readahead on non-spinning disks to 8kb (16 512b sectors)<br>
&gt; ACTION=3D=3D&quot;add&quot;, KERNEL=3D=3D&quot;dm-*&quot;, ATTR{queue/=
rotational}=3D=3D&quot;0&quot;,<br>
&gt; ATTR{bdi/read_ahead_kb}=3D&quot;8&quot;<br>
&gt;<br>
<br>
</div>Try ACTION=3D=3D&quot;change&quot;, KERNEL=3D=3D&quot;dm-*&quot;, ENV=
{DM_ACTIVATION}=3D=3D&quot;1&quot;, ATTR ....<br>
<br>
Anyway, there&#39;s direct way to set the readahead value using LVM tools w=
ith:<br>
=C2=A0 lvcreate/lvchange -r/--readahead (see man lvcreate and lvchange for =
more info).<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
Peter<br>
</font></span></blockquote></div><br></div>

--20cf3005dd2acae21604f9d6aae2--
