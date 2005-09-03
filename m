Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j838O2V28800
	for <linux-lvm@redhat.com>; Sat, 3 Sep 2005 04:24:02 -0400
Received: from wproxy.gmail.com (wproxy.gmail.com [64.233.184.195])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j838NoD9010091
	for <linux-lvm@redhat.com>; Sat, 3 Sep 2005 04:23:55 -0400
Received: by wproxy.gmail.com with SMTP id 36so716401wra
	for <linux-lvm@redhat.com>; Sat, 03 Sep 2005 01:23:45 -0700 (PDT)
Message-ID: <87bbbe3d05090301233de841ba@mail.gmail.com>
Date: Sat, 3 Sep 2005 13:23:45 +0500
From: Linuxian-Zaheer Abbas <zaheerlg@gmail.com>
Subject: Re: [linux-lvm] Big problem with my LVM
In-Reply-To: <1125711908.10227.9.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_22239_15049058.1125735825008"
References: <1125705280.10227.6.camel@localhost.localdomain>
	<1125711908.10227.9.camel@localhost.localdomain>
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

------=_Part_22239_15049058.1125735825008
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dear Guys..
I m also having a prob with LVM..
i configured LVM at SuSe 9.3 worked perfectly fine..=20
unfortunately my linux got some prob..
i restored it using 1st cd of suse 9.3 ... linux got recovered.. perfectly.
but LVM lost..
1st i tried to recreate the VG with same name and same PV
but it didnt showed my data.
after then i tried restored that .. but still my data is vanished..

Is there any way to get back / recover my data..?????



