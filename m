Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.12])
	by int-mx03.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n8IELgZZ013598
	for <linux-lvm@redhat.com>; Fri, 18 Sep 2009 10:21:42 -0400
Received: from mail-ew0-f211.google.com (mail-ew0-f211.google.com
	[209.85.219.211])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n8IELXqX029495
	for <linux-lvm@redhat.com>; Fri, 18 Sep 2009 10:21:33 -0400
Received: by ewy7 with SMTP id 7so1314617ewy.7
	for <linux-lvm@redhat.com>; Fri, 18 Sep 2009 07:21:32 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <29ae894c0909180608l7bd4c6c9mb8a0272adf3edaf4@mail.gmail.com>
References: <29ae894c0909180607t2cffb41bjec5a8406b601f0fb@mail.gmail.com>
	<29ae894c0909180608l7bd4c6c9mb8a0272adf3edaf4@mail.gmail.com>
Date: Fri, 18 Sep 2009 16:21:32 +0200
Message-ID: <29ae894c0909180721w40630e22y1c750cdd88562580@mail.gmail.com>
From: brem belguebli <brem.belguebli@gmail.com>
Content-Type: multipart/alternative; boundary=00504502d32145d1070473dad97b
Subject: [linux-lvm] Re: Ambiguous mirror log option
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

--00504502d32145d1070473dad97b
Content-Type: text/plain; charset=ISO-8859-1

Got the right doc,

the log device MUST belong to the VG, it cannot be an external device, it is
specified as thrid device vhen creating the LV:

lvcreate -m1 --mirrorlog disk  -L 9G -n lvolvm1 VMVG /dev/firstleg
/dev/secondleg /dev/log...




2009/9/18, brem belguebli <brem.belguebli@gmail.com>:
>
> Running x86_64 RHEL  5u4
>
> 2009/9/18, brem belguebli <brem.belguebli@gmail.com>:
>>
>> Hi,
>>
>> I've been struggling with lvcreate for more than  a hour to create a
>> mirror'ed LV with on disk log, with no success (I'm ashamed! :-| )
>>
>>
>> Here's what I typed on a VG (with 2 X 8678 4MB extents free), it's not a
>> free space issue...
>>
>> lvcreate -m1 --mirrorlog disk  -L 9G -n lvolvm1 VMVG, it complains about
>> 2304 more extents required (wich make the exact size of the LV I want to
>> create), plus where to define the log device to use ?
>>
>> same command whith --corelog (instead of --mirrorlog disk) succeeds.
>>
>> Same command without any of these 2 options fails with the same  complain
>> as the first (man page says that default no option == mirrolog disk).
>>
>> Any tip ?
>>
>> Regards
>>
>
>

--00504502d32145d1070473dad97b
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div>Got the right doc,</div>
<div>=A0</div>
<div>the log device MUST belong to the VG, it cannot be an external device,=
 it is specified as thrid device vhen creating the LV:</div>
<div>=A0</div>
<div>lvcreate -m1 --mirrorlog disk=A0 -L 9G -n lvolvm1 VMVG /dev/firstleg /=
dev/secondleg /dev/log...</div>
<div>=A0</div>
<div><br><br>=A0</div>
<div><span class=3D"gmail_quote">2009/9/18, brem belguebli &lt;<a href=3D"m=
ailto:brem.belguebli@gmail.com">brem.belguebli@gmail.com</a>&gt;:</span>
<blockquote class=3D"gmail_quote" style=3D"PADDING-LEFT: 1ex; MARGIN: 0px 0=
px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid">Running x86_64 RHEL=A0 5u4 <br><=
br>
<div><span class=3D"gmail_quote">2009/9/18, brem belguebli &lt;<a onclick=
=3D"return top.js.OpenExtLink(window,event,this)" href=3D"mailto:brem.belgu=
ebli@gmail.com" target=3D"_blank">brem.belguebli@gmail.com</a>&gt;:</span>=
=20
<div><span class=3D"e" id=3D"q_123cd44aeffe4e01_1">
<blockquote class=3D"gmail_quote" style=3D"PADDING-LEFT: 1ex; MARGIN: 0px 0=
px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid">
<div>Hi,</div>
<div>=A0</div>
<div>I&#39;ve been struggling with lvcreate for more than=A0 a hour to crea=
te a mirror&#39;ed LV with on disk log, with no success (I&#39;m ashamed! :=
-| )</div>
<div>=A0</div>
<div>=A0</div>
<div>Here&#39;s what I typed on a VG (with 2 X 8678 4MB extents free), it&#=
39;s not a free space issue...</div>
<div>=A0</div>
<div>lvcreate -m1 --mirrorlog disk=A0 -L 9G -n lvolvm1 VMVG, it complains a=
bout 2304 more extents required (wich make the exact size of the LV I want =
to create), plus where to define the log device to use ?</div>
<div>=A0</div>
<div>same command whith --corelog (instead of --mirrorlog disk) succeeds. <=
/div>
<div>=A0</div>
<div>Same command without any of these 2 options fails with the same=A0 com=
plain as the first (man page says that default no option =3D=3D mirrolog di=
sk).</div>
<div>=A0</div>
<div>Any tip ?</div>
<div>=A0</div>
<div>Regards</div></blockquote></span></div></div><br></blockquote></div><b=
r>

--00504502d32145d1070473dad97b--
