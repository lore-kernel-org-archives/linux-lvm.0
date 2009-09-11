Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.7])
	by int-mx04.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n8BJ17ns006235
	for <linux-lvm@redhat.com>; Fri, 11 Sep 2009 15:01:07 -0400
Received: from fg-out-1718.google.com (fg-out-1718.google.com [72.14.220.158])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n8BJ0ld9028226
	for <linux-lvm@redhat.com>; Fri, 11 Sep 2009 15:00:48 -0400
Received: by fg-out-1718.google.com with SMTP id 22so395629fge.9
	for <linux-lvm@redhat.com>; Fri, 11 Sep 2009 12:00:47 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20090911153958.24cc2cdc@fixlaptop.gillibert.homelinux.net>
References: <352f9c2a0909092319h2e115e07lbf867825c68c102e@mail.gmail.com>
	<20090910063511.GA7247@maude.comedia.it>
	<352f9c2a0909100135i64ac861awaf7089ea27c1b3b3@mail.gmail.com>
	<20090911153958.24cc2cdc@fixlaptop.gillibert.homelinux.net>
Date: Fri, 11 Sep 2009 22:00:47 +0300
Message-ID: <352f9c2a0909111200p4da44d7lbc52b9176f33ff0d@mail.gmail.com>
Subject: Re: [linux-lvm] Understanding if a disk is partioned with LVM or not
From: pent 5971 <pent5971@gmail.com>
Content-Type: multipart/alternative; boundary=00c09ffb5a670f9d40047351efd8
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

--00c09ffb5a670f9d40047351efd8
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

No no no, its funny i just needed the folder /xyz with mkdir which ill moun=
t
the new disk :-)

2009/9/11 Andr=E9 Gillibert <rcvxdg@gmail.com>

> pent 5971 <pent5971@gmail.com> wrote:
> > Hi,
> > Luca thanks for your answer . the disk seems to be regular one. So for
> > the new added disk
> > i have followed the
> >
> http://jamesthornton.com/redhat/linux/7.3/Reference-Guide/s1-filesystem-e=
xt3-create.html
> >  and rebooted the server (edited the fstab ). But the disk doesnt seem
> > to be
> > mounted . So what can be the problem?
> >
> 1) Check that the relevant partitions exist. Assuming your disk is
> /dev/sdb, partitions may be /dev/sdb1 /dev/sdb2, etc.
> 2) Try to mount them manually.
> Your boot script may not automatically mount all partitions. In that case=
:
> $ mount /mount/point
> should work.
> Or, maybe there's an issue with label detection.
> In that case, specify the partition.
> $ mount -t ext3 /dev/sdb1 /mount/point
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

--00c09ffb5a670f9d40047351efd8
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

No no no, its funny i just needed the folder /xyz with mkdir which ill moun=
t the new disk :-)<br><br><div class=3D"gmail_quote">2009/9/11 Andr=E9 Gill=
ibert <span dir=3D"ltr">&lt;<a href=3D"mailto:rcvxdg@gmail.com">rcvxdg@gmai=
l.com</a>&gt;</span><br>
<blockquote class=3D"gmail_quote" style=3D"border-left: 1px solid rgb(204, =
204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;"><div class=3D"im"=
>pent 5971 &lt;<a href=3D"mailto:pent5971@gmail.com">pent5971@gmail.com</a>=
&gt; wrote:<br>

&gt; Hi,<br>
&gt; Luca thanks for your answer . the disk seems to be regular one. So for=
<br>
&gt; the new added disk<br>
&gt; i have followed the<br>
&gt; <a href=3D"http://jamesthornton.com/redhat/linux/7.3/Reference-Guide/s=
1-filesystem-ext3-create.html" target=3D"_blank">http://jamesthornton.com/r=
edhat/linux/7.3/Reference-Guide/s1-filesystem-ext3-create.html</a><br>
&gt; =A0and rebooted the server (edited the fstab ). But the disk doesnt se=
em<br>
&gt; to be<br>
&gt; mounted . So what can be the problem?<br>
&gt;<br>
</div>1) Check that the relevant partitions exist. Assuming your disk is /d=
ev/sdb, partitions may be /dev/sdb1 /dev/sdb2, etc.<br>
2) Try to mount them manually.<br>
Your boot script may not automatically mount all partitions. In that case:<=
br>
$ mount /mount/point<br>
should work.<br>
Or, maybe there&#39;s an issue with label detection.<br>
In that case, specify the partition.<br>
$ mount -t ext3 /dev/sdb1 /mount/point<br>
<br>
--<br>
<font color=3D"#888888">Andr=E9 Gillibert<br>
</font><div><div></div><div class=3D"h5"><br>
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

--00c09ffb5a670f9d40047351efd8--
