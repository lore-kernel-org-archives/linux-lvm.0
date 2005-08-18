Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j7IFmQV19427
	for <linux-lvm@redhat.com>; Thu, 18 Aug 2005 11:48:26 -0400
Received: from tcmail21.telekom.de (tcmail21.telekom.de [217.6.95.235])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j7IFmNBE031200
	for <linux-lvm@redhat.com>; Thu, 18 Aug 2005 11:48:24 -0400
Received: from u8s17.ditscom.dsh.de (u8s17.ditscom.dsh.de [164.32.151.153]) by
	tcmail21.dmz.telekom.de with ESMTP for linux-lvm@redhat.com;
	Thu, 18 Aug 2005 17:48:18 +0200
Message-Id: <DF6FD933C3914D409E8CA14EE01A026C02F14AAE@e8sbh.ditscom.dsh.de>
From: Lutz.Reinegger@t-systems.com
Subject: RE: [linux-lvm] lvcreate --snapshot ---> file descriptor 7 left o pen?
Date: Thu, 18 Aug 2005 17:48:17 +0200
MIME-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Thanks for your speedy reply, Donald. I've appreciated that.
I am really glad to see that we are not the only ones messing around with
LVM2 snapshots and MySQL backups.
:)

>>> The 'flush tables with read lock' only persists as long as the connection is active.
Yes, I agree.

>>> I don't think you'll be able to do that directly in ksh
We are using a ksh coprocess + a command line MySQL client to issue the "flush tables with read lock" command;
then the script loops until the MySQL "Key_blocks_not_flushed" parameter reaches 0.
Subsequently the snapshot is taken; after completing the snapshot the locks are released
and the coprocess including the MySQL session is terminated.
I really "hope" this works as well as your approach.

But speaking of perl:
I am seriously considering porting my ksh script to perl because I am having some
trouble reading data from the coprocess.
So far I haven't found a way to read and check the "Query OK, 0 rows affected (Z.XY sec)"
from the MySQL client within the ksh coprocess.
But I am getting a bit of topic now...

Bye
Lutz
