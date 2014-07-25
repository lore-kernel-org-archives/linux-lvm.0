Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s6PKoNOg013717
	for <linux-lvm@redhat.com>; Fri, 25 Jul 2014 16:50:23 -0400
Received: from mail-qg0-f47.google.com (mail-qg0-f47.google.com
	[209.85.192.47])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s6PKoMix002979
	(version=TLSv1/SSLv3 cipher=RC4-SHA bits=128 verify=FAIL)
	for <linux-lvm@redhat.com>; Fri, 25 Jul 2014 16:50:22 -0400
Received: by mail-qg0-f47.google.com with SMTP id i50so5635866qgf.20
	for <linux-lvm@redhat.com>; Fri, 25 Jul 2014 13:50:21 -0700 (PDT)
MIME-Version: 1.0
From: Vivek Satpute <vivekonline86@gmail.com>
Date: Sat, 26 Jul 2014 02:20:01 +0530
Message-ID: <CAK4r=d5PT_LRbSQgU3Jo35LLvaVgJ3+fpgGWPOitoAJOVZOjeQ@mail.gmail.com>
Content-Type: multipart/alternative; boundary=001a113a304ec66b9604ff0ab854
Subject: [linux-lvm] How LVM root volumes gets mounted at boot time ?
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
To: linux-lvm@redhat.com

--001a113a304ec66b9604ff0ab854
Content-Type: text/plain; charset=UTF-8

Hi,

I am seeing that LVM2 is integrated with systemd framework and so
accordingly there are many changes in the way how LVM rootfs volume get
mounted at boot-up time.

For root LVM volume, LVM create virtual block device "/dev/rhel_host/root".
And systemd shows following description of this device.

[root@host vivek]# systemctl show dev-rhel_host-root.device
Id=dev-rhel_host-root.device
Names=dev-rhel_host-root.device
Following=sys-devices-virtual-block-dm\x2d0.device
Description=/dev/rhel_host/root
*LoadState=loaded*
*ActiveState=active*
*SubState=plugged*
InactiveExitTimestamp=Thu 2014-07-24 15:13:50 IST
InactiveExitTimestampMonotonic=17789280
ActiveEnterTimestamp=Thu 2014-07-24 15:13:50 IST
ActiveEnterTimestampMonotonic=17789280
ActiveExitTimestampMonotonic=0
InactiveEnterTimestampMonotonic=0
CanStart=no
CanStop=no
CanReload=no
CanIsolate=no
StopWhenUnneeded=no
RefuseManualStart=no
RefuseManualStop=no
AllowIsolate=no
DefaultDependencies=yes
OnFailureIsolate=no
IgnoreOnIsolate=yes
IgnoreOnSnapshot=yes
NeedDaemonReload=no
JobTimeoutUSec=1min 30s
ConditionTimestampMonotonic=0
ConditionResult=no
Transient=no
*SysFSPath=/sys/devices/virtual/block/dm-0*


I want to know,
1) How systemd and LVM create above dependency of "/dev/rhel_host/root" ?
How "/dev/rhel_host/root" gets SysFsPath "*/sys/devices/virtual/block/dm-0"
? *

2) Which is the udev rule/systemd file creates above dependency (seen by
command "systemctl show dev-rhel_host-root.device").

3) How LVM root volume " /dev/rhel_host/root" gets mounted ? Does it
handled by LVmetaD ?

Any suggestions/inputs would be welcome.


Thanks and Regards,
Vivek

--001a113a304ec66b9604ff0ab854
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,=C2=A0<div><br></div><div style>I am seeing that LVM2 i=
s integrated with systemd framework and so accordingly there are many chang=
es in the way how LVM rootfs volume get mounted at boot-up time.</div><div =
style>

<br></div><div style>For root LVM volume, LVM create virtual block device &=
quot;/dev/<span style=3D"color:rgb(0,0,0);font-family:Helvetica;font-size:1=
4px">rhel_host/root&quot;. And systemd shows following description of this =
device.</span></div>

<div style><br></div><div style><div style=3D"color:rgb(0,0,0);font-family:=
Helvetica;font-size:14px">[root@host vivek]# systemctl show dev-rhel_host-r=
oot.device</div><div style=3D"color:rgb(0,0,0);font-family:Helvetica;font-s=
ize:14px">

Id=3Ddev-rhel_host-root.device</div><div style=3D"color:rgb(0,0,0);font-fam=
ily:Helvetica;font-size:14px">Names=3Ddev-rhel_host-root.device</div><div s=
tyle=3D"color:rgb(0,0,0);font-family:Helvetica;font-size:14px">Following=3D=
sys-devices-virtual-block-dm\x2d0.device</div>

<div style=3D"color:rgb(0,0,0);font-family:Helvetica;font-size:14px">Descri=
ption=3D/dev/rhel_host/root</div><div style=3D"color:rgb(0,0,0);font-family=
:Helvetica;font-size:14px"><b>LoadState=3Dloaded</b></div><div style=3D"col=
or:rgb(0,0,0);font-family:Helvetica;font-size:14px">

<b>ActiveState=3Dactive</b></div><div style=3D"color:rgb(0,0,0);font-family=
:Helvetica;font-size:14px"><b>SubState=3Dplugged</b></div><div style=3D"col=
or:rgb(0,0,0);font-family:Helvetica;font-size:14px">InactiveExitTimestamp=
=3DThu 2014-07-24 15:13:50 IST</div>

