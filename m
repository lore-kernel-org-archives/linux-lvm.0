Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m0TAIeKf026039
	for <linux-lvm@redhat.com>; Tue, 29 Jan 2008 05:18:40 -0500
Received: from mail2.syneticon.net (mail.syneticon.net [213.239.212.131])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id m0TAI7fS005781
	for <linux-lvm@redhat.com>; Tue, 29 Jan 2008 05:18:08 -0500
Received: from postfix1.syneticon.net (postfix1.syneticon.net [192.168.112.6])
	by mail2.syneticon.net (Postfix) with ESMTP id EB6644889C
	for <linux-lvm@redhat.com>; Tue, 29 Jan 2008 11:18:02 +0100 (CET)
Received: from localhost (filter1.syneticon.net [192.168.113.3])
	by postfix1.syneticon.net (Postfix) with ESMTP id 9EBA09383
	for <linux-lvm@redhat.com>; Tue, 29 Jan 2008 11:18:01 +0100 (CET)
Received: from postfix1.syneticon.net ([192.168.113.4])
	by localhost (mx03.syneticon.net [192.168.113.3]) (amavisd-new,
	port 10025) with ESMTP id KEFH7e7QRTL8 for <linux-lvm@redhat.com>;
	Tue, 29 Jan 2008 11:17:59 +0100 (CET)
Received: from [192.168.10.145] (koln-4d0b0605.pool.mediaWays.net [77.11.6.5])
	by postfix1.syneticon.net (Postfix) with ESMTP
	for <linux-lvm@redhat.com>; Tue, 29 Jan 2008 11:17:58 +0100 (CET)
Message-ID: <479EFD55.7030505@wpkg.org>
Date: Tue, 29 Jan 2008 11:17:57 +0100
From: Tomasz Chmielewski <mangoo@wpkg.org>
MIME-Version: 1.0
Subject: Re: [linux-lvm] "vgchange -a n VG" freezes, other LVM commands too
References: <479EF3A4.8040905@wpkg.org>
In-Reply-To: <479EF3A4.8040905@wpkg.org>
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

Tomasz Chmielewski schrieb:
> I just wanted to deactivate a volume group - I used:
> 
> vgchange -a n volume_group
> 
> 
> Unfortunately, it didn't work and it seems frozen - the command is still 
> being executed, and is in "D" state.
> 
> Any other LVM command (lvs etc.) freezes as well (D state), adding +1 to 
> the system load average.
> 
> This is what happens when I start lvs with verbose/debug parameters:

Oh, it looks like it's a dead iSCSI session that got in the way... With 
a timeout set to 10 days or so. Well, let's wait 10 days and see what 
happens.



-- 
Tomasz Chmielewski
http://wpkg.org
