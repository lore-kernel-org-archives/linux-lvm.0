Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id i9CDAOS9017005
	for <linux-lvm@redhat.com>; Tue, 12 Oct 2004 14:10:24 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1CHMQ4-0004uJ-QI
	for linux-lvm@redhat.com; Tue, 12 Oct 2004 14:10:24 +0100
Date: Tue, 12 Oct 2004 14:10:24 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] PV corruption: allocated PE > total PE
Message-ID: <20041012131024.GR6404@agk.surrey.redhat.com>
References: <200410120841.14323@trumpet.tarind.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200410120841.14323@trumpet.tarind.com>
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

On Tue, Oct 12, 2004 at 08:41:14AM +0100, Toby Dickenson wrote:
> Ive just noticed that one of my PVs has more allocated PE's than the total 
> available, leading to a negative amount of free space:
 
> This is on a gentoo linux system, kernel 2.6.6. The latest LVM userland in 
> gentoo is 2.00.08, I havent tried anything more recent, but there doesnt seem 
> anything relevant in the change log. 

Definitely try the latest version: there've been a few related fixes.
(With lvm1 on-disk format, may need to backup restore/metadata if it's 
wrong on disk.)

Alasdair
-- 
agk@redhat.com
