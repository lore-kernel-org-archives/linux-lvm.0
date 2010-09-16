Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.10])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o8G8qXwG024549
	for <linux-lvm@redhat.com>; Thu, 16 Sep 2010 04:52:34 -0400
Received: from mail-iw0-f174.google.com (mail-iw0-f174.google.com
	[209.85.214.174])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o8G8qPak007033
	for <linux-lvm@redhat.com>; Thu, 16 Sep 2010 04:52:25 -0400
Received: by iwn5 with SMTP id 5so1201188iwn.33
	for <linux-lvm@redhat.com>; Thu, 16 Sep 2010 01:52:25 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4C77FE94.5090905@cbnco.com>
References: <4C77FE94.5090905@cbnco.com>
Date: Thu, 16 Sep 2010 14:22:24 +0530
Message-ID: <AANLkTikZPjtR+gTQ67tprCK=GdbJBrLYk5jr2d8xcO0u@mail.gmail.com>
From: aneesh vs <mailtoaneeshvs@gmail.com>
Content-Type: multipart/alternative; boundary=0022152d7feda2443a04905c90eb
Subject: Re: [linux-lvm] CLVM and LV activation
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

--0022152d7feda2443a04905c90eb
Content-Type: text/plain; charset=ISO-8859-1

If you are using clvm, you shouldn't wory about volume_list because clvm
allows nodes to activate LVs in all nodes.
Please check what is "locking_type" in lvm.conf . It should be 3 in RHEL5 so
that when clvm starts it can enable all clustered VGs.
If the issue still persists, please chkconfig all cluster services off and
reboot nodes. Once nodes are up start the cluster services in order. Please
note that cluster should be quorate for clvm to start fine.

On Fri, Aug 27, 2010 at 11:36 PM, Michael Smith <msmith@cbnco.com> wrote:

> Hi,
>
> When a CLVM cluster comes up, the LVs in the clustered volume groups are
> "not available". I can use the heartbeat LVM resource to trigger a "vgchange
> -aly", but I'm wondering if there's a way to configure it to happen
> automatically. It'd make my cluster config simpler.
>
> I'm not positive, but I guess the volume_list directive in lvm.conf might
> be able to do it. Is there a way to tell it to activate all LVs on all VGs,
> or do I have to list the VGs by name?
>
> Thanks,
> Mike
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

--0022152d7feda2443a04905c90eb
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div>If you are using clvm, you shouldn&#39;t wory about volume_list becaus=
e clvm allows nodes to activate LVs in all nodes.</div>
<div>Please check=A0what is=A0&quot;locking_type&quot; in lvm.conf . It sho=
uld be 3 in RHEL5 so that when clvm starts it can enable all clustered VGs.=
</div>
<div>If the issue still persists, please chkconfig all cluster services off=
 and reboot nodes. Once nodes are up start the cluster services in order. P=
lease note that cluster should be quorate for clvm to start fine.<br><br>
</div>
<div class=3D"gmail_quote">On Fri, Aug 27, 2010 at 11:36 PM, Michael Smith =
<span dir=3D"ltr">&lt;<a href=3D"mailto:msmith@cbnco.com">msmith@cbnco.com<=
/a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"PADDING-LEFT: 1ex; MARGIN: 0px 0=
px 0px 0.8ex; BORDER-LEFT: #ccc 1px solid">Hi,<br><br>When a CLVM cluster c=
omes up, the LVs in the clustered volume groups are &quot;not available&quo=
t;. I can use the heartbeat LVM resource to trigger a &quot;vgchange -aly&q=
uot;, but I&#39;m wondering if there&#39;s a way to configure it to happen =
automatically. It&#39;d make my cluster config simpler.<br>
<br>I&#39;m not positive, but I guess the volume_list directive in lvm.conf=
 might be able to do it. Is there a way to tell it to activate all LVs on a=
ll VGs, or do I have to list the VGs by name?<br><br>Thanks,<br>Mike<br>
<br>_______________________________________________<br>linux-lvm mailing li=
st<br><a href=3D"mailto:linux-lvm@redhat.com" target=3D"_blank">linux-lvm@r=
edhat.com</a><br><a href=3D"https://www.redhat.com/mailman/listinfo/linux-l=
vm" target=3D"_blank">https://www.redhat.com/mailman/listinfo/linux-lvm</a>=
<br>
read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" target=
=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br></blockquote></div><br>

--0022152d7feda2443a04905c90eb--
