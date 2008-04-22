Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m3MAVRNu006313
	for <linux-lvm@redhat.com>; Tue, 22 Apr 2008 06:31:27 -0400
Received: from smtp03.atlngahp.sys.nuvox.net (smtp-out3.atlngahp.sys.nuvox.net
	[70.43.63.20])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m3MAUv5V008373
	for <linux-lvm@redhat.com>; Tue, 22 Apr 2008 06:30:58 -0400
Received: from smtp.media-brokers.com (70.43.81.99.nw.nuvox.net [70.43.81.99])
	by smtp03.atlngahp.sys.nuvox.net (8.13.1/8.13.1) with ESMTP id
	m3MAUjsD028524
	for <linux-lvm@redhat.com>; Tue, 22 Apr 2008 06:30:45 -0400
Received: from [192.168.1.110] (sjester.atl.media-brokers.com [192.168.1.110])
	by smtp.media-brokers.com (Postfix) with ESMTPSA id E98B52A57D5
	for <linux-lvm@redhat.com>; Tue, 22 Apr 2008 06:30:44 -0400 (EDT)
Message-ID: <480DBE54.1090406@Media-Brokers.com>
Date: Tue, 22 Apr 2008 06:30:44 -0400
From: Charles Marcus <CMarcus@Media-Brokers.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Snapshot question...
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
To: linux-lvm@redhat.com

Ok, now I have a question on how snapshots work...

I've read the following links:

http://tldp.org/HOWTO/LVM-HOWTO/snapshotintro.html

http://tldp.org/HOWTO/LVM-HOWTO/snapshots_backup.html

but am still unsure of something...

When a snapshot volume is created, it only needs to be large enough to 
accommodate any *changes* to the volume I'll be taking a snapshot of, 
correct? So, on a low volume mail server, 5GB should be way more than 
enough, especially if done in the middle of the night when it is 
essentially idling, right? I'm guessing that 500MB would probably be 
more than enough, but disk space is cheap, and I have plenty.

So, I have allocated 5GB of 'free space' in my volume group for snapshot 
use.

What I don't understand is... why am I mounting and then backing up the 
newly created snapshot volume, if it only contains the *changes* to the 
volume I really want to backup - which in my case is /var/virtual?

If the snapshot volume is only 5GB, how, by backing up *this* volume, am 
I backing up over 100GB of data that is in a different volume?

Tia for any responses,

-- 

Best regards,

Charles
