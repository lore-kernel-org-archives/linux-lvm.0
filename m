Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i8C6XCr20175
	for <linux-lvm@redhat.com>; Sun, 12 Sep 2004 02:33:12 -0400
Received: from mproxy.gmail.com (rproxy.gmail.com [64.233.170.203])
	by mx3.redhat.com (8.12.11/8.12.10) with ESMTP id i8C6X6as014624
	for <linux-lvm@redhat.com>; Sun, 12 Sep 2004 02:33:06 -0400
Received: by mproxy.gmail.com with SMTP id 76so190319rnk
	for <linux-lvm@redhat.com>; Sat, 11 Sep 2004 23:33:06 -0700 (PDT)
Message-ID: <ce9f1f9e040911233347ca7ec8@mail.gmail.com>
Date: Sat, 11 Sep 2004 23:33:06 -0700
From: Stanley Yue <stanley.yue@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Unable to create lvm1 configurations
Reply-To: Stanley Yue <stanley.yue@gmail.com>,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi all:

I have LVM2 installed, and I tried to create lvm1 configurations using
the following command:

[root@DAP-RHLNX1 tools]# vgcreate -v --metadatatype 1 vg1-lvm2
/dev/hda6 /dev/hda7
  Invalid argument 1
  Error during parsing of command line.
[root@DAP-RHLNX1 tools]# 

However, passing into "2" as the metadatatype would succeed.

[root@DAP-RHLNX1 tools]# vgcreate -v --metadatatype 2 vg1-lvm2
/dev/hda6 /dev/hda7
    Adding physical volume '/dev/hda6' to volume group 'vg1-lvm2'
    Adding physical volume '/dev/hda7' to volume group 'vg1-lvm2'
    Archiving volume group "vg1-lvm2" metadata.
    Creating volume group backup "/etc/lvm/backup/vg1-lvm2"
  Volume group "vg1-lvm2" successfully created
[root@DAP-RHLNX1 tools]# 


Does anyone what the problem is?
What is the best way to create LVM1 configurations?

Stanley
