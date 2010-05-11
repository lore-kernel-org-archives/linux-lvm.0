Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.7])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o4B6cxva020448
	for <linux-lvm@redhat.com>; Tue, 11 May 2010 02:38:59 -0400
Received: from web7908.mail.in.yahoo.com (web7908.mail.in.yahoo.com
	[202.86.4.84])
	by mx1.redhat.com (8.13.8/8.13.8) with SMTP id o4B6cnx8001349
	for <linux-lvm@redhat.com>; Tue, 11 May 2010 02:38:50 -0400
Message-ID: <703717.53679.qm@web7908.mail.in.yahoo.com>
Date: Tue, 11 May 2010 12:08:48 +0530 (IST)
From: andiket a <truly_linux@yahoo.co.in>
In-Reply-To: <1a46793.2153.1288523e143.Coremail.chaimvy@163.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="0-260942557-1273559928=:53679"
Subject: Re: [linux-lvm] LVM multiple Snpshots implementation query
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

--0-260942557-1273559928=:53679
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Thanks a lot.
I wasnt of the patch.

Yes, I am looking for a similar thing.
Right now after snapshot the cow is done for all the snapshots if there is =
a write on origin.

This is an obvious thing. Wondering it was missed in original lvm/dm snapsh=
ot code.

Any idea?


--- On Tue, 11/5/10, Busby.Cheung <chaimvy@163.com> wrote:

From: Busby.Cheung <chaimvy@163.com>
Subject: Re: [linux-lvm] LVM multiple Snpshots implementation query
To: "LVM general discussion and development" <linux-lvm@redhat.com>
Date: Tuesday, 11 May, 2010, 7:44 AM

Did you mean you want to use something like shared-snapshot? COW once?=0AI =
know shared-snapshot implemented by Mikulas and others:=0Ahttp://people.red=
hat.com/mpatocka/patches/kernel/new-snapshots/r19/=0A=C2=A0=0A

=C2=A0
=E5=9C=A82010-05-10=EF=BC=8C"andiket a" <truly_linux@yahoo.co.in> =E5=86=99=
=E9=81=93=EF=BC=9A =0A-----=E5=8E=9F=E5=A7=8B=E9=82=AE=E4=BB=B6-----
=E5=8F=91=E4=BB=B6=E4=BA=BA:"andiket a" <truly_linux@yahoo.co.in>
=E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4:2010=E5=B9=B45=E6=9C=8810=E6=97=A5 =E6=
=98=9F=E6=9C=9F=E4=B8=80
=E6=94=B6=E4=BB=B6=E4=BA=BA:linux-lvm@redhat.com
=E4=B8=BB=E9=A2=98:[linux-lvm] LVM multiple Snpshots implementation query

=0A=0A=0A=0AHi,

If there are multiple snapshots then write to origin is an expensive operat=
ion.
My understanding after looking at the code of orig_wirte() is that if a wri=
te comes on a chunk on orig device then cow is initiated for all the snapsh=
ots.
This is an expensive operation for sure.

Does anyone know if there was any reason behind implementing it like this?

Thanks,
Andiket.



=0A=E7=BD=91=E6=98=93=E4=B8=BA=E4=B8=AD=E5=B0=8F=E4=BC=81=E4=B8=9A=E5=85=8D=
=E8=B4=B9=E6=8F=90=E4=BE=9B=E4=BC=81=E4=B8=9A=E9=82=AE=E7=AE=B1=EF=BC=88=E8=
=87=AA=E4=B8=BB=E5=9F=9F=E5=90=8D=EF=BC=89=0A
-----Inline Attachment Follows-----

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/=0A=0A
--0-260942557-1273559928=:53679
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<table cellspacing=3D"0" cellpadding=3D"0" border=3D"0" ><tr><td valign=3D"=
top" style=3D"font: inherit;">Thanks a lot.<br>I wasnt of the patch.<br><br=
>Yes, I am looking for a similar thing.<br>Right now after snapshot the cow=
 is done for all the snapshots if there is a write on origin.<br><br>This i=
s an obvious thing. Wondering it was missed in original lvm/dm snapshot cod=
e.<br><br>Any idea?<br><br><br>--- On <b>Tue, 11/5/10, Busby.Cheung <i>&lt;=
chaimvy@163.com&gt;</i></b> wrote:<br><blockquote style=3D"border-left: 2px=
 solid rgb(16, 16, 255); margin-left: 5px; padding-left: 5px;"><br>From: Bu=
