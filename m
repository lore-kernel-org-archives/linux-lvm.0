Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u52HIYqb017826
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Thu, 2 Jun 2016 13:18:34 -0400
Received: from friday.buadh-brath.com (drochaid.buadh-brath.com
	[45.33.103.245])
	(using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8EEF2C049D67
	for <linux-lvm@redhat.com>; Thu,  2 Jun 2016 17:18:33 +0000 (UTC)
Received: from 107-138-158-92.lightspeed.rlghnc.sbcglobal.net
	([107.138.158.92] helo=bdmcc-us.com)
	by friday.buadh-brath.com with esmtp (Exim 4.80)
	(envelope-from <bdmc@bdmcc-us.com>) id 1b8Vmo-0005UM-UH
	for linux-lvm@redhat.com; Thu, 02 Jun 2016 16:47:58 +0000
Received: from localhost (mail.bdmcc-us.com [192.168.1.133])
	by bdmcc-us.com (Postfix) with ESMTP id 301C1180302
	for <linux-lvm@redhat.com>; Thu,  2 Jun 2016 13:06:24 -0400 (EDT)
Date: Thu, 2 Jun 2016 13:06:23 -0400
From: Brian McCullough <bdmc@bdmcc-us.com>
Message-ID: <20160602170622.GA32445@bdmcc-us.com>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] Recovering from incomplete pvmove
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

A few days ago, I had, I now know, a drive failing and attempted a
pvmove.

According to what I could see, some data was recovered.  However, the
source drive is now scrap metal, from what the data recovery company
tells me, so I am wondering whether I can restore anything from the new
target drive.

Can you help?


Ubuntu 14.04.1 LTS
Kernel 3.13.0-86-generic
LVM version: 2.02.98(2) ( 2012-10-15 )
Library version: 1.02.77 ( 2012-10-15 )
Driver version: 4.22.0

Anything else that I can provide?


Thanks,
Brian
