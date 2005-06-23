Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id j5N8BP3N022943
	for <linux-lvm@redhat.com>; Thu, 23 Jun 2005 09:11:25 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1DlMo1-0008OV-FM
	for linux-lvm@redhat.com; Thu, 23 Jun 2005 09:11:25 +0100
Date: Thu, 23 Jun 2005 09:11:25 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Re: PV segments corrupted in vg1 : LVM corrupted
Message-ID: <20050623081125.GB4195@agk.surrey.redhat.com>
References: <3cd4d99305062204374db9549@mail.gmail.com>
	<20050622141522.GD22056@null.msp.redhat.com>
	<3cd4d99305062218025d6c3059@mail.gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3cd4d99305062218025d6c3059@mail.gmail.com>
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

On Thu, Jun 23, 2005 at 11:02:52AM +1000, Jeff Ewing wrote:
> The output from "vgcfgrestore vg1" is 
>   PV /dev/md1 is a different format (seqno lvm1)

Add -M1 to force it to use lvm1 metadata format (default
is new format - or change default globally in lvm.conf).

Alasdair
-- 
agk@redhat.com
