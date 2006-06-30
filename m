Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5U8dQXt032154
	for <linux-lvm@redhat.com>; Fri, 30 Jun 2006 04:39:26 -0400
Received: from vwclub.ro (lcx.at [213.239.193.148])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k5U8dIvT032206
	for <linux-lvm@redhat.com>; Fri, 30 Jun 2006 04:39:19 -0400
Date: Fri, 30 Jun 2006 10:39:17 +0200
From: Cristian Livadaru <drac3@vwclub.ro>
Message-ID: <20060630083916.GO20554@vwclub.ro>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] LV's have "disapeared"
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

I have created some new lv's for some tests.
What I did was based on this howto:

http://www.tldp.org/HOWTO/LVM-HOWTO/recipethreescsi.html

pvcreate /dev/hdk 
pvcreate /dev/hdi

vgcreate vhostvg /dev/hdk /dev/hdi

lvcreate -L1G -nvm01lv vhostvg 
ok and here I thinkg I made a big mistake!
since I had no partitions on my disks and I assumed that I needed one so
that it matches the LVM that was created by debian automaticaly I
created on both disks a partition and changed the type to 8e  Linux LVM.
I actualy worked with the lv's and everything is ok ( except my speed
problem but this is a other topic )
now after a rebbot, I only see the lv created by debian, not the one
that I kind of screwed up with my partitioning.

Is there a simple way to recover it? It's not that important that I
would wast to much time with it, it was just for testing anyway and I
could recreate them.

regards, Cristian Livadaru
--
http://livadaru.net
