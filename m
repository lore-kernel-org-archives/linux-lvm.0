Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5TKEw0g030410
	for <linux-lvm@redhat.com>; Thu, 29 Jun 2006 16:14:58 -0400
Received: from bundure.hst.terra.com.br (bundure.hst.terra.com.br
	[200.176.10.195])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k5TKEol9000576
	for <linux-lvm@redhat.com>; Thu, 29 Jun 2006 16:14:51 -0400
Received: from calomba.hst.terra.com.br (calomba.hst.terra.com.br
	[200.176.10.11])
	by bundure.hst.terra.com.br (Postfix) with ESMTP id D00F19A0418
	for <linux-lvm@redhat.com>; Thu, 29 Jun 2006 17:14:49 -0300 (BRT)
Received: from [10.0.0.38] (unknown [200.168.58.218])
	(authenticated user minicom024)
	by calomba.hst.terra.com.br (Postfix) with ESMTP id 03AD03108088
	for <linux-lvm@redhat.com>; Thu, 29 Jun 2006 17:14:46 -0300 (BRT)
Message-ID: <44A43522.6080904@minicom.com.br>
Date: Thu, 29 Jun 2006 17:16:34 -0300
From: Du <eduardo@minicom.com.br>
MIME-Version: 1.0
Subject: Re: [linux-lvm] FC5 Increase LV in VolGroup00
References: <44A4181F.8070703@neatech.com>
In-Reply-To: <44A4181F.8070703@neatech.com>
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

I donno if will help, or you can do this, but one thing to do is to=20
change /etc/fstab to mount root in some other LV , thus when you reboot=20
your LogVol00 will not be mounted...

Patrick Nelson wrote:
> FC4 - Up to date
>
> I'm trying to figure out how to increase the size of=20
> VolGroup00/LogVol00 on my FC4 install.  This is the root dir and I can=20
> not unmount it.
>
> I figure some one can give me the step by step way of doing this=20
> because I have tried everything I can think of to do this, including:
>
> - booting to rescue mode
> - going to single user mode
>
>
> But no matter what I try I can not resize this LV.  If anyone has done=20
> this can you please help me with the steps to do this.  I'm adding a=20
> new drive (pv) and I have done the following:
>
> - pvcreate /dev/sdb
> - vgextend VolGroup00 /dev/sdb
> - I grabbed the PE from pvdisplay -> 191
> - lvextend -l 191 /dev/VolGroup00/LogVol00 /dev/sdb
>
> And I need to run resize2fs /dev/VolGroup00/LogVol00 but I need to=20
> umount it first.
> Any help greatly appreciated.
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
> E-mail classificado pelo Identificador de Spam Inteligente Terra.
> Para alterar a categoria classificada, visite
> http://mail.terra.com.br/protected_email/imail/imail.cgi?+_u=3Dminicom024=
&_l=3D1,1151606639.38087.17754.tulear.hst.terra.com.br,3956,Des15,Des15=20
>
>
> Esta mensagem foi verificada pelo E-mail Protegido Terra.
> Scan engine: McAfee VirusScan / Atualizado em 29/06/2006 / Vers=EF=BF=BDo=
:=20
> 4.4.00/4796
> Proteja o seu e-mail Terra: http://mail.terra.com.br/
>
>
