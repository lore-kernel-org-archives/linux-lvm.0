Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ED9C35C544
	for <linux-lvm@redhat.com>; Fri, 13 Oct 2017 10:41:26 +0000 (UTC)
Received: from mail-oi0-f51.google.com (mail-oi0-f51.google.com
	[209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1405381DFB
	for <linux-lvm@redhat.com>; Fri, 13 Oct 2017 10:41:25 +0000 (UTC)
Received: by mail-oi0-f51.google.com with SMTP id h200so13516260oib.4
	for <linux-lvm@redhat.com>; Fri, 13 Oct 2017 03:41:25 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <611a15f8-dd20-ac38-8be4-afd050a82293@suse.com>
References: <CALuPYL3fiHTGbxBFCeQw+HMEAwZBKs2HBMBuThnDFAHDCsDAsQ@mail.gmail.com>
	<CALuPYL3NMm7xrfemcbQ7Kt511rL=VrS7cKi0J0HBKjq8z7QDyg@mail.gmail.com>
	<CALuPYL2R1vLb5TY6CHEcC_m653oSyRHF2UBOU3if5fg2R8bCPg@mail.gmail.com>
	<CALuPYL0ohSNtaC4N97WWUHbW3J8DfnzhT1Pd=iTe_pFvhN2tjw@mail.gmail.com>
	<CALuPYL3EY2EjGER-Fhz0QW8Mu+LBE-L8oOAYo8=Eu9WwawCbgg@mail.gmail.com>
	<CALuPYL1KRtc5e-ZQOqCKE4fyNt9WAgKzBNDdn-6N52yEEQxvEA@mail.gmail.com>
	<CALuPYL26eMycV=h5ZLHTejWNSh-kwYdMKrNnfR7EfKNM83VBLQ@mail.gmail.com>
	<CALuPYL1uwtmaCS8PoVd6F4Y9u4qqhqtyST0yZi77H7fNdi2XUQ@mail.gmail.com>
	<CALuPYL1=MUfFawNOdSpSO-9az3m1vvWF3Y3jCrertFr5M3NewA@mail.gmail.com>
	<CALuPYL2=kUoNv=VhvKqzqEM9E0QOe5vjeopGAC4oZ8_=0TUhDg@mail.gmail.com>
	<CALuPYL2sLeTe8M7KgBGPbMkZWBQAGaOkkj0SS6ovHTg_0SCmuQ@mail.gmail.com>
	<CALuPYL1UVWO1013K7zna4xcBLQYx2zB1beJXVYpOyXWd=209Sw@mail.gmail.com>
	<611a15f8-dd20-ac38-8be4-afd050a82293@suse.com>
From: Indivar Nair <indivar.nair@techterra.in>
Date: Fri, 13 Oct 2017 16:10:53 +0530
Message-ID: <CALuPYL3nMUm6of__zqAsadKoHkPpBYprH_QEpYmYv20vLhM18g@mail.gmail.com>
Content-Type: multipart/alternative; boundary="001a1134e0ee5da4a7055b6b4c10"
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

--001a1134e0ee5da4a7055b6b4c10
Content-Type: text/plain; charset="UTF-8"

Thanks Eric,

I want to keep a single VG so that I can get the bandwidth (LVM Striping)
of all the disks (PVs)
  PLUS
the flexibility to adjust the space allocation between both LVs. Each LV
will be used by  different departments. With 1 LV on different hosts, I can
distribute the Network Bandwidth too.
I would also like to take snapshots of each LV before backing up.

I have been reading more about CLVM+Pacemaker options.
I can see that it is possible to have the same VG activated on multiple
hosts for a GFSv2 filesystem.
In which case, it is the same PVs, VG and LV getting activated on all hosts.

In my case, we will have the same PVs and VG activated on both hosts, but
LV1 on Host01 and LV2 on Host02. I paln to use ext4 or XFS filesystems.

Is there some possibility that it would work?

Regards,


Indivar Nair



On Fri, Oct 13, 2017 at 2:41 PM, Eric Ren <zren@suse.com> wrote:

> Hi,
>
> With CLVM / HA-LVM on a 2 node cluster -
>>
>> Is it possible to have a shared VG but separate LVs, with each LV
>> exclusively activated on different nodes in a 2 node cluster.
>> In case of a failure, the LV of the failed node will be activated on the
>> other node.
>>
>
> I think clvm can do what you want if you perform LVM commands by hand.
> But, with HA cluster manager (pacemaker) you cannot
> do it with the current resource agents (clvm + LVM) [1] [2], because they
> do failover at a VG basis.
>
> We are currently working on new resource agents [3] for lvmlockd [4]. The
> new agents can do activation on LV basis, but I won't
> recommend doing that if there's no strong reason. It makes things much
> more complicated.
>
> [1] https://github.com/ClusterLabs/resource-agents/blob/master/
> heartbeat/clvm
> [2] https://github.com/ClusterLabs/resource-agents/blob/master/
> heartbeat/LVM
> [3] https://www.redhat.com/archives/linux-lvm/2017-January/msg00025.html
> [4] https://github.com/ClusterLabs/resource-agents/pull/1040
>
> Eric
>
>
>

--001a1134e0ee5da4a7055b6b4c10
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks Eric,<div><br></div><div>I want to keep a single VG=
 so that I can get the bandwidth (LVM Striping) of all the disks (PVs) =C2=
=A0</div><div>=C2=A0 PLUS=C2=A0</div><div>the flexibility to adjust the spa=
ce allocation between both LVs. Each LV will be used by =C2=A0different dep=
artments. With 1 LV on different hosts, I can distribute the Network Bandwi=
dth too.</div><div>I would also like to take snapshots of each LV before ba=
cking up.</div><div><br></div><div>I have been reading more about CLVM+Pace=
maker options.</div><div>I can see that it is possible to have the same VG =
activated on multiple hosts for a GFSv2 filesystem.<br></div><div>In which =
case, it is the same PVs, VG and LV getting activated on all hosts.</div><d=
iv><br></div><div>In my case, we will have the same PVs and VG activated on=
 both hosts, but LV1 on Host01 and LV2 on Host02. I paln to use ext4 or XFS=
 filesystems.</div><div><br></div><div>Is there some possibility that it wo=
uld work?</div><div><br></div><div>Regards,</div><div><br></div><div><br></=
div><div>Indivar Nair=C2=A0</div><div><br></div><div><br></div></div><div c=
lass=3D"gmail_extra"><br><div class=3D"gmail_quote">On Fri, Oct 13, 2017 at=
 2:41 PM, Eric Ren <span dir=3D"ltr">&lt;<a href=3D"mailto:zren@suse.com" t=
arget=3D"_blank">zren@suse.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">Hi,<span class=3D""><br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
With CLVM / HA-LVM on a 2 node cluster -<br>
<br>
Is it possible to have a shared VG but separate LVs, with each LV exclusive=
ly activated on different nodes in a 2 node cluster.<br>
In case of a failure, the LV of the failed node will be activated on the ot=
her node.<br>
</blockquote>
<br></span>
I think clvm can do what you want if you perform LVM commands by hand. But,=
 with HA cluster manager (pacemaker) you cannot<br>
do it with the current resource agents (clvm + LVM) [1] [2], because they d=
o failover at a VG basis.<br>
<br>
We are currently working on new resource agents [3] for lvmlockd [4]. The n=
ew agents can do activation on LV basis, but I won&#39;t<br>
recommend doing that if there&#39;s no strong reason. It makes things much =
more complicated.<br>
<br>
[1] <a href=3D"https://github.com/ClusterLabs/resource-agents/blob/master/h=
eartbeat/clvm" rel=3D"noreferrer" target=3D"_blank">https://github.com/Clus=
terLabs<wbr>/resource-agents/blob/master/<wbr>heartbeat/clvm</a><br>
[2] <a href=3D"https://github.com/ClusterLabs/resource-agents/blob/master/h=
eartbeat/LVM" rel=3D"noreferrer" target=3D"_blank">https://github.com/Clust=
erLabs<wbr>/resource-agents/blob/master/<wbr>heartbeat/LVM</a><br>
[3] <a href=3D"https://www.redhat.com/archives/linux-lvm/2017-January/msg00=
025.html" rel=3D"noreferrer" target=3D"_blank">https://www.redhat.com/archi=
ve<wbr>s/linux-lvm/2017-January/<wbr>msg00025.html</a><br>
[4] <a href=3D"https://github.com/ClusterLabs/resource-agents/pull/1040" re=
l=3D"noreferrer" target=3D"_blank">https://github.com/ClusterLabs<wbr>/reso=
urce-agents/pull/1040</a><span class=3D"HOEnZb"><font color=3D"#888888"><br=
>
<br>
Eric<br>
<br>
<br>
</font></span></blockquote></div><br></div>

--001a1134e0ee5da4a7055b6b4c10--
