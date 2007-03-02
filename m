Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l22Bmqj1030164
	for <linux-lvm@redhat.com>; Fri, 2 Mar 2007 06:48:52 -0500
Received: from mail2.syneticon.net (mail.syneticon.net [213.239.212.131])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l22BmoBb030840
	for <linux-lvm@redhat.com>; Fri, 2 Mar 2007 06:48:51 -0500
Received: from localhost (localhost [127.0.0.1])
	by mail2.syneticon.net (Postfix) with ESMTP id E73A6547C2
	for <linux-lvm@redhat.com>; Fri,  2 Mar 2007 12:48:38 +0100 (CET)
Received: from mail2.syneticon.net ([127.0.0.1])
	by localhost (linux [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 28352-08 for <linux-lvm@redhat.com>;
	Fri,  2 Mar 2007 12:48:22 +0100 (CET)
Received: from postfix1.syneticon.net (postfix1.syneticon.net [192.168.112.6])
	by mail2.syneticon.net (Postfix) with ESMTP
	for <linux-lvm@redhat.com>; Fri,  2 Mar 2007 12:48:22 +0100 (CET)
Received: from localhost (filter1.syneticon.net [192.168.113.3])
	by postfix1.syneticon.net (Postfix) with ESMTP id 31621946C
	for <linux-lvm@redhat.com>; Fri,  2 Mar 2007 12:48:22 +0100 (CET)
Received: from postfix1.syneticon.net ([192.168.113.4])
	by localhost (mx03.syneticon.net [192.168.113.3]) (amavisd-new,
	port 10025) with ESMTP id 7Zrucq7-4bFx for <linux-lvm@redhat.com>;
	Fri,  2 Mar 2007 12:47:22 +0100 (CET)
Received: from [81.173.142.58] (xdsl-81-173-142-58.netcologne.de
	[81.173.142.58]) by postfix1.syneticon.net (Postfix) with ESMTP
	for <linux-lvm@redhat.com>; Fri,  2 Mar 2007 12:48:20 +0100 (CET)
Message-ID: <45E80F02.6080003@wpkg.org>
Date: Fri, 02 Mar 2007 12:48:18 +0100
From: Tomasz Chmielewski <mangoo@wpkg.org>
MIME-Version: 1.0
Subject: Re: [linux-lvm] vgdisplay - checksum error - what does it mean?
References: <45D448F5.3000301@wpkg.org>	<45D47AF5.2040106@wpkg.org>	<20070216074737.GA14119@percy.comedia.it>	<45D57D16.8060902@wpkg.org>	<20070217125644.GC11919@percy.comedia.it>	<20070217183431.GW7201@agk.surrey.redhat.com>	<45DD98CC.1020305@wpkg.org>	<45DDA0DE.2020105@wpkg.org>	<20070225083815.GA23001@percy.comedia.it>
	<45E80C24.5020301@wpkg.org>
In-Reply-To: <45E80C24.5020301@wpkg.org>
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

(...)

> Curiously, I updated lvm to Debian's 2.02.06-3, rebooted (machine was in 
> a rather weird state), and the issue is gone.
> 
> With Debian's libdevmapper-dev 1.02.08-1 it doesn't compile; I didn't 
> try to upgrade it anymore.

As described in another post from today ("moving logical volumes to 
another system *remotely* - how?"), perhaps the issue had nothing to do 
with lvm tools, but with kernel?

I use 2.6.17.8 on that ARM machine, the kernel oopses after I create a 
snapshot, invalidate it (make it full), and try to remove it.

I'll try to upgrade to a newest stable kernel to see if anything changed 
(it will take some time, though).


-- 
Tomasz Chmielewski
http://wpkg.org
