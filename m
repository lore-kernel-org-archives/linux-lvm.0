Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i79HJua29466
	for <linux-lvm@redhat.com>; Mon, 9 Aug 2004 13:19:56 -0400
Received: from jinx.internetstaff.com (jinx.internetstaff.com [63.214.174.240])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i79HJte1031835
	for <linux-lvm@redhat.com>; Mon, 9 Aug 2004 13:19:55 -0400
Received: from localhost (localhost [127.0.0.1])
	by jinx.internetstaff.com (Postfix) with ESMTP id 16C324BC221
	for <linux-lvm@redhat.com>; Mon,  9 Aug 2004 10:19:55 -0700 (MST)
Received: from jinx.internetstaff.com ([127.0.0.1])
	by localhost (jinx [127.0.0.1]) (amavisd-new, port 10024) with LMTP
	id 04485-01-26 for <linux-lvm@redhat.com>;
	Mon,  9 Aug 2004 10:19:53 -0700 (MST)
Received: from [10.10.3.135] (unknown [65.161.175.218])
	by jinx.internetstaff.com (Postfix) with ESMTP id ADE2D4BC0B4
	for <linux-lvm@redhat.com>; Mon,  9 Aug 2004 10:19:53 -0700 (MST)
Subject: Re: [linux-lvm] SAN Storage/mirror/lvm
From: Cott Lang <cott@internetstaff.com>
Message-Id: <1092071992.3369.48.camel@localhost>
Mime-Version: 1.0
Date: Mon, 09 Aug 2004 10:19:53 -0700
Content-Transfer-Encoding: 7bit
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
To: linux-lvm@redhat.com

>I setup a similar system on a HDS-9570 but with only one
>card in each machine - 'assuming' that the failover in the
>driver would cope if a controller on the HDS failed (as
>opposed to a QLogic failure)
>
>This worked fine if I disconncected a path in the fabric but
>when we took a controller of line the failover failed.
>
>Since then I have used md multipath which has tested fine

I have a similar issue, two storage processors, two HBAs, and
redundant paths between them.

On the host, I see 4 SCSI devices, two valid, two invalid - I'm 
guessing this is caused because only one storage processor exports
a particular LUN, so half the paths are invalid until a storage
processor fails over.

sdd - SP A Path 1
sde - SP B Path 1
sdf - SP A Path 2
sdg - SP B Path 2

I have a LUN currently on SP B, so I can use md multipath configured 
with /dev/sde and /dev/sdg, and that seems to work.

However, two things:

1) How do I set this up to handle a failover to SP A?
2) Multipath only seems to work in failover mode, is there a way to
load balance across the two paths?

Anyone have any hints?  :)
