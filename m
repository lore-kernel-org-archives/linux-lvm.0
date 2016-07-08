Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u69BsYZD005520
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Sat, 9 Jul 2016 07:54:34 -0400
Received: from friday.buadh-brath.com (drochaid.buadh-brath.com
	[45.33.103.245])
	(using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 29B9263E0E
	for <linux-lvm@redhat.com>; Sat,  9 Jul 2016 11:54:34 +0000 (UTC)
Received: from 107-138-158-92.lightspeed.rlghnc.sbcglobal.net
	([107.138.158.92] helo=buadh-brath.com)
	by friday.buadh-brath.com with esmtp (Exim 4.80)
	(envelope-from <bdmc@mail.buadh-brath.com>) id 1bLqNO-0000NK-0j
	for linux-lvm@redhat.com; Sat, 09 Jul 2016 11:24:50 +0000
Date: Fri, 8 Jul 2016 11:52:31 -0400
From: Brian McCullough <bdmc@bdmcc-us.com>
Message-ID: <20160708155231.GA27423@bdmcc-us.com>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] Copying a raw disk image to LVM2
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


I have been hunting for some time over the past couple of days, and find
several documentss that talk about converting from an LVM2 volume to a
raw disk image for Xen, but nothing about the reverse.

I have a VHD disk file that I would like to put on to an LVM2 volume,
like my other DomU guests.

I can see using dd, but am concerned about overwriting the LVM2 header.


Does anybody have any suggestions?


Thanks,
Brian
