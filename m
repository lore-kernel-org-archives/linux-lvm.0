Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n6LBnriR025825
	for <linux-lvm@redhat.com>; Tue, 21 Jul 2009 07:49:53 -0400
Received: from mail-qy0-f201.google.com (mail-qy0-f201.google.com
	[209.85.221.201])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n6LBnevh016095
	for <linux-lvm@redhat.com>; Tue, 21 Jul 2009 07:49:40 -0400
Received: by qyk39 with SMTP id 39so2492546qyk.23
	for <linux-lvm@redhat.com>; Tue, 21 Jul 2009 04:49:40 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4A659CFF.4060308@cox.net>
References: <38bdcd1f0907210016y440121c1x9c92f399e5ea1f9e@mail.gmail.com>
	<4A657BEB.6070200@cox.net>
	<38bdcd1f0907210208g19b3a803j90e43a4ce8f6b301@mail.gmail.com>
	<4A658D5A.7060205@cox.net>
	<20090721103511.GH32330@agk-dp.fab.redhat.com>
	<4A659CFF.4060308@cox.net>
Date: Tue, 21 Jul 2009 20:49:39 +0900
Message-ID: <38bdcd1f0907210449t78caaafdr445d5b2284fc6bcd@mail.gmail.com>
Subject: Re: [linux-lvm] vgs result code error
From: Masanari Iida <standby24x7@gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

> Is it because of the multi-level device name, and the parser getting confused?

Maybe, multi-level device file name canfuse vgs.
See my test.

# ls -l /dev/cciss/c0d3p3
brw-r-----  1 root disk 104, 51 Jul 22 05:21 c0d3p3

# mknod /dev/c0d3p3 b 104 51
# ls -l  /dev/c0d3p3
brw-r--r-- 1 root root 104, 51 Jul 22 05:43 /dev/c0d3p3

# vgs /dev/c0d3p3
  Volume group "c0d3p3" not found

# echo $?
5

Regards,

Masanari Iida
