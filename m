Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k7BI6s1P018643
	for <linux-lvm@redhat.com>; Fri, 11 Aug 2006 19:06:54 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1GBbPK-0000Ye-QS
	for linux-lvm@redhat.com; Fri, 11 Aug 2006 19:06:54 +0100
Date: Fri, 11 Aug 2006 19:06:54 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Missing link in /dev/<domain>?
Message-ID: <20060811180654.GI18633@agk.surrey.redhat.com>
References: <87f94c370608111059h2259788bx9e6cd37293e8ec5d@mail.gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87f94c370608111059h2259788bx9e6cd37293e8ec5d@mail.gmail.com>
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

On Fri, Aug 11, 2006 at 01:59:35PM -0400, Greg Freemyer wrote:
> my-domain-data
> my-domain-data-real

> The unexpected entry is the -data-real one.
 
Did you try anything with snapshots?

See what vgmknodes does.

Post the output of dmsetup info -c and lvs -va.

Alasdair
-- 
agk@redhat.com
