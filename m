MIME-Version: 1.0
In-Reply-To: <53D6085D.2030303@redhat.com>
References: <CAK4r=d5PT_LRbSQgU3Jo35LLvaVgJ3+fpgGWPOitoAJOVZOjeQ@mail.gmail.com>
	<53D6085D.2030303@redhat.com>
From: Vivek Satpute <vivekonline86@gmail.com>
Date: Thu, 7 Aug 2014 23:50:35 +0530
Message-ID: <CAK4r=d4wtwm+n=JyKrd7yrCqw-EjSoZagtDEMONUTz9acg2C3g@mail.gmail.com>
Content-Type: multipart/alternative; boundary=001a11353dd04c38cb05000e26ba
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

--001a11353dd04c38cb05000e26ba
Content-Type: text/plain; charset=UTF-8

Thanks a lot Peter for replying.

I know that */sys/devices/virtual**/block/dm-0  *SysFsPath would get
created by block-layer when corresponding block device gets created.

Actually I am looking for how below dependencies is getting created for LVM
volume by systemd:

[root@host]# systemctl show dev-rhel_host-root.device
Id=dev-rhel_host-root.device
Names=dev-rhel_host-root.device

*Following=sys-devices-virtual-block-dm\x2d0.device*
[...]
*SysFSPath=/sys/devices/virtual/block/dm-0*

/dev/rhel_host/root (path of LVM volume) is actually a symbolic link
pointing to /dev/dm-0, then how systemd recognize that device
dev-rhel_host-root.device
follows *sys-devices-virtual-block-dm\x2d0.device ?*


Thanks,
Vivek


On Mon, Jul 28, 2014 at 1:52 PM, Peter Rajnoha <prajnoha@redhat.com> wrote:

> On 07/25/2014 10:50 PM, Vivek Satpute wrote:
> > Hi,
> >
> > I am seeing that LVM2 is integrated with systemd framework and so
> > accordingly there are many changes in the way how LVM rootfs volume get
> > mounted at boot-up time.
> >
> > For root LVM volume, LVM create virtual block device
> > "/dev/rhel_host/root". And systemd shows following description of this
> > device.
> >
> > [root@host vivek]# systemctl show dev-rhel_host-root.device
> > Id=dev-rhel_host-root.device
> > Names=dev-rhel_host-root.device
> > Following=sys-devices-virtual-block-dm\x2d0.device
> > Description=/dev/rhel_host/root
> > *LoadState=loaded*
> > *ActiveState=active*
> > *SubState=plugged*
> > InactiveExitTimestamp=Thu 2014-07-24 15:13:50 IST
> > InactiveExitTimestampMonotonic=17789280
> > ActiveEnterTimestamp=Thu 2014-07-24 15:13:50 IST
> > ActiveEnterTimestampMonotonic=17789280
> > ActiveExitTimestampMonotonic=0
> > InactiveEnterTimestampMonotonic=0
> > CanStart=no
> > CanStop=no
> > CanReload=no
> > CanIsolate=no
> > StopWhenUnneeded=no
> > RefuseManualStart=no
> > RefuseManualStop=no
> > AllowIsolate=no
> > DefaultDependencies=yes
> > OnFailureIsolate=no
> > IgnoreOnIsolate=yes
> > IgnoreOnSnapshot=yes
> > NeedDaemonReload=no
> > JobTimeoutUSec=1min 30s
> > ConditionTimestampMonotonic=0
> > ConditionResult=no
> > Transient=no
> > *SysFSPath=/sys/devices/virtual/block/dm-0*
> >
> >
> > I want to know,
> > 1) How systemd and LVM create above dependency of "/dev/rhel_host/root"
> > ? How "/dev/rhel_host/root" gets SysFsPath
> > "*/sys/devices/virtual/block/dm-0" ? *
>
> The dm-0 is the actual kernel name of the device and the sysfs item is
> created automatically by block layer as for any other block device when
> it's created/activated - the kernel name is always used for that sysfs
> path.
>
> The /dev/rhel_host/root is just a symlink created in addition to that
> (either by udev and driven by udev rule or by LVM directly, but udev is
> used by default now and it's the preferred way).
>
> Systemd has access to the list of device kernel names and their associated
> symlinks via udev database that systemd reads. The .device systemd units
> are created automatically by systemd based on incoming events.
>
> It's possible to set the description via udev rule, but we're not doing
> this.
> So the description you see is in the "systemctl show" output is the default
> one added by systemd itself.
>
> >
> > 2) Which is the udev rule/systemd file creates above dependency (seen by
> > command "systemctl show dev-rhel_host-root.device").
>
> /lib/udev/rules.d/11-dm-lvm.rules and this line exactly:
>
> # Create symlinks for top-level devices only.
> ENV{DM_VG_NAME}=="?*", ENV{DM_LV_NAME}=="?*",
> SYMLINK+="$env{DM_VG_NAME}/$env{DM_LV_NAME}", GOTO="lvm_end"
>
> That's for all LVs in general. The root LV is specific in a way that it's
> activated in initramfs and hence it depends on how the initramfs is handled
> in your distro. For example Fedora uses udev-driven dracut for the
> initramfs
> which copies this rule into initramfs image and it activates the root LV
> directly,
> not depending on lvmetad. But some distros may use lvmetad even in
> initramfs for
> the root LV autoactivation (I think it's Arch Linux that does it this way
> at the
> moment). All the /dev content is created by udev.
>
> >
> > 3) How LVM root volume " /dev/rhel_host/root" gets mounted ? Does it
> > handled by LVmetaD ?
>
> Mount points are never handled by lvmetad. Lvmetad only handles LVM
> metadata
> caching and LVM volume autoactivation (with the help of udev since lvmetad
> needs
> to know when the underlying device - PV - appears.).
>
> Systemd itself handles mounting - it either reads /etc/fstab and translates
> it into .mount systemd units or it uses native .mount systemd unit if they
> exist. Systemd then waits for the particular .device unit the .mount unit
> is
> bound to and if the device is present, it mounts it...
>
> >
> > Any suggestions/inputs would be welcome.
> >
> >
> > Thanks and Regards,
> > Vivek
> >
> >
> >
> >
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@redhat.com
> > https://www.redhat.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> >
>
>
> --
> Peter
>

--001a11353dd04c38cb05000e26ba
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span style=3D"font-family:arial,sans-serif;font-size:13px=
">Thanks a lot Peter for replying.</span><div style=3D"font-family:arial,sa=
ns-serif;font-size:13px"><br></div><div style=3D"font-family:arial,sans-ser=
if;font-size:13px">

I know that=C2=A0<font color=3D"#000000"><b>/sys/devices/virtual</b><b>/blo=
ck/dm-0 =C2=A0</b>SysFsPath would get created by block-layer when correspon=
ding block device gets created.=C2=A0</font><div><br></div></div><div style=
=3D"font-family:arial,sans-serif;font-size:13px">

Actually I am looking for how below dependencies is getting created for LVM=
 volume by systemd:</div><div style=3D"font-family:arial,sans-serif;font-si=
ze:13px"><br></div><div style=3D"font-family:arial,sans-serif;font-size:13p=
x">

<font color=3D"#000000">[root@host]# systemctl show dev-rhel_host-root.devi=
ce<br>Id=3Ddev-rhel_host-root.device<br>Names=3Ddev-rhel_host-root.device<b=
r><b>Following=3Dsys-devices-virtual-block-dm\x2d0.device<br></b></font></d=
iv>
<div style=3D"font-family:arial,sans-serif;font-size:13px">
<font color=3D"#000000">[...]</font></div><div style=3D"font-family:arial,s=
ans-serif;font-size:13px"><b><font color=3D"#000000">SysFSPath=3D/sys/devic=
es/virtual/block/dm-0</font></b></div><div style=3D"font-family:arial,sans-=
serif;font-size:13px">

