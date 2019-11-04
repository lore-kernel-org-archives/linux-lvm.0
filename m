Content-Type: multipart/alternative;
	boundary=Apple-Mail-8E3B7A3B-A0AE-4BE2-8999-7368CD6F5ECE
Content-Transfer-Encoding: 7bit
From: =?utf-8?Q?Tomas_Dalebj=C3=B6rk?= <tomas.dalebjork@gmail.com>
Mime-Version: 1.0 (1.0)
Date: Mon, 4 Nov 2019 06:54:29 +0100
Message-Id: <5BDF90CF-72E7-44A0-8C78-7854B2B8996A@gmail.com>
References: <CACrcyfJE2rEGTVOGTXGTf08w1Z-js8xTRshibCm+PuZNxp3OUA@mail.gmail.com>
In-Reply-To: <CACrcyfJE2rEGTVOGTXGTf08w1Z-js8xTRshibCm+PuZNxp3OUA@mail.gmail.com>
Subject: Re: [linux-lvm] exposing snapshot block device
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
To: Zdenek Kabelac <zkabelac@redhat.com>
Cc: Gionatan Danti <g.danti@assyoma.it>, LVM general discussion and development <linux-lvm@redhat.com>


--Apple-Mail-8E3B7A3B-A0AE-4BE2-8999-7368CD6F5ECE
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi

I have some additional questions related to this.
regarding this statement:
=E2=80=9C While the merge is in progress, reads or writes to the origin appe=
ar as they were directed to the snapshot being merged. =E2=80=9D

What exactly does that mean?

Will that mean that before changes are being placed on the origin device, it=
 has to first:
read the data from the snapshot back to origin, copy the data back from orig=
in to the snapshot, and than after that allow changes to happen?
if that is the case, does it keep track of that this block should not be cop=
ied again?

and will the ongoing merge priorities this block before the other background=
 copying?

how about read operations ?
will the requested read operations on the origin volume be prioritized befor=
e the copying of snapshot data?

I didn=E2=80=99t find much information about this, hence why I ask here

assuming that someone has executed: lvconvert - - merge -b snapshot

thanks for the feedback=20

Skickat fr=C3=A5n min iPhone

> 25 okt. 2019 kl. 18:31 skrev Tomas Dalebj=C3=B6rk <tomas.dalebjork@gmail.c=
om>:
>=20
> =EF=BB=BF
> Wow!
>=20
> Impressing.
> This will make history!
>=20
> If this is possible, than we are able to implement a solution, which can d=
o:
> - progressive block level incremental forever (always incremental on block=
 level : this already exist)
> - instant recovery to point in time (using the mentioned methods you just d=
escribed)
>=20
> For example, lets say that a client wants to restore a file system, or a l=
ogical volume to how it looked a like yesterday.
> Eventhough there are no snapshot, nor any data.
> Than the client (with some coding); can start from an empty volume, and re=
-attach a cow device, and convert that using lvconvert --merge, so that the c=
opying can be done in background using the backup server.
>=20
> If you forget about "how we will re-create the cow device"; and just focus=
ing on the LVM ideas of re-attaching a cow device.
> Do you think that I have understood it correctly?
>=20
>=20
> Den tors 24 okt. 2019 kl 18:01 skrev Zdenek Kabelac <zkabelac@redhat.com>:=

>> Dne 23. 10. 19 v 13:24 Tomas Dalebj=C3=B6rk napsal(a):
>> > I have tested FusionIO together with old thick snapshots.
>> > I created the thick snapshot on a separate old traditional SATA drive, j=
ust to=20
>> > check if that could be used as a snapshot target for high performance d=
isks;=20
>> > like a Fusion IO card.
>> > For those who doesn't know about FusionIO; they can deal with 150-250,0=
00 IOPS.
>> >=20
>> > And to be honest, I couldn't bottle neck the SATA disk I used as a thic=
k
>> > snapshot target.
>> > The reason for why is simple:
>> > - thick snapshots uses sequential write techniques
>> >=20
>> > If I would have been using thin snapshots, than the writes would most l=
ikely=20
>> > be more randomized on disk, which would have required more spindles to c=
oop=20
>> > with this.
>> >=20
>> > Anyhow;
>> > I am still eager to hear how to use an external device to import snapsh=
ots.
>> > And when I say "import"; I am not talking about copyback, more to use t=
o read=20
>> > data from.
>>=20
>> Format of 'on-disk' snapshot metadata for old snapshot is trivial - being=
 some
>> header + pairs of dataoffset-TO-FROM -  I think googling will reveal coup=
le
>> python tools playing with it.
>>=20
>> You can add pre-created COW image to LV  with  lvconvert --snapshot
>> and to avoid 'zeroing' metadata use option -Zn
>> (BTW in the same way you can detach snapshot from LV with --splitsnapshot=
 so=20
>> you can look how the metadata looks like...)
>>=20
>> Although it's pretty unusual why would anyone create first the COW image w=
ith=20
>> all the special layout and then merge it to LV - instead of directly=20
>> merging...   There is only the 'little' advantage of minimizing 'offline'=
 time=20
