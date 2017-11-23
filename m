Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7F17060FA1
	for <linux-lvm@redhat.com>; Thu, 23 Nov 2017 16:14:32 +0000 (UTC)
Received: from mail-ot0-f180.google.com (mail-ot0-f180.google.com
	[74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4797337E79
	for <linux-lvm@redhat.com>; Thu, 23 Nov 2017 16:14:31 +0000 (UTC)
Received: by mail-ot0-f180.google.com with SMTP id d27so16665274ote.11
	for <linux-lvm@redhat.com>; Thu, 23 Nov 2017 08:14:31 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <52d46b9d-c4bd-65a9-639d-de68f47049d5@suse.com>
References: <CALuPYL3fiHTGbxBFCeQw+HMEAwZBKs2HBMBuThnDFAHDCsDAsQ@mail.gmail.com>
	<CALuPYL3EY2EjGER-Fhz0QW8Mu+LBE-L8oOAYo8=Eu9WwawCbgg@mail.gmail.com>
	<CALuPYL1KRtc5e-ZQOqCKE4fyNt9WAgKzBNDdn-6N52yEEQxvEA@mail.gmail.com>
	<CALuPYL26eMycV=h5ZLHTejWNSh-kwYdMKrNnfR7EfKNM83VBLQ@mail.gmail.com>
	<CALuPYL1uwtmaCS8PoVd6F4Y9u4qqhqtyST0yZi77H7fNdi2XUQ@mail.gmail.com>
	<CALuPYL1=MUfFawNOdSpSO-9az3m1vvWF3Y3jCrertFr5M3NewA@mail.gmail.com>
	<CALuPYL2=kUoNv=VhvKqzqEM9E0QOe5vjeopGAC4oZ8_=0TUhDg@mail.gmail.com>
	<CALuPYL2sLeTe8M7KgBGPbMkZWBQAGaOkkj0SS6ovHTg_0SCmuQ@mail.gmail.com>
	<CALuPYL1UVWO1013K7zna4xcBLQYx2zB1beJXVYpOyXWd=209Sw@mail.gmail.com>
	<611a15f8-dd20-ac38-8be4-afd050a82293@suse.com>
	<CALuPYL3nMUm6of__zqAsadKoHkPpBYprH_QEpYmYv20vLhM18g@mail.gmail.com>
	<ca355575-a7c7-1a03-b042-3f87bec1306e@suse.com>
	<CALuPYL2nhMGC8PZ0GLhF95o5VjLnxYgjEEYQRF08FrBLs3eSug@mail.gmail.com>
	<3adc61ab-b979-2072-5b35-b6fb29588faf@suse.com>
	<CALuPYL3cuccWb98iKT_toDAP+oYYwoUFtiXs4qgNTMgL5LGwmQ@mail.gmail.com>
	<52d46b9d-c4bd-65a9-639d-de68f47049d5@suse.com>
From: Indivar Nair <indivar.nair@techterra.in>
Date: Thu, 23 Nov 2017 21:44:00 +0530
Message-ID: <CALuPYL0vVHSNc=WwULTVq1zTp1SFtpFJkEk3z26YgpLnuH7_NA@mail.gmail.com>
Content-Type: multipart/alternative; boundary="94eb2c1c08c622bdb9055ea8bbc6"
Subject: Re: [linux-lvm] Shared VG, Separate LVs
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
To: Eric Ren <zren@suse.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

--94eb2c1c08c622bdb9055ea8bbc6
Content-Type: text/plain; charset="UTF-8"

Sure. Will keep that in mind.
Thanks a lot, Eric.

Regards,


Indivar Nair

On Thu, Nov 23, 2017 at 7:16 PM, Eric Ren <zren@suse.com> wrote:

> Hi,
>
>
>
>
> *"I noticed you didn't configure LVM resource agent to manage your VG's
> (de)activation task, not sure if it can always work as expect, so have more
> exceptional checking :)" *
>
>              Strangely the Pacemaker active-passive configuration example
> shows VG controlled by Pacemaker, while the active-active one does not. I
> have taken the active-active configuration for Pacemaker and created 2 LVs,
> then instead of formatting it using the GFS2 clustered filesystem, I used
> normal XFS and made sure that it is mounted only on one node at a time.
> (lv01 on node 2, lv02 on node2)
>
>              https://access.redhat.com/documentation/en-us/red_hat_
> enterprise_linux/7/html/global_file_system_2/ch-clustsetup-gfs2
>
>              I can see the clustered VG and LVs as soon ocf:heartbeat:clvm
> is started.
>
> Is there anything I am missing here?
>
>
> Good. "clvm" will activate all VGs by default. If you have more than one
> VG in your cluster,  you may want to
> activate/deactivate one VG for each group of "vg" and "xfs", then you may
> need to look at LVM for each VG:
>
> https://github.com/ClusterLabs/resource-agents/blob/master/heartbeat/LVM
>
> Eric
>

--94eb2c1c08c622bdb9055ea8bbc6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Sure. Will keep that in mind.<div>Thanks a lot, Eric.</div=
><div><br></div><div>Regards,</div><div><br></div><div><br></div><div>Indiv=
ar Nair</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote=
">On Thu, Nov 23, 2017 at 7:16 PM, Eric Ren <span dir=3D"ltr">&lt;<a href=
=3D"mailto:zren@suse.com" target=3D"_blank">zren@suse.com</a>&gt;</span> wr=
ote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex">
 =20
   =20
 =20
  <div text=3D"#000000" bgcolor=3D"#FFFFFF">
    Hi,<span class=3D""><br>
    <br>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div><br>
        </div>
        <div><i><span>&quot;I noticed you didn&#39;t configure LVM resource=
 agent
              to manage your VG&#39;s (de)activation task,</span><br>
            <span>not sure if it can always work as expect, so have more
              exceptional checking :)&quot;</span><br>
          </i></div>
        <div><br>
        </div>
        <div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Strangely the =
