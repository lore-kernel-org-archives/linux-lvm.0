Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l61DTLHC013503
	for <linux-lvm@redhat.com>; Sun, 1 Jul 2007 09:29:21 -0400
Received: from main.carme.maven.pl (main.carme.maven.pl [193.239.45.138])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l61DTJ0C024508
	for <linux-lvm@redhat.com>; Sun, 1 Jul 2007 09:29:19 -0400
Received: from chello087207214234.chello.pl ([87.207.214.234]
	helo=[192.168.0.149])
	by main.carme.maven.pl with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.66) (envelope-from <arekm@maven.pl>) id 1I4zUL-0000CY-KD
	for linux-lvm@redhat.com; Sun, 01 Jul 2007 15:29:17 +0200
From: Arkadiusz Miskiewicz <arekm@maven.pl>
Date: Sun, 1 Jul 2007 15:29:08 +0200
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <200707011529.08381.arekm@maven.pl>
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] [PATCH]: don't use functions marked by SUSv3 as legacy
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
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@redhat.com


Please merge this one:
http://cvs.pld-linux.org/cgi-bin/cvsweb/SOURCES/lvm2-susv3.patch
by qboosh/pld-linux.org.

--=20
Arkadiusz Mi=EF=BF=BDkiewicz        PLD/Linux Team
arekm / maven.pl            http://ftp.pld-linux.org/
