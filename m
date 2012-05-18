Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q4IEDgVq019481
	for <linux-lvm@redhat.com>; Fri, 18 May 2012 10:13:42 -0400
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q4IEDeB9017643
	for <linux-lvm@redhat.com>; Fri, 18 May 2012 10:13:41 -0400
Received: by wibhj6 with SMTP id hj6so188314wib.9
	for <linux-lvm@redhat.com>; Fri, 18 May 2012 07:13:40 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4FB623AC.9060900@redhat.com>
References: <CAGQjrKb6_HuVc2Ro8vnkMwEmHg-H4gJHJVf_Q5GVaZfSM1p7yA@mail.gmail.com>
	<20120517181350.2922a70b@bettercgi.com>
	<4FB623AC.9060900@redhat.com>
Date: Fri, 18 May 2012 19:43:40 +0530
Message-ID: <CAGQjrKYrgcx+y8M6NnLGZK5Z+hNpH3Fp4E2EysnKGZuObaFuBA@mail.gmail.com>
From: tariq wali <ganaiwali@gmail.com>
Content-Type: multipart/alternative; boundary=f46d0444ef43ba7a6f04c050283d
Subject: Re: [linux-lvm] lvreduce nightmare
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

--f46d0444ef43ba7a6f04c050283d
Content-Type: text/plain; charset=ISO-8859-1

Appreciate the response although I realized a messed up large volume  lvm
requires time and which I didn't have in this case and resorted to backup
and recreated volumes all over new .

I realize I went wrong with resize2fs thinking that it would reduce my lvm
by 100G but it actually reduced the total volume size to 100G , i-e an lvm
of 1.7T

resize2fs /dev/vg0/data 100G ( i thought it would reduce the by 100G but
dropped the block device size to total of 100G )

so to i guess to do this right i should have

resize2fs /dev/vg0/data 1.6T or (1600G)

and then lvreduce -n data -L 100G /dev/vg0/data ( to reduce the lvm by 100
)

I even tried the vgcfgrestore on the archived lvm metadata file but that
just restored the metadata (back to original volume size however I still
had a bad file system ) .


Tariq


On Fri, May 18, 2012 at 3:55 PM, Bryn M. Reeves <bmr@redhat.com> wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 05/18/2012 12:13 AM, Ray Morris wrote:
> > Stop. Don't do anything else until you are sure of what to do next.
> >  You will not lose data by studying. You can lose data by trying to
> > fix it.
> >
> >> resize2fs /dev/vg0/data 100G lvreduce -L -100G -n /dev/vg0/data*
> >
> > A 100 GB filesystem needs a block device of around 110 GB.  So
> > this cut off the end of your filesystem. (The device needs to hold
> > the journal as well as the FS, for example.)
>
> Not with most file systems. When you ask resize2fs to make a file
> system 100G it will make it (within rounding limits) 100G's worth of
> blocks in length. This is the actual space required on the disk (i.e.
> the argument is the size of the file system image not the maximum free
> space within it).
>
> E.g.:
>
> # lvcreate -L 100M -n l0 tvg0
>  Logical volume "l0" created
> # mke2fs -j /dev/tvg0/l0
> mke2fs 1.41.9 (22-Aug-2009)
> Filesystem label=
> OS type: Linux
> Block size=1024 (log=0)
> Fragment size=1024 (log=0)
> 25688 inodes, 102400 blocks
> [...]
>
> 102400 1024-byte blocks is exactly 100M (MiB to be pedantic).
>
> Resize to 50M gives:
>
> # resize2fs /dev/tvg0/l0 50M
> resize2fs 1.41.9 (22-Aug-2009)
> Resizing the filesystem on /dev/tvg0/l0 to 51200 (1k) blocks.
> The filesystem on /dev/tvg0/l0 is now 51200 blocks long.
>
> 51200 1024 byte blocks is exactly 50MiB.
>
> Regards,
> Bryn.
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.12 (GNU/Linux)
> Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/
>
> iEYEARECAAYFAk+2I6wACgkQ6YSQoMYUY96SlACfTAzVIzeym6iM3fzGhsR0P9YK
> iG8Amwfu9AwTnwHvCUddMdzhKxlW0uCA
> =+ITm
> -----END PGP SIGNATURE-----
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>



-- 
*Tariq Wali.*

