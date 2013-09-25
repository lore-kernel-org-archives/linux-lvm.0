MIME-Version: 1.0
In-Reply-To: <523FF01F.4000403@redhat.com>
References: <CAFrGbuXqastwqEG3J5Vc7LeuiK3_SGr3GDkoaeMAJEW3FUEO+A@mail.gmail.com>
	<523FF01F.4000403@redhat.com>
Date: Wed, 25 Sep 2013 02:24:07 +0200
Message-ID: <CAFrGbuWYBEF7TYS61d6jZhOYMAg8-Ax1vuFMvgjfXyud1HgFVA@mail.gmail.com>
From: Alessandro MACUZ <alessandro.macuz@gmail.com>
Content-Type: multipart/alternative; boundary=001a113366bc87623604e72a452a
Subject: Re: [linux-lvm] Mirrored LVM volumes and UUID
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

--001a113366bc87623604e72a452a
Content-Type: text/plain; charset=ISO-8859-1

When the mirror volume is activated, only top-level volumes are scanned

> by blkid in udev rules (it's coordinated by 11-dm-lvm.rules and
> 13-dm-disk.rules
> which are in /lib/udev/rules.d). In this case, it's the lvm01-root only
> that
> is scanned by blkid within udev processing, not the *_mimage devices. Then
> we
> end up with a symlink created only for the top-level volume in
> /dev/disk/by-uuid
> directory. And this is what is being looked for at boot...
>
> The similar situation happens with snapshot volumes which would end up with
> same FS UUID for the origin and all its snapshots. In this case, we always
> give
> priority to the origin volume.
>
> Peter
>

Many thanks Peter for your explanation,

I'll have a look at it.

Alex

--001a113366bc87623604e72a452a
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">When the mirror volume is activated, only top-level volume=
s are scanned<br><div class=3D"gmail_extra"><div class=3D"gmail_quote"><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">

by blkid in udev rules (it&#39;s coordinated by 11-dm-lvm.rules and 13-dm-d=
isk.rules<br>
which are in /lib/udev/rules.d). In this case, it&#39;s the lvm01-root only=
 that<br>
is scanned by blkid within udev processing, not the *_mimage devices. Then =
we<br>
end up with a symlink created only for the top-level volume in /dev/disk/by=
-uuid<br>
directory. And this is what is being looked for at boot...<br>
<br>
The similar situation happens with snapshot volumes which would end up with=
<br>
same FS UUID for the origin and all its snapshots. In this case, we always =
give<br>
priority to the origin volume.<br>
<span class=3D""><font color=3D"#888888"><br>
Peter<br>
</font></span></blockquote></div><br><div><div>Many thanks Peter for your e=
xplanation,<br><br></div>I&#39;ll have a look at it.<br><br></div>Alex<br><=
br><br></div></div>

--001a113366bc87623604e72a452a--