sby.Cheung &lt;chaimvy@163.com&gt;<br>Subject: Re: [linux-lvm] LVM multiple=
 Snpshots implementation query<br>To: "LVM general discussion and developme=
nt" &lt;linux-lvm@redhat.com&gt;<br>Date: Tuesday, 11 May, 2010, 7:44 AM<br=
><br><div id=3D"yiv1768918167"><div>Did you mean you want to use something =
like shared-snapshot? COW once?</div>=0A<div>I know shared-snapshot impleme=
nted by Mikulas and others:</div>=0A<div><a rel=3D"nofollow" target=3D"_bla=
nk" href=3D"http://people.redhat.com/mpatocka/patches/kernel/new-snapshots/=
r19/">http://people.redhat.com/mpatocka/patches/kernel/new-snapshots/r19/</=
a></div>=0A<div>&nbsp;</div>=0A<div><br><br>&nbsp;</div><span></span><br>=
=E5=9C=A82010-05-10=EF=BC=8C"andiket a" &lt;truly_linux@yahoo.co.in&gt; =E5=
=86=99=E9=81=93=EF=BC=9A =0A<blockquote style=3D"border-left: 1px solid rgb=
(204, 204, 204); margin: 0px 0px 0px 0.8ex; padding-left: 1ex;" id=3D"isRep=
lyContent">-----=E5=8E=9F=E5=A7=8B=E9=82=AE=E4=BB=B6-----<br><b>=E5=8F=91=
=E4=BB=B6=E4=BA=BA:</b>"andiket a" &lt;truly_linux@yahoo.co.in&gt;<br><b>=
=E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4:</b>2010=E5=B9=B45=E6=9C=8810=E6=97=A5=
 =E6=98=9F=E6=9C=9F=E4=B8=80<br><b>=E6=94=B6=E4=BB=B6=E4=BA=BA:</b>linux-lv=
m@redhat.com<br><b>=E4=B8=BB=E9=A2=98:</b>[linux-lvm] LVM multiple Snpshots=
 implementation query<br><br>=0A<table border=3D"0" cellpadding=3D"0" cells=
pacing=3D"0">=0A<tbody>=0A<tr>=0A<td valign=3D"top">Hi,<br><br>If there are=
 multiple snapshots then write to origin is an expensive operation.<br>My u=
nderstanding after looking at the code of orig_wirte() is that if a write c=
omes on a chunk on orig device then cow is initiated for all the snapshots.=
<br>This is an expensive operation for sure.<br><br>Does anyone know if the=
re was any reason behind implementing it like this?<br><br>Thanks,<br>Andik=
et.<br></td></tr></tbody></table><br></blockquote><br><br><span title=3D"ne=
teasefooter"><hr>=0A<a rel=3D"nofollow" target=3D"_blank" href=3D"http://ym=
.163.com/?from=3Dod3">=E7=BD=91=E6=98=93=E4=B8=BA=E4=B8=AD=E5=B0=8F=E4=BC=
=81=E4=B8=9A=E5=85=8D=E8=B4=B9=E6=8F=90=E4=BE=9B=E4=BC=81=E4=B8=9A=E9=82=AE=
=E7=AE=B1=EF=BC=88=E8=87=AA=E4=B8=BB=E5=9F=9F=E5=90=8D=EF=BC=89</a>=0A</spa=
n></div><br>-----Inline Attachment Follows-----<br><br><div class=3D"plainM=
ail">_______________________________________________<br>linux-lvm mailing l=
ist<br><a ymailto=3D"mailto:linux-lvm@redhat.com" href=3D"/mc/compose?to=3D=
linux-lvm@redhat.com">linux-lvm@redhat.com</a><br><a href=3D"https://www.re=
dhat.com/mailman/listinfo/linux-lvm" target=3D"_blank">https://www.redhat.c=
om/mailman/listinfo/linux-lvm</a><br>read the LVM HOW-TO at <a href=3D"http=
://tldp.org/HOWTO/LVM-HOWTO/" target=3D"_blank">http://tldp.org/HOWTO/LVM-H=
OWTO/</a></div></blockquote></td></tr></table><br>
--0-260942557-1273559928=:53679--
