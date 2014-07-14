Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s6EKAHqj010147
	for <linux-lvm@redhat.com>; Mon, 14 Jul 2014 16:10:17 -0400
Received: from mail-ie0-f182.google.com (mail-ie0-f182.google.com
	[209.85.223.182])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s6EKA9QB028610
	(version=TLSv1/SSLv3 cipher=RC4-SHA bits=128 verify=FAIL)
	for <linux-lvm@redhat.com>; Mon, 14 Jul 2014 16:10:10 -0400
Received: by mail-ie0-f182.google.com with SMTP id y20so3746514ier.27
	for <linux-lvm@redhat.com>; Mon, 14 Jul 2014 13:10:09 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <53C4327E.1020501@genome.wustl.edu>
References: <53C4327E.1020501@genome.wustl.edu>
Date: Mon, 14 Jul 2014 15:10:09 -0500
Message-ID: <CAL8j3POiVM6_DtUAZr4UWxN5YFMUqKmD46Tdft=GBawMspE9rQ@mail.gmail.com>
From: Matthew Kurowski <allfather@gmail.com>
Content-Type: multipart/alternative; boundary=bcaec517c920bd6e4004fe2ce089
Subject: Re: [linux-lvm] pvmove taking for ever to complete
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

--bcaec517c920bd6e4004fe2ce089
Content-Type: text/plain; charset=UTF-8

Can you provide any environmental details? What you describe could be slow
or fast...

Have you checked that the storage NICs/adapters and their assoc ports are
"behaving well" (e.g. speed/duplex, NetQueues, storm controls etc.)?

 On Jul 14, 2014 2:47 PM, "Matt Weil" <mweil@genome.wustl.edu> wrote:

> Hello all,
>
> doing a pvmove from old to new storage and it is taking for ever.
>
> command
>
> pvmove /dev/mpath/gxfer4_1 /dev/mapper/compel1_gxfer1
>
> progress after about two weeks
>   /dev/mpath/gxfer4_1: Moved: 42.1%
>
> version
>   LVM version:     2.02.74(2)-RHEL5 (2011-01-28)
>   Library version: 1.02.55-RHEL5 (2010-11-09)
>   Driver version:  4.11.5
>
> The devices are 10TB each but it should not be taking this long.
>
> Any assistance is appreciated.
>
> Thanks
>
> Matt
>
> ____
> This email message is a private communication. The information
> transmitted, including attachments, is intended only for the person or
> entity to which it is addressed and may contain confidential, privileged,
> and/or proprietary material. Any review, duplication, retransmission,
> distribution, or other use of, or taking of any action in reliance upon,
> this information by persons or entities other than the intended recipient
> is unauthorized by the sender and is prohibited. If you have received this
> message in error, please contact the sender immediately by return email and
> delete the original message from all computer systems. Thank you.
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

--bcaec517c920bd6e4004fe2ce089
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">Can you provide any environmental details? What you describe=
 could be slow or fast...</p>
<p dir=3D"ltr">Have you checked that the storage NICs/adapters and their as=
soc ports are &quot;behaving well&quot; (e.g. speed/duplex, NetQueues, stor=
m controls etc.)?<br><br></p>
<p dir=3D"ltr"> </p>
<div class=3D"gmail_quote">On Jul 14, 2014 2:47 PM, &quot;Matt Weil&quot; &=
lt;<a href=3D"mailto:mweil@genome.wustl.edu">mweil@genome.wustl.edu</a>&gt;=
 wrote:<br type=3D"attribution"><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
Hello all,<br>
<br>
doing a pvmove from old to new storage and it is taking for ever.<br>
<br>
command<br>
<br>
pvmove /dev/mpath/gxfer4_1 /dev/mapper/compel1_gxfer1<br>
<br>
progress after about two weeks<br>
=C2=A0 /dev/mpath/gxfer4_1: Moved: 42.1%<br>
<br>
version<br>
=C2=A0 LVM version: =C2=A0 =C2=A0 2.02.74(2)-RHEL5 (2011-01-28)<br>
=C2=A0 Library version: 1.02.55-RHEL5 (2010-11-09)<br>
=C2=A0 Driver version: =C2=A04.11.5<br>
<br>
The devices are 10TB each but it should not be taking this long.<br>
<br>
Any assistance is appreciated.<br>
<br>
Thanks<br>
<br>
Matt<br>
<br>
____<br>
This email message is a private communication. The information transmitted,=
 including attachments, is intended only for the person or entity to which =
it is addressed and may contain confidential, privileged, and/or proprietar=
y material. Any review, duplication, retransmission, distribution, or other=
 use of, or taking of any action in reliance upon, this information by pers=
ons or entities other than the intended recipient is unauthorized by the se=
nder and is prohibited. If you have received this message in error, please =
contact the sender immediately by return email and delete the original mess=
age from all computer systems. Thank you.<br>

<br>
______________________________<u></u>_________________<br>
linux-lvm mailing list<br>
<a href=3D"mailto:linux-lvm@redhat.com" target=3D"_blank">linux-lvm@redhat.=
com</a><br>
<a href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm" target=3D"_bl=
ank">https://www.redhat.com/<u></u>mailman/listinfo/linux-lvm</a><br>
read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" target=
=3D"_blank">http://tldp.org/HOWTO/LVM-<u></u>HOWTO/</a><br>
</blockquote></div>

--bcaec517c920bd6e4004fe2ce089--
