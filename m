Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i9GHhCr20971
	for <linux-lvm@redhat.com>; Sat, 16 Oct 2004 13:43:12 -0400
Received: from ms-smtp-03-eri0.texas.rr.com (ms-smtp-03.texas.rr.com
	[24.93.47.42])
	by mx3.redhat.com (8.12.11/8.12.10) with ESMTP id i9GHh6kk012837
	for <linux-lvm@redhat.com>; Sat, 16 Oct 2004 13:43:07 -0400
Received: from tor.tx.mcbf.net (cs68203212-84.rgv.rr.com [68.203.212.84])
	by ms-smtp-03-eri0.texas.rr.com (8.12.10/8.12.7) with ESMTP id
	i9GHgw2b010712
	for <linux-lvm@redhat.com>; Sat, 16 Oct 2004 12:42:58 -0500 (CDT)
Received: from adler.tx.mcbf.net ([10.10.10.11])
	by tor.tx.mcbf.net with esmtp (Exim 4.34) id 1CIsa2-0001DQ-Ay
	for linux-lvm@redhat.com; Sat, 16 Oct 2004 12:42:58 -0500
Subject: Re: [linux-lvm] Missing volume group device
From: David Mohr <damailings@mcbf.net>
In-Reply-To: <41706483.8080409@gmx.net>
References: <41706483.8080409@gmx.net>
Message-Id: <1097948615.3069.4.camel@adler>
Mime-Version: 1.0
Date: Sat, 16 Oct 2004 12:43:35 -0500
Content-Transfer-Encoding: 7bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Fri, 2004-10-15 at 19:00, langelino wrote:
> [root]# ls -l /dev/vg*
> ls: /dev/vg*: No such file or directory

Just a guess, but what about vgmknodes?

~David
