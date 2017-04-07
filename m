Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B53BB60F83
	for <linux-lvm@redhat.com>; Fri,  7 Apr 2017 18:21:41 +0000 (UTC)
Received: from mail-lf0-f53.google.com (mail-lf0-f53.google.com
	[209.85.215.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DC6FF624A4
	for <linux-lvm@redhat.com>; Fri,  7 Apr 2017 18:21:38 +0000 (UTC)
Received: by mail-lf0-f53.google.com with SMTP id z15so46249102lfd.1
	for <linux-lvm@redhat.com>; Fri, 07 Apr 2017 11:21:38 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1438f48b-0a6d-4fb7-92dc-3688251e0a00@assyoma.it>
References: <1438f48b-0a6d-4fb7-92dc-3688251e0a00@assyoma.it>
From: =?UTF-8?Q?Tomas_Dalebj=C3=B6rk?= <tomas.dalebjork@gmail.com>
Date: Fri, 7 Apr 2017 20:21:36 +0200
Message-ID: <CACrcyfLfTjkp9d7J4aCaAs8qeQbP-=O2aOwVSq-p2uTGrgKjuQ@mail.gmail.com>
Content-Type: multipart/alternative; boundary=94eb2c1cd53c3679b6054c97b2b7
Subject: Re: [linux-lvm] Snapshot behavior on classic LVM vs ThinLVM
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

--94eb2c1cd53c3679b6054c97b2b7
Content-Type: text/plain; charset=UTF-8

Hi

Agent less snapshot of the vm server might be an issue with application
running in the vm guest os.
Especially as there are no VSS like features on linux.

Perhaps someone can introduce a udev listener that can be used?

Den 6 apr. 2017 16:32 skrev "Gionatan Danti" <g.danti@assyoma.it>:

> Hi all,
> I'm seeking some advice for a new virtualization system (KVM) on top of
> LVM. The goal is to take agentless backups via LVM snapshots.
>
> In short: what you suggest to snapshot a quite big (8+ TB) volume? Classic
> LVM (with old snapshot behavior) or thinlvm (and its new snapshot method)?
>
> Long story:
> In the past, I used classical, preallocated logical volumes directly
> exported as virtual disks. In this case, I snapshot the single LV I want to
> backup and, using dd/ddrescue, I copy it.
>
> Problem is this solution prevents any use of thin allocation or sparse
> files, so I tried to replace it with something filesystem-based. Lately I
> used another approach, configuring a single thinly provisioned LV (with no
> zeroing) + XFS + raw or qcow2 virtual machine images. To make backups, I
> snapshotted the entire thin LV and, after mounting it, I copied the
> required files.
>
> So far this second solution worked quite well. However, before using it in
> more and more installations, I wonder if it is the correct approach or if
> something better, especially from a stability standpoint, is possible.
>
> Gived that I would like to use XFS, and that I need snapshots at the block
> level, two possibilities came to mind:
>
> 1) continue to use thinlvm + thin snapshots + XFS. What do you think about
> a 8+ TB thin pool/volume with relatively small (64/128KB) chunks? Would you
> be comfortable using it in production workloads? What about powerloss
> protection? From my understanding, thinlvm passes flushes anytime the
> higher layers issue them and so should be reasonable safe against
> unexpected powerloss. Is this view right?
>
> 2) use a classic (non-thin) LVM + normal snapshot + XFS. I know for sure
> that LV size is not an issue here, however big snapshot size used to be
> problematic: the CoW table had to be read completely before the snapshot
> can be activated. Is this problem a solved one? Or big snapshot can be
> problematic?
>
> Thank you all.
>
> --
> Danti Gionatan
> Supporto Tecnico
> Assyoma S.r.l. - www.assyoma.it
> email: g.danti@assyoma.it - info@assyoma.it
> GPG public key ID: FF5F32A8
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

--94eb2c1cd53c3679b6054c97b2b7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi<div dir=3D"auto"><br></div><div dir=3D"auto">Agent les=
s snapshot of the vm server might be an issue with application running in t=
he vm guest os.</div><div dir=3D"auto">Especially as there are no VSS like =
features on linux.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Perha=
ps someone can introduce a udev listener that can be used?</div></div><div =
class=3D"gmail_extra"><br><div class=3D"gmail_quote">Den 6 apr. 2017 16:32 =
skrev &quot;Gionatan Danti&quot; &lt;<a href=3D"mailto:g.danti@assyoma.it">=
g.danti@assyoma.it</a>&gt;:<br type=3D"attribution"><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">Hi all,<br>
I&#39;m seeking some advice for a new virtualization system (KVM) on top of=
 LVM. The goal is to take agentless backups via LVM snapshots.<br>
<br>
In short: what you suggest to snapshot a quite big (8+ TB) volume? Classic =
LVM (with old snapshot behavior) or thinlvm (and its new snapshot method)?<=
br>
<br>
Long story:<br>
In the past, I used classical, preallocated logical volumes directly export=
ed as virtual disks. In this case, I snapshot the single LV I want to backu=
p and, using dd/ddrescue, I copy it.<br>
<br>
Problem is this solution prevents any use of thin allocation or sparse file=
s, so I tried to replace it with something filesystem-based. Lately I used =
another approach, configuring a single thinly provisioned LV (with no zeroi=
ng) + XFS + raw or qcow2 virtual machine images. To make backups, I snapsho=
tted the entire thin LV and, after mounting it, I copied the required files=
.<br>
<br>
So far this second solution worked quite well. However, before using it in =
more and more installations, I wonder if it is the correct approach or if s=
omething better, especially from a stability standpoint, is possible.<br>
<br>
Gived that I would like to use XFS, and that I need snapshots at the block =
level, two possibilities came to mind:<br>
<br>
1) continue to use thinlvm + thin snapshots + XFS. What do you think about =
a 8+ TB thin pool/volume with relatively small (64/128KB) chunks? Would you=
 be comfortable using it in production workloads? What about powerloss prot=
ection? From my understanding, thinlvm passes flushes anytime the higher la=
yers issue them and so should be reasonable safe against unexpected powerlo=
ss. Is this view right?<br>
<br>
2) use a classic (non-thin) LVM + normal snapshot + XFS. I know for sure th=
at LV size is not an issue here, however big snapshot size used to be probl=
ematic: the CoW table had to be read completely before the snapshot can be =
activated. Is this problem a solved one? Or big snapshot can be problematic=
?<br>
<br>
Thank you all.<br>
<br>
-- <br>
Danti Gionatan<br>
Supporto Tecnico<br>
Assyoma S.r.l. - <a href=3D"http://www.assyoma.it" rel=3D"noreferrer" targe=
t=3D"_blank">www.assyoma.it</a><br>
email: <a href=3D"mailto:g.danti@assyoma.it" target=3D"_blank">g.danti@assy=
oma.it</a> - <a href=3D"mailto:info@assyoma.it" target=3D"_blank">info@assy=
oma.it</a><br>
GPG public key ID: FF5F32A8<br>
<br>
______________________________<wbr>_________________<br>
linux-lvm mailing list<br>
<a href=3D"mailto:linux-lvm@redhat.com" target=3D"_blank">linux-lvm@redhat.=
com</a><br>
<a href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm" rel=3D"norefe=
rrer" target=3D"_blank">https://www.redhat.com/mailman<wbr>/listinfo/linux-=
lvm</a><br>
read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" rel=3D"=
noreferrer" target=3D"_blank">http://tldp.org/HOWTO/LVM-HOWT<wbr>O/</a><br>
</blockquote></div></div>

--94eb2c1cd53c3679b6054c97b2b7--
