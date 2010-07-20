Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.14])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o6K6TjoE026535
	for <linux-lvm@redhat.com>; Tue, 20 Jul 2010 02:29:45 -0400
Received: from web137318.mail.in.yahoo.com (web137318.mail.in.yahoo.com
	[121.101.151.145])
	by mx1.redhat.com (8.13.8/8.13.8) with SMTP id o6K6TZNF032131
	for <linux-lvm@redhat.com>; Tue, 20 Jul 2010 02:29:36 -0400
Message-ID: <670541.99249.qm@web137318.mail.in.yahoo.com>
Date: Tue, 20 Jul 2010 11:59:34 +0530 (IST)
From: andiket a <truly_linux@yahoo.co.in>
In-Reply-To: <AANLkTilGmL8ExwUf53KYV83dzXsbi-VzIstmy9QdjWy4@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="0-805020753-1279607374=:99249"
Subject: Re: [linux-lvm] COW store
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
To: LVM general discussion and development <linux-lvm@redhat.com>

--0-805020753-1279607374=:99249
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

Bingo.
Got exactly what I wanted. My lack of hands on with lvm utils.
Thanks a ton Greg! :-)

Let me tell you the context of why I wanted to do this.

I was experimenting with LVM. Take snapshots n take backups etc.
I figured out probabaly a room for optimization after looking at the code.
Look at the cow operation, once the data is read from original
device after that I/Os (writes) on original n cow device can proceed in
parallel. Which in current happens serially i.e. first cow write then
original device write.

I am not sure if this is on todo list of lvm. Is it already? or even if the=
y
are thinking of any such thing.



--- On Tue, 20/7/10, Greg Freemyer <greg.freemyer@gmail.com> wrote:

From: Greg Freemyer <greg.freemyer@gmail.com>
Subject: Re: [linux-lvm] COW store
To: "LVM general discussion and development" <linux-lvm@redhat.com>
Date: Tuesday, 20 July, 2010, 2:42 AM

On Mon, Jul 19, 2010 at 3:06 PM, andiket a <truly_linux@yahoo.co.in> wrote:
>
> Greg,
>
> You got absolutely right.
> That is exactly what I actually wanted to ask.
>
> I didn't know about this pv stuff for original LVs n snapshot LVs.
> Let me look at the lvcreate once again.
>
> I want the cow store to go on to a separate physical device.
>

You can create new LVs on the PVs you want by simply adding a PV param
at the end of the lvcreate line.=A0 (See the man page).

But assuming you already have LVs created:

Use "lvdisplay -m" to show you which PVs your current LVs are on.

Assuming the LVs are not on the PVs you want them to be on, then you
can use pvmove to move the LV extents off of one PV and onto another.
I believe that can be done without disabling the LV, but I don't
recall testing it.

In my case I have 2 PVs:

PV /dev/sdb1 is for my main data and PV /dev/sda3 is for my snapshots.

If I just want to move all the LV extents off a PV so you can dedicate
it to snapshots, you can simply:

pvmove /dev/sda3=A0 =A0 =A0 =A0 =A0 =A0 =A0=A0=A0where /dev/sda3=A0 would b=
e the PV I'm
trying to free up.

So when setting things up I could have done "pvmove /dev/sda3" to
ensure my PV wasn't used for normal LVs.

Then one of my nightly scripts has this in it:

lvcreate --snapshot -L 45g --name data_snap /dev/TruStore-Data/data /dev/sd=
a3

I believe that says "create a 45GB snapshot named data_snap of the
main LV on the PV /dev/sda3".=A0 (I set that up years ago, and I admit
to not testing it recently.)

And since I setup /dev/TruStore-Data/data to be on /dev/sdb1, I know
the main LV and snapshot LV are on different PVs.

Again, at any point I can run "lvdisplay -m" to double check things
are the way I want them.

Hope that helps
Greg

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
=0A=0A
--0-805020753-1279607374=:99249
Content-Type: text/html; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

