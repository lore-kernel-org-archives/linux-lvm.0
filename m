Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q7AJwBWC005805
	for <linux-lvm@redhat.com>; Fri, 10 Aug 2012 15:58:11 -0400
Received: from mail-vc0-f174.google.com (mail-vc0-f174.google.com
	[209.85.220.174])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q7AJwA6t029646
	for <linux-lvm@redhat.com>; Fri, 10 Aug 2012 15:58:10 -0400
Received: by vcbfk26 with SMTP id fk26so2347127vcb.33
	for <linux-lvm@redhat.com>; Fri, 10 Aug 2012 12:58:10 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAH+HAhxg1ArkSG0DguGj5OBvxwL4CRBZzV8HVUvYDo+wMrOsWg@mail.gmail.com>
References: <CAH+HAhxg1ArkSG0DguGj5OBvxwL4CRBZzV8HVUvYDo+wMrOsWg@mail.gmail.com>
Date: Fri, 10 Aug 2012 15:58:10 -0400
Message-ID: <CAH+HAhwfpNtrpdr0QijJkhvMpRxDJFR6jHk3-fKAgah-vsc-5w@mail.gmail.com>
From: Reza Gholdor <gholdorreza@gmail.com>
Content-Type: multipart/alternative; boundary=047d7b66fcad70367904c6eec3f3
Subject: Re: [linux-lvm] Translating device name from sar to a filesystem
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
To: linux-lvm@redhat.com, gholdorreza@gmail.com

--047d7b66fcad70367904c6eec3f3
Content-Type: text/plain; charset=ISO-8859-1

Scott Merrillees,
Thank you very much for the information! I have not figured out what
additional info I can get from pvs but between df, ls and the fact that the
digits following dev are major and minor numbers of the device, I can find
what I needed.
Appreciate your help.
Regards
Reza
===========================================
Try the following commands:

df -h
sudo  pvs -o +lv_name
ls -lL /dev/mapper /dev/sd*

which will allow you to map:
dev253-17 to /dev/mapper/vg-lv with device number 253, 17
dev8-0 to /dev/sda with device number 8, 0

then you can map these back up thru the lvm data provided by pvs,
and then up to file systems from df

--
Scott Merrilees

On Tue, Aug 7, 2012 at 9:18 AM, Reza Gholdor <gholdorreza@gmail.com> wrote:

> Hi All,
> I am a DBA trying to determine if I/O is a bottleneck for an Oracle
> 11g database running on RHEL 5.7 x64 on VmWare ESXi 4.1. I monitor disk
> activity using "sar -d" and get device names like dev8-0 and dev253-17. I
> have tried to translate these device names to filesystem names without
> succes. Can someone provide instructions on how to find filesystem build on
> a device name from "sar -d"? Are there any giudeline or better commands for
> determining if I/O is a bottleneck?
> Appreciate any help.
> Regards,
> Reza
>

--047d7b66fcad70367904c6eec3f3
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div>Scott Merrillees,</div><div>Thank you very much for the information! I=
 have not figured out what additional info I can get from pvs but between d=
f, ls and the=A0fact that the digits following dev are major and minor numb=
ers of the device, I can find what I needed.</div>
<div>Appreciate your help.</div><div>Regards</div><div>Reza</div><div>=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D</div><div>Try the follo=
wing commands:<br><br>df -h<br>sudo=A0 pvs -o +lv_name<br>ls -lL /dev/mappe=
r /dev/sd*<br>
<br>which will allow you to map:<br>dev253-17 to /dev/mapper/vg-lv with dev=
ice number 253, 17<br>dev8-0 to /dev/sda with device number 8, 0<br><br>the=
n you can map these back up thru the lvm data provided by pvs,<br>and then =
up to file systems from df<br>
<br>--<br>Scott Merrilees<br><br></div><div class=3D"gmail_quote">On Tue, A=
ug 7, 2012 at 9:18 AM, Reza Gholdor <span dir=3D"ltr">&lt;<a href=3D"mailto=
:gholdorreza@gmail.com" target=3D"_blank">gholdorreza@gmail.com</a>&gt;</sp=
an> wrote:<br>
<blockquote style=3D"margin:0px 0px 0px 0.8ex;padding-left:1ex;border-left-=
color:rgb(204,204,204);border-left-width:1px;border-left-style:solid" class=
=3D"gmail_quote"><div>Hi All,</div><div>I am a DBA trying to determine if I=
/O is a bottleneck for an Oracle 11g=A0database running on RHEL 5.7 x64 on =
VmWare ESXi 4.1. I monitor disk activity using &quot;sar -d&quot; and get d=
evice names like dev8-0 and dev253-17. I have tried to translate these devi=
ce names to filesystem names without succes. Can someone provide instructio=
ns on how to find filesystem build on a device name from &quot;sar -d&quot;=
? Are there any giudeline or better commands for determining if I/O is a bo=
ttleneck?</div>

<div>Appreciate any help.</div><div>Regards,</div><div>Reza</div>
</blockquote></div><br>

--047d7b66fcad70367904c6eec3f3--
