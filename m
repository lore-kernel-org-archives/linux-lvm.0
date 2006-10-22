Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k9MBC2jE015407
	for <linux-lvm@redhat.com>; Sun, 22 Oct 2006 12:12:02 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1GbbFK-0004yr-Kk
	for linux-lvm@redhat.com; Sun, 22 Oct 2006 12:12:02 +0100
Date: Sun, 22 Oct 2006 12:12:02 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] LVM2 Snapshots Question
Message-ID: <20061022111202.GE17654@agk.surrey.redhat.com>
References: <20061022110659.82422.qmail@web52911.mail.yahoo.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20061022110659.82422.qmail@web52911.mail.yahoo.com>
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

On Sun, Oct 22, 2006 at 04:06:59AM -0700, Rik Herrin wrote:
> Does this mean that I don't have to unmount (or remount ro) a partition if
> I'm using a 2.6 kernel to take a snapshot and I can rest assured that the
> logical volume will be in a consistent state?  Thanks for your help.
 
Yes, in principle; but there was a bug in userspace lvm2 for a while
(fixed in 2.02.08 - introduced around 2.02.02?) and there are problems
with a mistaken semaphone/mutex change someone put into some recent kernels
around 2.6.18.

Alasdair
-- 
agk@redhat.com
