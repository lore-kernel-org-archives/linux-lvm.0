Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n3HF5Em6019553
	for <linux-lvm@redhat.com>; Fri, 17 Apr 2009 11:05:15 -0400
Received: from ey-out-2122.google.com (ey-out-2122.google.com [74.125.78.27])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n3HF4XLC000860
	for <linux-lvm@redhat.com>; Fri, 17 Apr 2009 11:04:35 -0400
Received: by ey-out-2122.google.com with SMTP id 9so182365eyd.39
	for <linux-lvm@redhat.com>; Fri, 17 Apr 2009 08:04:32 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 17 Apr 2009 16:04:32 +0100
Message-ID: <bfb379e10904170804h55a7fbbemfd33b4f36fc6289c@mail.gmail.com>
From: iCy-fLaME <icy.flame.gm@gmail.com>
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] leaked on lvcreate invocation.
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

Hello,

I have the following sql script to create a snapshot volume for backup purpose:

######### snapshot.sql #########
flush tables;
flush tables with read lock;
flush logs;
system lvcreate --snapshot --size=10G --name=sn_www /dev/lvg00/pwww;
system lvcreate --snapshot --size=10G --name=sn_db /dev/lvg00/pdb;
unlock tables;
######### EOF #########

and this sql script is started in a shell script by:

mysql < /home/root/snapshot.sql


I get this warning? error? message:

File descriptor 3 (socket:[1023997]) leaked on lvcreate invocation.
Parent PID 2850: mysql
File descriptor 3 (socket:[1023997]) leaked on lvcreate invocation.
Parent PID 2850: mysql


I have little idea what it means, should I be concerned?


Thanks for the helps!

-- 
iCy-fLaME
