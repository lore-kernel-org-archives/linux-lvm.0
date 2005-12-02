Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jB2H7jV18980
	for <linux-lvm@redhat.com>; Fri, 2 Dec 2005 12:07:45 -0500
Received: from pd3mo1so.prod.shaw.ca (shawidc-mo1.cg.shawcable.net
	[24.71.223.10])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id jB2H7aqe030935
	for <linux-lvm@redhat.com>; Fri, 2 Dec 2005 12:07:37 -0500
Received: from pd2mr8so.prod.shaw.ca (pd2mr8so-qfe3.prod.shaw.ca [10.0.141.11])
	by l-daemon (Sun ONE Messaging Server 6.0 HotFix 1.01 (built Mar 15
	2004))
	with ESMTP id <0IQV00JRORKOEZC0@l-daemon> for linux-lvm@redhat.com; Fri,
	02 Dec 2005 10:07:36 -0700 (MST)
Received: from pn2ml6so.prod.shaw.ca ([10.0.121.150])
	by pd2mr8so.prod.shaw.ca (Sun ONE Messaging Server 6.0 HotFix 1.01
	(built Mar
	15 2004)) with ESMTP id <0IQV00F0GRKOA210@pd2mr8so.prod.shaw.ca> for
	linux-lvm@redhat.com; Fri, 02 Dec 2005 10:07:36 -0700 (MST)
Received: from [192.168.1.123] ([24.85.82.146])
	by l-daemon (Sun ONE Messaging Server 6.0 HotFix 1.01 (built Mar 15
	2004))
	with ESMTP id <0IQV004AARKNV1A0@l-daemon> for linux-lvm@redhat.com; Fri,
	02 Dec 2005 10:07:35 -0700 (MST)
Date: Fri, 02 Dec 2005 09:07:52 -0800
From: Terry Rigby <t-rigby@shaw.ca>
Message-id: <200512020907.52315.t-rigby@shaw.ca>
MIME-version: 1.0
Content-transfer-encoding: 7bit
Content-disposition: inline
Subject: [linux-lvm] Need to keep running fsck on LVM
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
To: linux-lvm@redhat.com

Once a week or so I am getting an issue with my volume where I can no longer 
write to it  and I get "read only filesystem" errors.  I need to unmount it 
and run an fsck.ext3 on it and it will fix errors and then will be fine for 
awhile.  I assume that there is a drive that is dying in the array.  Is there 
any way or telling which drive this might be?

Gumby
