Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m0DFMlMP005128
	for <linux-lvm@redhat.com>; Sun, 13 Jan 2008 10:22:47 -0500
Received: from nhindia.com (del-static-52-67-7-210.direct.net.in [210.7.67.52]
	(may be forged))
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id m0DFMPhU009762
	for <linux-lvm@redhat.com>; Sun, 13 Jan 2008 10:22:26 -0500
Message-ID: <60595.61.8.131.123.1200237699.squirrel@webmail.nhindia.com>
Date: Sun, 13 Jan 2008 20:51:39 +0530 (IST)
From: "bhagwat swarup" <bhagwat.swarup@nhindia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] snapshot of a lvm
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


Dear All
OS -RHEL5(Tikanga)
I tried to take  a snapshot of a LV but it result in continous failure if
selinux is in enforcing mode .
I disabled the selinux and successfully took the snapshot of lv.

Now the issue is that in RHEL5 ,what is the procedure of taking snapshot
if Selinux is in enforcing mode.
How can i modify selinux ,so that snapshot will be possible in selinux
enforcing mode.


My second question
I tried to configure a SSL enabled apache-2.2.3 on RHEL5 ,but it is not
working ,i guess threre must be something with selinux on its certificate
and key file.


Thanks And Regards
Bhagwat Swarup
NH India Ltd
