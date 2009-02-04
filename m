Received: from agk.fab.redhat.com (agk.fab.redhat.com [10.33.0.19])
	by ns3.rdu.redhat.com (8.13.8/8.13.8) with ESMTP id n141vhKC014184
	for <linux-lvm@redhat.com>; Tue, 3 Feb 2009 20:57:43 -0500
Received: from agk by agk.fab.redhat.com with local (Exim 4.34)
	id 1LUX1K-0006x9-D7
	for linux-lvm@redhat.com; Wed, 04 Feb 2009 01:57:42 +0000
Date: Wed, 4 Feb 2009 01:57:42 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] What causes this type of messages
Message-ID: <20090204015742.GL20668@agk.fab.redhat.com>
References: <20090204011132.GK20668@agk.fab.redhat.com>
	<4905EFD192EEDF4A9A19EEE98C32B7F70EFB4B52@DBQV3005.na.corp.mckesson.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4905EFD192EEDF4A9A19EEE98C32B7F70EFB4B52@DBQV3005.na.corp.mckesson.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

This was tweaked last in version 2.02.29 and previously in 2.02.11.
(Compare the lvm2 version with those.)

My favorite way to touch the metaata is vgchange -xn followed by vgchange -xy
to put it back (assuming it had that default setting which hardly anyone
changes).

Alasdair
-- 
agk@redhat.com
