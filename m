Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id lA9GM2Tq031099
	for <linux-lvm@redhat.com>; Fri, 9 Nov 2007 11:22:02 -0500
Received: from nhindia.com (del-static-52-67-7-210.direct.net.in [210.7.67.52]
	(may be forged))
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id lA9GM0W9029313
	for <linux-lvm@redhat.com>; Fri, 9 Nov 2007 11:22:00 -0500
Message-ID: <36110.61.8.131.123.1194625395.squirrel@webmail.nhindia.com>
Date: Fri, 9 Nov 2007 21:53:15 +0530 (IST)
From: "bhagwat swarup" <bhagwat.swarup@nhindia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] EXCEPT option is not working in /etc/hosts.allow
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

Hi all
I configure vsftpd on RHEL5 and use tcp_wrapers security
My /etc/hosts.allow
vsftpd : .example.com EXCEPT server1.example.com
/etc/hosts.deny is empty.

according to this all hosts of example.com domain are allowed to use
vsftpd except server1.example.com ,But it not working like this ,it
allowed all example.com domain and server1.example.com also.




Thanks And Regards
Bhagwat Swarup
NH India Ltd
