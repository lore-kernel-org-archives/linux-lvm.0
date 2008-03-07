Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m27GbpZ6029746
	for <linux-lvm@redhat.com>; Fri, 7 Mar 2008 11:37:51 -0500
Received: from mail2.syneticon.net (mail.syneticon.net [213.239.212.131])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m27GbIjC030421
	for <linux-lvm@redhat.com>; Fri, 7 Mar 2008 11:37:18 -0500
Received: from postfix1.syneticon.net (postfix1.syneticon.net [192.168.112.6])
	by mail2.syneticon.net (Postfix) with ESMTP id 98ABC62FD2
	for <linux-lvm@redhat.com>; Fri,  7 Mar 2008 17:37:13 +0100 (CET)
Received: from localhost (filter1.syneticon.net [192.168.113.3])
	by postfix1.syneticon.net (Postfix) with ESMTP id 6E3AA937E
	for <linux-lvm@redhat.com>; Fri,  7 Mar 2008 17:37:11 +0100 (CET)
Received: from postfix1.syneticon.net ([192.168.113.4])
	by localhost (mx03.syneticon.net [192.168.113.3]) (amavisd-new,
	port 10025) with ESMTP id z7w36jWyb8Lq for <linux-lvm@redhat.com>;
	Fri,  7 Mar 2008 17:37:08 +0100 (CET)
Received: from [192.168.10.145] (koln-4d0b7335.pool.mediaWays.net
	[77.11.115.53]) by postfix1.syneticon.net (Postfix) with ESMTP
	for <linux-lvm@redhat.com>; Fri,  7 Mar 2008 17:37:08 +0100 (CET)
Message-ID: <47D16F33.8050905@wpkg.org>
Date: Fri, 07 Mar 2008 17:37:07 +0100
From: Tomasz Chmielewski <mangoo@wpkg.org>
MIME-Version: 1.0
Subject: Re: [linux-lvm] How to "clone" a logical volume
References: <dd20e5b50803070734o3eac4e18o156fe4e1552040c@mail.gmail.com>	<47D162C8.4040104@wpkg.org>
	<dd20e5b50803070806g1068b31djecbd683c38fea713@mail.gmail.com>
In-Reply-To: <dd20e5b50803070806g1068b31djecbd683c38fea713@mail.gmail.com>
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

Lionel Kernux schrieb:
> Hi,
> 
> Thanks for the reply.
> 
> I'm talking about LVM uuid...I assumed that it is stored somwhere on
> the actual LV...is this not the case? If not, my problem is solved!
> 
> So...Just to be sure:
> 
> If I dd my source LV to my destination LV (which has alraedy been
> created through  lvcreate) then LVM wont care and will activate it and
> all will be well?

Yep, it will work just fine.

You may also consider using snapshots, although it has some performance 
penalties involved.

-- 
Tomasz Chmielewski
http://wpkg.org
