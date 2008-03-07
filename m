Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m27Fiv4w021049
	for <linux-lvm@redhat.com>; Fri, 7 Mar 2008 10:44:57 -0500
Received: from mail2.syneticon.net (mail.syneticon.net [213.239.212.131])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m27FiNpT006591
	for <linux-lvm@redhat.com>; Fri, 7 Mar 2008 10:44:24 -0500
Received: from postfix1.syneticon.net (postfix1.syneticon.net [192.168.112.6])
	by mail2.syneticon.net (Postfix) with ESMTP id 8771549B90
	for <linux-lvm@redhat.com>; Fri,  7 Mar 2008 16:44:14 +0100 (CET)
Received: from localhost (filter1.syneticon.net [192.168.113.3])
	by postfix1.syneticon.net (Postfix) with ESMTP id 7CD93937E
	for <linux-lvm@redhat.com>; Fri,  7 Mar 2008 16:44:12 +0100 (CET)
Received: from postfix1.syneticon.net ([192.168.113.4])
	by localhost (mx03.syneticon.net [192.168.113.3]) (amavisd-new,
	port 10025) with ESMTP id WOwn6fc38JYj for <linux-lvm@redhat.com>;
	Fri,  7 Mar 2008 16:44:09 +0100 (CET)
Received: from [192.168.10.145] (koln-4d0b7335.pool.mediaWays.net
	[77.11.115.53]) by postfix1.syneticon.net (Postfix) with ESMTP
	for <linux-lvm@redhat.com>; Fri,  7 Mar 2008 16:44:09 +0100 (CET)
Message-ID: <47D162C8.4040104@wpkg.org>
Date: Fri, 07 Mar 2008 16:44:08 +0100
From: Tomasz Chmielewski <mangoo@wpkg.org>
MIME-Version: 1.0
Subject: Re: [linux-lvm] How to "clone" a logical volume
References: <dd20e5b50803070734o3eac4e18o156fe4e1552040c@mail.gmail.com>
In-Reply-To: <dd20e5b50803070734o3eac4e18o156fe4e1552040c@mail.gmail.com>
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
> Here's what I'm trying to do:
> 
> I have an LV that is being used as a physical disk for a XEN virtual machine.
> I want to "clone" the VM.
> lvcreate -L 75G -n virtualmachine_clone_lv VG00
> dd if=/path/to/virtualmachine_lv of=/path/to/virtualmachine_clone_lvT
> 
> This method would be perfect if it wasn't for the fact that now I have
> 2 LV's with the same uuid....not good...

What UUID are you talking about here? Filesystem UUID, or LVM UUID?

If about LVM UUID, it will not be the same if you dd a LV - UUID is 
stored somewhere else.

Filesystem UUID (if any) will remain the same, of course, as it's the 
exact copy.



-- 
Tomasz Chmielewski
http://wpkg.org
