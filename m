Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q1LH1E7w017210
	for <linux-lvm@redhat.com>; Tue, 21 Feb 2012 12:01:14 -0500
Received: from mail-pw0-f46.google.com (mail-pw0-f46.google.com
	[209.85.160.46])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q1LH1DaX032576
	for <linux-lvm@redhat.com>; Tue, 21 Feb 2012 12:01:14 -0500
Received: by pbcun15 with SMTP id un15so10984312pbc.33
	for <linux-lvm@redhat.com>; Tue, 21 Feb 2012 09:01:13 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20120221102932.19eb3218@bettercgi.com>
References: <20120221102932.19eb3218@bettercgi.com>
Date: Tue, 21 Feb 2012 11:01:13 -0600
Message-ID: <CAOAgVpyfEApbLRFr1-s6UvAsa8yO0MSOcYDgPWXBv2FRoD+Ntg@mail.gmail.com>
From: Les Mikesell <lesmikesell@gmail.com>
Content-Type: multipart/alternative; boundary=e89a8ff2452bc7d0bc04b97c5bf8
Subject: Re: [linux-lvm] mirror_region_size default: 4096 six times faster
 than 512?
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

--e89a8ff2452bc7d0bc04b97c5bf8
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Feb 21, 2012 at 10:29 AM, Ray Morris <support@bettercgi.com> wrote:

>
> If 4096 is OFTEN several times faster than 512, would it make sense
> to consider canging the default?
>

What disks are underneath this?  One of the new 4k sector types?

-- 
   Les Mikesell
    lesmikesell@gmail.com

--e89a8ff2452bc7d0bc04b97c5bf8
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Tue, Feb 21, 2012 at 10:29 AM, Ray Morris <sp=
an dir=3D"ltr">&lt;<a href=3D"mailto:support@bettercgi.com">support@betterc=
gi.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"=
margin:0pt 0pt 0pt 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">
<br>
If 4096 is OFTEN several times faster than 512, would it make sense<br>
to consider canging the default?<br></blockquote></div><br>What disks are u=
nderneath this?=A0 One of the new 4k sector types?<br><br>-- <br>=A0=A0 Les=
 Mikesell<br>=A0=A0=A0 <a href=3D"mailto:lesmikesell@gmail.com">lesmikesell=
@gmail.com</a><br>
<br>

--e89a8ff2452bc7d0bc04b97c5bf8--
