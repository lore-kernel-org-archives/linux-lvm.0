Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q3OHXMiF019895
	for <linux-lvm@redhat.com>; Tue, 24 Apr 2012 13:33:22 -0400
Received: from www.bettercgi.com (www.bettercgi.com [74.122.122.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q3OHXEEG018041
	for <linux-lvm@redhat.com>; Tue, 24 Apr 2012 13:33:15 -0400
Received: from localhost (r74-192-17-33.bcstcmta01.clsttx.tl.dh.suddenlink.net
	[74.192.17.33])
	by www.bettercgi.com (Postfix) with ESMTPSA id 3B792213D4
	for <linux-lvm@redhat.com>; Tue, 24 Apr 2012 12:33:12 -0500 (CDT)
Date: Tue, 24 Apr 2012 12:33:12 -0500
From: Ray Morris <support@bettercgi.com>
Message-ID: <20120424123312.31542cda@bettercgi.com>
In-Reply-To: <CAL-GF3xhhOQwOGYbJW06pOdjb2tVpcjGS9k=LM=mJH-KDfe2Pw@mail.gmail.com>
References: <CAL-GF3xhhOQwOGYbJW06pOdjb2tVpcjGS9k=LM=mJH-KDfe2Pw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] lvremove snapshot hangs LVM system
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

> Well, I suppose no one else had this problem.

I suppose not. I got a hang using snapshots atop mdadm raid, but I see
no mention of such in your message or log. I do see selinux calls in
your stack trace. It would take only seconds to setenforce 0 and test
that way, and longer to disable selinux entirely and test it. In the
best case, you'd find it's selinux related. In the worst case, you'd
shorten up your stack trace, narrowing down the problem.

Not that I'm advocating turning off selinux in general, but since
selinux is in the stack trace a quick test with selinux off for a
momment might be useful.
-- 
Ray Morris
support@bettercgi.com

Strongbox - The next generation in site security:
http://www.bettercgi.com/strongbox/

Throttlebox - Intelligent Bandwidth Control
http://www.bettercgi.com/throttlebox/

Strongbox / Throttlebox affiliate program:
http://www.bettercgi.com/affiliates/user/register.php




On Tue, 24 Apr 2012 17:27:16 +0200
Da <dcodix@gmail.com> wrote:

> Well, I suppose no one else had this problem.
> 
> Does it mean that no one is using snapshots in a clvm environment? or
> that they just work for everybody?
> 
> Just to keep it updated:
> I tried withe the last soft versions and the same happens, the
> "lvremove" of a snapshot just hangs my lvm system.
> Here the versions I am using:
> 
> kernel-2.6.32-220.13.1.el6.x86_64
> cman-3.0.12.1-23.el6.x86_64
> corosync-1.4.1-4.el6.x86_64
> corosynclib-1.4.1-4.el6.x86_64
> lvm2-cluster-2.02.88-3.el6.x86_64
> lvm2-libs-2.02.88-3.el6.x86_64
> lvm2-2.02.88-3.el6.x86_64
> lvm2-devel-2.02.88-3.el6.x86_64
> fence-virt-0.2.3-5.el6.x86_64
> fence-agents-3.1.5-10.el6.x86_64
> 
> Thanks!
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
