Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iA752kr14556
	for <linux-lvm@redhat.com>; Sun, 7 Nov 2004 00:02:46 -0500
Message-ID: <418DAC9C.70205@dakotacom.net>
Date: Sat, 06 Nov 2004 22:03:24 -0700
From: ewf <erich@dakotacom.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Possible version problem
Reply-To: erich1@dakotacom.net,
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Heinz Mauelshagen <Linux-LVM@Sistina.com>

Well
      I have a 2.2.20 kernel, (Debian stable), and I have a Debian 
package for lvm10 and lvm-common:

            lvm10,  install version, 1.0.4-4

            lvm-common, install version, 1.5.5

     I read that, for this early a version, a kernel module must be 
installed. However, I see no evidence that
one has been installed. I suspect that the new, (lvm), package may not 
contain  the kernel module
necessary to run with the old kernel version. Please confirm.

     I assume that the process of installing a package under Debian 
automatically installs a kernel
module if a given package requires it and contains it.

     I am setting up a MythTV system for home usage, and would like to 
gain the benefits of LVM.

                                                                        
                                                              Sincerely,
                                                                        
                                                              Erich 
Flothmeier
