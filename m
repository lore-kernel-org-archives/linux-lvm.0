Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m8PHJfnY018262
	for <linux-lvm@redhat.com>; Thu, 25 Sep 2008 13:19:43 -0400
Received: from an-out-0708.google.com (an-out-0708.google.com [209.85.132.250])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m8PHJUil031392
	for <linux-lvm@redhat.com>; Thu, 25 Sep 2008 13:19:31 -0400
Received: by an-out-0708.google.com with SMTP id d31so36637and.124
	for <linux-lvm@redhat.com>; Thu, 25 Sep 2008 10:19:30 -0700 (PDT)
Message-ID: <779919740809251019t82ef425w6863c4b05044519a@mail.gmail.com>
Date: Thu, 25 Sep 2008 11:19:29 -0600
From: "Jeremy Lyon" <jerlyon@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_7037_29608803.1222363169928"
Subject: [linux-lvm] pvmove with a clustered VG
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
To: linux clustering <linux-cluster@redhat.com>, LVM general discussion and development <linux-lvm@redhat.com>

------=_Part_7037_29608803.1222363169928
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

I wasn't sure which list to, so I chose both cluster and lvm.

My current configuration:
2 Node RHEL 5.2 cluster with multiple GFS on top of logical volumes in one
volume group.

# rpm -q cman lvm2 lvm2-cluster kmod-gfs
cman-2.0.84-2.el5
lvm2-2.02.32-4.el5
lvm2-cluster-2.02.32-4.el5
kmod-gfs-0.1.23-5.el5

I need to move a PV out of this volume group so I attempted to run pvmove
/dev/sdk1 but errors about locking on the other node.  I assumed this was
because of the multiple GFS file systems being used on both nodes (services
were spread across the nodes).  So I relocated all services to one node and
even stopped rgmanager, gfs, clvmd and cman on the idle node to make sure
that no locks would remain open.

I still had issues with running the pvmove.  I saw these messages:

Sep 24 17:56:48 nodea kernel: device-mapper: mirror log: Module for logging
t
ype "clustered-core" not found.
Sep 24 17:56:48 nodea kernel: device-mapper: table: 253:31: mirror: Error
cre
ating mirror dirty log
Sep 24 17:56:48 nodea kernel: device-mapper: ioctl: error adding target to
ta
ble

And after about 14% of the move was completed, there was another locking
message and many processes went into an uninteruptable sleep state.  Load on
the server shot up to around 80.

I finally had to reboot the node and run pvmove --abort to get everything
back to working condition.

Is it not possible to run pvmove on a clustered VG?  Any help would be
appreciated.

-Jeremy

------=_Part_7037_29608803.1222363169928
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

<div dir="ltr">I wasn&#39;t sure which list to, so I chose both cluster and lvm.<br><br>My current configuration:<br>2 Node RHEL 5.2 cluster with multiple GFS on top of logical volumes in one volume group.<br><br># rpm -q cman lvm2 lvm2-cluster kmod-gfs<br>
cman-2.0.84-2.el5<br>lvm2-2.02.32-4.el5<br>lvm2-cluster-2.02.32-4.el5<br>kmod-gfs-0.1.23-5.el5<br><br>I need to move a PV out of this volume group so I attempted to run pvmove /dev/sdk1 but errors about locking on the other node.&nbsp; I assumed this was because of the multiple GFS file systems being used on both nodes (services were spread across the nodes).&nbsp; So I relocated all services to one node and even stopped rgmanager, gfs, clvmd and cman on the idle node to make sure that no locks would remain open.<br>
<br>I still had issues with running the pvmove.&nbsp; I saw these messages:<br><br>Sep 24 17:56:48 nodea kernel: device-mapper: mirror log: Module for logging t<br>ype &quot;clustered-core&quot; not found.<br>Sep 24 17:56:48 nodea kernel: device-mapper: table: 253:31: mirror: Error cre<br>
ating mirror dirty log<br>Sep 24 17:56:48 nodea kernel: device-mapper: ioctl: error adding target to ta<br>ble<br><br>And after about 14% of the move was completed, there was another locking message and many processes went into an uninteruptable sleep state.&nbsp; Load on the server shot up to around 80.<br>
<br>I finally had to reboot the node and run pvmove --abort to get everything back to working condition.&nbsp; <br><br>Is it not possible to run pvmove on a clustered VG?&nbsp; Any help would be appreciated.<br><br>-Jeremy<br><br></div>

------=_Part_7037_29608803.1222363169928--
