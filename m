Received: from agk.fab.redhat.com (agk.fab.redhat.com [10.33.0.19])
	by ns3.rdu.redhat.com (8.13.8/8.13.8) with ESMTP id mA51V44Z006070
	for <linux-lvm@redhat.com>; Tue, 4 Nov 2008 20:31:04 -0500
Received: from agk by agk.fab.redhat.com with local (Exim 4.34)
	id 1KxXEe-0007iO-02
	for linux-lvm@redhat.com; Wed, 05 Nov 2008 01:31:04 +0000
Date: Wed, 5 Nov 2008 01:31:03 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] reading lun snapshots with identical lvm information
	on them on one machine
Message-ID: <20081105013103.GL14593@agk.fab.redhat.com>
References: <8D07631D47C3CB4F867AD7BCF07D5C232C87@excs01.bucoks>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8D07631D47C3CB4F867AD7BCF07D5C232C87@excs01.bucoks>
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

On Tue, Nov 04, 2008 at 07:23:39PM -0600, James A. Dinkel wrote:
> I have 4 san luns attached to a RedHat EL 5.2 server. Each partitioned with a
> single lvm partition, making up a single volume group. I've created a
> snapshot of these luns on the san and reattached the 4 snapshot luns back to
> the same server.
 
Making sure you know which are original and which are snapshot, run pvchange -u
on the snapshot ones, then vgchange -u and vgrename.

Use a filter in lvm.conf (env var LVM_SYSTEM_DIR to use different one if this is
an automated process, not a one-off) or with --config on each command so only
the snapshot devices are visible.

Alasdair
-- 
agk@redhat.com
