MIME-Version: 1.0
From: su liu <liusu8788@gmail.com>
Date: Fri, 26 Aug 2016 14:28:03 +0800
Message-ID: <CAN2gjWTwXofKjUGO0RStX3=CQJLa5kR5CG945pE9=gEtucdQQA@mail.gmail.com>
Content-Type: multipart/alternative; boundary=94eb2c09c1eae437ba053af39d8d
Subject: Re: [linux-lvm] lvm2 cluster aware
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
To: David Teigland <teigland@redhat.com>
Cc: linux-lvm <linux-lvm@redhat.com>

--94eb2c09c1eae437ba053af39d8d
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

hi David Teigland. Thanks your explanation.

My use case is:

I have 3 nodes and they all have access to a SAN storage. One node acts as
admin node which manage lvs(such as creating or deleting lvs)=E3=80=82The o=
ther two
nodes act as compute node which run VMs. Then I want to attach the lv to
the VMs =EF=BC=88not  multiattach=EF=BC=89=E3=80=82As I know ,the metadata =
is stored in PVs=EF=BC=8Cthen I
create  a lv on admin node, It can be seen on compute node without lvmetad
adn clvmd daemon running. My questions is:

1 In this docment: http://www.tldp.org/HOWTO/LVM-HOWTO/sharinglvm1.html  It
says that

"The key thing to remember when sharing volumes is that all the LVM
administration must be done on one node only and that all other nodes must
have LVM shut down before changing anything on the admin node. Then, when
the changes have been made, it is necessary to run vgscan on the other
nodes before reloading the volume groups." .

I have not shot down lvm on compute node ,and I have not run vgscan on
compute node after I create lv on admin node, But I can see the lv  after I
create it on admin node. Should I take the operation shutdown and run vgsan=
?

2 If I do not use clvmd or lvmlockd, Shoud I run additional operation to
activate the lvs on compute node before attaching it to VM. and Shoud I do
another after I run the delete lv operation on admin node? As I have tried
yesterday, After I run lvremove lv on admin node, It is still has file in
directory /dev/myvg/ on compute node.

Can you explain them to me? Thanks very much.



2016-08-25 23:59 GMT+08:00 David Teigland <teigland@redhat.com>:

> On Thu, Aug 25, 2016 at 09:50:24AM +0800, su liu wrote:
> > I have a question about lvm2 cluster, The scene is that I try to imitat=
e
> > FCSAN by mapping a rbd volume to two compute node, Then I using the rbd
> > volume to  create a PV and VG.I stoped the lvmetad daemon on the comput=
e
> > nodes. Then I find that when I operating the VG on one compute node, th=
e
> > changes can also be aware on another compute nodes.
> >
> > But this docment(http://www.tldp.org/HOWTO/LVM-HOWTO/sharinglvm1.html=
=EF=BC=89
> says
> > that "*LVM is not cluster aware".*
> >
> > My question is that can I use the method to achieve the case that I
> create
> > or delete lv on one node whlie other compute node can using the lvs?
> >
> > Can anybody explain this?
>
> It's not safe to use lvm on shared storage without some extra mechanism t=
o
> protect the data or coordinate access among hosts.  There are multiple
> ways, depending on what sort of sharing/coordination you want to use:
>
> - use system ID to protect VGs from other hosts,
>   http://man7.org/linux/man-pages/man7/lvmsystemid.7.html
>
> - use lvmlockd to coordinate sharing with sanlock or dlm (this is new),
>   http://man7.org/linux/man-pages/man8/lvmlockd.8.html
>
> - use clvm to coordinate sharing with dlm (this is old)
>   http://man7.org/linux/man-pages/man8/clvmd.8.html
>
>

--94eb2c09c1eae437ba053af39d8d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><br></div><div class=3D"gmail_q=
uote"><br><div dir=3D"ltr">hi David Teigland. Thanks your=C2=A0explanation.=
<div><br></div><div>My use case is:</div><div><br></div><div>I have 3 nodes=
 and they all have access to a SAN storage. One node acts as admin node whi=
ch manage lvs(such as creating or deleting lvs)=E3=80=82The other two nodes=
 act as compute node which run VMs. Then I want to attach the lv to the VMs=
 =EF=BC=88not =C2=A0multiattach=EF=BC=89=E3=80=82As I know ,the metadata is=
 stored in PVs=EF=BC=8Cthen I create =C2=A0a lv on admin node, It can be se=
en on compute node without lvmetad adn clvmd daemon running. My questions i=
s:</div><div><br></div><div>1 In this docment:=C2=A0<a href=3D"http://www.t=
ldp.org/HOWTO/LVM-HOWTO/sharinglvm1.html" target=3D"_blank">http://www.tldp=
.org/<wbr>HOWTO/LVM-HOWTO/sharinglvm1.<wbr>html</a> =C2=A0It says that=C2=
=A0</div><div><font size=3D"1"><font face=3D"simsun, serif"><br></font></fo=
nt></div><div><font size=3D"1"><font face=3D"simsun, serif">&quot;</font><s=
pan style=3D"color:rgb(0,0,0)"><font face=3D"simsun, serif">The key thing t=
o remember when sharing volumes is that all the LVM administration must be =
done on one node only and that all other nodes must have LVM shut down befo=
re changing anything on the admin node. Then, when the changes have been ma=
de, it is necessary to run vgscan on the other nodes before reloading the v=
olume groups.&quot; .</font></span></font></div><div><font size=3D"1"><span=
 style=3D"color:rgb(0,0,0)"><font face=3D"arial, helvetica, sans-serif"><br=
></font></span></font></div><div><font size=3D"1"><span style=3D"color:rgb(=
0,0,0)"><font face=3D"arial, helvetica, sans-serif"> I have not shot down l=
vm on compute node ,and I have not run vgscan on compute node after I creat=
e lv on admin node, But I can see the lv =C2=A0after I create it on admin n=
ode. Should I take the operation shutdown and run vgsan?</font></span></fon=
t></div><div><font face=3D"simsun, serif" size=3D"1"><span style=3D"color:r=
gb(0,0,0)"><br></span></font></div><div><font color=3D"#000000" size=3D"1" =
face=3D"arial, helvetica, sans-serif">2 If I do not use clvmd or lvmlockd, =
Shoud I run additional operation to activate the lvs on compute node before=
 attaching it to VM. and Shoud I do another after I run the delete lv opera=
