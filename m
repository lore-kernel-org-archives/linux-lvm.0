Received: from agk.fab.redhat.com (agk.fab.redhat.com [10.33.0.19])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id l6QK8wAZ002084
	for <linux-lvm@redhat.com>; Thu, 26 Jul 2007 16:08:58 -0400
Received: from agk by agk.fab.redhat.com with local (Exim 4.34)
	id 1IE9dq-0006gT-1y
	for linux-lvm@redhat.com; Thu, 26 Jul 2007 21:08:58 +0100
Date: Thu, 26 Jul 2007 21:08:58 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] libLVM progress?
Message-ID: <20070726200858.GL459@agk.fab.redhat.com>
References: <63576.192.52.57.33.1185480057.squirrel@webmail.wpi.edu>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <63576.192.52.57.33.1185480057.squirrel@webmail.wpi.edu>
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

On Thu, Jul 26, 2007 at 04:00:57PM -0400, Ken Stein wrote:
> * use a premade LVM interface library.
 
> The last idea came to me when I realized almost everything has a library
> these days, so I looked into it, but all I can find is people saying the
> current/old liblvm should not be used for new development or as a platform
> to base any new liblvm work off of, and people suggesting that a liblvm
> project be started to work with the new LVM systems and export a stable,
> logical public API.  However, I can't find any mention of actual work
> being done on this - if I'm just missing it, a link would be great. 
> Otherwise, is there any work I can base a modern liblvm implementation off
> of, or anyone I can talk to about joining a liblvm project to help out?

Work has begun.

The first step is to achieve proper separation of the 'tools' and 'lib'
directories - so the 'tools' directory will only use the new library
interface.   If you watch the lvm-devel list you'll see a number of
patches going into the tree and the new interface evolving.  Feel free
to help out on the lvm-devel mailing list.
 
Alasdair
-- 
agk@redhat.com
