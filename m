Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id sB5AC7mH005062
	for <linux-lvm@redhat.com>; Fri, 5 Dec 2014 05:12:07 -0500
Received: from mail-la0-f51.google.com (mail-la0-f51.google.com
	[209.85.215.51])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id sB5AC4lB000338
	(version=TLSv1/SSLv3 cipher=RC4-SHA bits=128 verify=FAIL)
	for <linux-lvm@redhat.com>; Fri, 5 Dec 2014 05:12:05 -0500
Received: by mail-la0-f51.google.com with SMTP id ms9so380006lab.24
	for <linux-lvm@redhat.com>; Fri, 05 Dec 2014 02:12:04 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <5480E939.3070702@ubuntu.com>
References: <5480E939.3070702@ubuntu.com>
Date: Fri, 5 Dec 2014 13:12:04 +0300
Message-ID: <CADxRZqxjvrp3MhW4rAxaBvxeJ7qev=KE=0H92rNcKGBAD1VMaA@mail.gmail.com>
From: Anatoly Pugachev <matorola@gmail.com>
Content-Type: multipart/alternative; boundary=001a11c36c68f568050509754ebf
Subject: Re: [linux-lvm] Raid1 -> linear conversion = destroyed data
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

--001a11c36c68f568050509754ebf
Content-Type: text/plain; charset=UTF-8

On Fri, Dec 5, 2014 at 2:07 AM, Phillip Susi <psusi@ubuntu.com> wrote:

>
> I used lvconvert -m 1 --type raid1 to clone my root volume onto a new
> drive, and then used --splitmirrors to split off the original volume
> as a backup while I worked off the new drive for a few days.  I then
> decided the new drive was working well and used lvconvert -m 0 to
> convert the volume back to linear.  Instead of dropping the split off
> original leg, lvm dropped the NEW copy and redirected all IO to the
> OLD data, causing massive filesystem corruption.
>
> This is on Ubuntu 14.10 using lvm 2.02.98 and linux 3.16.
>

Phillip,

can you please paste the commands you've used to convert the volume? I
don't have ubuntu , but rhel7 manual page for lvconvert, example section is
pretty clear on how to convert back to flat (-m0) volume and what physical
device you remove from logical volume, quote:


       Converts mirror logical volume "vg00/lvmirror1" to linear, freeing
physical extents from /dev/sda:

       lvconvert -m0 vg00/lvmirror1 /dev/sda

--001a11c36c68f568050509754ebf
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On F=
ri, Dec 5, 2014 at 2:07 AM, Phillip Susi <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:psusi@ubuntu.com" target=3D"_blank">psusi@ubuntu.com</a>&gt;</span> w=
rote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
I used lvconvert -m 1 --type raid1 to clone my root volume onto a new<br>
drive, and then used --splitmirrors to split off the original volume<br>
as a backup while I worked off the new drive for a few days.=C2=A0 I then<b=
r>
decided the new drive was working well and used lvconvert -m 0 to<br>
convert the volume back to linear.=C2=A0 Instead of dropping the split off<=
br>
original leg, lvm dropped the NEW copy and redirected all IO to the<br>
OLD data, causing massive filesystem corruption.<br>
<br>
This is on Ubuntu 14.10 using lvm 2.02.98 and linux 3.16.<br></blockquote><=
div><br></div><div>Phillip,<br><br>can you please paste the commands you&#3=
9;ve used to convert the volume? I don&#39;t have ubuntu , but rhel7 manual=
 page for lvconvert, example section is pretty clear on how to convert back=
 to flat (-m0) volume and what physical device you remove from logical volu=
me, quote:<br><br><br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Converts mirror =
logical volume &quot;vg00/lvmirror1&quot; to linear, freeing physical exten=
ts from /dev/sda:<br><br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 lvconvert -m0=
 vg00/lvmirror1 /dev/sda<br><br><br></div></div></div></div>

--001a11c36c68f568050509754ebf--
