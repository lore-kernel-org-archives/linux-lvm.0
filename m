Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i1CIefi24981
	for <linux-lvm@redhat.com>; Thu, 12 Feb 2004 13:40:41 -0500
Received: from office.labsysgrp.com (wsip-68-14-253-125.ph.ph.cox.net [68.14.253.125])
	by mx1.redhat.com (8.11.6/8.11.6) with SMTP id i1CIefb18535
	for <linux-lvm@redhat.com>; Thu, 12 Feb 2004 13:40:41 -0500
Received: from [127.0.0.1] (helo=localhost)
	by office.labsysgrp.com with esmtp (Exim 4.24)
	id 1ArLlL-0008Ld-LF
	for linux-lvm@redhat.com; Thu, 12 Feb 2004 11:40:35 -0700
Received: from office.labsysgrp.com ([127.0.0.1])
 by localhost (office.lsg.internal [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 31634-05 for <linux-lvm@redhat.com>;
 Thu, 12 Feb 2004 11:40:25 -0700 (MST)
Received: from jeeves.kpf.internal ([192.168.170.1])
	by office.labsysgrp.com with esmtp (Exim 4.24)
	id 1ArLlB-0008LW-7z
	for linux-lvm@redhat.com; Thu, 12 Feb 2004 11:40:25 -0700
Received: from [192.168.172.107] (helo=backtobasicsmgmt.com)
	by jeeves.kpf.internal with esmtp (Exim 4.05)
	id 1ArLlA-0000m9-00
	for linux-lvm@redhat.com; Thu, 12 Feb 2004 11:40:24 -0700
Message-ID: <402BC89E.6020606@backtobasicsmgmt.com>
From: "Kevin P. Fleming" <kpfleming@backtobasicsmgmt.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Re: LVM2 on top of RAID1? (x86_64)
References: <20040212100955.3b79511c.kilpatds@oppositelock.org> <402BBAEF.8000508@comedia.it>
In-Reply-To: <402BBAEF.8000508@comedia.it>
Content-Transfer-Encoding: 7bit
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Thu Feb 12 13:40:04 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Luca Berra wrote:

> i still believe it would be better if lvm ignored md component devices 
> completely.

In kernel 2.6 land this is easy to do as well (for everything, not just 
MD). When vgscan tries to open the device to read metadata, open it with 
O_EXCL. If any other kernel subsystem is currently using the device, 
then the open() will fail and vgscan can ignore the device.
