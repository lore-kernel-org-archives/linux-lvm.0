Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iAHLt2r26183
	for <linux-lvm@redhat.com>; Wed, 17 Nov 2004 16:55:02 -0500
Received: from grabki.3c.pl (mail@as254.internetdsl.tpnet.pl [80.53.176.254])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id iAHLsmA8010112
	for <linux-lvm@redhat.com>; Wed, 17 Nov 2004 16:54:55 -0500
Received: from angel ([192.168.1.2])
	by grabki.3c.pl with esmtp (Exim 3.35 #1 (Debian))
	id 1CUXmN-0001NS-00
	for <linux-lvm@redhat.com>; Wed, 17 Nov 2004 22:55:55 +0100
From: "Krzysztof" <kris@grabki.3c.pl>
Date: Wed, 17 Nov 2004 22:54:26 +0100
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <20041108173315.GA21451@redhat.com>
Message-Id: <E1CUXmN-0001NS-00@grabki.3c.pl>
Subject: [linux-lvm] LVM Config Files
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
Content-Type: text/plain; charset="us-ascii"
To: 'LVM general discussion and development' <linux-lvm@redhat.com>

Hi.

One small question. I have googled, but don't find any news about configs in
lvm.
I understand that they are locate in /etc/lvm*, but is there any options in
lvm to specify another
location of configs like /home/jail/etc/lvm* ? for example. Or i just need
recompile lvm1 from 
source and play with location of configs files ? (i don't want do this). :\


I have lvm1 on my debian ;)
- (lvm-common v1.5.5)
- (lvm10 v1.0.4-5woody1)


Another question is about disk in lvm.

# pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- ACTIVE   PV "/dev/hdg1"  of VG "lvm" [20.22 GB / 0 free]
pvscan -- ACTIVE   PV "/dev/hde1"  of VG "lvm" [60.77 GB / 0 free]
pvscan -- ACTIVE   PV "/dev/hdb1" of VG "lvm" [82.73 GB / 0 free]

I created one big ;) volumegroup and then i create another one big logical
volume. Now i have problem.
One of disk (hdb1) is showing errors, and smart show me that it will die. Is
there any chance to free _exacly_ all pe from hdb1, and only from this disk
?
.it seems that lvm free pv from volume in strage order. Can i tell lvm that
i want free only this disk ?


Kris.

Ps. I know. My english isn't perfect. Sorry for that.
