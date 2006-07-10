Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6AKIYdw032532
	for <linux-lvm@redhat.com>; Mon, 10 Jul 2006 16:18:34 -0400
Received: from bungunia.hst.terra.com.br (bungunia.hst.terra.com.br
	[200.176.10.196])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k6AKIKfU025669
	for <linux-lvm@redhat.com>; Mon, 10 Jul 2006 16:18:26 -0400
Message-ID: <44B2B696.9060005@minicom.com.br>
Date: Mon, 10 Jul 2006 17:20:38 -0300
From: Du <eduardo@minicom.com.br>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM2 maximum logical volume size help
References: <012401c6a45a$c53bcb80$2901a8c0@robbie>
In-Reply-To: <012401c6a45a$c53bcb80$2901a8c0@robbie>
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
To: Robbie Coss <robbie@vzavenue.net>, LVM general discussion and development <linux-lvm@redhat.com>

Take a look in XFS filesystem, I think its what you need, and it has a=20
great performance with big files too.

Robbie Coss wrote:
> Hi,
>
> I am currently running RHEL4 update 3  (kernel 2.6.9-34.0.2.EL), and
> using LVM2 and the ext3 filesystem.
>
> I need to know what is the maximum logical volume size I can create. From
> the LVM2 Howto, the max size is stated to be 8 exebytes. However, the
> Red Hat doc says that the max filesystem size for ext3 is 8 TB.
>
> I am guessing that means I am limited to 8 TB if I want to use ext3 ???
>
> If so, then are there other filesystems I can use to overcome this=20
> limit. I want
> to be able to create volumes at least up to 100TB. Is there anything=20
> included
> with the Red Hat release that would be a good choice? Or anything free=20
> not
> included with Red Hat? Or anything commercial?
>
> Thanks in advance for any help or opinions.
> Robbie
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
&_l=3D1,1152561325.833955.27724.sotovento.hst.terra.com.br,4186,Des15,Des15=
=20
>
>
> Esta mensagem foi verificada pelo E-mail Protegido Terra.
> Scan engine: McAfee VirusScan / Atualizado em 10/07/2006 / Vers=EF=BF=BDo=
:=20
> 4.4.00/4803
> Proteja o seu e-mail Terra: http://mail.terra.com.br/
>
>
