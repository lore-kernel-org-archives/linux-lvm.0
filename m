Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p1NJ7Uxj002973
	for <linux-lvm@redhat.com>; Wed, 23 Feb 2011 14:07:30 -0500
Received: from nm3-vm1.bullet.mail.in.yahoo.com
	(nm3-vm1.bullet.mail.in.yahoo.com [121.101.151.208])
	by mx1.redhat.com (8.14.4/8.14.4) with SMTP id p1NJ7KPp003831
	for <linux-lvm@redhat.com>; Wed, 23 Feb 2011 14:07:21 -0500
Message-ID: <548483.57735.qm@web95205.mail.in2.yahoo.com>
Date: Thu, 24 Feb 2011 00:37:19 +0530 (IST)
From: Tinni <t_inni@yahoo.co.in>
In-Reply-To: <Pine.LNX.4.64.1102231304240.14448@bmsred.bmsi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Problem executing  lvm related commands
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi All,

 Need the suggession for the folling issues :

   Operating  System : rhel 5.5 ,  86_64 

  In our environment,  16 nodes are in cluster and shared storage is being used.
  Multipath is used, and there was no aliases.  The  admins  created the disk,
  with the /dev/dm....

  Now they changed the  multipath  config  file and incorporated  the aliases.

  The alias names are as follows:

             HOST-1TB-CLVM-VG04-DISK1
             HOST-1TB-CLVM-VG02-DISK1

  and so on. 

  They  use  the filter  in lvm.conf  as   filter = [ "r/scsi.*/","r/pci.*/","r/sd.*/","a/.*/" ]

  They did not enable  the  "preferred_names"   option in lvm.conf


  Now the problem is, lvm related  any commands are getting hung. 

  While debugging the issue I activated the "preferred_names"  option   in lvm.conf

  and found the errors  as follows:

     [root@server ~]# lvs
  File descriptor 4 (/dev/pts/0) leaked on lvs invocation. Parent PID 20817: bash
  WARNING: Ignoring duplicate config node: preferred_names (seeking preferred_names)

I mentioned literally all the vgnames  under "preferred_names"  in lvm.conf but  still the 
errors are same. 

If anybody gives some suggesstion , how to rectify the issue  that  will be really helpful.


Thanks  in advance
