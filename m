Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p252DLl9025334
	for <linux-lvm@redhat.com>; Fri, 4 Mar 2011 21:13:21 -0500
Received: from mail-vw0-f46.google.com (mail-vw0-f46.google.com
	[209.85.212.46])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p252DCsQ030449
	for <linux-lvm@redhat.com>; Fri, 4 Mar 2011 21:13:12 -0500
Received: by vws12 with SMTP id 12so3083622vws.33
	for <linux-lvm@redhat.com>; Fri, 04 Mar 2011 18:13:11 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1299228115.13997.37.camel@localhost>
References: <AANLkTimg-wAqrWxGaj-HSFYazPV-GT7kWKfdYGst9tM3@mail.gmail.com>
	<Pine.LNX.4.64.1103031516340.14941@bmsred.bmsi.com>
	<1299228115.13997.37.camel@localhost>
Date: Sat, 5 Mar 2011 15:13:10 +1300
Message-ID: <AANLkTinATFdAZ6fsrE_vkfJ6pMrF6v0xfN4hu8sqEP0N@mail.gmail.com>
From: Scott Arthur <scott@scottatron.com>
Content-Type: multipart/alternative; boundary=20cf307ca05cd8ff1c049db2cd62
Subject: Re: [linux-lvm] Resizing underlying LVM partition after cloning to
 bigger disk
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

--20cf307ca05cd8ff1c049db2cd62
Content-Type: text/plain; charset=ISO-8859-1

I've been playing around on a test system with a similar partition table.

Have successfully resized 2 to fill the disk extent. Partition 5 however
proves to be problematic.

Using fdisk, I tried deleting 2 and 5 and recreating based on sectors, but
couldn't recreate 5 on the same starting sector, it told me I was out of
bounds.

I then tried the same thing with fdisk but with cylinders instead and both
partitions were recreated okay, but destroyed all my LVM stuff.

I can happily resize 2 using parted but parted wont resize 5.

Should I expect to be able to resize 5, or am I missing the point. Should I
simply be creating a partition 6 to fill the additional space opened up by
the resizing of partition 2?

On 4 March 2011 21:41, Radu Rendec <radu.rendec@mindbit.ro> wrote:

> On Thu, 2011-03-03 at 15:18 -0500, Stuart D. Gathman wrote:
> > On Thu, 3 Mar 2011, Scott Arthur wrote:
> >
> > > Partition Table: msdos
> > >
> > > Number  Start   End     Size    Type      File system  Flags
> > >  1      32.3kB  296MB   296MB   primary   ext4         boot
> > >  2      296MB   1000GB  1000GB  extended
> > >  5      296MB   1000GB  1000GB  logical                lvm
> > >
> > > I'm obviously wanting to expand the LVM partition to fill the remaining
> 1TB
> > > of space.
> > >
> > > Am I able to simply use parted to resize the partition before doing a
> > > pvresize etc?
> > >
> > > Or is it risky to resize the underlying LVM partition?
>
> I wouldn't do that. Instead, I would create a new logical partition,
> "format" it as lvm physical volume and then extend the volume group to
> use this partition as well.
>
> I think this can be safely done like this:
>
> * turn off lvm;
> * note down the exact starting and ending *sector* of partition 5 (using
> fdisk -lu)
> * use fdisk and delete partition 5 and 2, then re-create partition 2 up
> to the full disk size
> * re-create partition 5 making sure it's on exactly the same starting
> and ending sector as it was before
> * create new partition 6
>
> > You are getting to a size where msdos partition tables are risky.
> > Don't they crap out at 2TB?
>
> They do. But the "2TB" disk is actually 2000GB, which is safe (it takes
> more than 2048GB to run into trouble with m$dos partitions).
>
> Best regards,
>
> Radu Rendec
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>



-- 
Scottatron | Mob +6421 89 11 88 | skype scottatron

--20cf307ca05cd8ff1c049db2cd62
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

