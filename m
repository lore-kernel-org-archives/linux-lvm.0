Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i414Gjv27024
	for <linux-lvm@redhat.com>; Sat, 1 May 2004 00:16:45 -0400
Received: from qmail-out.click21.com.br (qmail-local.click21.com.br
	[200.245.240.65])
	by mx3.redhat.com (8.12.10/8.12.10) with SMTP id i414Gh99020679
	for <linux-lvm@redhat.com>; Sat, 1 May 2004 00:16:44 -0400
Message-ID: <20040501041640.26322.qmail@qmail-local.click21.com.br>
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: 1 May 2004 1:16:40 -0300
References: <20040430105323.GB15691@redhat.com>
Subject: Re[2]: [linux-lvm] Help with my LVM
From: "Rodolfo Sikora de Melo 2" <vo0do0@click21.com.br>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
To: LVM general discussion and development <linux-lvm@redhat.com>





=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>De:Heinz Mauelshagen <mauelshagen@redhat.com>
>Para:LVM general discussion and development <linux-lvm@redhat.com>
>Assunto:Re: [linux-lvm] Help with my LVM
>
>On Wed, Apr 28, 2004 at 01:24:29PM -0300,
>Rodolfo Sikora de Melo 2 wrote:
>> Guys, I'm desperate needing help.
>> After a reboot one of lvm pv stopped do work.
>
>What *exactly* happened to your LVM PVs before
>the reboot ?

Nothing at all.. it was there happy and running.

>
>>=20
>> The scenario:
>> 10 disks:=20
>> 5 disks in channel A Raid 5
>> 5 disks in channel B Raid 5
>>=20
>> the sda has sda1 sda2 sda3, where only sda3 is
>a physical volume and is working great.
>>=20
>> the sda has sdb1 sdb2 sdb3, where only sdb3 is
>a physical volume and after a reboot stopped to
>work.
>>=20
>> licor:~/uuid_fixer# pvdisplay /dev/sdb3
>> pvdisplay -- no physical volume identifier on
>"/dev/sdb3"
>
>Presumably your RAID is fully operational,
>some{one|thing} has written
>over the LVM metadata. At least partionally.

yes, it was perfect. It's a netraid managing a taskmaster unit.

>
>>=20
>> What I can do to fix this? I have 100Gb of
>important data inside this PV.=20
>
>If just the LVM metatada and no data on
>/dev/sdb3 is gone *and* you've
>got /etc/lvmconf/ metadata backups, you want to
>run:
>
># pvcreate -ff /dev/sdb3
># vgcfgrestore -n VGName /dev/sdb3

I tried vgcfgrestore but not pvcreate -ff
I was so screwed that I cleaned the partition and restored a backup from 15=
 days before.

Man I have been experiencing too much problem running xfs under lvm.

>
>Before you do that or any other changes to your
>disks, let's make clear=20
>what really happend first!
>
too late, anyway thank you.
>>=20
>> I can provide any information u need to help
>me!
>> Thank you very much.
>>=20




___________________________________________________________________________=
________
Acesse nosso portal www.click21.com.br

Porque internet gr=EF=BF=BDtis, nem a Embratel pode fazer mais barato. Mas =
pode fazer melhor.