tion on admin node? As I have tried yesterday, After I run lvremove lv on a=
dmin node, It is still has file in directory /dev/myvg/ on compute node.</f=
ont></div><div><font color=3D"#000000" size=3D"1" face=3D"arial, helvetica,=
 sans-serif"><br></font></div><div><font color=3D"#000000" size=3D"1" face=
=3D"arial, helvetica, sans-serif">Can you explain them to me? Thanks very m=
uch.</font></div><div><div class=3D"h5"><div><font color=3D"#000000" face=
=3D"simsun, serif" size=3D"1"><br></font></div><div><font color=3D"#000000"=
 face=3D"simsun, serif" size=3D"1"><br></font></div><div><div class=3D"gmai=
l_extra"><br><div class=3D"gmail_quote">2016-08-25 23:59 GMT+08:00 David Te=
igland <span dir=3D"ltr">&lt;<a href=3D"mailto:teigland@redhat.com" target=
=3D"_blank">teigland@redhat.com</a>&gt;</span>:<br><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex"><span>On Thu, Aug 25, 2016 at 09:50:24AM +0800, s=
u liu wrote:<br>
&gt; I have a question about lvm2 cluster, The scene is that I try to imita=
te<br>
&gt; FCSAN by mapping a rbd volume to two compute node, Then I using the rb=
d<br>
&gt; volume to=C2=A0 create a PV and VG.I stoped the lvmetad daemon on the =
compute<br>
&gt; nodes. Then I find that when I operating the VG on one compute node, t=
he<br>
&gt; changes can also be aware on another compute nodes.<br>
&gt;<br>
&gt; But this docment(<a href=3D"http://www.tldp.org/HOWTO/LVM-HOWTO/sharin=
glvm1.html" rel=3D"noreferrer" target=3D"_blank">http://www.tldp.org/HO<wbr=
>WTO/LVM-HOWTO/sharinglvm1.html</a><wbr>=EF=BC=89 says<br>
</span><span>&gt; that &quot;*LVM is not cluster aware&quot;.*<br>
&gt;<br>
</span><span>&gt; My question is that can I use the method to achieve the c=
ase that I create<br>
&gt; or delete lv on one node whlie other compute node can using the lvs?<b=
r>
&gt;<br>
&gt; Can anybody explain this?<br>
<br>
</span>It&#39;s not safe to use lvm on shared storage without some extra me=
chanism to<br>
protect the data or coordinate access among hosts.=C2=A0 There are multiple=
<br>
ways, depending on what sort of sharing/coordination you want to use:<br>
<br>
- use system ID to protect VGs from other hosts,<br>
=C2=A0 <a href=3D"http://man7.org/linux/man-pages/man7/lvmsystemid.7.html" =
rel=3D"noreferrer" target=3D"_blank">http://man7.org/linux/man-page<wbr>s/m=
an7/lvmsystemid.7.html</a><br>
<br>
- use lvmlockd to coordinate sharing with sanlock or dlm (this is new),<br>
=C2=A0 <a href=3D"http://man7.org/linux/man-pages/man8/lvmlockd.8.html" rel=
=3D"noreferrer" target=3D"_blank">http://man7.org/linux/man-page<wbr>s/man8=
/lvmlockd.8.html</a><br>
<br>
- use clvm to coordinate sharing with dlm (this is old)<br>
=C2=A0 <a href=3D"http://man7.org/linux/man-pages/man8/clvmd.8.html" rel=3D=
"noreferrer" target=3D"_blank">http://man7.org/linux/man-page<wbr>s/man8/cl=
vmd.8.html</a><br>
<br>
</blockquote></div><br></div></div></div></div></div>
</div><br></div>

--94eb2c09c1eae437ba053af39d8d--