Pacemaker active-passive
          configuration example shows VG controlled by Pacemaker, while
          the active-active one does not. I have taken the active-active
          configuration for Pacemaker and created 2 LVs, then instead of
          formatting it using the GFS2 clustered filesystem, I used
          normal XFS and made sure that it is mounted only on one node
          at a time. (lv01 on node 2, lv02 on node2)</div>
        <div><br>
        </div>
        <div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"htt=
ps://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/=
global_file_system_2/ch-clustsetup-gfs2" target=3D"_blank">https://access.r=
edhat.com/<wbr>documentation/en-us/red_hat_<wbr>enterprise_linux/7/html/<wb=
r>global_file_system_2/ch-<wbr>clustsetup-gfs2</a></div>
        <div><br>
        </div>
        <div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0I can see the =
clustered VG and LVs as soon=C2=A0<span>ocf:heartbeat:clvm
            is started.</span></div>
        <div><br>
        </div>
        <div>Is there anything I am missing here?</div>
      </div>
    </blockquote>
    <br></span>
    Good. &quot;clvm&quot; will activate all VGs by default. If you have mo=
re than
    one VG in your cluster,=C2=A0 you may want to<br>
    activate/deactivate one VG for each group of &quot;vg&quot; and &quot;x=
fs&quot;, then
    you may need to look at LVM for each VG:<br>
    <br>
<a class=3D"m_6831217383628340589moz-txt-link-freetext" href=3D"https://git=
hub.com/ClusterLabs/resource-agents/blob/master/heartbeat/LVM" target=3D"_b=
lank">https://github.com/<wbr>ClusterLabs/resource-agents/<wbr>blob/master/=
heartbeat/LVM</a><span class=3D"HOEnZb"><font color=3D"#888888"><br>
    <br>
    Eric<br>
  </font></span></div>

</blockquote></div><br></div>

--94eb2c1c08c622bdb9055ea8bbc6--
