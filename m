Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m47F0dLx000970
	for <linux-lvm@redhat.com>; Wed, 7 May 2008 11:00:39 -0400
Received: from smtp3.mail.easynet.fr (smarthost187.mail.easynet.fr
	[212.180.1.187])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m47F0A3b004241
	for <linux-lvm@redhat.com>; Wed, 7 May 2008 11:00:11 -0400
Received: from saros016845-4.clients.easynet.fr ([84.37.61.220]
	helo=titan.saros.fr) by smtp3.mail.easynet.fr with esmtp (Exim 4.63)
	(envelope-from <gilles.guiot@saros.fr>) id 1Jtl7n-0000MP-J3
	for linux-lvm@redhat.com; Wed, 07 May 2008 17:00:08 +0200
Received: from [192.168.100.11] (helo=[127.0.0.1])
	by titan.saros.fr with esmtp (Exim 4.63)
	(envelope-from <gilles.guiot@saros.fr>) id 1Jtl7m-0006mi-Cm
	for linux-lvm@redhat.com; Wed, 07 May 2008 17:00:06 +0200
Message-ID: <4821C3F1.6000108@saros.fr>
Date: Wed, 07 May 2008 17:00:01 +0200
From: Gilles Guiot <gilles.guiot@saros.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] device /dev/sdb1 not found or ignored by filtering
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
To: linux-lvm@redhat.com

Hello Everybody

I have two raid 1 arrays on a Dell PowerEdge 2950,
1) 2*500 Go
2) 2*750 Go

I need to use LVM, to create a LV on the second raid array, in which i=20
will afterwards incorporate the first raid array. I have the latest=20
debian distro installed, with kernel updates, and LVM2 is installed.

I encounter my first problem when typing pvcreate /dev/sdb1. ( the=20
partition of the second raid array) I get the message :
device /dev/sdb1 not found or ignored by filtering
I checked /etc/lvm/lvm.conf, and I commented out the line about the filter.
After a reboot, no more luck. I tried to circumvent the problem by=20
booting with an ubuntu CD, but i get the same error message.
Could anybody tip me about what's wrong and more importantly suggest=20
solutions to me ? :-)

Thanks a lot in advance.


--=20
Gilles Guiot
Responsable exploitation informatique
T=EF=BF=BDl. : 01 53 23 02 20
gilles.guiot@saros.fr
