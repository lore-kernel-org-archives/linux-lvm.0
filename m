Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.7])
	by int-mx05.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o1CHYW4a012225
	for <linux-lvm@redhat.com>; Fri, 12 Feb 2010 12:34:32 -0500
Received: from nerv.dolda2000.com (1-1-3-7a.rny.sth.bostream.se
	[82.182.133.20])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o1CHY0vR026780
	for <linux-lvm@redhat.com>; Fri, 12 Feb 2010 12:34:17 -0500
Received: from [IPv6:2002:52b6:8514:200:21d:7dff:fea1:197]
	([IPv6:2002:52b6:8514:200:21d:7dff:fea1:197]) (authenticated bits=0)
	by nerv.dolda2000.com (8.14.3/8.14.3/Debian-5+lenny1) with ESMTP id
	o1CHKQnx018096
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Fri, 12 Feb 2010 18:20:26 +0100
From: Fredrik Tolf <fredrik@dolda2000.com>
Date: Fri, 12 Feb 2010 05:22:19 +0100
Message-ID: <1265948539.2794.5.camel@pc7.dolda2000.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] More helpful error messages
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

Hi List,

Just to provide some friendly critique for LVM, I wanted to tell you
that I just spent a couple of hours trying to find out why I got the
message "create ioctl failed: No such device or address" when activating
a volume group after the first reboot after I had created a couple of
new LVs in another VG.

After browsing through the kernel sources, it seems the VG that I had
modified got activated first by vgchange, and the new LVs came to occupy
the persistent minors that I had allocated in the failing VG, which was
the cause for its failure to activate.

I was able to reallocate those LVs without too much trouble, so the
problem was solved, but it would certainly have helped if the error
message was more helpful. After having read the source, I do understand
that it seems hard to propagate the exact cause from the kernel to
userspace, but it should be reasonable to print something to the dmesg,
at least.

In all else, thanks for makgin LVM!

Fredrik Tolf
