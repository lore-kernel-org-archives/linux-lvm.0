Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.5])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o6NLiT5G025160
	for <linux-lvm@redhat.com>; Fri, 23 Jul 2010 17:44:29 -0400
Received: from storix.com (storix.com [206.71.178.18])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o6NLiJCd022159
	for <linux-lvm@redhat.com>; Fri, 23 Jul 2010 17:44:20 -0400
Received: from [192.168.1.104] (office [209.216.215.162])
	by storix.com (Postfix) with ESMTP id B75185C2
	for <linux-lvm@redhat.com>; Fri, 23 Jul 2010 14:44:19 -0700 (PDT)
Message-ID: <4C4A0D33.20100@storix.com>
Date: Fri, 23 Jul 2010 14:44:19 -0700
From: Keegan Quinn <kquinn@storix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Detecting active/inactive volume groups
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Hello world,

I am searching for a way to determine which volume groups on a system 
are active; ideally I'd like to be able to list all active volume groups 
and all inactive volume groups separately, from the command line.

With older versions of LVM, I believe this was possible by using the -D 
flag to vgdisplay. Unfortunately, with current versions of LVM - I'm 
running 2.02.66 presently - the -D flag no longer exists, and I cannot 
find equivalent functionality in vgdisplay or in any other command. In 
fact, vgdisplay now appears to always list all VGs, regardless of their 
state, and makes no mention whatsoever of active or inactive state.

Is it possible to determine which VGs are active or inactive, with 
recent versions of LVM? How should I go about doing this?

Thanks,

  - Keegan

-- 
Keegan Quinn  <kquinn@storix.com>
Software Support Engineer
Storix, Inc.
(619) 543-0200
