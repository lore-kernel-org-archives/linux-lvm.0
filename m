Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.9])
	by int-mx05.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o1OGGcac001902
	for <linux-lvm@redhat.com>; Wed, 24 Feb 2010 11:16:38 -0500
Received: from fela.liber4e.com (fela.liber4e.com [208.77.96.130])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o1OGGMPh007203
	for <linux-lvm@redhat.com>; Wed, 24 Feb 2010 11:16:22 -0500
Received: from fela.liber4e.com (fela.liber4e.com [127.0.0.1])
	by fela.liber4e.com (8.14.2/8.14.2) with ESMTP id o1OGEKuR023955
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Wed, 24 Feb 2010 16:14:31 GMT
Message-ID: <ece181eaa6b6652da66cb42699955e87.squirrel@fela.liber4e.com>
Date: Wed, 24 Feb 2010 16:14:20 -0000 (GMT)
From: "jose nuno neto" <jose.neto@liber4e.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Mirror fail/recover test
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
To: linux-lvm@redhat.com

Hi

I'm trying to test the failure of a SAN Mirrored Lv, and the recover and
check for data lost.

Im runing RedHat 5.4
2.6.18-164.2.1.el5
lvm2-2.02.46-8.el5_4.1

I create a 2mirror+log lv ok, can lvconvert to one leg only, can delete ok.
But when I simulate a disk fail either with
dd if=/dev/zero of=pvmirror_device
echo offline > /sys/block/pvmirror_device/device/status

lvs -a -o +devices
stills shows the lv has mirrored ( should switch to non-mirrored right?) ,
and show Unknonwn device on the pvmirror_device I destroy

When I issue a lvconvert -m 0 complains about pv --uuid not found, if I
try to pvcreate --uuid pvmirror_device I got a error complaining about
still mounted device
If I try lvconvert --repair i hangs forever

What should be the correct procedure to recover from this?

Thanks
Jose

-- 
This message has been scanned for viruses and
dangerous content by MailScanner, and is
believed to be clean.
