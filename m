Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id j71DcqRm024929
	for <linux-lvm@redhat.com>; Mon, 1 Aug 2005 14:38:52 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1DzaVI-0006xf-Ft
	for linux-lvm@redhat.com; Mon, 01 Aug 2005 14:38:52 +0100
Date: Mon, 1 Aug 2005 14:38:52 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] vgexport/vgimport fails
Message-ID: <20050801133852.GI4985@agk.surrey.redhat.com>
References: <Pine.LNX.4.62.0508010816320.27345@rray.drdc.mstc.ms.gov>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.62.0508010816320.27345@rray.drdc.mstc.ms.gov>
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

Run vgscan -vvvv and look for the reason it
gives for ignoring the disks.

Alasdair
