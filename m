Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i2NHqrj24514
	for <linux-lvm@redhat.com>; Tue, 23 Mar 2004 12:52:53 -0500
Received: from mail.cs.umass.edu
	(IDENT:ZEIP2g/AafhUusCDcr6bD/hk/mWItxy7@loki.cs.umass.edu
	[128.119.243.168])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i2NHqqWA014747
	for <linux-lvm@redhat.com>; Tue, 23 Mar 2004 12:52:52 -0500
Received: from loki.cs.umass.edu
	(IDENT:+jClYgP9V0f8E9UaH7ugJMSf5LZ3vpkw@localhost [127.0.0.1])
	by mail.cs.umass.edu (8.12.10/8.12.5) with ESMTP id i2NHqojW021814
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <linux-lvm@redhat.com>; Tue, 23 Mar 2004 12:52:50 -0500
Received: from localhost (vijay@localhost)
	by loki.cs.umass.edu (8.12.10/8.12.5/Submit) with ESMTP id
	i2NHqoRB021811
	for <linux-lvm@redhat.com>; Tue, 23 Mar 2004 12:52:50 -0500
Date: Tue, 23 Mar 2004 12:52:50 -0500 (EST)
From: Vijay Sundaram <vijay@cs.umass.edu>
Message-ID: <Pine.LNX.4.44.0403231238320.15959-100000@loki.cs.umass.edu>
MIME-Version: 1.0
Subject: [linux-lvm] moving logical volumes online
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com


Hi,

I had the following questions:

1. Linux lvm has snapshot capability, but to make sure that all changes to
a logical volume have propogated to secondary storage it is recommended
that the logical volume be unmounted before the snapshot is taken. Is this
absolutely necessary?

2. The second question is regarding moving or migrating a logical volume 
from one volume group to another when the logical volume is online. 
	Taking snapshots allows one to create a backup, but my question
then essentially is: if one creates the backup on another volume group,
can one bring this backup up-to-date with any changes that may have been
made to the primary copy. I can then make this backup the primary copy and
delete the original copy.
	Of course, it is required that the logical volume be online and
functional (available) at all times.
	Does lvm have this capability, or does it already achieve it in a
transparent way?

thanks,
-- Vijay
