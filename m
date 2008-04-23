Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m3NGCEGt012308
	for <linux-lvm@redhat.com>; Wed, 23 Apr 2008 12:12:15 -0400
Received: from smtp02.atlngahp.sys.nuvox.net (smtp-out2.atlngahp.sys.nuvox.net
	[70.43.63.19])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m3NGBslF018166
	for <linux-lvm@redhat.com>; Wed, 23 Apr 2008 12:11:54 -0400
Received: from smtp.media-brokers.com (70.43.81.99.nw.nuvox.net [70.43.81.99])
	by smtp02.atlngahp.sys.nuvox.net (8.13.1/8.13.1) with ESMTP id
	m3NGBpXY020163
	for <linux-lvm@redhat.com>; Wed, 23 Apr 2008 12:11:52 -0400
Received: from [192.168.1.110] (sjester.atl.media-brokers.com [192.168.1.110])
	by smtp.media-brokers.com (Postfix) with ESMTPSA id B8B5A3779EC
	for <linux-lvm@redhat.com>; Wed, 23 Apr 2008 12:11:51 -0400 (EDT)
Message-ID: <480F5FD9.4090709@Media-Brokers.com>
Date: Wed, 23 Apr 2008 12:12:09 -0400
From: Charles Marcus <CMarcus@Media-Brokers.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Simple scripts for use in automated backups?
References: <480F3680.6030900@Media-Brokers.com> <480F3B0F.6010205@wpkg.org>
In-Reply-To: <480F3B0F.6010205@wpkg.org>
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

>> Would any kind souls be willing to share some basic scripts that can 
>> be used to activate a snapshot, then 'do x' (this would be my 
>> rsnapshot command), then release the snapshot? The part that I don't 
>> have a clue about is how to check for errors - ie, did the snapshot 
>> activate ok? Did it release ok?...

> *Usually*, a command exits with code 0 if it finishes with a success.

<snip>

> Here's a few links I dug up a couple weeks ago on how
> people use lvm to back up mysql:

Thanks! helps a lot...

-- 

Best regards,

Charles
