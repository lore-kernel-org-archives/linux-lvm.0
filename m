Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id i5TE8Mvl028677
	for <linux-lvm@redhat.com>; Tue, 29 Jun 2004 15:08:22 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1BfJHa-0003J2-1h
	for linux-lvm@redhat.com; Tue, 29 Jun 2004 15:08:22 +0100
Date: Tue, 29 Jun 2004 15:08:22 +0100
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20040629140822.GF8838@agk.surrey.redhat.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] LVM2 Release 2.00.19
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

ftp://sources.redhat.com/pub/lvm2/LVM2.2.00.19.tgz
http://sources.redhat.com/lvm2/
  
  Add init_debug to clvmd.
  Reduce severity of setlocale failure message.
  Added --disable-selinux to configure script.
  LD_FLAGS->LDFLAGS & LD_DEPS->LDDEPS in configure script.
  Make -O2 configurable.
  Recognise argv[0] "initrd-lvm" (pld-linux).

Alasdair
-- 
agk@redhat.com
