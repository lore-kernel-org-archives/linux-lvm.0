Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id j6NF7WUJ020089
	for <linux-lvm@redhat.com>; Sat, 23 Jul 2005 16:07:32 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1DwLbA-0001tI-1W
	for linux-lvm@redhat.com; Sat, 23 Jul 2005 16:07:32 +0100
Date: Sat, 23 Jul 2005 16:07:32 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] LVM / File descriptor .. left open / Snapshot-Problems
Message-ID: <20050723150732.GG23710@agk.surrey.redhat.com>
References: <200507231644.26202.Juergen.Vollmer@informatik-vollmer.de>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <200507231644.26202.Juergen.Vollmer@informatik-vollmer.de>
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
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

On Sat, Jul 23, 2005 at 04:44:22PM +0200, Dr. J�rgen Vollmer wrote:
> > lvdisplay
> File descriptor 10 left open �<<<<<<< what does this tell me?
> File descriptor 11 left open

Whatever program is execing lvdisplay is not closing all its
file descriptors first.  It's warning you because sometimes 
this can lead to security problems.
You can use strace or lsof to work out where they have come from.

Alasdair