On 9/3/05, e-Jah <e-Jah@ejahworld.net> wrote:
>=20
> Le samedi 03 septembre 2005 =E0 01:54 +0200, e-Jah a =E9crit :
> > Hi all,
> >
> > I have a big problem with my LVM, let me explain you it:
> > I had a lv of a vg, this vg was composed of 2 pv and i had an
> > ext3 partition on this lvm.
> > Today i reinstalled my system on a new hard drive and i used the partma=
n
> > tool of debian, it detected me the 2 disks as lvm, then i simply create
> > a vg with this 2 disque, and a lv with all the space. After i said: "do
> > nothing" to put myself the entry to mount it in fstab.
> > Now i can't mount it, and fdisk don't detect any partition on this driv=
e
> > Testdisk found nothing too.
> > I have the old informations about the lvm, is it possible to come back
> > in the old situation with them (or have you got a better solution ) ?
> >
> > Thank you very much.
> >
> > (sorry for my english ^^)
> >
> > My actual configuration (who doesn't work):
> >
> > [root@ici]/home/ejah #pvdisplay
> > --- Physical volume ---
> > PV Name /dev/hde1
> > VG Name donnees
> > PV Size 115,04 GB / not usable 0
> > Allocatable yes (but full)
> > PE Size (KByte) 4096
> > Total PE 29449
> > Free PE 0
> > Allocated PE 29449
> > PV UUID it2W5v-3hKi-DKCC-2eqw-C11U-GWoY-U7pO4v
> >
> > --- Physical volume ---
> > PV Name /dev/hdg1
> > VG Name donnees
> > PV Size 189,91 GB / not usable 0
> > Allocatable yes (but full)
> > PE Size (KByte) 4096
> > Total PE 48618
> > Free PE 0
> > Allocated PE 48618
> > PV UUID 6g9FOv-qeVO-00bW-B8TV-kL3t-D2XD-M09u0H
> >
> >
> > [root@ici]/home/ejah # vgdisplay
> > --- Volume group ---
> > VG Name donnees
> > System ID
> > Format lvm2
> > Metadata Areas 2
> > Metadata Sequence No 2
> > VG Access read/write
> > VG Status resizable
> > MAX LV 0
> > Cur LV 1
> > Open LV 0
> > Max PV 0
> > Cur PV 2
> > Act PV 2
> > VG Size 304,95 GB
> > PE Size 4,00 MB
> > Total PE 78067
> > Alloc PE / Size 78067 / 304,95 GB
> > Free PE / Size 0 / 0
> > VG UUID CgCalc-mWD8-NwYs-Y79z-1A4V-MpY6-YkXQB0
> >
> > [root@ici]/home/ejah # lvdisplay
> > --- Logical volume ---
> > LV Name /dev/donnees/donnees
> > VG Name donnees
> > LV UUID mCFZue-m7Bf-LBju-BCjU-Xo7G-7GE7-dT2QeQ
> > LV Write Access read/write
> > LV Status available
> > # open 0
> > LV Size 304,95 GB
> > Current LE 78067
> > Segments 2
> > Allocation inherit
> > Read ahead sectors 0
> > Block device 254:0
> >
>=20
> Other informations:
> OS: Ubuntu Hoary
> lvm version: 2.00.32
>=20
> I have restored my old configuration with vgcfgrestore, but the is no
> magy in this world; my ext3 partitions didn't come back :/
>=20
> Aye ideas ? thx
>=20
> --
> Guillaume aKa e-Jah
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>=20



--=20
Zaheer Abbas Sheriff
Linuxian

------=_Part_22239_15049058.1125735825008
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dear Guys..<br>
I m also having a prob with LVM..<br>
i configured LVM at SuSe 9.3 worked perfectly fine.. <br>
unfortunately my linux got some prob..<br>
i restored it using 1st cd of suse 9.3 ... linux got recovered.. perfectly.=
<br>
but LVM lost..<br>
1st i tried to recreate the VG with same name and same PV<br>
but it didnt showed my data.<br>
after then i tried restored that .. but still my data is vanished..<br>
<br>
Is there any way to get back / recover my data..?????<br>
<br>
<br><br><div><span class=3D"gmail_quote">On 9/3/05, <b class=3D"gmail_sende=
rname">e-Jah</b> &lt;<a href=3D"mailto:e-Jah@ejahworld.net">e-Jah@ejahworld=
.net</a>&gt; wrote:</span><blockquote class=3D"gmail_quote" style=3D"border=
-left: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-lef=
t: 1ex;">
Le samedi 03 septembre 2005 =E0 01:54 +0200, e-Jah a =E9crit :<br>&gt; Hi a=
ll,<br>&gt;<br>&gt; I have a big problem with my LVM, let me explain you it=
:<br>&gt; I had a lv of a vg, this vg was composed of 2 pv and i had an<br>
&gt; ext3 partition on this lvm.<br>&gt; Today i reinstalled my system on a=
 new hard drive and i used the partman<br>&gt; tool of debian, it detected =
me the 2 disks as lvm, then i simply create<br>&gt; a vg with this 2 disque=
, and a lv with all the space. After i said: &quot;do
<br>&gt; nothing&quot; to put myself the entry to mount it in fstab.<br>&gt=
; Now i can't mount it, and fdisk don't detect any partition on this drive<=
br>&gt; Testdisk found nothing too.<br>&gt; I have the old informations abo=
ut the lvm, is it possible to come back
<br>&gt; in the old situation with them (or have you got a better solution =
) ?<br>&gt;<br>&gt; Thank you very much.<br>&gt;<br>&gt; (sorry for my engl=
ish ^^)<br>&gt;<br>&gt; My actual configuration (who doesn't work):<br>
&gt;<br>&gt; [root@ici]/home/ejah #pvdisplay<br>&gt;&nbsp;&nbsp; --- Physic=
al volume ---<br>&gt;&nbsp;&nbsp; PV Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/hde1<br>&gt;&nbsp;&=
nbsp; VG Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; donnees<br>&gt;&nbsp;&nbsp;
PV
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;
115,04 GB / not usable 0<br>&gt;&nbsp;&nbsp; Allocatable&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; yes (but full)<br>&gt;&nbsp;&nbsp=
; PE Size (KByte)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4096<br>&gt;&nbsp;&nb=
sp; Total PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;29449<br>&gt;&nbsp;&nbsp; Free PE&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0<br>&gt;&n=
bsp;&nbsp; Allocated PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;29449<br>
&gt;&nbsp;&nbsp;
PV
UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;
it2W5v-3hKi-DKCC-2eqw-C11U-GWoY-U7pO4v<br>&gt;<br>&gt;&nbsp;&nbsp; --- Phys=
ical volume ---<br>&gt;&nbsp;&nbsp; PV Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/hdg1<br>&gt;&nbsp=
;&nbsp; VG Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; donnees<br>&gt;&nbsp;&nbsp;
PV
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;
189,91 GB / not usable 0<br>&gt;&nbsp;&nbsp; Allocatable&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; yes (but full)<br>&gt;&nbsp;&nbsp=
; PE Size (KByte)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4096<br>&gt;&nbsp;&nb=
sp; Total PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;48618<br>&gt;&nbsp;&nbsp; Free PE&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0<br>&gt;&n=
bsp;&nbsp; Allocated PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;48618<br>
&gt;&nbsp;&nbsp;
PV
UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;
6g9FOv-qeVO-00bW-B8TV-kL3t-D2XD-M09u0H<br>&gt;<br>&gt;<br>&gt; [root@ici]/h=
ome/ejah # vgdisplay<br>&gt;&nbsp;&nbsp; --- Volume group ---<br>&gt;&nbsp;=
&nbsp; VG Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; donnees<br>&gt;&nbsp;&nbsp; System ID<br>&gt;&nbsp;=
&nbsp; Format&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;lvm2
<br>&gt;&nbsp;&nbsp; Metadata Areas&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;2<br>&gt;&nbsp;&nbsp; Metadata Sequence No&nbsp;&nbsp;2<br>&gt;&nbs=
p;&nbsp; VG Access&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; read/write<br>&gt;&nbsp;&nbsp; VG Status&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; resizable<br>&gt;&nbs=
p;&nbsp; MAX LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;0<br>&gt;&nbsp;&nbsp; Cur LV&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;1
<br>&gt;&nbsp;&nbsp; Open LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0<br>&gt;&nbsp;&nbsp; Max PV&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;0<br>&gt;&nbsp;&nbsp; Cur PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2<br>&gt;&nbsp=
;&nbsp; Act PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2<br>&gt;&nbsp;&nbsp; VG Size&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3=
04,95 GB<br>&gt;&nbsp;&nbsp; PE Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4,00 MB<br>
&gt;&nbsp;&nbsp; Total PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;78067<br>&gt;&nbsp;&nbsp; Alloc PE / Size=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 78067 / 304,95 GB<br>&gt;&nbsp;&nbsp; =
Free&nbsp;&nbsp;PE / Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0 / 0<br>&gt;=
&nbsp;&nbsp;
VG
UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;
CgCalc-mWD8-NwYs-Y79z-1A4V-MpY6-YkXQB0<br>&gt;<br>&gt; [root@ici]/home/ejah=
 # lvdisplay<br>&gt;&nbsp;&nbsp; --- Logical volume ---<br>&gt;&nbsp;&nbsp;
LV
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;/dev/donnees/donnees<br>&gt;&nbsp;&nbsp; VG Name&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;donnees<br>&gt;&nbsp;&nbsp;
LV
UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;mCFZue-m7Bf-LBju-BCjU-Xo7G-7GE7-dT2QeQ<br>&gt;&nbs=
p;&nbsp; LV Write Access&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;rea=
d/write<br>&gt;&nbsp;&nbsp; LV Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;available<br>&gt;&nbsp;&nbsp;=
 # open&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; 0<br>&gt;&nbsp;&nbsp;
LV
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;304,95
GB<br>&gt;&nbsp;&nbsp; Current LE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 78067<br>&gt;&nbsp;&nbsp; Segments&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
2<br>&gt;&nbsp;&nbsp; Allocation&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; inherit<br>&gt;&nbsp;&nbsp; Read ahead sector=
s&nbsp;&nbsp;&nbsp;&nbsp; 0<br>&gt;&nbsp;&nbsp; Block device&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 254:0<br>&gt;<br><br>Other in=
formations:
<br>OS: Ubuntu Hoary<br>lvm version: 2.00.32<br><br>I have restored my old =
configuration with vgcfgrestore, but the is no<br>magy in this world; my ex=
t3 partitions didn't come back :/<br><br>Aye ideas ? thx<br><br>--<br>Guill=
aume aKa e-Jah
<br><br>_______________________________________________<br>linux-lvm mailin=
g list<br><a href=3D"mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><=
br><a href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm">https://ww=
w.redhat.com/mailman/listinfo/linux-lvm
</a><br>read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/"=
>http://tldp.org/HOWTO/LVM-HOWTO/</a><br></blockquote></div><br><br clear=
=3D"all"><br>-- <br>Zaheer Abbas Sheriff<br>Linuxian

------=_Part_22239_15049058.1125735825008--
