Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i55HMY017012
	for <linux-lvm@redhat.com>; Sat, 5 Jun 2004 13:22:34 -0400
Received: from salusa.poochiereds.net (rdu26-93-067.nc.rr.com [66.26.93.67])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i55HMXi5026863
	for <linux-lvm@redhat.com>; Sat, 5 Jun 2004 13:22:33 -0400
Received: from localhost (localhost [127.0.0.1])
	by salusa.poochiereds.net (Postfix) with ESMTP id D4D3ECE43
	for <linux-lvm@redhat.com>; Sat,  5 Jun 2004 13:22:23 -0400 (EDT)
Received: from salusa.poochiereds.net ([127.0.0.1])
	by localhost (salusa [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 25931-01 for <linux-lvm@redhat.com>;
	Sat, 5 Jun 2004 13:22:23 -0400 (EDT)
Received: from localhost (tleilax.poochiereds.net [192.168.1.3])
	by salusa.poochiereds.net (Postfix) with ESMTP id E94B9AA51
	for <linux-lvm@redhat.com>; Sat,  5 Jun 2004 13:22:22 -0400 (EDT)
From: Jeff Layton <jtlayton@poochiereds.net>
Content-Transfer-Encoding: 7bit
Message-Id: <1086456141.30408.3.camel@localhost>
Mime-Version: 1.0
Date: Sat, 05 Jun 2004 13:22:21 -0400
Subject: [linux-lvm] New lvm2create_initrd version
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
To: LVM general discussion and development <linux-lvm@redhat.com>

I've just comitted a new version of the lvm2create_initrd script to my
SVN repository:

http://poochiereds.net/svn/lvm2

This version adds support for different MAKEDEV invocations, settable
via a command-line switch (and env var too). I've also added a manpage
for the script with some usage notes as well.

I'm particularly interested in having someone with a RedHat or Fedora
machine test this out, as I don't have one to test this on. Also I'd be
happy to add support for other versions of MAKEDEV as well, if other
distribs programs take different options.

Thanks!
-- 
Jeff Layton <jtlayton@poochiereds.net>
