Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n6L7GJ6d022259
	for <linux-lvm@redhat.com>; Tue, 21 Jul 2009 03:16:19 -0400
Received: from mail-vw0-f178.google.com (mail-vw0-f178.google.com
	[209.85.212.178])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n6L7G6Jb002579
	for <linux-lvm@redhat.com>; Tue, 21 Jul 2009 03:16:06 -0400
Received: by vwj8 with SMTP id 8so2650956vwj.23
	for <linux-lvm@redhat.com>; Tue, 21 Jul 2009 00:16:06 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 21 Jul 2009 16:16:05 +0900
Message-ID: <38bdcd1f0907210016y440121c1x9c92f399e5ea1f9e@mail.gmail.com>
From: Masanari Iida <standby24x7@gmail.com>
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] vgs result code error
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
To: linux-lvm@redhat.com

Hello List,

I have encountered an error with vgs command.

How to reproduce.

(1) Initialize the PV.
# pvcreate /dev/cciss/c0d3p3

(2) Create VG
#  vgcreate vg01 /dev/cciss/c0d3p3

(3)  Use vgs command and see result code.

# vgs /dev/cciss/c0d3p3
  Invalid volume group name: cciss/c0d3p3

# echo $?
0

The result code should be none zero value.
One of a script rely on this result code, and it failed to work
because of this bug.

I have found this bug on RHEL5 (which uses lvm2.02.40-6) and
I have checked out WHATS_NEW between 2.02-40 to 49,
so far no similar symptom.

/dev/cciss is pointed HP Smart Array, FYI.

Regards,

Masanari
