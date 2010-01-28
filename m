Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.8])
	by int-mx05.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o0S9oV0I024501
	for <linux-lvm@redhat.com>; Thu, 28 Jan 2010 04:50:31 -0500
Received: from sklave3.rackland.de (sklave3.rackland.de [88.198.248.38])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o0S9oFAM006590
	for <linux-lvm@redhat.com>; Thu, 28 Jan 2010 04:50:16 -0500
Date: Thu, 28 Jan 2010 10:50:14 +0100
From: Hadmut Danisch <hadmut@danisch.de>
Message-ID: <20100128095014.GA6725@danisch.de>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] dmsetup and 2.6.31 kernel?
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Hi,

just a question: 

With a 2.6.31 kernel (ubuntu) I run into the problem that some dmsetup
and dmlosetup commands that used to work before do not work anymore. 

e.g.

dd if=/dev/zero of=/tmp/testdisk count=1000
dmsetup create xxxtest --table '0 1000 loop /tmp/testdisk 0'

produces

device-mapper: reload ioctl failed: Invalid argument
Command failed



an strace shows that all problems are caused by

ioctl(3, DM_TABLE_LOAD, 0x959c430)      = -1 EINVAL (Invalid argument)


Even compiling the latest source from your cvs repository does not
solve the problem. 


Any idea how to solve that problem?

regards
Hadmut
