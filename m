Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id lB5NaqRO011531
	for <linux-lvm@redhat.com>; Wed, 5 Dec 2007 18:36:52 -0500
Received: from biostat.ucsf.edu (upstrm185.psg-ucsf.org [38.99.193.74])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id lB5NaWwG001779
	for <linux-lvm@redhat.com>; Wed, 5 Dec 2007 18:36:32 -0500
From: Ross Boylan <ross@biostat.ucsf.edu>
In-Reply-To: <1196895938.23282.15.camel@corn.betterworld.us>
References: <1196895938.23282.15.camel@corn.betterworld.us>
Content-Transfer-Encoding: 7bit
Date: Wed, 05 Dec 2007 15:36:18 -0800
Message-Id: <1196897778.23282.33.camel@corn.betterworld.us>
Mime-Version: 1.0
Subject: [linux-lvm] Re: snapshot has post-snapshot files
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
To: linux-lvm@redhat.com

It might also be relevant that the origin of the snapshot is mounted
noatime for an ext3 filesystem:
/dev/mapper/daisy-cyrlib on /var/lib/cyrus type ext3 (rw)
/dev/mapper/daisy-cyrspool on /var/spool/cyrus type ext3 (rw,noatime)

I'm guessing I should have mounted the snapshots ro, but I haven't been
writing to them.

Ross
