Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	l0GNDaxS002968
	for <linux-lvm@redhat.com>; Tue, 16 Jan 2007 23:13:36 GMT
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1H6xUm-00055S-SF
	for linux-lvm@redhat.com; Tue, 16 Jan 2007 23:13:36 +0000
Date: Tue, 16 Jan 2007 23:13:36 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] MAX LV
Message-ID: <20070116231336.GR21980@agk.surrey.redhat.com>
References: <Pine.LNX.4.64.0701161644370.22063@rray.drdc.mstc.ms.gov>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.64.0701161644370.22063@rray.drdc.mstc.ms.gov>
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

On Tue, Jan 16, 2007 at 04:49:26PM -0600, Richard Ray wrote:
> Using vgdisplay shows MAX LV 0 on volume groups.
> I understand that this is the maximum number of logical volumes for this 
> volume group.
> Does 0 mean unlimited?

On LVM2, yes - see vgcreate -l.

Alasdair
-- 
agk@redhat.com
