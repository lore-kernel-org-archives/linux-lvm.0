Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i3UCJEv04670
	for <linux-lvm@redhat.com>; Fri, 30 Apr 2004 08:19:14 -0400
Received: from hnse2.hns.com (hnse2.hns.com [208.236.67.202])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i3UCJE99029031
	for <linux-lvm@redhat.com>; Fri, 30 Apr 2004 08:19:14 -0400
Received: from excore8.hns.com (excore8.hns.com [139.85.52.156])
	by hnse2.hns.com (Switch-3.1.0/Switch-3.1.0) with ESMTP id
	i3UCJ7GH019971
	(version=TLSv1/SSLv3 cipher=EDH-RSA-DES-CBC3-SHA bits=168 verify=NO)
	for <linux-lvm@redhat.com>; Fri, 30 Apr 2004 08:19:07 -0400 (EDT)
Received: from rpppc1.md.hns.com (rpppc1.md.hns.com [139.85.94.36])
	by excore8.hns.com (Switch-3.1.0/Switch-3.1.0) with ESMTP id
	i3UCJ1Nj000687
	for <linux-lvm@redhat.com>; Fri, 30 Apr 2004 08:19:01 -0400 (EDT)
From: "Neal D. Becker" <nbecker@hns.com>
Date: Fri, 30 Apr 2004 08:18:54 -0400
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <200404300819.00478.nbecker@hns.com>
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Help with lvm2 problem
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
Content-Type: Text/Plain; charset="utf-8"
To: linux-lvm@redhat.com

-----BEGIN PGP SIGNED MESSAGE-----Hash: SHA1
Does anyone know what I need to do to fix this?
I am running FC2 (from developement).��Root�is�on�Raid0�lvm2,�created�byFC2T1.
When I boot lately, I'm seeing messages about not being able to find devicewith uuid xxxx....
I just ran lvdisplay to see what it would say, and it looks like the samemessage I saw at boot time:


/usr/sbin/lvdisplay��Couldn't�find�device�with�uuid�'2adyAl-cmc6-kSXj-a7Nu-IPmg-YF0e-5ERd6y'.��Couldn't�find�all�physical�volumes�for�volume�group�Volume00.��Volume�group�"Volume00"�not�found
It is not fatal, because it manages to mount anyway:
mount/dev/mapper/Volume00-LogVol00 on / type ext3 (rw)> Here is some more info:
/usr/sbin/pvdisplay ��Couldn't�find�device�with�uuid�'2adyAl-cmc6-kSXj-a7Nu-IPmg-YF0e-5ERd6y'.��---�Physical�volume�---��PV�Name���������������/dev/sda2��VG�Name���������������Volume00��PV�Size���������������73.24�GB�/�not�usable�0�����Allocatable�����������yes�(but�full)��PE�Size�(KByte)�������4096��Total�PE��������������18749��Free�PE���������������0��Allocated�PE����������18749��PV�UUID���������������wwpCTJ-Yc4C-EARb-1jnt-YPJE-TMGm-c845g8�����---�Physical�volume�---��PV�Name���������������unknown�device��VG�Name���������������Volume00��PV�Size���������������73.24�GB�/�not�usable�0�����Allocatable�����������yes���PE�Size�(KByte)�������4096��Total�PE��������������18749��Free�PE���������������2��Allocated�PE����������18747��PV�UUID���������������2adyAl-cmc6-kSXj-a7Nu-IPmg-YF0e-5ERd6y

- -- Please AVOID sending me WORD, EXCEL or POWERPOINT attachments.See http://www.fsf.org/philosophy/no-word-attachments.html-----BEGIN PGP SIGNATURE-----Version: GnuPG v1.2.4 (GNU/Linux)
iD8DBQFAkkQxMDqogpR5tkMRAgaVAJ4mL8ki4AJkmKAOF6jOhaDidZQKHwCeJm2G9Awi/1K/JvOIbH3k/aB+OMo==sXU0-----END PGP SIGNATURE-----
