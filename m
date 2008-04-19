Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m3JHvwNI015174
	for <linux-lvm@redhat.com>; Sat, 19 Apr 2008 13:57:58 -0400
Received: from smtp03.atlngahp.sys.nuvox.net (smtp-out3.atlngahp.sys.nuvox.net
	[70.43.63.20])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m3JHvgEw029579
	for <linux-lvm@redhat.com>; Sat, 19 Apr 2008 13:57:42 -0400
Received: from smtp.media-brokers.com (70.43.81.99.nw.nuvox.net [70.43.81.99])
	by smtp03.atlngahp.sys.nuvox.net (8.13.1/8.13.1) with ESMTP id
	m3JHvbgg005134
	for <linux-lvm@redhat.com>; Sat, 19 Apr 2008 13:57:37 -0400
Received: from [192.168.1.110] (sjester.atl.media-brokers.com [192.168.1.110])
	by smtp.media-brokers.com (Postfix) with ESMTPSA id 8A3D514CD12
	for <linux-lvm@redhat.com>; Sat, 19 Apr 2008 13:57:37 -0400 (EDT)
Message-ID: <480A3291.7070702@Media-Brokers.com>
Date: Sat, 19 Apr 2008 13:57:37 -0400
From: Charles Marcus <CMarcus@Media-Brokers.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Adding PVs to a group
References: <48091663.2070404@Media-Brokers.com>
In-Reply-To: <48091663.2070404@Media-Brokers.com>
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Actually, now I'm confusing myself...

Currently, /dev/sdb is partitioned into two partitions...

Since I'm no longer using the second partition at all, wouldn't it be 
simpler/cleaner to just delete the second partition entirely (using 
fdisk) and then just resize /dev/sdb1 to include the new free space 
using vgextend?

Or will that not work?

-- 

Best regards,

Charles
