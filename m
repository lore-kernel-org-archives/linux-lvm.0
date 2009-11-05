Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.13])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id nA5Jqart011379
	for <linux-lvm@redhat.com>; Thu, 5 Nov 2009 14:52:36 -0500
Received: from e36.co.us.ibm.com (e36.co.us.ibm.com [32.97.110.154])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id nA5JqN2M003636
	for <linux-lvm@redhat.com>; Thu, 5 Nov 2009 14:52:23 -0500
Received: from d03relay01.boulder.ibm.com (d03relay01.boulder.ibm.com
	[9.17.195.226])
	by e36.co.us.ibm.com (8.14.3/8.13.1) with ESMTP id nA5JoD7u016980
	for <linux-lvm@redhat.com>; Thu, 5 Nov 2009 12:50:13 -0700
Received: from d03av04.boulder.ibm.com (d03av04.boulder.ibm.com [9.17.195.170])
	by d03relay01.boulder.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	nA5JqIn4106812
	for <linux-lvm@redhat.com>; Thu, 5 Nov 2009 12:52:18 -0700
Received: from d03av04.boulder.ibm.com (loopback [127.0.0.1])
	by d03av04.boulder.ibm.com (8.14.3/8.13.1/NCO v10.0 AVout) with ESMTP
	id nA5DnIEp003495
	for <linux-lvm@redhat.com>; Thu, 5 Nov 2009 06:49:19 -0700
Received: from malahal.localdomain (malahal.beaverton.ibm.com [9.47.17.130])
	by d03av04.boulder.ibm.com (8.14.3/8.13.1/NCO v10.0 AVin) with ESMTP id
	nA5DnIMY003465
	for <linux-lvm@redhat.com>; Thu, 5 Nov 2009 06:49:18 -0700
Date: Thu, 5 Nov 2009 11:52:17 -0800
From: malahal@us.ibm.com
Subject: Re: [linux-lvm] PFree is 0 on a drive with nothing on it
Message-ID: <20091105195217.GA20934@us.ibm.com>
References: <1257433818.17792.30@raydesk1.bettercgi.com>
	<E6AFA4E4-A03C-4D1D-8A78-5DF2110EFA2E@gmail.com>
	<1257436528.17792.32@raydesk1.bettercgi.com>
	<896EDE05-E939-4C70-9513-5805DB864BD4@gmail.com>
	<Pine.LNX.4.64.0911051412100.13658@bmsred.bmsi.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.64.0911051412100.13658@bmsred.bmsi.com>
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
To: linux-lvm@redhat.com

Stuart D. Gathman [stuart@bmsi.com] wrote:
> If you want an integrated LVM/filesystem, then you should look
> at OpenSolaris and ZFS.  There are some advantages to this approach,
> but it does mean that you have only one filesystem choice.

BTRFS is planning on doing similar things, in case you are not planning
on jumping to Solaris yet. Stuart is right, you will be restricted to a
single file system though.
