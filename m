Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id j7VFkpHQ005296
	for <linux-lvm@redhat.com>; Wed, 31 Aug 2005 16:46:51 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1EAUnb-0004J8-F7
	for linux-lvm@redhat.com; Wed, 31 Aug 2005 16:46:51 +0100
Date: Wed, 31 Aug 2005 16:46:51 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] vgscan & CDROM Solved
Message-ID: <20050831154651.GD15141@agk.surrey.redhat.com>
References: <20050829200548.GB11271@gutek.swissptt.ch>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20050829200548.GB11271@gutek.swissptt.ch>
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

And only *the first* 'filter=' setting gets used - others
are ignored.  

For now, I've added a warning to the example.conf comments.

We'll update the code to handle this better some day,
probably by concatenating items with identical names into
lists as we load them in.  

[If anyone wants to offer a patch, it starts with _file() 
in lib/config/config.c: before the parser adds each new node 
to the tree, check for a duplicate identifier within the
same section and append/convert the entries as appropriate.]

Alasdair
-- 
agk@redhat.com
