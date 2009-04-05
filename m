Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n35IWUdL015284
	for <linux-lvm@redhat.com>; Sun, 5 Apr 2009 14:32:30 -0400
Received: from positron.souja.net (positron.souja.net [206.251.36.12])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n35IW7pO018854
	for <linux-lvm@redhat.com>; Sun, 5 Apr 2009 14:32:07 -0400
Received: from [99.7.170.241] (helo=[192.168.1.200])
	by positron.souja.net with esmtpsa (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.69) (envelope-from <jvantuyl@engineyard.com>)
	id 1LqX8X-0004P0-OC
	for linux-lvm@redhat.com; Sun, 05 Apr 2009 11:32:06 -0700
Message-Id: <49DD2D4E-9D47-47D1-BB70-C85DE4D9C9AB@engineyard.com>
From: Jayson Vantuyl <jvantuyl@engineyard.com>
In-Reply-To: <49D8E4EE.3020703@traversetechnologies.com>
Content-Type: multipart/alternative; boundary=Apple-Mail-51-803599567
Mime-Version: 1.0 (Apple Message framework v930.3)
Subject: Re: [linux-lvm] progress, but... - re. fixing LVM/md snafu
Date: Sun, 5 Apr 2009 11:32:00 -0700
References: <49D8E4EE.3020703@traversetechnologies.com>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: LVM general discussion and development <linux-lvm@redhat.com>


--Apple-Mail-51-803599567
Content-Type: text/plain;
	charset=US-ASCII;
	format=flowed;
	delsp=yes
Content-Transfer-Encoding: quoted-printable

Miles,

It seems like what's probably happened is that LVM detected the raw =20
device instead of the MD device at some point early in the boot =20
process.  This may be because the MD detection happened after LVM =20
setup.  I'm unsure if it's possible for LVM to "steal" the device from =20=

MD.

Depending on your distribution, this may require different things to =20
fix.  Stop worrying about downtime.  If the data is important, just =20
don't worry about downtime.  If downtime is really important, build a =20=

second machine, get it working right, and transfer the data.  Being in =20=

a hurry and attempting to "optimize" the recovery process is a really =20=

good way to lose the data.

Assuming that you're going to try to fix this setup, I'd start out =20
with a backup.  This is critical.  Everybody always says to do a =20
backup.  Nobody ever does it.  Really, do one.  Get an S3 account, use =20=

an S3 backup utility.  There's just not an excuse these days.  Your =20
data is one-MD-mistake away from oblivion.

So, right now MD should have sda/sdb but only has sda.  sdb is now =20
newer than sda and may have important data if this server stores =20
anything like that.  The challenge is that, according to MD, sda is =20
newer.  Since MD isn't handling writes to sdb, it won't be updating =20
its metadata to know that it's newer.  There are two options that I =20
can think of, both ugly.  Pick one of:

1.  Destroy the MD.  Create a new one with the same UUID and sdb3 as =20
the source. (which you listed, the UUID part can trip you up)
2.  Sync the updated data from sdb3 onto md2.  Wipe sdb3.  Add it back =20=

into md2. (might be less downtime depending on data size, doesn't nuke =20=

MD)
3.  Build another machine.  Get it working right.  Transfer data with =20=

Rsync. (least downtime, most expensive)

In the first two cases, this only sets you up for it to break again.  =20=

The core problem is figuring out what happened during boot.  In a =20
perfect world, you would just tell LVM to only consider MD devices.  =20
That's not hard, but it's complicated by the fact that you have LVM =20
on /.  This means that the configuration that's used is likely not the =20=

version on / but a copy of it that is made when you set up your boot =20
ramdisk (a.k.a. initrd, or possibly an initramfs).  Even if we get LVM =20=

locked down to use just MDs and get that config used to boot-time, =20
there's the possibility that the MD won't get assembled (since it =20
already may not have been when LVM was first activated) and the system =20=

won't boot.  Again, fraught with peril.

If you want to fix the MD, first steps will be using a rescue LiveCD =20
to boot up and do all of this.  With that LiveCD, you can also adjust =20=

