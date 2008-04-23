Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m3NDZwcv027344
	for <linux-lvm@redhat.com>; Wed, 23 Apr 2008 09:35:58 -0400
Received: from mail2.syneticon.net (mail.syneticon.net [213.239.212.131])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m3NDZU1H026365
	for <linux-lvm@redhat.com>; Wed, 23 Apr 2008 09:35:30 -0400
Received: from postfix1.syneticon.net (postfix1.syneticon.net [192.168.112.6])
	by mail2.syneticon.net (Postfix) with ESMTP id A2A1A6382E
	for <linux-lvm@redhat.com>; Wed, 23 Apr 2008 15:35:25 +0200 (CEST)
Received: from localhost (filter1.syneticon.net [192.168.113.3])
	by postfix1.syneticon.net (Postfix) with ESMTP id 90709936B
	for <linux-lvm@redhat.com>; Wed, 23 Apr 2008 15:35:23 +0200 (CEST)
Received: from postfix1.syneticon.net ([192.168.113.4])
	by localhost (mx03.syneticon.net [192.168.113.3]) (amavisd-new,
	port 10025) with ESMTP id HqyI6QL5gx+q for <linux-lvm@redhat.com>;
	Wed, 23 Apr 2008 15:35:14 +0200 (CEST)
Received: from [192.168.10.145] (koln-4d0b7c77.pool.mediaWays.net
	[77.11.124.119]) by postfix1.syneticon.net (Postfix) with ESMTP
	for <linux-lvm@redhat.com>; Wed, 23 Apr 2008 15:35:13 +0200 (CEST)
Message-ID: <480F3B0F.6010205@wpkg.org>
Date: Wed, 23 Apr 2008 15:35:11 +0200
From: Tomasz Chmielewski <mangoo@wpkg.org>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Simple scripts for use in automated backups?
References: <480F3680.6030900@Media-Brokers.com>
In-Reply-To: <480F3680.6030900@Media-Brokers.com>
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

Charles Marcus schrieb:
> Hello again,
> 
> Sorry to flood the list with newbie questions... if there is a better 
> list for things like this, please let me know...
> 
> I'm still fairly new to linux (coming from windows world), and enjoying 
> the freedom, but as far as scripting goes - well, to call me a noob is 
> being kind...
> 
> Would any kind souls be willing to share some basic scripts that can be 
> used to activate a snapshot, then 'do x' (this would be my rsnapshot 
> command), then release the snapshot? The part that I don't have a clue 
> about is how to check for errors - ie, did the snapshot activate ok? Did 
> it release ok?...

*Usually*, a command exits with code 0 if it finishes with a success.

In bash, you can check the exit code with $? variable.

So:


lvmcommand --option1 --option2

if [ $? -eq 0 ] ; then
    do_this
else
    do_that
fi
