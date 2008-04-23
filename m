Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m3NDG9iP008628
	for <linux-lvm@redhat.com>; Wed, 23 Apr 2008 09:16:09 -0400
Received: from smtp03.atlngahp.sys.nuvox.net (smtp-out3.atlngahp.sys.nuvox.net
	[70.43.63.20])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m3NDFn2t008065
	for <linux-lvm@redhat.com>; Wed, 23 Apr 2008 09:15:49 -0400
Received: from smtp.media-brokers.com (70.43.81.99.nw.nuvox.net [70.43.81.99])
	by smtp03.atlngahp.sys.nuvox.net (8.13.1/8.13.1) with ESMTP id
	m3NDFiU5029074
	for <linux-lvm@redhat.com>; Wed, 23 Apr 2008 09:15:45 -0400
Received: from [192.168.1.110] (sjester.atl.media-brokers.com [192.168.1.110])
	by smtp.media-brokers.com (Postfix) with ESMTPSA id D0AA42F486A
	for <linux-lvm@redhat.com>; Wed, 23 Apr 2008 09:15:44 -0400 (EDT)
Message-ID: <480F3680.6030900@Media-Brokers.com>
Date: Wed, 23 Apr 2008 09:15:44 -0400
From: Charles Marcus <CMarcus@Media-Brokers.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Simple scripts for use in automated backups?
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

Hello again,

Sorry to flood the list with newbie questions... if there is a better 
list for things like this, please let me know...

I'm still fairly new to linux (coming from windows world), and enjoying 
the freedom, but as far as scripting goes - well, to call me a noob is 
being kind...

Would any kind souls be willing to share some basic scripts that can be 
used to activate a snapshot, then 'do x' (this would be my rsnapshot 
command), then release the snapshot? The part that I don't have a clue 
about is how to check for errors - ie, did the snapshot activate ok? Did 
it release ok?...

Thanks for any responses, including decent how-to's, etc...

-- 

Best regards,

Charles
