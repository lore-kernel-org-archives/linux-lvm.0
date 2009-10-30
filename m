Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.10])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n9U8r2Z3002836
	for <linux-lvm@redhat.com>; Fri, 30 Oct 2009 04:53:02 -0400
Received: from mail-qy0-f185.google.com (mail-qy0-f185.google.com
	[209.85.221.185])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n9U8qhQ1029065
	for <linux-lvm@redhat.com>; Fri, 30 Oct 2009 04:52:43 -0400
Received: by qyk15 with SMTP id 15so1498523qyk.23
	for <linux-lvm@redhat.com>; Fri, 30 Oct 2009 01:52:43 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20091030004218.GA11054@us.ibm.com>
References: <868096450910291645k49ebb1dfn1e55e5132805011e@mail.gmail.com>
	<1256860851.19833.14@raydesk1.bettercgi.com>
	<20091030004218.GA11054@us.ibm.com>
Date: Fri, 30 Oct 2009 09:52:43 +0100
Message-ID: <868096450910300152s271d34dcl74980fff211d15b4@mail.gmail.com>
Subject: Re: [linux-lvm] Best Practices deploying LVM
From: =?ISO-8859-1?Q?Abraham_P=E9rez?= <jockah@gmail.com>
Content-Type: multipart/alternative; boundary=0016368340d4aeecbf04772326b2
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

--0016368340d4aeecbf04772326b2
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Thanks for the instant answers!

Well... I'll try to explain myself better. I'm working in a client who have
a lot of servers running under VMware. This client have a lot of problems
with the storage, because they never have enough space so when they have to
allocate disk in servers, they add small virtual hard disks with, for
example, 5 or 10GB.

Then for the OS installation, we follow the basic schema based on disk
partitions (/dev/sda1 pointing to / with ext3, /dev/sda2 pointing to /home
and so on) and for the applications data, we use VG and LV pointing to /opt

The client have some applications who need a lot of mountpoints, so my
colleague adds 1-3 LV per VG (aproximated) and I only create only one VG an=
d
inside it, different LVs.  With this infrastructure, we have to discard
different kinds of hard disk because they're exactly the same... and we hav=
e
that doubt: what schema is better and why, discarding concept things like a
volume group was designed to be a group, because we're looking for good
reasons based in performance of future actions, it's not important... or am
I mistaken???

I don't know if I explained myself very well, so thanks all anyway!

Regards,
Abraham P=E9rez

2009/10/30 <malahal@us.ibm.com>

> Ray Morris [support@bettercgi.com] wrote:
> >     I don't know about a whitepaper, but I can address
> > your example.
> >
> > > he makes one volume group for each logical volume (more or less)
> >
> >     If each one has one volume, that's not exactly a volume
> > GROUP, is it?  If groups and volumes are basically synomous,
> > he gives up all the benfits of groups.  In fact, he gives
> > up most of the benefits of logical volumes, since each PV
> > has to be in one group, and each VG is one LV, you're left
> > with one LV per PV - might as well just use partitions
> > directly.
>
> I agree, you lose some flexibility but it has some advantage compared to
> plain partitions without LVM. E.g. he can make a file system larger than
> any disk with multiple disks in the above LVM (one LV per VG)
> configuration.  There are other advantages. I am not sure the reason for
> making only one LV per VG though!
>
> Thanks, Malahal.
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

--0016368340d4aeecbf04772326b2
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Thanks for the instant answers!<br><br>Well... I&#39;ll try to explain myse=
lf better. I&#39;m working in a client who have a lot of servers running un=
der VMware. This client have a lot of problems with the storage, because th=
ey never have enough space so when they have to allocate disk in servers, t=
hey add small virtual hard disks with, for example, 5 or 10GB.<br>
<br>Then for the OS installation, we follow the basic schema based on disk =
partitions (/dev/sda1 pointing to / with ext3, /dev/sda2 pointing to /home =
and so on) and for the applications data, we use VG and LV pointing to /opt=
<br>
<br>The client have some applications who need a lot of mountpoints, so my =
colleague adds 1-3 LV per VG (aproximated) and I only create only one VG an=
d inside it, different LVs.=A0 With this infrastructure, we have to discard=
 different kinds of hard disk because they&#39;re exactly the same... and w=
e have that doubt: what schema is better and why, discarding concept things=
 like a volume group was designed to be a group, because we&#39;re looking =
for good reasons based in performance of future actions, it&#39;s not impor=
tant... or am I mistaken???<br>
<br>I don&#39;t know if I explained myself very well, so thanks all anyway!=
<br><br>Regards,<br>Abraham P=E9rez<br><br><div class=3D"gmail_quote">2009/=
10/30  <span dir=3D"ltr">&lt;<a href=3D"mailto:malahal@us.ibm.com">malahal@=
us.ibm.com</a>&gt;</span><br>
<blockquote class=3D"gmail_quote" style=3D"border-left: 1px solid rgb(204, =
204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;"><div class=3D"im"=
>Ray Morris [<a href=3D"mailto:support@bettercgi.com">support@bettercgi.com=
</a>] wrote:<br>

&gt; =A0 =A0 I don&#39;t know about a whitepaper, but I can address<br>
&gt; your example.<br>
&gt;<br>
&gt; &gt; he makes one volume group for each logical volume (more or less)<=
br>
&gt;<br>
&gt; =A0 =A0 If each one has one volume, that&#39;s not exactly a volume<br=
>
&gt; GROUP, is it? =A0If groups and volumes are basically synomous,<br>
&gt; he gives up all the benfits of groups. =A0In fact, he gives<br>
&gt; up most of the benefits of logical volumes, since each PV<br>
&gt; has to be in one group, and each VG is one LV, you&#39;re left<br>
&gt; with one LV per PV - might as well just use partitions<br>
&gt; directly.<br>
<br>
</div>I agree, you lose some flexibility but it has some advantage compared=
 to<br>
plain partitions without LVM. E.g. he can make a file system larger than<br=
>
any disk with multiple disks in the above LVM (one LV per VG)<br>
configuration. =A0There are other advantages. I am not sure the reason for<=
br>
making only one LV per VG though!<br>
<br>
Thanks, Malahal.<br>
<div><div></div><div class=3D"h5"><br>
_______________________________________________<br>
linux-lvm mailing list<br>
<a href=3D"mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br>
<a href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm" target=3D"_bl=
ank">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>
read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" target=
=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br>
</div></div></blockquote></div><br>

--0016368340d4aeecbf04772326b2--
