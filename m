Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id iBCHtPH6025138
	for <linux-lvm@redhat.com>; Sun, 12 Dec 2004 17:55:25 GMT
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1CdXwL-0002Eo-QD
	for linux-lvm@redhat.com; Sun, 12 Dec 2004 17:55:25 +0000
Date: Sun, 12 Dec 2004 17:55:25 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] shrink pv without pvresize (FC3 LVM)
Message-ID: <20041212175525.GP11338@agk.surrey.redhat.com>
References: <41BA294D.5090605@pitt.edu>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <41BA294D.5090605@pitt.edu>
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

On Fri, Dec 10, 2004 at 05:55:09PM -0500, Ilya Goldin wrote:
> Why can't it get the geometry? Does LVM support FAT32 LVs? Does mkdosfs
> support LVM?
 
ioctl(3, HDIO_GETGEO, 0xbffffa8c)       = -1 ENOTTY (Inappropriate ioctl for device)

Something probably needs to make up a geometry.

Alasdair
-- 
agk@redhat.com
