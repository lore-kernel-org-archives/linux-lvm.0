Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iBENc7r11110
	for <linux-lvm@redhat.com>; Tue, 14 Dec 2004 18:38:07 -0500
Received: from tsmtp2.mail.isp (smtp.terra.es [213.4.129.129])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id iBENc5i6011850
	for <linux-lvm@redhat.com>; Tue, 14 Dec 2004 18:38:05 -0500
Received: from 211.Red-81-40-6.pooles.rima-tde.net
	([81.40.6.211]) by tsmtp2.mail.isp (terra.es) with ESMTP id
	I8QKBF01.I36 for <linux-lvm@redhat.com>;
	Wed, 15 Dec 2004 00:38:03 +0100 
From: Fernando Ruza <feruza@terra.es>
Message-Id: <1103067201.995.12.camel@luna.horche.gu>
Mime-Version: 1.0
Date: Wed, 15 Dec 2004 00:36:55 +0100
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Cannot create a Volume Group
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
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@redhat.com

Hi,

I have the following problem:

sol:~# pvcreate /dev/hda1 /dev/hda4 /dev/hdb1
  Physical volume "/dev/hda1" successfully created
  Physical volume "/dev/hda4" successfully created
  Physical volume "/dev/hdb1" successfully created
sol:~# vgcreate vg1 /dev/hda1 /dev/hda4 /dev/hdb1
  Volume group "vg1" successfully created

Everything seems to be create properly, however when now I'm trying to
activate the volume group or to scan it, it says it cannot found it:

sol:~# vgchange -a y vg1
  Unable to find volume group "vg1"
sol:~# vgscan
 No volume groups found

What's wrong here ?? Do I missing something ??

The versions I have are:

  lvm-common     1.5.17
  lvm2           2.00.29-1
  libdevmapper1. 1.00.19-4

Thanks for any reply.

Regards.

-- 
Yo uso software libre, �Y tu?
�Qu� es el software libre? consulta: http://www.gnu.org/philosophy/free-sw.es.html

Fernando Ruza 
e-mail: feruza@terra.es
jabber: fruza@jabber.guadawireless.net
web: http://guada24.guadawireless.net
Tlf: 661123845
Linux user: #273644 (http://counter.li.org)
Debian Sid (Kernel 2.4.20 & ext3)

"In an internet without fences ... who needs 'gates'"
