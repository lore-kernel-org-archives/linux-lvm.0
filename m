Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iAJIUVr13816
	for <linux-lvm@redhat.com>; Fri, 19 Nov 2004 13:30:31 -0500
Received: from mailgate2.Cadence.COM (mailgate2.Cadence.COM [158.140.2.31])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id iAJIUP4U024082
	for <linux-lvm@redhat.com>; Fri, 19 Nov 2004 13:30:25 -0500
Received: from exmbx01sj.global.cadence.com (exmbx01sj.Cadence.COM
	[158.140.128.146])
	by mailgate2.Cadence.COM (8.9.3/8.9.3) with ESMTP id KAA11504
	for <linux-lvm@redhat.com>; Fri, 19 Nov 2004 10:29:44 -0800 (PST)
Subject: Re: [linux-lvm] HA Fileserver configuration recommendation sought.
From: Chris Croswhite <csc@cadence.com>
In-Reply-To: <20041119182414.GF3139@polop.usc.edu>
References: <1100857645.13422.99.camel@grma-lap>
	<1100885267.19894.217.camel@rct07.cadence.com>
	<20041119182414.GF3139@polop.usc.edu>
Message-Id: <1100889024.19894.237.camel@rct07.cadence.com>
Mime-Version: 1.0
Date: Fri, 19 Nov 2004 10:30:24 -0800
Content-Transfer-Encoding: 7bit
Reply-To: csc@cadence.com,
	LVM general discussion and development <linux-lvm@redhat.com>
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


> How do you solve the problem of lvm2 seeing 3 duplicate PVs (2 paths and 1 md
> device)?  Are you using the filter in /etc/lvm/lvm.conf?
Filter, only look at the md devices.