<div style=3D"color:rgb(0,0,0);font-family:Helvetica;font-size:14px">Inacti=
veExitTimestampMonotonic=3D17789280</div><div style=3D"color:rgb(0,0,0);fon=
t-family:Helvetica;font-size:14px">ActiveEnterTimestamp=3DThu 2014-07-24 15=
:13:50 IST</div>

<div style=3D"color:rgb(0,0,0);font-family:Helvetica;font-size:14px">Active=
EnterTimestampMonotonic=3D17789280</div><div style=3D"color:rgb(0,0,0);font=
-family:Helvetica;font-size:14px">ActiveExitTimestampMonotonic=3D0</div><di=
v style=3D"color:rgb(0,0,0);font-family:Helvetica;font-size:14px">

InactiveEnterTimestampMonotonic=3D0</div><div style=3D"color:rgb(0,0,0);fon=
t-family:Helvetica;font-size:14px">CanStart=3Dno</div><div style=3D"color:r=
gb(0,0,0);font-family:Helvetica;font-size:14px">CanStop=3Dno</div><div styl=
e=3D"color:rgb(0,0,0);font-family:Helvetica;font-size:14px">

CanReload=3Dno</div><div style=3D"color:rgb(0,0,0);font-family:Helvetica;fo=
nt-size:14px">CanIsolate=3Dno</div><div style=3D"color:rgb(0,0,0);font-fami=
ly:Helvetica;font-size:14px">StopWhenUnneeded=3Dno</div><div style=3D"color=
:rgb(0,0,0);font-family:Helvetica;font-size:14px">

RefuseManualStart=3Dno</div><div style=3D"color:rgb(0,0,0);font-family:Helv=
etica;font-size:14px">RefuseManualStop=3Dno</div><div style=3D"color:rgb(0,=
0,0);font-family:Helvetica;font-size:14px">AllowIsolate=3Dno</div><div styl=
e=3D"color:rgb(0,0,0);font-family:Helvetica;font-size:14px">

DefaultDependencies=3Dyes</div><div style=3D"color:rgb(0,0,0);font-family:H=
elvetica;font-size:14px">OnFailureIsolate=3Dno</div><div style=3D"color:rgb=
(0,0,0);font-family:Helvetica;font-size:14px">IgnoreOnIsolate=3Dyes</div><d=
iv style=3D"color:rgb(0,0,0);font-family:Helvetica;font-size:14px">

IgnoreOnSnapshot=3Dyes</div><div style=3D"color:rgb(0,0,0);font-family:Helv=
etica;font-size:14px">NeedDaemonReload=3Dno</div><div style=3D"color:rgb(0,=
0,0);font-family:Helvetica;font-size:14px">JobTimeoutUSec=3D1min 30s</div><=
div style=3D"color:rgb(0,0,0);font-family:Helvetica;font-size:14px">

ConditionTimestampMonotonic=3D0</div><div style=3D"color:rgb(0,0,0);font-fa=
mily:Helvetica;font-size:14px">ConditionResult=3Dno</div><div style=3D"colo=
r:rgb(0,0,0);font-family:Helvetica;font-size:14px">Transient=3Dno</div><div=
 style=3D"color:rgb(0,0,0);font-family:Helvetica;font-size:14px">

<b>SysFSPath=3D/sys/devices/virtual/block/dm-0</b></div><div><br></div><div=
><br></div><div style>I want to know,=C2=A0</div><div style>1) How systemd =
and LVM create above dependency of=C2=A0&quot;/dev/<span style=3D"color:rgb=
(0,0,0);font-family:Helvetica;font-size:14px">rhel_host/root&quot; ? How=C2=
=A0</span>&quot;/dev/<span style=3D"color:rgb(0,0,0);font-family:Helvetica;=
font-size:14px">rhel_host/root&quot; gets SysFsPath &quot;</span><b style=
=3D"color:rgb(0,0,0);font-family:Helvetica;font-size:14px">/sys/devices/vir=
tual/block/dm-0&quot; ?=C2=A0</b></div>

<div style><span style=3D"color:rgb(0,0,0);font-family:Helvetica;font-size:=
14px"><br></span></div><div style><span style=3D"color:rgb(0,0,0);font-fami=
ly:Helvetica;font-size:14px">2) Which is the udev rule/systemd file creates=
 above dependency (seen by command &quot;</span><span style=3D"color:rgb(0,=
0,0);font-family:Helvetica;font-size:14px">systemctl show dev-rhel_host-roo=
t.device&quot;).</span></div>

<div style><span style=3D"color:rgb(0,0,0);font-family:Helvetica;font-size:=
14px"><br></span></div><div style><span style=3D"color:rgb(0,0,0);font-fami=
ly:Helvetica;font-size:14px">3) How LVM root volume &quot;=C2=A0</span>/dev=
/<span style=3D"color:rgb(0,0,0);font-family:Helvetica;font-size:14px">rhel=
_host/root&quot; gets mounted ? Does it handled by LVmetaD ?</span></div>

<div style><span style=3D"color:rgb(0,0,0);font-family:Helvetica;font-size:=
14px"><br></span></div><div style>Any suggestions/inputs would be welcome.<=
/div><div style><br></div><div style><br></div><div style>Thanks and Regard=
s,</div>

<div style>Vivek</div><div style><span style=3D"color:rgb(0,0,0);font-famil=
y:Helvetica;font-size:14px"><br></span></div><div style><span style=3D"colo=
r:rgb(0,0,0);font-family:Helvetica;font-size:14px"><br></span></div></div>
</div>

--001a113a304ec66b9604ff0ab854--
