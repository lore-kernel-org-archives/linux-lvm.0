Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m3J0JMSw020056
	for <linux-lvm@redhat.com>; Fri, 18 Apr 2008 20:19:22 -0400
Received: from pretender.frop.net (pretender.frop.net [70.85.16.90])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m3J0IvZ4007897
	for <linux-lvm@redhat.com>; Fri, 18 Apr 2008 20:18:58 -0400
Date: Fri, 18 Apr 2008 20:18:57 -0400
From: dave@frop.net
Subject: Re: [linux-lvm] Adding PVs to a group
Message-ID: <20080419001857.GA21151@pretender.frop.net>
References: <48091663.2070404@Media-Brokers.com>
	<480917FD.60002@Media-Brokers.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <480917FD.60002@Media-Brokers.com>
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

sounds fine to me.

I had never heard of the %FREE thing though. To fill out a vg I would just check how many extents are available and use that on the command line with -l, remember there are no spaces between -l and the number of extents given.
