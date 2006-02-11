Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k1B13V102780
	for <linux-lvm@redhat.com>; Fri, 10 Feb 2006 20:03:31 -0500
Received: from swlx166.swmed.edu (swlx166.swmed.edu [199.165.152.166])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id k1B13PJ5006857
	for <linux-lvm@redhat.com>; Fri, 10 Feb 2006 20:03:27 -0500
Received: from peters.swmed.org ([129.112.118.137])
	by swlx166.swmed.edu with esmtp (Exim 4.44) id 1F7jAW-0000Z2-ET
	for linux-lvm@redhat.com; Fri, 10 Feb 2006 19:03:20 -0600
Message-ID: <43ED37D8.9090908@utsouthwestern.edu>
Date: Fri, 10 Feb 2006 19:03:20 -0600
From: Peter Smith <peter.smith@utsouthwestern.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] potential bug with LVM2, --removemissing, and a LVM1 VG
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

I'm posting this to the list before I enter a real bug report 
just-to-see if anyone can see the flaw in what I'm doing...

First the background.  Recently I removed some SAN space from one of our 
system's LVM1 setups.  Problem is, I did a 'pvchange -x n <pv>', a 
'lvremove <lv>'  on the SAN space in question and then basically removed 
the space from the system physically.  Well, the rest of the VG 
obviously refused to mount after a reboot..  Through many steps I 
learned that the '--removemissing' option for 'vgreduce' on the newest 
LVM2 is bugged in that it will not work with LVM1 VGs.  You are forced 
to use a non-bugged version of LVM2.  As a matter of fact, you can 
create a LVM1 VG under LVM2, perform the steps above, and then try to 
fix it using the '--removemissing' option and it will NOT work.  I have 
gone so far as to create a script that can exercise the functionality 
and illustrate its failure.

So my question is, is this a legitimate bug?  I believe it is.  
Specifically a bug with the '--removemissing' option for the newest LVM2..

Thanks,
Peter
