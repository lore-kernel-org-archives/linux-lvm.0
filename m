Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id i5OF1pvl015289
	for <linux-lvm@redhat.com>; Thu, 24 Jun 2004 16:01:51 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1BdVjb-0003hH-64
	for linux-lvm@redhat.com; Thu, 24 Jun 2004 16:01:51 +0100
Date: Thu, 24 Jun 2004 16:01:51 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] rootfs on lvm2 and vgchange: Can't deactivate volume
	group "vg_sys" with 4 open logical volume(s)
Message-ID: <20040624150151.GZ6302@agk.surrey.redhat.com>
References: <200406241548.26342.arekm@pld-linux.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200406241548.26342.arekm@pld-linux.org>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Thu, Jun 24, 2004 at 03:48:25PM +0200, Arkadiusz Miskiewicz wrote:
>   LVM version:     2.00.17 (2004-06-20)

Looks to be a bug in that version - thanks for the diagnostics;
I've fixed it in CVS and will issue 2.00.18 shortly.

Alasdair
-- 
agk@redhat.com
