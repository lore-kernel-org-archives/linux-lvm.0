Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i3SGOYv23022
	for <linux-lvm@redhat.com>; Wed, 28 Apr 2004 12:24:34 -0400
Received: from qmail-out.click21.com.br (qmail-local.click21.com.br
	[200.245.240.65])
	by mx3.redhat.com (8.12.10/8.12.10) with SMTP id i3SGOW99022390
	for <linux-lvm@redhat.com>; Wed, 28 Apr 2004 12:24:32 -0400
Message-ID: <20040428162429.9978.qmail@qmail-local.click21.com.br>
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: 28 Apr 2004 13:24:29 -0300
From: "Rodolfo Sikora de Melo 2" <vo0do0@click21.com.br>
Subject: [linux-lvm] Help with my LVM
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
To: linux-lvm@redhat.com

Guys, I'm desperate needing help.
After a reboot one of lvm pv stopped do work.

The scenario:
10 disks:=20
5 disks in channel A Raid 5
5 disks in channel B Raid 5

the sda has sda1 sda2 sda3, where only sda3 is a physical volume and is wor=
king great.

the sda has sdb1 sdb2 sdb3, where only sdb3 is a physical volume and after =
a reboot stopped to work.

licor:~/uuid_fixer# pvdisplay /dev/sdb3
pvdisplay -- no physical volume identifier on "/dev/sdb3"

What I can do to fix this? I have 100Gb of important data inside this PV.=20

I can provide any information u need to help me!
Thank you very much.




___________________________________________________________________________=
________
Acesse nosso portal www.click21.com.br

Porque internet gr=EF=BF=BDtis, nem a Embratel pode fazer mais barato. Mas =
pode fazer melhor.
