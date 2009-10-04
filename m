Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.8])
	by int-mx03.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n94Hnx5q003981
	for <linux-lvm@redhat.com>; Sun, 4 Oct 2009 13:49:59 -0400
Received: from mail-vw0-f193.google.com (mail-vw0-f193.google.com
	[209.85.212.193])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n94Hne6h017501
	for <linux-lvm@redhat.com>; Sun, 4 Oct 2009 13:49:41 -0400
Received: by vws31 with SMTP id 31so1615315vws.19
	for <linux-lvm@redhat.com>; Sun, 04 Oct 2009 10:49:40 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20091004191106.08a50ebf@fixlaptop.gillibert.homelinux.net>
References: <f6d6a910910040718n6286e9c1t3ae507cde17bc4bf@mail.gmail.com>
	<20091004163835.3b5dffec@fixlaptop.gillibert.homelinux.net>
	<f6d6a910910040823lffdc70fkff4d2e4a15d49349@mail.gmail.com>
	<20091004191106.08a50ebf@fixlaptop.gillibert.homelinux.net>
Date: Sun, 4 Oct 2009 12:49:40 -0500
Message-ID: <f6d6a910910041049r79912d8ap558c31788a3c233c@mail.gmail.com>
Subject: Re: [linux-lvm] Unmounting file system hangs up...
From: Thinking Outside the Well <rod.rook@gmail.com>
Content-Type: multipart/alternative; boundary=0016e64ec9a619280104751f9fbc
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

--0016e64ec9a619280104751f9fbc
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Here is what is in /etc/fstab.
#
# /etc/fstab
# Created by anaconda on Mon Sep  7 20:25:11 2009
#
# Accessible filesystems, by reference, are maintained under '/dev/disk'
# See man pages fstab(5), findfs(8), mount(8) and/or vol_id(8) for more inf=
o
#
UUID=3D878c124d-0271-4dd7-95d1-e6c95439220c /                       ext3
defaults        1 1
UUID=3D3511be5f-909d-44c5-a806-2e1d00d21dc4 /home                   ext3
defaults        1 2
UUID=3D8ee04c46-a36e-484d-824c-661c07f4c126 /boot                   ext3
defaults        1 2
tmpfs                   /dev/shm                tmpfs   defaults        0 0
devpts                  /dev/pts                devpts  gid=3D5,mode=3D620 =
 0 0
sysfs                   /sys                    sysfs   defaults        0 0
proc                    /proc                   proc    defaults        0 0
UUID=3D917a7154-8448-4c94-a230-7bd4be54e571 swap                    swap
defaults        0 0

CentOS-5 is on a hard drive of the same computer. /etc/fstab does not
explicitly mount CentOS-5, but Fedora-10 somehow mounts all hard drives
including NTFS drives. I must have done something to do this, but I forgot
what I did. Do you have any idea what I did and how I remedy this situation=
?



On Sun, Oct 4, 2009 at 12:11 PM, Andr=E9 Gillibert <rcvxdg@gmail.com> wrote=
:

> Thinking Outside the Well <rod.rook@gmail.com> wrote:
>
> > I agree you are right on your suggestion that Fedora is trying to umoun=
t
> a
> > network file system. I think it actually is trying to umount a CentOS
> file
> > system installed in another hard drive. The reason why I think that way
> is
> > that whenever I log on to CentOS, it complains that something is wrong
> with
> > the file system and checks it
> >
> Not properly unmounting a network (NFS, CIFS, etc.) mount point shouldn't
> break the target file system in any way, and shouldn't cause fsck to repo=
rt
> errors.
> Is CentOS hard drive on another computer?
> In that case, what network file system protocol is used, if any?
> If it's local hard drive, then, it's probably mounted as local file syste=
m
> (ext3 or other), and, not properly unmounting it, may cause fsck to
> complain.
>
> The contents of /etc/fstab and /etc/mtab or /proc/mounts may help you.
>
> fstab contains a static list of fs mounted at boot time.
> mtab and /proc/mounts contain the list of currently mounted file systems,
> including ones that might have been automatically mounted by your desktop
> environment when HAL notified it.
>
> --
> Andr=E9 Gillibert
>
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

--0016e64ec9a619280104751f9fbc
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Here is what is in /etc/fstab. <br><div style=3D"margin-left: 40px;">#<br>#=
 /etc/fstab<br># Created by anaconda on Mon Sep=A0 7 20:25:11 2009<br>#<br>=
