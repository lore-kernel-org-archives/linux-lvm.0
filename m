Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r946dvoG001450
	for <linux-lvm@redhat.com>; Fri, 4 Oct 2013 02:39:57 -0400
Received: from mail-vc0-f174.google.com (mail-vc0-f174.google.com
	[209.85.220.174])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r946duRE029421
	for <linux-lvm@redhat.com>; Fri, 4 Oct 2013 02:39:56 -0400
Received: by mail-vc0-f174.google.com with SMTP id gd11so1541563vcb.33
	for <linux-lvm@redhat.com>; Thu, 03 Oct 2013 23:39:56 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CALHAVFx5vVd8OPiEgS=nkE9u+hg0qGt=6q_JrB2oLFUDokKKMw@mail.gmail.com>
References: <CALHAVFw1T1vMJwECqCO4-_KfUjU_EyCihFW=DgW5xDh36nR19A@mail.gmail.com>
	<CALHAVFx5vVd8OPiEgS=nkE9u+hg0qGt=6q_JrB2oLFUDokKKMw@mail.gmail.com>
Date: Fri, 4 Oct 2013 12:09:55 +0530
Message-ID: <CAHNdDV_iSnAKXFJMUB-s3TS053BUdyaDcTOoFDaCECyxhSqY_g@mail.gmail.com>
From: Chaitanya Gotkhindikar <cg011235@gmail.com>
Content-Type: multipart/alternative; boundary=20cf30780c5c10576104e7e4928b
Subject: Re: [linux-lvm] File system read only
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

--20cf30780c5c10576104e7e4928b
Content-Type: text/plain; charset=ISO-8859-1

Can you check /etc/fstab for mount options.
Also, can you try remounting it as rw.

-Chaitanya


On Sun, Sep 29, 2013 at 5:29 PM, Prathyush <prathyush.r@gmail.com> wrote:

> Hi
> In our server the ext3.fs created on lvm is going read only mode.
> When I try to mount it again it suggest for file system check and never
> mounted.But I did lvm deactivate and activate.then tried mounting  ....now
> this got mounted with out file system check.we took one problematic volume
> ,deleted and recreated the volume,made file system.But the isse happened on
> that fs ....Any idea?
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

--20cf30780c5c10576104e7e4928b
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Can you check /etc/fstab for mount options.<div>Also, can =
you try remounting it as rw.</div><div><br></div><div>-Chaitanya</div></div=
><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">On Sun, Sep =
29, 2013 at 5:29 PM, Prathyush <span dir=3D"ltr">&lt;<a href=3D"mailto:prat=
hyush.r@gmail.com" target=3D"_blank">prathyush.r@gmail.com</a>&gt;</span> w=
rote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><p>Hi<br>
In our server the ext3.fs created on lvm is going read only mode.<br>
When I try to mount it again it suggest for file system check and never mou=
nted.But I did lvm deactivate and activate.then tried mounting=A0 ....now t=
his got mounted with out file system check.we took one problematic volume ,=
deleted and recreated the volume,made file system.But the isse happened on =
that fs ....Any idea?</p>


<br>_______________________________________________<br>
linux-lvm mailing list<br>
<a href=3D"mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br>
<a href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm" target=3D"_bl=
ank">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>
read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" target=
=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br></blockquote></div><br>=
</div>

--20cf30780c5c10576104e7e4928b--
