Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id s47A4Ykl013742
	for <linux-lvm@redhat.com>; Wed, 7 May 2014 06:04:34 -0400
Received: from nm39-vm5.bullet.mail.bf1.yahoo.com
	(nm39-vm5.bullet.mail.bf1.yahoo.com [72.30.239.149])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s47A4Whc022702
	for <linux-lvm@redhat.com>; Wed, 7 May 2014 06:04:33 -0400
References: <1399447987.73696.YahooMailNeo@web141603.mail.bf1.yahoo.com>
	<5369FFAB.2040701@redhat.com>
Message-ID: <1399457072.41382.YahooMailNeo@web141606.mail.bf1.yahoo.com>
Date: Wed, 7 May 2014 03:04:32 -0700 (PDT)
From: Mahmood Naderan <nt_mahmood@yahoo.com>
In-Reply-To: <5369FFAB.2040701@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Add a disk from remote node to LVM
Reply-To: Mahmood Naderan <nt_mahmood@yahoo.com>,
	LVM general discussion and development <linux-lvm@redhat.com>
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>




>How do you mean "remote drive" exactly? What type is it - is it iscsi, nbd...?

There are two nodes in a single rack. Each has 4 slots for SATAII disks. Current configuration is


N1: /dev/sda, /dev/sdb, /dev/sdc, /dev/sdd where the last three (b, c, d) are grouped in in a single LVM volume.


N2: /dev/sda, /dev/sdb where the last one (b) is free and I want to add it to the LVM of N1.

Each node is running an independent operating system (scientific linux)Currently /dev/sdb on N2 is not shared. I have just format it as ext4 (which is the same format as the LVM of N1).



>But essentially, you need to connect the remote drive first and then do a pvcreate and vgextend.

Should I run these commands on N1 or N2?

Regards,
Mahmood
