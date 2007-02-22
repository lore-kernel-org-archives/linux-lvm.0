Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l1MDLpal001482
	for <linux-lvm@redhat.com>; Thu, 22 Feb 2007 08:21:51 -0500
Received: from mail2.syneticon.net (mail.syneticon.net [213.239.212.131])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l1MDLnqk018693
	for <linux-lvm@redhat.com>; Thu, 22 Feb 2007 08:21:49 -0500
Received: from localhost (localhost [127.0.0.1])
	by mail2.syneticon.net (Postfix) with ESMTP id 640165434A
	for <linux-lvm@redhat.com>; Thu, 22 Feb 2007 14:21:39 +0100 (CET)
Received: from mail2.syneticon.net ([127.0.0.1])
	by localhost (linux [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 21808-07 for <linux-lvm@redhat.com>;
	Thu, 22 Feb 2007 14:21:23 +0100 (CET)
Received: from postfix1.syneticon.net (postfix1.syneticon.net [192.168.112.6])
	by mail2.syneticon.net (Postfix) with ESMTP
	for <linux-lvm@redhat.com>; Thu, 22 Feb 2007 14:21:23 +0100 (CET)
Received: from localhost (filter1.syneticon.net [192.168.113.3])
	by postfix1.syneticon.net (Postfix) with ESMTP id 3297D9483
	for <linux-lvm@redhat.com>; Thu, 22 Feb 2007 14:20:53 +0100 (CET)
Received: from postfix1.syneticon.net ([192.168.113.4])
	by localhost (192.168.113.3 [192.168.113.3]) (amavisd-new, port 10025)
	with ESMTP id E+o03ZPaDeu1 for <linux-lvm@redhat.com>;
	Thu, 22 Feb 2007 14:21:26 +0100 (CET)
Received: from [81.173.188.20] (xdsl-81-173-188-20.netcologne.de
	[81.173.188.20]) by postfix1.syneticon.net (Postfix) with ESMTP
	for <linux-lvm@redhat.com>; Thu, 22 Feb 2007 14:20:48 +0100 (CET)
Message-ID: <45DD98CC.1020305@wpkg.org>
Date: Thu, 22 Feb 2007 14:21:16 +0100
From: Tomasz Chmielewski <mangoo@wpkg.org>
MIME-Version: 1.0
Subject: Re: [linux-lvm] vgdisplay - checksum error - what does it mean?
References: <45D448F5.3000301@wpkg.org>
	<45D47AF5.2040106@wpkg.org>	<20070216074737.GA14119@percy.comedia.it>	<45D57D16.8060902@wpkg.org>	<20070217125644.GC11919@percy.comedia.it>
	<20070217183431.GW7201@agk.surrey.redhat.com>
In-Reply-To: <20070217183431.GW7201@agk.surrey.redhat.com>
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
To: linux-lvm@redhat.com

Alasdair G Kergon schrieb:
> On Sat, Feb 17, 2007 at 01:56:44PM +0100, Luca Berra wrote:
>> On Fri, Feb 16, 2007 at 10:44:54AM +0100, Tomasz Chmielewski wrote:
>>> BTW, the machine is running Debian etch (ARM port).
>> mmm i don't have an arm maybe this is the issue why lvm does not
>> understand that sda2 is a md component?!?
>  
> I've not followed this thread, but you must use version 2.02.21 or later
> for the ARM architecture with md (or backport the patch).

Hmm, I must try that.

I'll let the list know in a week or so.

-- 
Tomasz Chmielewski
http://wpkg.org