the LVM configuration and update the initrd (or whatever is used for =20
boot).  You may need to chroot into the system and/or trick the initrd =20=

into seeing the right devices.  I don't really think I can walk you =20
through this via an e-mail.

The LVM part is pretty easy.  Just set a filter line (you only get =20
one, so disable any other filter lines) in <root of system>/etc/=20
lvm.conf to:

> filter =3D [ "a|^/dev/md.*$|", "r/.*/" ]


That will prevent you from using anything but the MD.

To update the initrd with this information depends on distro (and =20
distro version)=00.  It's usually either some invocation of "mkinitrd" =20=

or some script that wraps it.  It will get the LVM configuration =20
available at boot-time.  This *MIGHT* sort out the MD problem.  It =20
might not.  If it doesn't, I'm not sure where to tell you to start.  =20
If mdadm is being used by your initrd, you'll need to tweak its =20
configuration.  If it's relying on MD autodetection, you might have =20
turned that off in your kernel.  If you have an IDE controller that =20
takes too long to initialize, that can also cause this sort of thing =20
(although that's REALLY unlikely these days).

I hope that some of this helps.  Although, it will be hard for anyone =20=

to give you really solid advice without a little more insight into why =20=

the MD isn't getting assembled prior to LVM's scan.

On Apr 5, 2009, at 10:05 AM, Miles Fidelman wrote:

> Hello again Folks,
>
> So.. I'm getting closer to fixing this messed up machine.
>
> Where things stand:
>
> I have root defined as an LVM2 LV, that should use /dev/md2 as it's =20=

> PV.
> /dev/md2 in turn is a RAID1 array built from /dev/sda3 /dev/sdb3 =20
> and /dev/sdc3
>
> Instead, LVM is reporting: "Found duplicate PV =20
> 2ppSS2q0kO3t0tuf8t6S19qY3ypWBOxF: using /dev/sdb3 not /dev/sda3"
> and the /dev/md2 is reporting itself as inactive (cat /proc/mdstat) =20=

> and active,degraded (mdadm --detail)
>
> ---
> I'm guessing that, during boot:
>
> - the raid array failed to start
> - LVM found both copies of the PV, and picked one (/dev/sdb3)
> - everything then came up and my server is humming away
>
> but: the md array can't rebuild because the most current device in =20
> it is already in use
>
> so...  I'm looking for the right sequence of events, with the =20
> minimum downtime to:
>
> 1. stop changes to /dev/sdb3 (actually, to / - which complicates =20
> things)
> 2. rebuild the RAID1 array, making sure to use /dev/sdb3 as the =20
> starting point for current data
> 3. restart in such a way that LVM finds /dev/md2 as the right PVM =20
> instead of one of its components
>
> Each of these is just tricky enough that I'm sure there are lots of =20=

> gotchas to watch out for.
>
> So.. any suggestions?
>
> Thanks very much,
>
> Miles Fidelman
>
>
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

--=20
Jayson Vantuyl
Founder and Architect
Engine Yard
jvantuyl@engineyard.com
1 866 518 9275 ext 204
IRC (freenode): kagato


--Apple-Mail-51-803599567
Content-Type: text/html;
	charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

<html><body style=3D"word-wrap: break-word; -webkit-nbsp-mode: space; =
-webkit-line-break: after-white-space; =
"><div>Miles,</div><div><br></div>It seems like what's probably happened =
is that LVM detected the raw device instead of the MD device at some =
point early in the boot process. &nbsp;This may be because the MD =
detection happened after LVM setup. &nbsp;I'm unsure if it's possible =
for LVM to "steal" the device from MD.<div><br></div><div>Depending on =
your distribution, this may require different things to fix. &nbsp;Stop =
worrying about downtime. &nbsp;If the data is important, just don't =
worry about downtime. &nbsp;If downtime is really important, build a =
second machine, get it working right, and transfer the data. &nbsp;Being =
in a hurry and attempting to "optimize" the recovery process is a really =
good way to lose the data.</div><div><br></div><div>Assuming that you're =
going to try to fix this setup, I'd start out with a backup. &nbsp;This =
is critical. &nbsp;Everybody always says to do a backup. &nbsp;Nobody =
ever does it. &nbsp;Really, do one. &nbsp;Get an S3 account, use an S3 =
backup utility. &nbsp;There's just not an excuse these days. &nbsp;Your =
data is one-MD-mistake away from oblivion.</div><div><br></div><div>So, =
right now MD should have sda/sdb but only has sda. &nbsp;sdb is now =
newer than sda and may have important data if this server stores =
anything like that. &nbsp;The challenge is that, according to MD, sda is =
newer. &nbsp;Since MD isn't handling writes to sdb, it won't be updating =
its metadata to know that it's newer. &nbsp;There are two options that I =
can think of, both ugly. &nbsp;Pick one of:</div><div><br></div><div>1. =
&nbsp;Destroy the MD. &nbsp;Create a new one with the same UUID and sdb3 =
as the source. (which you listed, the UUID part can trip you =
up)</div><div>2. &nbsp;Sync the updated data from sdb3 onto md2. =
&nbsp;Wipe sdb3. &nbsp;Add it back into md2. (might be less downtime =
depending on data size, doesn't nuke MD)</div><div>3. &nbsp;Build =
another machine. &nbsp;Get it working right. &nbsp;Transfer data with =
Rsync. (least downtime, most expensive)</div><div><br></div><div>In the =
first two cases, this only sets you up for it to break again. &nbsp;The =
core problem is figuring out what happened during boot. &nbsp;In a =
perfect world, you would just tell LVM to only consider MD devices. =
&nbsp;That's not hard, but it's complicated by the fact that you have =
LVM on /. &nbsp;This means that the configuration that's used is likely =
not the version on / but a copy of it that is made when you set up your =
boot ramdisk (a.k.a. initrd, or possibly an initramfs). &nbsp;Even if we =
get LVM locked down to use just MDs and get that config used to =
boot-time, there's the possibility that the MD won't get assembled =
(since it already may not have been when LVM was first activated) and =
the system won't boot. &nbsp;Again, fraught with =
peril.</div><div><br></div><div>If you want to fix the MD, first steps =
will be using a rescue LiveCD to boot up and do all of this. &nbsp;With =
that LiveCD, you can also adjust the LVM configuration and update the =
initrd (or whatever is used for boot). &nbsp;You may need to chroot into =
the system and/or trick the initrd into seeing the right devices. =
&nbsp;I don't really think I can walk you through this via an =
e-mail.</div><div><br></div><div>The LVM part is pretty easy. &nbsp;Just =
set a filter line (you only get one, so disable any other filter lines) =
in &lt;root of system>/etc/lvm.conf =
to:</div><div><br></div><div><blockquote type=3D"cite">filter =3D [ =
"a|^/dev/md.*$|", "r/.*/" ]</blockquote></div><div><br></div><div>That =
will prevent you from using anything but the =
MD.</div><div><br></div><div>To update the initrd with this information =
depends on distro (and distro version)=00. &nbsp;It's usually either =
some invocation of "mkinitrd" or some script that wraps it. &nbsp;It =
will get the LVM configuration available at boot-time. &nbsp;This =
*MIGHT* sort out the MD problem. &nbsp;It might not. &nbsp;If it =
doesn't, I'm not sure where to tell you to start. &nbsp;If mdadm is =
being used by your initrd, you'll need to tweak its configuration. =
&nbsp;If it's relying on MD autodetection, you might have turned that =
off in your kernel. &nbsp;If you have an IDE controller that takes too =
long to initialize, that can also cause this sort of thing (although =
that's REALLY unlikely these days).</div><div><br></div><div>I hope that =
some of this helps. &nbsp;Although, it will be hard for anyone to give =
you really solid advice without a little more insight into why the MD =
isn't getting assembled prior to LVM's =
scan.</div><div><br></div><div><div><div>On Apr 5, 2009, at 10:05 AM, =
Miles Fidelman wrote:</div><br =
class=3D"Apple-interchange-newline"><blockquote type=3D"cite"><div>Hello =
again Folks,<br><br>So.. I'm getting closer to fixing this messed up =
machine.<br><br>Where things stand:<br><br>I have root defined as an =
LVM2 LV, that should use /dev/md2 as it's PV.<br>/dev/md2 in turn is a =
RAID1 array built from /dev/sda3 /dev/sdb3 and /dev/sdc3<br><br>Instead, =
LVM is reporting: "Found duplicate PV 2ppSS2q0kO3t0tuf8t6S19qY3ypWBOxF: =
using /dev/sdb3 not /dev/sda3"<br>and the /dev/md2 is reporting itself =
as inactive (cat /proc/mdstat) and active,degraded (mdadm =
--detail)<br><br>---<br>I'm guessing that, during boot:<br><br>- the =
raid array failed to start<br>- LVM found both copies of the PV, and =
picked one (/dev/sdb3)<br>- everything then came up and my server is =
humming away<br><br>but: the md array can't rebuild because the most =
current device in it is already in use<br><br>so... &nbsp;I'm looking =
for the right sequence of events, with the minimum downtime =
to:<br><br>1. stop changes to /dev/sdb3 (actually, to / - which =
complicates things)<br>2. rebuild the RAID1 array, making sure to use =
/dev/sdb3 as the starting point for current data<br>3. restart in such a =
way that LVM finds /dev/md2 as the right PVM instead of one of its =
components<br><br>Each of these is just tricky enough that I'm sure =
there are lots of gotchas to watch out for.<br><br>So.. any =
suggestions?<br><br>Thanks very much,<br><br>Miles =
Fidelman<br><br><br><br><br>______________________________________________=
_<br>linux-lvm mailing list<br><a =
href=3D"mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br>https://w=
ww.redhat.com/mailman/listinfo/linux-lvm<br>read the LVM HOW-TO at =
http://tldp.org/HOWTO/LVM-HOWTO/<br></div></blockquote></div></div><br><di=
v apple-content-edited=3D"true"> <span class=3D"Apple-style-span" =
style=3D"border-collapse: separate; color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant: normal; =
font-weight: normal; letter-spacing: normal; line-height: normal; =
orphans: 2; text-align: auto; text-indent: 0px; text-transform: none; =
white-space: normal; widows: 2; word-spacing: 0px; =
-webkit-border-horizontal-spacing: 0px; -webkit-border-vertical-spacing: =
0px; -webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: =
auto; -webkit-text-stroke-width: 0; "><div style=3D"word-wrap: =
break-word; -webkit-nbsp-mode: space; -webkit-line-break: =
after-white-space; "><span class=3D"Apple-style-span" =
style=3D"border-collapse: separate; color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant: normal; =
font-weight: normal; letter-spacing: normal; line-height: normal; =
orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; =
widows: 2; word-spacing: 0px; -webkit-border-horizontal-spacing: 0px; =
-webkit-border-vertical-spacing: 0px; =
-webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: =
auto; -webkit-text-stroke-width: 0px; "><div style=3D"word-wrap: =
break-word; -webkit-nbsp-mode: space; -webkit-line-break: =
after-white-space; "><span class=3D"Apple-style-span" =
style=3D"border-collapse: separate; color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant: normal; =
font-weight: normal; letter-spacing: normal; line-height: normal; =
orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; =
widows: 2; word-spacing: 0px; -webkit-border-horizontal-spacing: 0px; =
-webkit-border-vertical-spacing: 0px; =
-webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: =
auto; -webkit-text-stroke-width: 0px; "><div style=3D"word-wrap: =
break-word; -webkit-nbsp-mode: space; -webkit-line-break: =
after-white-space; "><span class=3D"Apple-style-span" =
style=3D"border-collapse: separate; color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant: normal; =
font-weight: normal; letter-spacing: normal; line-height: normal; =
orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; =
widows: 2; word-spacing: 0px; -webkit-border-horizontal-spacing: 0px; =
-webkit-border-vertical-spacing: 0px; =
-webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: =
auto; -webkit-text-stroke-width: 0px; "><div style=3D"word-wrap: =
break-word; -webkit-nbsp-mode: space; -webkit-line-break: =
after-white-space; "><span class=3D"Apple-style-span" =
style=3D"border-collapse: separate; color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 12px; font-style: normal; font-variant: normal; =
font-weight: normal; letter-spacing: normal; line-height: normal; =
orphans: 2; text-indent: 0px; text-transform: none; white-space: normal; =
widows: 2; word-spacing: 0px; -webkit-border-horizontal-spacing: 0px; =
-webkit-border-vertical-spacing: 0px; =
-webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: =
auto; -webkit-text-stroke-width: 0px; "><div style=3D"word-wrap: =
break-word; -webkit-nbsp-mode: space; -webkit-line-break: =
after-white-space; "><span class=3D"Apple-style-span" =
style=3D"border-collapse: separate; -webkit-border-horizontal-spacing: =
0px; -webkit-border-vertical-spacing: 0px; color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
line-height: normal; -webkit-text-decorations-in-effect: none; =
text-indent: 0px; -webkit-text-size-adjust: auto; text-transform: none; =
orphans: 2; white-space: normal; widows: 2; word-spacing: 0px; "><div =
style=3D"word-wrap: break-word; -webkit-nbsp-mode: space; =
-webkit-line-break: after-white-space; "><span class=3D"Apple-style-span" =
style=3D"border-collapse: separate; -webkit-border-horizontal-spacing: =
0px; -webkit-border-vertical-spacing: 0px; color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
line-height: normal; -webkit-text-decorations-in-effect: none; =
text-indent: 0px; -webkit-text-size-adjust: auto; text-transform: none; =
orphans: 2; white-space: normal; widows: 2; word-spacing: 0px; "><span =
class=3D"Apple-style-span" style=3D"border-collapse: separate; =
-webkit-border-horizontal-spacing: 0px; -webkit-border-vertical-spacing: =
0px; color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; =
font-style: normal; font-variant: normal; font-weight: normal; =
letter-spacing: normal; line-height: normal; =
-webkit-text-decorations-in-effect: none; text-indent: 0px; =
-webkit-text-size-adjust: auto; text-transform: none; orphans: 2; =
white-space: normal; widows: 2; word-spacing: 0px; =
"><div>--&nbsp;</div><div>Jayson Vantuyl</div><div><font =
class=3D"Apple-style-span" size=3D"2"><span class=3D"Apple-style-span" =
style=3D"font-size: 10px; "><span class=3D"Apple-style-span" =
style=3D"font-size: 10px; "><span class=3D"Apple-style-span" =
style=3D"font-size: 10px; ">Founder and =
Architect</span></span></span></font></div><div><b style=3D"font-weight: =
bold; "><a href=3D"http://www.engineyard.com"><span =
class=3D"Apple-style-span" style=3D"font-weight: normal; color: rgb(0, =
0, 238); -webkit-text-decorations-in-effect: underline; "><span =
class=3D"Apple-style-span" style=3D"color: rgb(0, 0, 238); =
-webkit-text-decorations-in-effect: underline; ">Engine =
Yard</span></span></a></b></div><div><font class=3D"Apple-style-span" =
size=3D"2"><span class=3D"Apple-style-span" style=3D"font-size: 10px; =
"><span class=3D"Apple-style-span" style=3D"font-size: 10px; "><span =
class=3D"Apple-style-span" style=3D"font-size: 10px; "><a =
href=3D"mailto:jvantuyl@engineyard.com">jvantuyl@engineyard.com</a></span>=
</span></span></font></div><div><font class=3D"Apple-style-span" =
size=3D"2"><span class=3D"Apple-style-span" style=3D"font-size: 10px; =
">1 866 518 9275 ext 204</span></font></div><div><font =
class=3D"Apple-style-span" size=3D"2"><span class=3D"Apple-style-span" =
style=3D"font-size: 10px; ">IRC (freenode): =
kagato</span></font></div></span></span></div></span></div></span></div></=
span></div></span></div></span></div></span> </div><br></body></html>=

--Apple-Mail-51-803599567--
