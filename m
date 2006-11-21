Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id kALMnOHx016975
	for <linux-lvm@redhat.com>; Tue, 21 Nov 2006 17:49:24 -0500
Received: from ug-out-1314.google.com (ug-out-1314.google.com [66.249.92.169])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id kALMnMNa007552
	for <linux-lvm@redhat.com>; Tue, 21 Nov 2006 17:49:23 -0500
Received: by ug-out-1314.google.com with SMTP id 30so10894ugs
	for <linux-lvm@redhat.com>; Tue, 21 Nov 2006 14:49:17 -0800 (PST)
Message-ID: <a4ff0d310611211449x39096d7dy6bd05d0b927e136e@mail.gmail.com>
Date: Tue, 21 Nov 2006 15:49:16 -0700
From: "Charles Tuckey" <charles@tuckey.ca>
Sender: ctuckey@gmail.com
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Subject: [linux-lvm] Two Logical Volumes data disappeared
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

I installed x86_64 FC6 on a new Dell Inspiron 9400 running an Intel
Core 2 Duo CPU. It has a Hitachi HTS72101 100GB HDD. The initial
installed kernel was 2.6.18-1.2798 but I upgraded, via yum, to
2.6.18-1.2849 almost immediately.

There are 2 partitions on the HDD - one for /boot and one for a
Logical Volume Group. I split the Logical Volume Group into 4 volumes:
00 - 64.72 GB, / mount point
01 - 1.94 GB, swap space
02 - 6.81 GB, /home/charlie mount point
03 - 19.53 GB, /home/media mount point

About a week after setting up, I rebooted. After reboot all the data
in volumes 02 & 03 were gone and the permissions had been reset to
what they were just after initial installation. Prior to this
particular reboot, I had rebooted many times without any problems.

I looked through the log files (that I know about) and could find
nothing that, to me, indicated a problem.

Needless to say, I am very nervous now about using the laptop as my
primary machine. Does anyone have any ideas on what the problem might
be or what other trouble shooting I could do?


-- 
Regards,
    Charlie
