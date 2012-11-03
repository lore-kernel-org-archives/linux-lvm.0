Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id qA34QTIv017662
	for <linux-lvm@redhat.com>; Sat, 3 Nov 2012 00:26:30 -0400
Received: from smtp3.pacifier.net (smtp3.pacifier.net [64.255.237.177])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id qA34QSWj031698
	for <linux-lvm@redhat.com>; Sat, 3 Nov 2012 00:26:29 -0400
Received: from laptop.localnet (ip136.133.dsl-acs2.pdx.iinet.com
	[209.20.133.136])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp3.pacifier.net (Postfix) with ESMTPS id 746EC38F2D
	for <linux-lvm@redhat.com>; Fri,  2 Nov 2012 21:26:28 -0700 (PDT)
From: ben <benscott@nwlink.com>
Date: Fri, 02 Nov 2012 21:26:26 -0700
Message-ID: <1999397.ymMrq1jpYJ@laptop>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Subject: [linux-lvm] Do thin volumes use allocation policy?
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
To: linux-lvm@redhat.com

Do thin volumes still use allocation policy like normal volumes?
That seems against the general idea of having a pool. Especially 
when the actual device in use isn't displayed anyhere.

The output of lvs show the allocation policy of thin volumes
as follows:

lvs
  LV    VG   Attr      LSize  Pool  Origin Data%  Move Log Copy%  Convert
  Pool1 vg01 twi-a-tz- 17.71g                0.00                        
  Thin1 vg01 Vwa-a-tz- 10.00g Pool1          0.00

The lvchange command and some of the others use allocation policy
on thin volumes too.
