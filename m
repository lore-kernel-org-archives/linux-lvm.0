Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i32COlj21208
	for <linux-lvm@redhat.com>; Fri, 2 Apr 2004 07:24:47 -0500
Date: Fri, 2 Apr 2004 14:24:22 +0200
From: Dumas Patrice <dumas@centre-cired.fr>
Message-ID: <20040402122422.GA17971@hermes.centre-cired.fr>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] depmod in lvmcreate_initrd erro rmessages with
	different kernel
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
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
Content-Transfer-Encoding: 7bit
To: Heinz Mauelshagen <Linux-LVM@Sistina.com>

Hi,

I am trying to use lvmcreate_initrd to make an initrd for a kernel different
than the one which is running (to be more precise, I have a running redhat 9
and I am doing lvmcreate_initrd chrooted in a gentoo). Thus I run 
$ lvmcreate_initrd 2.4.24
When lvmcreate_initrd runs depmod, it runs
$ depmod -a 2.4.24
depmod echoes a lot of errors message because there are a lot of unresolved 
symbols (because the running kernel isn't the kernel I run depmod for). The 
exit status is 0, though and the initrd is created.
The right depmod invocation should (if I'm not wrong) be:
$ depmod -a 2.4.24 -F /usr/src/linux-2.4.24/System.map

Is this a problem (depmod having unresolved symbols) ? (there is a comment in 
the lvmcreate_initrd code which seems to imply that it is not a problem, but I 
am not sure)

If yes, I think a new option should be added to lvmcreate_initrd, for the
System.map location.

If no, this should be stated in the man page.

I can do diffs if you want.

Pat