I&#39;ve been playing around on a test system with a similar partition tabl=
e.=A0<div><br></div><div>Have successfully resized 2 to fill the disk exten=
t.=A0Partition 5 however proves to be problematic.<div><br></div><div>Using=
 fdisk, I tried deleting 2 and 5 and recreating based on sectors, but could=
n&#39;t recreate 5 on the same starting sector, it told me I was out of bou=
nds.=A0</div>
<div><br></div><div>I then tried the same thing with fdisk but with cylinde=
rs instead and both partitions were recreated okay, but destroyed all my LV=
M stuff.</div><div><br></div><div>I can happily resize 2 using parted but p=
arted wont resize 5.</div>
<div><br></div><div>Should I expect to be able to resize 5, or am I missing=
 the point. Should I simply be creating a partition 6 to fill the additiona=
l space opened up by the resizing of partition 2?</div><div><br><div class=
=3D"gmail_quote">
On 4 March 2011 21:41, Radu Rendec <span dir=3D"ltr">&lt;<a href=3D"mailto:=
radu.rendec@mindbit.ro">radu.rendec@mindbit.ro</a>&gt;</span> wrote:<br><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex;">
<div class=3D"im">On Thu, 2011-03-03 at 15:18 -0500, Stuart D. Gathman wrot=
e:<br>
&gt; On Thu, 3 Mar 2011, Scott Arthur wrote:<br>
&gt;<br>
&gt; &gt; Partition Table: msdos<br>
&gt; &gt;<br>
&gt; &gt; Number =A0Start =A0 End =A0 =A0 Size =A0 =A0Type =A0 =A0 =A0File =
system =A0Flags<br>
&gt; &gt; =A01 =A0 =A0 =A032.3kB =A0296MB =A0 296MB =A0 primary =A0 ext4 =
=A0 =A0 =A0 =A0 boot<br>
&gt; &gt; =A02 =A0 =A0 =A0296MB =A0 1000GB =A01000GB =A0extended<br>
&gt; &gt; =A05 =A0 =A0 =A0296MB =A0 1000GB =A01000GB =A0logical =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0lvm<br>
&gt; &gt;<br>
&gt; &gt; I&#39;m obviously wanting to expand the LVM partition to fill the=
 remaining 1TB<br>
&gt; &gt; of space.<br>
&gt; &gt;<br>
&gt; &gt; Am I able to simply use parted to resize the partition before doi=
ng a<br>
&gt; &gt; pvresize etc?<br>
&gt; &gt;<br>
&gt; &gt; Or is it risky to resize the underlying LVM partition?<br>
<br>
</div>I wouldn&#39;t do that. Instead, I would create a new logical partiti=
on,<br>
&quot;format&quot; it as lvm physical volume and then extend the volume gro=
up to<br>
use this partition as well.<br>
<br>
I think this can be safely done like this:<br>
<br>
* turn off lvm;<br>
* note down the exact starting and ending *sector* of partition 5 (using<br=
>
fdisk -lu)<br>
* use fdisk and delete partition 5 and 2, then re-create partition 2 up<br>
to the full disk size<br>
* re-create partition 5 making sure it&#39;s on exactly the same starting<b=
r>
and ending sector as it was before<br>
* create new partition 6<br>
<div class=3D"im"><br>
&gt; You are getting to a size where msdos partition tables are risky.<br>
&gt; Don&#39;t they crap out at 2TB?<br>
<br>
</div>They do. But the &quot;2TB&quot; disk is actually 2000GB, which is sa=
fe (it takes<br>
more than 2048GB to run into trouble with m$dos partitions).<br>
<br>
Best regards,<br>
<font color=3D"#888888"><br>
Radu Rendec<br>
</font><div><div></div><div class=3D"h5"><br>
<br>
_______________________________________________<br>
linux-lvm mailing list<br>
<a href=3D"mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br>
<a href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm" target=3D"_bl=
ank">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>
read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" target=
=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br>
</div></div></blockquote></div><br><br clear=3D"all"><br>-- <br>Scottatron =
| Mob +6421 89 11 88 | skype scottatron<br><br><br>
</div></div>

--20cf307ca05cd8ff1c049db2cd62--
