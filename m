Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.10])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o3I8sT72004881
	for <linux-lvm@redhat.com>; Sun, 18 Apr 2010 04:54:29 -0400
Received: from mirapoint3.brutele.be (mirapoint3.brutele.be [212.68.199.148])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o3I8sCT1008021
	for <linux-lvm@redhat.com>; Sun, 18 Apr 2010 04:54:13 -0400
Message-ID: <4BCAC8B2.7090505@tvcablenet.be>
Date: Sun, 18 Apr 2010 10:54:10 +0200
From: =?ISO-8859-1?Q?Fran=E7ois_Valenduc?=
 <francois.valenduc@tvcablenet.be>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] Problem to remove LVM snaphots
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
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@redhat.com

Hello everybody,

I am using gentoo and I use LVM snapshots to make backups of my system.
Unfortunately, I always have a problem to remove these. LVM always
complains that it can't remove an open logical volume. However, the
snapshot is unmounted when I try to remove it. It seems it's only
possible to remove the snapshot if the corresponding volume is
deactivated. So, I am forced to boot on a live cd to remove the snapshot
of my root partition. Is this really normal ?
I already had that problem a long time ago and I thought it was solved
if a do a sync before removing the snapshot. It seems it's no more
sufficient. I am using LVM 2.02.56-r2, udev 149 and kernel 2.6.33.2

What is even more strange is that I can't even remove snapshot of
logical volumes which I have never mount. In fact, I do the following steps:
	lvcreate -L5G -n test gentoo
	lvcreate -n test1 -L1G -s /dev/gentoo/test
	lvremove gentoo/test1
And, I always get this error: Can't remove open logical volume "test1"

Am I forgetting something ? Until 2 month agos, this worked without any
error. Does anybody have an idea about this problem ?

Thanks in advance for your help,

Fran=EF=BF=BDois Valenduc
