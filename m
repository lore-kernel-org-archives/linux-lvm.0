Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id i9FIfXuA016249
	for <linux-lvm@redhat.com>; Fri, 15 Oct 2004 19:41:33 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1CIX1B-0001EQ-QH
	for linux-lvm@redhat.com; Fri, 15 Oct 2004 19:41:33 +0100
Date: Fri, 15 Oct 2004 19:41:33 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] PV corruption: allocated PE > total PE
Message-ID: <20041015184133.GS24242@agk.surrey.redhat.com>
References: <200410120841.14323@trumpet.tarind.com>
	<20041012131024.GR6404@agk.surrey.redhat.com>
	<200410130001.19680@trumpet.tarind.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200410130001.19680@trumpet.tarind.com>
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
To: linux-lvm@redhat.com

I still can't reproduce this.

Please do a metadata backup/restore using 2.00.25 to make sure the
on-disk metadata is correct, then try again.

If it still goes wrong, please send me your /etc/lvm directory
to investigate.

Alasdair
-- 
agk@redhat.com
