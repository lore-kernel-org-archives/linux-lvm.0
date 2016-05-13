Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u4DAdcNw019378
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Fri, 13 May 2016 06:39:38 -0400
Received: from mr001msb.fastweb.it (mr001msb.fastweb.it [85.18.95.85])
	by mx1.redhat.com (Postfix) with ESMTP id 5E58290E45
	for <linux-lvm@redhat.com>; Fri, 13 May 2016 10:39:35 +0000 (UTC)
Received: from ceres.assyoma.it (93.63.55.57) by mr001msb.fastweb.it
	(8.5.140.04) id 572A17230083AF12 for linux-lvm@redhat.com;
	Fri, 13 May 2016 12:39:33 +0200
Received: from gdanti-laptop.assyoma.it (unknown [172.31.255.5])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by ceres.assyoma.it (Postfix) with ESMTPSA id E433C288279
	for <linux-lvm@redhat.com>; Fri, 13 May 2016 12:39:32 +0200 (CEST)
From: Gionatan Danti <g.danti@assyoma.it>
Message-ID: <5735AEE4.4080402@assyoma.it>
Date: Fri, 13 May 2016 12:39:32 +0200
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Backup superblock for thin provision?
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi all,
using thin provisioning in production machines (using it mostly for its 
fast snapshot support, rather than for thin provision / storage 
overcommit by itself), I wonder what to do if a critical metadata 
corruption, as the loss of the superblock, should happen.

Filesystems generally have some backup copy of the superblock; should 
the primary one fail, another copy can be used.

So I have the following questions:
- how about thin LVM? Has it a backup superblock somewhere?
- how can the metadata be reliable backupped without shutting down the 
volume?
- more generally, how to deal with metadata backup? Does vgcfgrestore 
works for thin volumes?

Thank you all.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
