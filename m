Received: from agk.fab.redhat.com (agk.fab.redhat.com [10.33.0.19])
	by pobox.surrey.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	l3EErt4s024513
	for <linux-lvm@redhat.com>; Sat, 14 Apr 2007 15:53:55 +0100
Received: from agk by agk.fab.redhat.com with local (Exim 4.34)
	id 1HcjdT-0006TA-7H
	for linux-lvm@redhat.com; Sat, 14 Apr 2007 15:53:55 +0100
Date: Sat, 14 Apr 2007 15:53:55 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Limitation: only < 32 snapshots possible
Message-ID: <20070414145355.GJ26983@agk.fab.redhat.com>
References: <4620D6A7.1090806@dtnet.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4620D6A7.1090806@dtnet.de>
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

On Sat, Apr 14, 2007 at 03:27:03PM +0200, Daniel Schwager wrote:
> QUESTION: Is this limitiation fixed in the current version 2.02.24 from 
> ftp://sources.redhat.com/pub/lvm2
 
These are limitations of the existing kernel implementation, not userspace.

Alasdair
-- 
agk@redhat.com
