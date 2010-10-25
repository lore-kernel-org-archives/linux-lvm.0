Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.13])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id o9PLT6bG006350
	for <linux-lvm@redhat.com>; Mon, 25 Oct 2010 17:29:06 -0400
Received: from e6.ny.us.ibm.com (e6.ny.us.ibm.com [32.97.182.146])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o9PLSp0o017792
	for <linux-lvm@redhat.com>; Mon, 25 Oct 2010 17:28:51 -0400
Received: from d01relay03.pok.ibm.com (d01relay03.pok.ibm.com [9.56.227.235])
	by e6.ny.us.ibm.com (8.14.4/8.13.1) with ESMTP id o9PLTTgo025123
	for <linux-lvm@redhat.com>; Mon, 25 Oct 2010 17:29:29 -0400
Received: from d01av04.pok.ibm.com (d01av04.pok.ibm.com [9.56.224.64])
	by d01relay03.pok.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	o9PLSoKp227326
	for <linux-lvm@redhat.com>; Mon, 25 Oct 2010 17:28:50 -0400
Received: from d01av04.pok.ibm.com (loopback [127.0.0.1])
	by d01av04.pok.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id
	o9PLSnLp000749
	for <linux-lvm@redhat.com>; Mon, 25 Oct 2010 17:28:49 -0400
Received: from malahal (malahal-009047025235.beaverton.ibm.com [9.47.25.235])
	by d01av04.pok.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with ESMTP id
	o9PLSnUK000696
	for <linux-lvm@redhat.com>; Mon, 25 Oct 2010 17:28:49 -0400
Date: Mon, 25 Oct 2010 14:28:48 -0700
From: Malahal Naineni <malahal@us.ibm.com>
Message-ID: <20101025212848.GA6297@us.ibm.com>
References: <AANLkTikX3+Dr5b-QQLZUquTvZ_YYuv8rB_nh=8ocmHvW@mail.gmail.com>
	<20101025181108.GA1019@us.ibm.com>
	<AANLkTinWs=_Z7bzKdq4SNKKBd_BhWGQ_2D7ni00PKyxB@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <AANLkTinWs=_Z7bzKdq4SNKKBd_BhWGQ_2D7ni00PKyxB@mail.gmail.com>
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] Determine boot disk device name...
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
Content-Type: text/plain; charset="windows-1252"
To: linux-lvm@redhat.com

Alexander Skwar [alexanders.mailinglists+nospam@gmail.com] wrote:
>    I also wanted to suggest this, but=E2=80=A6
>=20
>    benutzer@horst:~$ cat /proc/cmdline
>    root=3D/dev/xvda1 ro

I got confused with boot and root! Thanks for correction. Usually boot
disk is mounted at /boot. Your boot disk could be same as root disk (in
this case there would not be anything mounted at /boot but just a
directory).

I don't think there is a sure way to find out your boot-loader disk in
every situation as your boot-loader disk is not needed after boot.

Thanks, Malahal.
