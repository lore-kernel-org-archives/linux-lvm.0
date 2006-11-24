Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id kAODrLTr017633
	for <linux-lvm@redhat.com>; Fri, 24 Nov 2006 08:53:21 -0500
Received: from smtp.cdf.toronto.edu (smtp.cdf.toronto.edu [128.100.31.106])
	by mx3.redhat.com (8.13.1/8.13.1) with SMTP id kAODrEZJ000325
	for <linux-lvm@redhat.com>; Fri, 24 Nov 2006 08:53:14 -0500
Date: Fri, 24 Nov 2006 08:53:08 -0500 (EST)
From: Andrew Park <apark@cdf.toronto.edu>
Message-ID: <Pine.LNX.4.62.0611240841270.14332@skywolf.cdf.toronto.edu>
MIME-Version: 1.0
Subject: [linux-lvm] pvresize experince
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Hi all,

I have RHAS4 (update 3) and the following is the LVM tool info.

[root@mysystem ~]# pvresize --version
   LVM version:     2.02.01 (2005-11-23)
   Library version: 1.02.02 (2006-01-04)
   Driver version:  4.5.0

Now I have a RAID that had 5 x 300 GB on it and I recently added 3 more.
It is in the middle of migrating it data across 8 drives.  Once this is
completed I am expected to run

 	pvresize /dev/sda

to have the increased space recognized.

Now my question, may I hear from the folks who have used pvresize
before?  i.e. successfully recognized the new space in how many minutes
etc...

The situation I am facing ... it is critical that pvresize does not mess
up the RAID or any other settings since we just cannot lose any more
time.  So I just wanted to be extra sure that this can be done.

Please let me know,

P.S. : Please CC me on the reply since I am not subscribed on the list.

Thanks

Andrew Park

________________________________________________________________________
  GnuPG Signature              www.cdf.utoronto.ca/~apark/public_key.txt
________________________________________________________________________