--f46d0444ef43ba7a6f04c050283d
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Appreciate the response although I realized a messed up la=
rge volume =A0lvm requires time and which I didn&#39;t have in this case an=
d resorted to backup and recreated volumes all over new .=A0<div><br></div>=
<div>
I realize I went wrong with resize2fs thinking that it would reduce my lvm =
by 100G but it actually reduced the total volume size to 100G , i-e an lvm =
of 1.7T</div><div><br></div><div>resize2fs /dev/vg0/data 100G ( i thought i=
t would reduce the by 100G but dropped the block device size to total of 10=
0G )</div>
<div><br></div><div>so to i guess to do this right i should have=A0</div><d=
iv><br></div><div>resize2fs /dev/vg0/data=A01.6T or (1600G)</div><div><br><=
/div><div>and then lvreduce -n data -L 100G /dev/vg0/data ( to reduce the l=
vm by 100 )=A0</div>
<div><br></div><div>I even tried the vgcfgrestore on the archived lvm metad=
ata file but that just restored the metadata (back to original volume size =
however I still had a bad file system ) .</div><div><br></div><div><br>
</div><div>Tariq</div><div><br></div><div><br><div class=3D"gmail_quote">On=
 Fri, May 18, 2012 at 3:55 PM, Bryn M. Reeves <span dir=3D"ltr">&lt;<a href=
=3D"mailto:bmr@redhat.com" target=3D"_blank">bmr@redhat.com</a>&gt;</span> =
wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div>-----BEGIN PGP SIGNED MESSAGE-----<br>
Hash: SHA1<br>
<br>
</div><div>On 05/18/2012 12:13 AM, Ray Morris wrote:<br>
&gt; Stop. Don&#39;t do anything else until you are sure of what to do next=
.<br>
&gt; =A0You will not lose data by studying. You can lose data by trying to<=
br>
&gt; fix it.<br>
&gt;<br>
&gt;&gt; resize2fs /dev/vg0/data 100G lvreduce -L -100G -n /dev/vg0/data*<b=
r>
&gt;<br>
&gt; A 100 GB filesystem needs a block device of around 110 GB. =A0So<br>
&gt; this cut off the end of your filesystem. (The device needs to hold<br>
&gt; the journal as well as the FS, for example.)<br>
<br>
</div>Not with most file systems. When you ask resize2fs to make a file<br>
system 100G it will make it (within rounding limits) 100G&#39;s worth of<br=
>
blocks in length. This is the actual space required on the disk (i.e.<br>
the argument is the size of the file system image not the maximum free<br>
space within it).<br>
<br>
E.g.:<br>
<br>
# lvcreate -L 100M -n l0 tvg0<br>
 =A0Logical volume &quot;l0&quot; created<br>
# mke2fs -j /dev/tvg0/l0<br>
mke2fs 1.41.9 (22-Aug-2009)<br>
Filesystem label=3D<br>
OS type: Linux<br>
Block size=3D1024 (log=3D0)<br>
Fragment size=3D1024 (log=3D0)<br>
25688 inodes, 102400 blocks<br>
[...]<br>
<br>
102400 1024-byte blocks is exactly 100M (MiB to be pedantic).<br>
<br>
Resize to 50M gives:<br>
<br>
# resize2fs /dev/tvg0/l0 50M<br>
resize2fs 1.41.9 (22-Aug-2009)<br>
Resizing the filesystem on /dev/tvg0/l0 to 51200 (1k) blocks.<br>
The filesystem on /dev/tvg0/l0 is now 51200 blocks long.<br>
<br>
51200 1024 byte blocks is exactly 50MiB.<br>
<div><br>
Regards,<br>
Bryn.<br>
-----BEGIN PGP SIGNATURE-----<br>
Version: GnuPG v1.4.12 (GNU/Linux)<br>
Comment: Using GnuPG with Mozilla - <a href=3D"http://enigmail.mozdev.org/"=
 target=3D"_blank">http://enigmail.mozdev.org/</a><br>
<br>
</div>iEYEARECAAYFAk+2I6wACgkQ6YSQoMYUY96SlACfTAzVIzeym6iM3fzGhsR0P9YK<br>
iG8Amwfu9AwTnwHvCUddMdzhKxlW0uCA<br>
=3D+ITm<br>
-----END PGP SIGNATURE-----<br>
<br>
_______________________________________________<br>
linux-lvm mailing list<br>
<a href=3D"mailto:linux-lvm@redhat.com" target=3D"_blank">linux-lvm@redhat.=
com</a><br>
<a href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm" target=3D"_bl=
ank">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>
read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" target=
=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div dir=3D"=
ltr"><i style=3D"background-color:rgb(255,0,0);color:rgb(0,102,0)">Tariq Wa=
li.</i><span><span style=3D"background-color:rgb(255,255,153)"></span></spa=
n><br>

</div><br>
</div></div>

--f46d0444ef43ba7a6f04c050283d--
