Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j36IHbO01623
	for <linux-lvm@redhat.com>; Wed, 6 Apr 2005 14:17:37 -0400
Received: from mail.inostor.com (w130.z209220038.sjc-ca.dsl.cnc.net
	[209.220.38.130])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j36IHVfX000752
	for <linux-lvm@redhat.com>; Wed, 6 Apr 2005 14:17:31 -0400
From: "James G. Sack (jim)" <jsack@inostor.com>
Message-Id: <1112811461.2396.12.camel@jgs3>
Mime-Version: 1.0
Date: 06 Apr 2005 11:17:42 -0700
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] [MINOR REQUEST] snapshot timestamps should be time of
	creation
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

I notice that the timestamp on a snapshot gets set to the mtime of the
origin volume (at least it works that way on LVM1). 

I suggest it would be more meaningful to users if the snapshot time
could be made the time of snapshot creation.

I am currently 'touch'ing the origin filesystem before calling lvcreate,
in order to get the snapshot to stat the way I like, but it may be
argued that touching the origin is not desirable (the origin may even be
unmounted, of course).

..jim
