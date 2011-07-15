Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p6F2kPZ3026056
	for <linux-lvm@redhat.com>; Thu, 14 Jul 2011 22:46:25 -0400
Received: from new-smtp01.pacifier.net (new-smtp01.pacifier.net
	[64.255.237.177])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p6F2kNKi024139
	for <linux-lvm@redhat.com>; Thu, 14 Jul 2011 22:46:23 -0400
Received: from laptop.localnet (ip136.133.dsl-acs2.pdx.iinet.com
	[209.20.133.136])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: benscott@nwlink.com)
	by new-smtp01.pacifier.net (Postfix) with ESMTPSA id D59002CA45
	for <linux-lvm@redhat.com>; Thu, 14 Jul 2011 19:46:22 -0700 (PDT)
From: ben <benscott@nwlink.com>
Date: Thu, 14 Jul 2011 19:46:12 -0700
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <201107141946.12747.benscott@nwlink.com>
Subject: [linux-lvm] merging snapshots and lvs bug
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
Content-Type: Text/Plain; charset="us-ascii"
To: linux-lvm@redhat.com

Currently the first field of the attribute bits are set to 's' for a snapshot 
and 'S' for a merging snap. Unfortunatly 'S' was used for an invalid snapshot 
and lvs still uses it both ways. 

  LVM version:     2.02.86(2) (2011-07-08)
  Library version: 1.02.65 (2011-07-08)
  Driver version:  4.20.0
