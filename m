Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id i8BKXZrI025995
	for <linux-lvm@redhat.com>; Sat, 11 Sep 2004 21:33:35 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1C6EYx-00014t-4g
	for linux-lvm@redhat.com; Sat, 11 Sep 2004 21:33:35 +0100
Date: Sat, 11 Sep 2004 21:33:35 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] initrd for LVM2 root partition
Message-ID: <20040911203335.GF1094@agk.surrey.redhat.com>
References: <B825AF1D-042F-11D9-9080-000A95C71776@freezone.co.uk>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <B825AF1D-042F-11D9-9080-000A95C71776@freezone.co.uk>
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

On Sat, Sep 11, 2004 at 01:18:18PM -0700, ms419@freezone.co.uk wrote:
> How does one manually build an initrd to mount an LVM2 root partition?
 
Look at scripts/lvm2create_initrd/ in the source tarball.

Alasdair
-- 
agk@redhat.com