>> of such device   (and it's the reason why --split exists).
>>=20
>> Regards
>>=20
>> Zdenek
>>=20
>>=20

--Apple-Mail-8E3B7A3B-A0AE-4BE2-8999-7368CD6F5ECE
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto">Hi<div><br></div><div>I have some additiona=
l questions related to this.</div><div>regarding this statement:</div><div>=E2=
=80=9C<span style=3D"font-size: 16px; -webkit-text-size-adjust: auto; caret-=
color: rgb(68, 68, 68); color: rgb(68, 68, 68); font-family: verdana, helvet=
ica, arial, sans-serif; background-color: rgb(255, 255, 255);">&nbsp;While t=
he merge is in progress, reads or writes to the origin appear as they were d=
irected to the snapshot being merged. =E2=80=9D</span></div><div><font color=
=3D"#444444" face=3D"verdana, helvetica, arial, sans-serif" size=3D"3"><span=
 style=3D"caret-color: rgb(68, 68, 68); -webkit-text-size-adjust: auto; back=
ground-color: rgb(255, 255, 255);"><br></span></font>What exactly does that m=
ean?</div><div><br></div><div>Will that mean that before changes are being p=
laced on the origin device, it has to first:</div><div>read the data from th=
e snapshot back to origin, copy the data back from origin to the snapshot, a=
nd than after that allow changes to happen?</div><div>if that is the case, d=
oes it keep track of that this block should not be copied again?</div><div><=
br></div><div>and will the ongoing merge priorities this block before the ot=
her background copying?</div><div><br></div><div>how about read operations ?=
</div><div>will the requested read operations on the origin volume be priori=
tized before the copying of snapshot data?</div><div><br></div><div>I didn=E2=
=80=99t find much information about this, hence why I ask here</div><div><br=
></div><div>assuming that someone has executed: lvconvert - - merge -b snaps=
hot</div><div><br></div><div>thanks for the feedback&nbsp;</div><div><br></d=
iv><div><div dir=3D"ltr">Skickat fr=C3=A5n min iPhone</div><div dir=3D"ltr">=
<br><blockquote type=3D"cite">25 okt. 2019 kl. 18:31 skrev Tomas Dalebj=C3=B6=
rk &lt;tomas.dalebjork@gmail.com&gt;:<br><br></blockquote></div><blockquote t=
ype=3D"cite"><div dir=3D"ltr">=EF=BB=BF<div dir=3D"ltr"><div>Wow!</div><div>=
<br></div><div>Impressing.</div><div>This will make history!</div><div><br><=
/div><div>If this is possible, than we are able to implement a solution, whi=
ch can do:</div><div>- progressive block level incremental forever (always i=
ncremental on block level : this already exist)</div><div>- instant recovery=
 to point in time (using the mentioned methods you just described)</div><div=
><br></div><div>For example, lets say that a client wants to restore a file s=
ystem, or a logical volume to how it looked a like yesterday.</div><div>Even=
though there are no snapshot, nor any data.</div><div>Than the client (with s=
ome coding); can start from an empty volume, and re-attach a cow device, and=
 convert that using lvconvert --merge, so that the copying can be done in ba=
ckground using the backup server.</div><div><br></div><div>If you forget abo=
ut "how we will re-create the cow device"; and just focusing on the LVM idea=
s of re-attaching a cow device.</div><div>Do you think that I have understoo=
d it correctly?</div><div><br></div></div><br><div class=3D"gmail_quote"><di=
v dir=3D"ltr" class=3D"gmail_attr">Den tors 24 okt. 2019 kl 18:01 skrev Zden=
ek Kabelac &lt;<a href=3D"mailto:zkabelac@redhat.com">zkabelac@redhat.com</a=
>&gt;:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Dne 23. 10.=
 19 v 13:24 Tomas Dalebj=C3=B6rk napsal(a):<br>
&gt; I have tested FusionIO together with old thick snapshots.<br>
&gt; I created the thick snapshot on a separate old traditional SATA drive, j=
ust to <br>
&gt; check if that could be used as a snapshot target for high performance d=
isks; <br>
&gt; like a Fusion IO card.<br>
&gt; For those who doesn't know about FusionIO; they can deal with 150-250,0=
00 IOPS.<br>
&gt; <br>
&gt; And to be honest, I couldn't bottle neck the SATA disk I used as a thic=
k <br>
&gt; snapshot target.<br>
&gt; The reason for why is simple:<br>
&gt; - thick snapshots uses sequential write techniques<br>
&gt; <br>
&gt; If I would have been using thin snapshots, than the writes would most l=
ikely <br>
&gt; be more randomized on disk, which would have required more spindles to c=
oop <br>
&gt; with this.<br>
&gt; <br>
&gt; Anyhow;<br>
&gt; I am still eager to hear how to use an external device to import snapsh=
ots.<br>
&gt; And when I say "import"; I am not talking about copyback, more to use t=
o read <br>
&gt; data from.<br>
<br>
Format of 'on-disk' snapshot metadata for old snapshot is trivial - being so=
me<br>
header + pairs of dataoffset-TO-FROM -&nbsp; I think googling will reveal co=
uple<br>
python tools playing with it.<br>
<br>
You can add pre-created COW image to LV&nbsp; with&nbsp; lvconvert --snapsho=
t<br>
and to avoid 'zeroing' metadata use option -Zn<br>
(BTW in the same way you can detach snapshot from LV with --splitsnapshot so=
 <br>
you can look how the metadata looks like...)<br>
<br>
Although it's pretty unusual why would anyone create first the COW image wit=
h <br>
all the special layout and then merge it to LV - instead of directly <br>
merging...&nbsp; &nbsp;There is only the 'little' advantage of minimizing 'o=
ffline' time <br>
of such device&nbsp; &nbsp;(and it's the reason why --split exists).<br>
<br>
Regards<br>
<br>
Zdenek<br>
<br>
<br>
</blockquote></div>
</div></blockquote></div></body></html>=

--Apple-Mail-8E3B7A3B-A0AE-4BE2-8999-7368CD6F5ECE--
