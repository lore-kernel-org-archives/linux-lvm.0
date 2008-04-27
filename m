Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m3RKr2ct021183
	for <linux-lvm@redhat.com>; Sun, 27 Apr 2008 16:53:02 -0400
Received: from smtp01.atlngahp.sys.nuvox.net (smtp-out1.atlngahp.sys.nuvox.net
	[70.43.63.18])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m3RKqLO6024399
	for <linux-lvm@redhat.com>; Sun, 27 Apr 2008 16:52:21 -0400
Received: from smtp.media-brokers.com (70.43.81.99.nw.nuvox.net [70.43.81.99])
	by smtp01.atlngahp.sys.nuvox.net (8.13.1/8.13.1) with ESMTP id
	m3RKqIHc008155
	for <linux-lvm@redhat.com>; Sun, 27 Apr 2008 16:52:19 -0400
Received: from [192.168.1.110] (sjester.atl.media-brokers.com [192.168.1.110])
	by smtp.media-brokers.com (Postfix) with ESMTPSA id C939F33ABD7
	for <linux-lvm@redhat.com>; Sun, 27 Apr 2008 16:52:18 -0400 (EDT)
Message-ID: <4814E782.9080805@Media-Brokers.com>
Date: Sun, 27 Apr 2008 16:52:18 -0400
From: Charles Marcus <CMarcus@Media-Brokers.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] How to move /usr from LVM back to non-LVM?
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

Hello,

Ok, resizing my /var partition was without incident, so thanks much to 
the replies I got for reassurance...

Now, I have another thing I'd like to do, but it is only incidentally 
LVM related...

When this system was first set up - not by me - they put /home, /usr and 
/var on LVM partitions.

I'm fine with /home and /var, but I'd like to put /usr back as part of 
the / partition...

Has anyone ever done something like this before?

I'm thinking something along the lines of:

1. Boot off of livecd

2. mount /

3. Mount /usr

4. cp /usr to /usr2 on /

5. umount /usr

6. mv /usr2 /usr

?

Thanks for any comments/suggestions/how-to pointers...

-- 

Best regards,

Charles
