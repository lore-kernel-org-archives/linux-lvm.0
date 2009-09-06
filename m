Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.5])
	by int-mx03.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n86H3kXL013438
	for <linux-lvm@redhat.com>; Sun, 6 Sep 2009 13:03:46 -0400
Received: from ixe-mta-18.emailfiltering.com (ixe-mta-18-tx.emailfiltering.com
	[194.116.198.213])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n86H3Yjd018519
	for <linux-lvm@redhat.com>; Sun, 6 Sep 2009 13:03:35 -0400
Received: from smtp.media-brokers.com ([70.43.81.99])
	by ixe-mta-18.emailfiltering.com with emfmta (version
	4.0.0.434.1.rd-3.2.3-libc2.3.2) vanilla id 1324053516
	for linux-lvm@redhat.com; Sun, 06 Sep 2009 18:03:34 +0100
Received: from [192.168.1.110] (sjester.atl.media-brokers.com [192.168.1.110])
	by smtp.media-brokers.com (Postfix) with ESMTPSA id 65D6F506FCC
	for <linux-lvm@redhat.com>; Sun,  6 Sep 2009 13:03:33 -0400 (EDT)
Message-ID: <4AA3EB65.40909@Media-Brokers.com>
Date: Sun, 06 Sep 2009 13:03:33 -0400
From: Charles Marcus <CMarcus@Media-Brokers.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Inode usage on lvm volumes?
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Hello,

I've googled for an hour now and cannot find an answer to this question...

I'm on gentoo linux, and when I run:

df -i

I get a list of inode usage for everything except my lvm volumes - they
show zeros all the way across:

/dev/sda3            2501856   11865 2489991    1% /
udev                  257496    4956  252540    2% /dev
/dev/sda4            8437760      11 8437749    1% /backups
/dev/mapper/vg2-home       0       0       0    -  /home
/dev/mapper/vg2-usr        0       0       0    -  /usr
/dev/mapper/vg2-var        0       0       0    -  /var

Is this normal? If so, how do I check inode usage on an lvm volume?

Thanks,

Charles
