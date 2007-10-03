Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l93LmSfJ027021
	for <linux-lvm@redhat.com>; Wed, 3 Oct 2007 17:48:28 -0400
Received: from e31.co.us.ibm.com (e31.co.us.ibm.com [32.97.110.149])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id l93LmLGt016208
	for <linux-lvm@redhat.com>; Wed, 3 Oct 2007 17:48:21 -0400
Received: from d03relay02.boulder.ibm.com (d03relay02.boulder.ibm.com
	[9.17.195.227])
	by e31.co.us.ibm.com (8.13.8/8.13.8) with ESMTP id l93LmFuH000694
	for <linux-lvm@redhat.com>; Wed, 3 Oct 2007 17:48:15 -0400
Received: from d03av04.boulder.ibm.com (d03av04.boulder.ibm.com [9.17.195.170])
	by d03relay02.boulder.ibm.com (8.13.8/8.13.8/NCO v8.5) with ESMTP id
	l93Lm1kU490518
	for <linux-lvm@redhat.com>; Wed, 3 Oct 2007 15:48:03 -0600
Received: from d03av04.boulder.ibm.com (loopback [127.0.0.1])
	by d03av04.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	l93Lm0GD001409
	for <linux-lvm@redhat.com>; Wed, 3 Oct 2007 15:48:01 -0600
Date: Wed, 3 Oct 2007 14:47:59 -0700
From: malahal@us.ibm.com
Subject: Re: [linux-lvm] Poison pills
Message-ID: <20071003214759.GA10385@us.ibm.com>
References: <Pine.LNX.4.44.0710031449370.29351-100000@bmsred.bmsi.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0710031449370.29351-100000@bmsred.bmsi.com>
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
To: "Stuart D. Gathman" <stuart@bmsi.com>
Cc: linux-lvm@redhat.com

It would be a lot cheaper if you can test it with loop devices!

Stuart D. Gathman [stuart@bmsi.com] wrote:
> I think an inexpensive torture test of this logic is to get 3 or 4 external USB
> drives, put them all in a VG, and start playing games with hotplugging them.
> (E.g. unplug drive, vgreduce, plug drive back in).
