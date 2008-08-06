Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m766d83A012756
	for <linux-lvm@redhat.com>; Wed, 6 Aug 2008 02:39:08 -0400
Received: from smtp-msa-out01.orange.fr (smtp-msa-out01.orange.fr
	[193.252.23.120])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m766cufk026650
	for <linux-lvm@redhat.com>; Wed, 6 Aug 2008 02:38:56 -0400
Received: from me-wanadoo.net (localhost [127.0.0.1])
	by mwinf2352.orange.fr (SMTP Server) with ESMTP id C885B7000083
	for <linux-lvm@redhat.com>; Wed,  6 Aug 2008 08:38:50 +0200 (CEST)
Received: from [172.20.20.150] (LPuteaux-151-41-11-129.w217-128.abo.wanadoo.fr
	[217.128.26.129])
	by mwinf2352.orange.fr (SMTP Server) with ESMTP id 8CC277000088
	for <linux-lvm@redhat.com>; Wed,  6 Aug 2008 08:38:50 +0200 (CEST)
Message-ID: <489946F6.60706@squirk.org>
Date: Wed, 06 Aug 2008 08:38:46 +0200
From: Jean Spirat <jeanspirat@squirk.org>
MIME-Version: 1.0
Subject: Re: [linux-lvm] the lvm shared storage question of the week
References: <48985774.2080509@squirk.org>
	<54CA3782-8BC9-4F64-B209-2066B2315E77@redhat.com>
In-Reply-To: <54CA3782-8BC9-4F64-B209-2066B2315E77@redhat.com>
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Jonathan Brassow a =EF=BF=BDcrit :
> Our testing group has machines that use AOE.  It works well with=20
> CLVM.  However, they use their machines as a cluster.  It seems to me=20
> that you want to carve up your storage, but you only want one machine=20
> to use each piece.
>
yes each server will mount a part of the filesystem and not the same=20
part on each. This mean a single lvm logical volume will be mounted only=20
on one host.

> LVM manual briefly mentions CLVM (should apply equally well to debian):
> http://www.redhat.com/docs/manuals/enterprise/RHEL-5-manual/Cluster_Logic=
al_Volume_Manager/index.html=20
>
yes it just speak about it but there is no doc at all, nothing tells us=20
if it listen on a tcp port or just communicate by using data on the disk=20
or anything about the setup. Also it speak about special configuration=20
in lvm.conf but nowhere i see WHAT should be configured :)

i guess with:

locking_type What type of locking to use. 1 is the default, which use=20
flocks on files in locking_dir (see below) to avoid conflicting LVM2=20
commands running concurrently on a single machine. 0 disables locking=20
and risks corrupting your metadata. If set to 2, the tools will load the=20
external locking_library (see below). If the tools were configured=20
--with-cluster=3Dinternal (the default) then 3 means to use built-in=20
cluster-wide locking. All changes to logical volumes and their states=20
are communicated using locks.

that it should use

locking_type=3D2


but is this enough ?
>
> You will want to come up to speed on the cluster infrastructure (at=20
> least the setup) if you want to use CLVM....
>
sorry i am not native english speaker, what do you mean by that ?

regards,
Jean.