# Accessible filesystems, by reference, are maintained under &#39;/dev/disk=
&#39;<br>
# See man pages fstab(5), findfs(8), mount(8) and/or vol_id(8) for more inf=
o<br>#<br>UUID=3D878c124d-0271-4dd7-95d1-e6c95439220c /=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ext3=A0=A0=A0 defaults=A0=
=A0=A0=A0=A0=A0=A0 1 1<br>UUID=3D3511be5f-909d-44c5-a806-2e1d00d21dc4 /home=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ext3=A0=A0=A0 defaul=
ts=A0=A0=A0=A0=A0=A0=A0 1 2<br>
UUID=3D8ee04c46-a36e-484d-824c-661c07f4c126 /boot=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ext3=A0=A0=A0 defaults=A0=A0=A0=A0=A0=A0=A0 =
1 2<br>tmpfs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 /dev/shm=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 tmpfs=A0=A0 defaults=A0=A0=A0=
=A0=A0=A0=A0 0 0<br>devpts=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 /dev/pts=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 devpts=A0 gid=3D5=
,mode=3D620=A0 0 0<br>
sysfs=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 /sys=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 sysfs=A0=A0 defaults=A0=A0=
=A0=A0=A0=A0=A0 0 0<br>proc=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 /proc=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 proc=
=A0=A0=A0 defaults=A0=A0=A0=A0=A0=A0=A0 0 0<br>UUID=3D917a7154-8448-4c94-a2=
30-7bd4be54e571 swap=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 swap=A0=A0=A0 defaults=A0=A0=A0=A0=A0=A0=A0 0 0<br>
<br></div>CentOS-5 is on a hard drive of the same computer. /etc/fstab does=
 not explicitly mount CentOS-5, but Fedora-10 somehow mounts all hard drive=
s including NTFS drives. I must have done something to do this, but I forgo=
t what I did. Do you have any idea what I did and how I remedy this situati=
on?<br>
<div style=3D"margin-left: 40px;"><br><br></div><br><div class=3D"gmail_quo=
te">On Sun, Oct 4, 2009 at 12:11 PM, Andr=E9 Gillibert <span dir=3D"ltr">&l=
t;<a href=3D"mailto:rcvxdg@gmail.com">rcvxdg@gmail.com</a>&gt;</span> wrote=
:<br><blockquote class=3D"gmail_quote" style=3D"border-left: 1px solid rgb(=
204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;">
<div class=3D"im">Thinking Outside the Well &lt;<a href=3D"mailto:rod.rook@=
gmail.com">rod.rook@gmail.com</a>&gt; wrote:<br>
<br>
</div><div class=3D"im">&gt; I agree you are right on your suggestion that =
Fedora is trying to umount a<br>
&gt; network file system. I think it actually is trying to umount a CentOS =
file<br>
&gt; system installed in another hard drive. The reason why I think that wa=
y is<br>
&gt; that whenever I log on to CentOS, it complains that something is wrong=
 with<br>
&gt; the file system and checks it<br>
&gt;<br>
</div>Not properly unmounting a network (NFS, CIFS, etc.) mount point shoul=
dn&#39;t break the target file system in any way, and shouldn&#39;t cause f=
sck to report errors.<br>
Is CentOS hard drive on another computer?<br>
In that case, what network file system protocol is used, if any?<br>
If it&#39;s local hard drive, then, it&#39;s probably mounted as local file=
 system (ext3 or other), and, not properly unmounting it, may cause fsck to=
 complain.<br>
<br>
The contents of /etc/fstab and /etc/mtab or /proc/mounts may help you.<br>
<br>
fstab contains a static list of fs mounted at boot time.<br>
mtab and /proc/mounts contain the list of currently mounted file systems, i=
ncluding ones that might have been automatically mounted by your desktop en=
vironment when HAL notified it.<br>
<font color=3D"#888888"><br>
--<br>
</font><div><div></div><div class=3D"h5">Andr=E9 Gillibert<br>
<br>
<br>
<br>
_______________________________________________<br>
linux-lvm mailing list<br>
<a href=3D"mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br>
<a href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm" target=3D"_bl=
ank">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>
read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" target=
=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br>
</div></div></blockquote></div><br>

--0016e64ec9a619280104751f9fbc--
