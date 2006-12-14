Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	kBEF97Wn010528
	for <linux-lvm@redhat.com>; Thu, 14 Dec 2006 15:09:07 GMT
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1GusCp-00055Z-2f
	for linux-lvm@redhat.com; Thu, 14 Dec 2006 15:09:07 +0000
Date: Thu, 14 Dec 2006 15:09:07 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] vgimport/vgexport commands when logically moving
	disks between systems
Message-ID: <20061214150906.GT3614@agk.surrey.redhat.com>
References: <298476.26347.qm@web51103.mail.yahoo.com>
	<45815669.5000107@redhat.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <45815669.5000107@redhat.com>
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

On Thu, Dec 14, 2006 at 01:49:29PM +0000, Patrick Caulfield wrote:
> Yes. there are device-mapper patches for 2.4 but it's really recommended to run 2.6.

The 2.4 patches have not been updated for a long time so they include bugs
that got fixed in 2.6 and they are missing features.

Anyone fancy updating them?

Alasdair
-- 
agk@redhat.com
