Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j4A6r8O16791
	for <linux-lvm@redhat.com>; Tue, 10 May 2005 02:53:08 -0400
Received: from wproxy.gmail.com (wproxy.gmail.com [64.233.184.196])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j4A6r2FY030099
	for <linux-lvm@redhat.com>; Tue, 10 May 2005 02:53:02 -0400
Received: by wproxy.gmail.com with SMTP id 68so1498083wri
	for <linux-lvm@redhat.com>; Mon, 09 May 2005 23:53:02 -0700 (PDT)
Message-ID: <e4fec31a05050923534f3bdaea@mail.gmail.com>
Date: Tue, 10 May 2005 12:23:02 +0530
From: Aditya Kulkarni <aditya.r.kulkarni@gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] LVM minor number allocation policy
Reply-To: Aditya Kulkarni <aditya.r.kulkarni@gmail.com>,
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
To: linux-lvm@redhat.com

Hi all,

Here are a few questions that I had related to minor numbers of
logical volumes (LVs). First the questions, and then I will explain
the reason why I ask these questions -

[1] Suppose I create two LVs named vol1 and vol2. They have the
following (major, minor) no.s. vol1 = (major=X, minor=0) and vol2 =
(major=X, minor=1). Now I reboot the system. Is it guaranteed that
vol1 and vol2 will retain their minor no.s?

[2] Are there some options while creating LVs that we can use so that
LVs are created with a particular minor number?

[3] Suppose it is not guaranteed that LVs retain their minor numbers
across system reboots. When the system is coming up, what policy it
uses to assign minor numbers to LVs. For example, it could be based on
any one of the following -
    1. sort order of names of LVs.
    2. Timestamp of creation of LVs.
    3. Random

Why I ask these:
The issue of minor number remaining same is relevant to services being
"highly available". In my case, it happens to be the NFS exported file
system. The NFS file handle includes, among other things, the minor
no. of the device on which the exported file system resides. In case
the minor no. of LV is different on the failed-over-to system, we get
the problem of stale file handles.

Hence, I wanted to know how minor numbers are treated by LVM.

-- 
Best Wishes,
Aditya Kulkarni
