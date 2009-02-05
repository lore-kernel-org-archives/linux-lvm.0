Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n15LsLWI029937
	for <linux-lvm@redhat.com>; Thu, 5 Feb 2009 16:54:21 -0500
Received: from asav-2.01.com (smtp.01.com [38.98.186.166])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n15Ls2Qs019404
	for <linux-lvm@redhat.com>; Thu, 5 Feb 2009 16:54:03 -0500
Received: from asav-2.01.com (localhost.localdomain [127.0.0.1])
	by asav-2.01.com (8.13.1/8.13.1) with ESMTP id n15LrnZ7004411
	for <linux-lvm@redhat.com>; Thu, 5 Feb 2009 15:53:49 -0600
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp-1.01.com (Postfix) with ESMTP id 55BF7E0DC8
	for <linux-lvm@redhat.com>; Thu,  5 Feb 2009 15:53:49 -0600 (CST)
Received: from smtp-1.01.com ([127.0.0.1])
	by localhost (smtp-1.01.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DlTEUz7sckty for <linux-lvm@redhat.com>;
	Thu,  5 Feb 2009 15:53:49 -0600 (CST)
Received: from [172.16.23.43] (unknown [12.130.157.75])
	by smtp-1.01.com (Postfix) with ESMTP id 21692E0DA6
	for <linux-lvm@redhat.com>; Thu,  5 Feb 2009 15:53:49 -0600 (CST)
Message-ID: <EMEWEMEW2_DELIMl14Frn987af881be0cb6ba3e4df2,
	vsrini@spikesource.com, 498B5FF>
Date: Thu, 05 Feb 2009 13:54:00 -0800
From: Vinay Srini <vsrini@spikesource.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] lvm2 specificiation
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

Hello,

New to linux-lvm, I have been looking around to understand lvm, and have 
a few questions.

I have a requirement to mount multiple volume groups with the same name 
(VolGroup00, as that is the most popular default name), without first 
using vgrename (because something might go wrong, and I may not be able 
to restore the name back).

I tried multiple variations including chroot to mount volumegroups. 
Seems to be some conflict with device mapper (since chroot uses the same 
kernel module).

Another way was to modify and compile my own version of lvm-tools to 
give volume groups another name (alias) before mounting them, and was 
not successful.

Can someone point me in a direction that I could try? Also, have been 
looking around, and cannot find the specification for lvm2. Can I get a 
pointer to that too.

thanks,
Vinay Srini
