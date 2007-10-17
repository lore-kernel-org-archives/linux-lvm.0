Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l9H6D4XE025420
	for <linux-lvm@redhat.com>; Wed, 17 Oct 2007 02:13:04 -0400
Received: from postman.formosahost.com (postman.formosahost.com [203.190.4.19])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id l9H6Cvq4010898
	for <linux-lvm@redhat.com>; Wed, 17 Oct 2007 02:12:57 -0400
Received: from localhost (localhost [127.0.0.1])
	by postman.formosahost.com (Postfix) with ESMTP id CC7148A28D
	for <linux-lvm@redhat.com>; Wed, 17 Oct 2007 14:09:41 +0800 (CST)
Received: from postman.formosahost.com ([127.0.0.1])
	by localhost (postman.formosahost.com [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id jJFUbIHdU76t for <linux-lvm@redhat.com>;
	Wed, 17 Oct 2007 14:09:27 +0800 (CST)
Received: from [192.168.0.98] (unknown [203.190.4.13])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by postman.formosahost.com (Postfix) with ESMTP id 4BBBB8A25D
	for <linux-lvm@redhat.com>; Wed, 17 Oct 2007 14:09:27 +0800 (CST)
Message-ID: <4715A86F.40504@ezpear.com>
Date: Wed, 17 Oct 2007 14:15:11 +0800
From: Hans <hans@ezpear.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] stupid question about lvm/lvm2/clvm
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

Hi!
I want build cluster. I couldn't decide about which system use OCFS2 or 
GFS2.
I was looking for some information about clvm.
On redhat website I found some tarball with clvm toolset but called lvm2...
Does it mean that clvm=lvm2? Or clvm is special extension to lvm2, not 
identical with lvm2.
I use openfiler (installed lvm2-2.02.14). Does it include clvm ext.?

Regards,
Hans
