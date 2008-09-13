Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m8D3jT7W006166
	for <linux-lvm@redhat.com>; Fri, 12 Sep 2008 23:45:29 -0400
Received: from s1.echoreply.us (s1.echoreply.us [216.146.143.173])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m8D3iCi2003937
	for <linux-lvm@redhat.com>; Fri, 12 Sep 2008 23:44:12 -0400
Received: from [125.60.243.116] (helo=[10.92.1.100])
	by s1.echoreply.us with esmtpsa (SSLv3:RC4-MD5:128) (Exim 4.68)
	(envelope-from <echo@echoreply.us>) id 1KeM3G-0005ga-JH
	for linux-lvm@redhat.com; Sat, 13 Sep 2008 03:44:03 +0000
From: Tim Post <echo@echoreply.us>
Date: Sat, 13 Sep 2008 11:43:57 +0800
Message-Id: <1221277437.5569.193.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Question regarding liblvm2cmd
Reply-To: echo@echoreply.us,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hello,

I am working with liblvm2cmd within a program that aims to simplify
typical LV management tasks from a web interface. Using the library
allows me to accomplish this with better sanity and safety.

I noticed that lvm2_run() only has a few possible return values and does
not set a global errno to give more information as to why something may
have failed. I inspected lvm2_run() and _run_command() in tools/.

For instance, if you try to create a LV of a size that exceeds the
capacity of the given VG, its easy to tell that something went wrong and
print the response from lvm in the callback. However, it seems rather
difficult for the calling function to know what went wrong. The user
knows, obviously, by what is printed.

Barring picking apart the strings that would be printed for any given
level, is there some other way to make a program understand the nature
of a failure?

Many thanks in advance.

Cheers,
--Tim
