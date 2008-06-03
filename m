Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m53Khqox030138
	for <linux-lvm@redhat.com>; Tue, 3 Jun 2008 16:43:52 -0400
Received: from scidubsmtp01.stercomm.com (scidubsmtp01.stercomm.com
	[209.95.244.35])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m53Khfk6013625
	for <linux-lvm@redhat.com>; Tue, 3 Jun 2008 16:43:42 -0400
Received: from IWDUBCORMSG002.sci.local (iwdubcormsg002.sci.local
	[10.105.142.32])
	by boamail1.stercomm.com (Postfix) with ESMTP id CA66633C55
	for <linux-lvm@redhat.com>; Tue,  3 Jun 2008 16:43:39 -0400 (EDT)
Subject: Re: [linux-lvm] ANNOUNCE: an experimental implementation of
	snapshot merging
From: Chris Cox <chris_cox@stercomm.com>
In-Reply-To: <Pine.LNX.4.64.0806031516380.20514@engineering.redhat.com>
References: <Pine.LNX.4.64.0806031516380.20514@engineering.redhat.com>
Content-Transfer-Encoding: 7bit
Date: Tue, 03 Jun 2008 15:43:39 -0500
Message-Id: <1212525819.19122.16.camel@behemoth.csg.stercomm.com>
Mime-Version: 1.0
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, 2008-06-03 at 15:26 -0400, Mikulas Patocka wrote:
> Hi
> 
> Here I release the first experimental implementation of snapshot merging. 
> Merging allows you to copy data in snapshot back to the origin device. 
> Once merging starts, it runs on background. When the merging finishes (you 
> see "0%" with "lvs" command), you should remove the merging snapshot with 
> lvremove command.

I would think this would be VERY hard to do since both the "origin" and
"snapshot" change (file deletes, etc).  Do you have a set of rules you
use for the merge?