<b><font color=3D"#000000"><br></font></b></div><div style=3D"font-family:a=
rial,sans-serif;font-size:13px"><div><font color=3D"#000000">/</font><span =
style=3D"color:rgb(0,0,0)">dev/rhel_host/root (path of LVM volume) is actua=
lly a symbolic link pointing to /dev/dm-0, then how systemd recognize that =
device=C2=A0</span><span style=3D"color:rgb(0,0,0)">dev-rhel_host-root.devi=
ce follows=C2=A0</span><b style=3D"color:rgb(0,0,0)">sys-devices-virtual-bl=
ock-dm\x2d0.device ?</b><br>

</div><div><b style=3D"color:rgb(0,0,0)"><br></b></div><div><b style=3D"col=
or:rgb(0,0,0)"><br></b></div><div style><font color=3D"#000000">Thanks,</fo=
nt></div><div style><font color=3D"#000000">Vivek</font></div></div></div><=
div class=3D"gmail_extra">

<br><br><div class=3D"gmail_quote">On Mon, Jul 28, 2014 at 1:52 PM, Peter R=
ajnoha <span dir=3D"ltr">&lt;<a href=3D"mailto:prajnoha@redhat.com" target=
=3D"_blank">prajnoha@redhat.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">

<div class=3D"">On 07/25/2014 10:50 PM, Vivek Satpute wrote:<br>
&gt; Hi,<br>
&gt;<br>
&gt; I am seeing that LVM2 is integrated with systemd framework and so<br>
&gt; accordingly there are many changes in the way how LVM rootfs volume ge=
t<br>
&gt; mounted at boot-up time.<br>
&gt;<br>
&gt; For root LVM volume, LVM create virtual block device<br>
&gt; &quot;/dev/rhel_host/root&quot;. And systemd shows following descripti=
on of this<br>
&gt; device.<br>
&gt;<br>
&gt; [root@host vivek]# systemctl show dev-rhel_host-root.device<br>
&gt; Id=3Ddev-rhel_host-root.device<br>
&gt; Names=3Ddev-rhel_host-root.device<br>
&gt; Following=3Dsys-devices-virtual-block-dm\x2d0.device<br>
&gt; Description=3D/dev/rhel_host/root<br>
</div>&gt; *LoadState=3Dloaded*<br>
&gt; *ActiveState=3Dactive*<br>
&gt; *SubState=3Dplugged*<br>
<div class=3D"">&gt; InactiveExitTimestamp=3DThu 2014-07-24 15:13:50 IST<br=
>
&gt; InactiveExitTimestampMonotonic=3D17789280<br>
&gt; ActiveEnterTimestamp=3DThu 2014-07-24 15:13:50 IST<br>
&gt; ActiveEnterTimestampMonotonic=3D17789280<br>
&gt; ActiveExitTimestampMonotonic=3D0<br>
&gt; InactiveEnterTimestampMonotonic=3D0<br>
&gt; CanStart=3Dno<br>
&gt; CanStop=3Dno<br>
&gt; CanReload=3Dno<br>
&gt; CanIsolate=3Dno<br>
&gt; StopWhenUnneeded=3Dno<br>
&gt; RefuseManualStart=3Dno<br>
&gt; RefuseManualStop=3Dno<br>
&gt; AllowIsolate=3Dno<br>
&gt; DefaultDependencies=3Dyes<br>
&gt; OnFailureIsolate=3Dno<br>
&gt; IgnoreOnIsolate=3Dyes<br>
&gt; IgnoreOnSnapshot=3Dyes<br>
&gt; NeedDaemonReload=3Dno<br>
&gt; JobTimeoutUSec=3D1min 30s<br>
&gt; ConditionTimestampMonotonic=3D0<br>
&gt; ConditionResult=3Dno<br>
&gt; Transient=3Dno<br>
</div>&gt; *SysFSPath=3D/sys/devices/virtual/block/dm-0*<br>
<div class=3D"">&gt;<br>
&gt;<br>
&gt; I want to know,<br>
&gt; 1) How systemd and LVM create above dependency of &quot;/dev/rhel_host=
/root&quot;<br>
&gt; ? How &quot;/dev/rhel_host/root&quot; gets SysFsPath<br>
</div>&gt; &quot;*/sys/devices/virtual/block/dm-0&quot; ? *<br>
<br>
The dm-0 is the actual kernel name of the device and the sysfs item is<br>
created automatically by block layer as for any other block device when<br>
it&#39;s created/activated - the kernel name is always used for that sysfs<=
br>
path.<br>
<br>
The /dev/rhel_host/root is just a symlink created in addition to that<br>
(either by udev and driven by udev rule or by LVM directly, but udev is<br>
used by default now and it&#39;s the preferred way).<br>
<br>
Systemd has access to the list of device kernel names and their associated<=
br>
symlinks via udev database that systemd reads. The .device systemd units<br=
>
are created automatically by systemd based on incoming events.<br>
<br>
It&#39;s possible to set the description via udev rule, but we&#39;re not d=
oing this.<br>
So the description you see is in the &quot;systemctl show&quot; output is t=
he default<br>
one added by systemd itself.<br>
<div class=3D""><br>
&gt;<br>
&gt; 2) Which is the udev rule/systemd file creates above dependency (seen =
by<br>
&gt; command &quot;systemctl show dev-rhel_host-root.device&quot;).<br>
<br>
</div>/lib/udev/rules.d/11-dm-lvm.rules and this line exactly:<br>
<br>
# Create symlinks for top-level devices only.<br>
ENV{DM_VG_NAME}=3D=3D&quot;?*&quot;, ENV{DM_LV_NAME}=3D=3D&quot;?*&quot;, S=
YMLINK+=3D&quot;$env{DM_VG_NAME}/$env{DM_LV_NAME}&quot;, GOTO=3D&quot;lvm_e=
nd&quot;<br>
<br>
That&#39;s for all LVs in general. The root LV is specific in a way that it=
&#39;s<br>
activated in initramfs and hence it depends on how the initramfs is handled=
<br>
in your distro. For example Fedora uses udev-driven dracut for the initramf=
s<br>
which copies this rule into initramfs image and it activates the root LV di=
rectly,<br>
not depending on lvmetad. But some distros may use lvmetad even in initramf=
s for<br>
the root LV autoactivation (I think it&#39;s Arch Linux that does it this w=
ay at the<br>
moment). All the /dev content is created by udev.<br>
<div class=3D""><br>
&gt;<br>
&gt; 3) How LVM root volume &quot; /dev/rhel_host/root&quot; gets mounted ?=
 Does it<br>
&gt; handled by LVmetaD ?<br>
<br>
</div>Mount points are never handled by lvmetad. Lvmetad only handles LVM m=
etadata<br>
caching and LVM volume autoactivation (with the help of udev since lvmetad =
needs<br>
to know when the underlying device - PV - appears.).<br>
<br>
Systemd itself handles mounting - it either reads /etc/fstab and translates=
<br>
it into .mount systemd units or it uses native .mount systemd unit if they<=
br>
exist. Systemd then waits for the particular .device unit the .mount unit i=
s<br>
bound to and if the device is present, it mounts it...<br>
<div class=3D""><br>
&gt;<br>
&gt; Any suggestions/inputs would be welcome.<br>
&gt;<br>
&gt;<br>
&gt; Thanks and Regards,<br>
&gt; Vivek<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
</div>&gt; _______________________________________________<br>
&gt; linux-lvm mailing list<br>
&gt; <a href=3D"mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br>
&gt; <a href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm" target=
=3D"_blank">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>
&gt; read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" ta=
rget=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br>
&gt;<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
<br>
--<br>
Peter<br>
</font></span></blockquote></div><br></div>

--001a11353dd04c38cb05000e26ba--
