Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k9BHk4w8003785
	for <linux-lvm@redhat.com>; Wed, 11 Oct 2006 18:46:04 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1GXi9c-0003ZY-Cs
	for linux-lvm@redhat.com; Wed, 11 Oct 2006 18:46:04 +0100
Date: Wed, 11 Oct 2006 18:46:04 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] [RFC] Let udev play with snapshots
Message-ID: <20061011174604.GQ17654@agk.surrey.redhat.com>
References: <20061011173421.GC4636@hasse.suse.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20061011173421.GC4636@hasse.suse.de>
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

We discussed this at OLS and decided that lvm2 would wait
for udev to finish whatever it wanted to do before writing
to the cow.  A yet-to-be-specified signalling mechanism would be 
introduced to achieve this.

Alasdair
-- 
agk@redhat.com
