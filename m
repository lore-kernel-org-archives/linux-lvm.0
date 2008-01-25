Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m0PFYJXL022968
	for <linux-lvm@redhat.com>; Fri, 25 Jan 2008 10:34:20 -0500
Received: from mail2.syneticon.net (mail.syneticon.net [213.239.212.131])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id m0PFXcD5027556
	for <linux-lvm@redhat.com>; Fri, 25 Jan 2008 10:33:39 -0500
Received: from postfix1.syneticon.net (postfix1.syneticon.net [192.168.112.6])
	by mail2.syneticon.net (Postfix) with ESMTP id 8BA8649B35
	for <linux-lvm@redhat.com>; Fri, 25 Jan 2008 16:33:34 +0100 (CET)
Received: from localhost (filter1.syneticon.net [192.168.113.3])
	by postfix1.syneticon.net (Postfix) with ESMTP id 271FF9486
	for <linux-lvm@redhat.com>; Fri, 25 Jan 2008 16:33:32 +0100 (CET)
Received: from postfix1.syneticon.net ([192.168.113.4])
	by localhost (mx03.syneticon.net [192.168.113.3]) (amavisd-new,
	port 10025) with ESMTP id hXk-AlpTR4Gy for <linux-lvm@redhat.com>;
	Fri, 25 Jan 2008 16:33:30 +0100 (CET)
Received: from [192.168.10.145] (koln-4d0b06c4.pool.mediaWays.net
	[77.11.6.196]) by postfix1.syneticon.net (Postfix) with ESMTP
	for <linux-lvm@redhat.com>; Fri, 25 Jan 2008 16:33:30 +0100 (CET)
Message-ID: <479A0148.40500@wpkg.org>
Date: Fri, 25 Jan 2008 16:33:28 +0100
From: Tomasz Chmielewski <mangoo@wpkg.org>
MIME-Version: 1.0
Subject: Re: [linux-lvm] is LVM cluster-aware?
References: <4798C8D9.6020506@wpkg.org> <4798CB0A.8090501@redhat.com>
In-Reply-To: <4798CB0A.8090501@redhat.com>
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

Bryn M. Reeves schrieb:

>> I don't want to add/remove/rename/resize/etc. any volumes - just access
>> them on separate machines.
> 
> As long as you never try to update the LVM metadata from two nodes at
> the same time (e.g. add/remove/rename/resize etc. running on two nodes
> simultaneously) then this is fine, but there is no automatic prevention
> of this situation.

Thanks for the tips on clvmd and pointing to linux-cluster list archive 
- I'm about to dig into it.

Are you 100% sure LVM metadata is not updated when I don't 
add/remove/rename/resize/etc. any volumes?

I.e., won't lvs or pvs commands write or update some timestamps, for 
example?


-- 
Tomasz Chmielewski
http://wpkg.org
