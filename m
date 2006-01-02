Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k02IP4131657
	for <linux-lvm@redhat.com>; Mon, 2 Jan 2006 13:25:04 -0500
Received: from hermesnew.ex.ac.uk (dot.ex.ac.uk [144.173.6.11])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id k02IOuRa010035
	for <linux-lvm@redhat.com>; Mon, 2 Jan 2006 13:25:01 -0500
Received: from dogbert.ex.ac.uk ([144.173.228.2] helo=dogbert)
	by hermesnew.ex.ac.uk with esmtps (Exim 4.50/mail)
	id 1EtUMV-00021s-Nh
	for linux-lvm@redhat.com; Mon, 02 Jan 2006 18:24:51 +0000
Received: from localhost ([127.0.0.1]) by dogbert with esmtp (Exim 4.43)
	id 1EtUPv-0001Z9-VZ
	for linux-lvm@redhat.com; Mon, 02 Jan 2006 18:28:24 +0000
From: John Rowe <rowe@excc.ex.ac.uk>
Date: Mon, 02 Jan 2006 18:28:23 +0000
Message-Id: <1136226503.2785.9.camel@dogbert>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] RAID 5 recovery?
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

Due to an extended power outage over the new year, I have a RAID5 array
with two dirty devices so it won't come up. The HOWTO suggests running:

 mdadm --assemble --force

Is this good advice? I'm running RedHat 9 so I don't have mdadm but of
course I'm happy to install it.

Thanks

John
