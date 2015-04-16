Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t3GHbq7d002813
	for <linux-lvm@redhat.com>; Thu, 16 Apr 2015 13:37:52 -0400
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t3GHbnlA028170
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Thu, 16 Apr 2015 13:37:50 -0400
Received: from zimbra39-e7.priv.proxad.net (unknown [172.20.243.189])
	by smtp3-g21.free.fr (Postfix) with ESMTP id B2ED5A6309
	for <linux-lvm@redhat.com>; Thu, 16 Apr 2015 19:35:30 +0200 (CEST)
Date: Thu, 16 Apr 2015 19:37:48 +0200 (CEST)
From: georges.giralt@free.fr
Message-ID: <441219761.721822832.1429205868173.JavaMail.root@zimbra39-e7.priv.proxad.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Booting through LVM. Possible ?
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hello !
I've got this new laptop which has a traditional disk and an M.2 NGFF SSD disk. So for the first time I'll plan to use LVM on a laptop. (I constantly use LVM at work on bare metal or virtual systems).
The disk of my laptop is 4K sector size, GPT partitioned with an EFI partition for some utilities and Windows boot, and the SSD can be partitioned. 
As I plan to install a very recent Ubuntu LTS release I wonder is I still need a plain partition for the /boot or if current Grub version can handle /boot out of an lvm lv ? 
I've seen a lot of negative answer so I ask "at the source" ;-)
Thank you in advance for your answer. 