<table cellspacing=3D"0" cellpadding=3D"0" border=3D"0" ><tr><td valign=3D"=
top" style=3D"font: inherit;">Bingo.<br>Got exactly what I wanted. My lack =
of hands on with lvm utils.<br>Thanks a ton Greg! :-)<br><br>Let me tell yo=
u the context of why I wanted to do this.<br><br>I was experimenting with L=
VM. Take snapshots n take backups etc.<br>I figured out probabaly a room fo=
r optimization after looking at the code.<br>Look at the cow operation, onc=
e the data is read from original<br>device after that I/Os (writes) on orig=
inal n cow device can proceed in<br>parallel. Which in current happens seri=
ally i.e. first cow write then<br>original device write.<br><br>I am not su=
re if this is on todo list of lvm. Is it already? or even if they<br>are th=
inking of any such thing.<br><br><br><br>--- On <b>Tue, 20/7/10, Greg Freem=
yer <i>&lt;greg.freemyer@gmail.com&gt;</i></b> wrote:<br><blockquote style=
=3D"border-left: 2px solid rgb(16, 16, 255); margin-left: 5px; padding-left=
:
 5px;"><br>From: Greg Freemyer &lt;greg.freemyer@gmail.com&gt;<br>Subject: =
Re: [linux-lvm] COW store<br>To: "LVM general discussion and development" &=
lt;linux-lvm@redhat.com&gt;<br>Date: Tuesday, 20 July, 2010, 2:42 AM<br><br=
><div class=3D"plainMail">On Mon, Jul 19, 2010 at 3:06 PM, andiket a &lt;<a=
 ymailto=3D"mailto:truly_linux@yahoo.co.in" href=3D"/mc/compose?to=3Dtruly_=
linux@yahoo.co.in">truly_linux@yahoo.co.in</a>&gt; wrote:<br>&gt;<br>&gt; G=
reg,<br>&gt;<br>&gt; You got absolutely right.<br>&gt; That is exactly what=
 I actually wanted to ask.<br>&gt;<br>&gt; I didn't know about this pv stuf=
f for original LVs n snapshot LVs.<br>&gt; Let me look at the lvcreate once=
 again.<br>&gt;<br>&gt; I want the cow store to go on to a separate physica=
l device.<br>&gt;<br><br>You can create new LVs on the PVs you want by simp=
ly adding a PV param<br>at the end of the lvcreate line.&nbsp; (See the man=
 page).<br><br>But assuming you already have LVs created:<br><br>Use
 "lvdisplay -m" to show you which PVs your current LVs are on.<br><br>Assum=
ing the LVs are not on the PVs you want them to be on, then you<br>can use =
pvmove to move the LV extents off of one PV and onto another.<br>I believe =
that can be done without disabling the LV, but I don't<br>recall testing it=
.<br><br>In my case I have 2 PVs:<br><br>PV /dev/sdb1 is for my main data a=
nd PV /dev/sda3 is for my snapshots.<br><br>If I just want to move all the =
LV extents off a PV so you can dedicate<br>it to snapshots, you can simply:=
<br><br>pvmove /dev/sda3&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nb=
sp;&nbsp;where /dev/sda3&nbsp; would be the PV I'm<br>trying to free up.<br=
><br>So when setting things up I could have done "pvmove /dev/sda3" to<br>e=
nsure my PV wasn't used for normal LVs.<br><br>Then one of my nightly scrip=
ts has this in it:<br><br>lvcreate --snapshot -L 45g --name data_snap /dev/=
TruStore-Data/data /dev/sda3<br><br>I believe that says "create a
 45GB snapshot named data_snap of the<br>main LV on the PV /dev/sda3".&nbsp=
; (I set that up years ago, and I admit<br>to not testing it recently.)<br>=
<br>And since I setup /dev/TruStore-Data/data to be on /dev/sdb1, I know<br=
>the main LV and snapshot LV are on different PVs.<br><br>Again, at any poi=
nt I can run "lvdisplay -m" to double check things<br>are the way I want th=
em.<br><br>Hope that helps<br>Greg<br><br>_________________________________=
______________<br>linux-lvm mailing list<br><a ymailto=3D"mailto:linux-lvm@=
redhat.com" href=3D"/mc/compose?to=3Dlinux-lvm@redhat.com">linux-lvm@redhat=
.com</a><br><a href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm" t=
arget=3D"_blank">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>r=
ead the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" target=
=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br></div></blockquote></td=
></tr></table><br>
--0-805020753-1279607374=:99249--
