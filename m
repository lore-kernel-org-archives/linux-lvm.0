Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i5BFCK003233
	for <linux-lvm@redhat.com>; Fri, 11 Jun 2004 11:12:20 -0400
Date: Fri, 11 Jun 2004 17:33:31 +0200
From: Jedi/Sector One <j@pureftpd.org>
Message-ID: <20040611153353.GA2025@c9x.org>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] dm-multipath without round robin
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
Content-Transfer-Encoding: 7bit
To: Linux-LVM@Sistina.com


  Hi Heinz.
  
  I'm awfully sorry for directly asking for help to you, but I'm cranking my
head on an issue you might have an immediate answer for.

  By default, dm-mpath-selector seems to always does round-robin between all
paths.

  Is there a way to do simple failover instead or round-robin, ie. define a
preferred path and keep the other one as a spare?

  It seems possible with md multipath, but then there is no way to create an
DM RAID0 over these md devices.

  Hope you can help,

       -Frank.
       
