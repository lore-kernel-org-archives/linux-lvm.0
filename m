Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i19HpCa26189
	for <linux-lvm@redhat.com>; Mon, 9 Feb 2004 12:51:12 -0500
Received: from salusa.ix.dyndns.org (rdu26-93-067.nc.rr.com [66.26.93.67])
	by mx1.redhat.com (8.11.6/8.11.6) with SMTP id i19HpCb16390
	for <linux-lvm@redhat.com>; Mon, 9 Feb 2004 12:51:12 -0500
Received: from localhost (localhost [127.0.0.1])
	by salusa.ix.dyndns.org (Postfix) with ESMTP id 892FD7188
	for <linux-lvm@redhat.com>; Mon,  9 Feb 2004 12:51:11 -0500 (EST)
Received: from salusa.ix.dyndns.org ([127.0.0.1])
	by localhost (salusa [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 19400-08 for <linux-lvm@redhat.com>;
	Mon, 9 Feb 2004 12:51:11 -0500 (EST)
Received: from localhost (salusa.ix.dyndns.org [192.168.1.2])
	by salusa.ix.dyndns.org (Postfix) with ESMTP id 0F049378B
	for <linux-lvm@redhat.com>; Mon,  9 Feb 2004 12:51:11 -0500 (EST)
From: Jeffrey Layton <jtlayton@poochiereds.net>
Message-Id: <1076349070.25356.7.camel@tesla.mmt.bellhowell.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] lvm2_createinitrd
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
Date: Mon Feb  9 12:50:07 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

I tried to send this to the mailing list this weekend, but it didn't go
through for some reason. Maybe the list doesn't like attachments?

In any case, I've made a first pass at an lvm2create_initrd script. It's
essentially a modified version of the lvm1 script, with some info
borrowed from Christope Saout's LVM2 initrd image.

It probably needs some more work, but is currently at the 'works for me'
stage. You can download it from my subversion repository at:

http://poochiereds.net/svn/lvm2create_initrd/

Patches are welcome. Please send them on if you have any to contribute!

Enjoy,
Jeff
