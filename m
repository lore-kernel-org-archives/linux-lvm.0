Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m4EKtUVD011565
	for <linux-lvm@redhat.com>; Wed, 14 May 2008 16:55:30 -0400
Received: from mx03.syneticon.net (mx03.syneticon.net [87.79.32.166])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m4EKtGw1028914
	for <linux-lvm@redhat.com>; Wed, 14 May 2008 16:55:16 -0400
Received: from localhost (filter1.syneticon.net [192.168.113.3])
	by mx03.syneticon.net (Postfix) with ESMTP id A4F50936B
	for <linux-lvm@redhat.com>; Wed, 14 May 2008 22:55:15 +0200 (CEST)
Received: from mx03.syneticon.net ([192.168.113.4])
	by localhost (mx03.syneticon.net [192.168.113.3]) (amavisd-new,
	port 10025) with ESMTP id QnvogJprmc3D for <linux-lvm@redhat.com>;
	Wed, 14 May 2008 22:55:05 +0200 (CEST)
Received: from [192.168.10.145] (koln-4d0b6e02.pool.mediaWays.net
	[77.11.110.2]) by mx03.syneticon.net (Postfix) with ESMTP
	for <linux-lvm@redhat.com>; Wed, 14 May 2008 22:55:05 +0200 (CEST)
Message-ID: <482B51A5.4070800@wpkg.org>
Date: Wed, 14 May 2008 22:55:01 +0200
From: Tomasz Chmielewski <mangoo@wpkg.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] lvs / pvs takes ages to execute under slight load
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

I noticed that various LVM commands, such as lvs, pvs, lvresize etc. can take 
several minutes to execute if I do a simple task like:

   dd if=/dev/vol/lv-snapshot of=/dev/vol/lv

Other than LVM commands, the machine is responsive and works fine.

Is it normal that LVM commands take so long to execute if we dd one volume (or 
snapshot volume) to another?

I have Debian Etch 4.0 and kernel 2.6.24.2.


-- 
Tomasz Chmielewski
http://wpkg.org
