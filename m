Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i1LIoYi03224
	for <linux-lvm@redhat.com>; Sat, 21 Feb 2004 13:50:34 -0500
Received: from mail.gmx.net (pop.gmx.net [213.165.64.20])
	by mx1.redhat.com (8.11.6/8.11.6) with SMTP id i1LIoYb28988
	for <linux-lvm@redhat.com>; Sat, 21 Feb 2004 13:50:34 -0500
From: "Michaeljohn Clement" <mjclement@gmx.net>
MIME-Version: 1.0
Message-ID: <29267.1077389428@www38.gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] LVM2 problem/disaster
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Sat Feb 21 13:49:01 2004
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com

Hi,

I recently upgraded lvm2 to 2.00.08 on my Gentoo installation.  After
rebooting, LVM fails to activate my volume group.  Since I have /home, /usr, and
/var on LVM, this creates a huge problem for me, and I can't downgrade the LVM
user-space tools to see if it fixes the problem.

My main disk is a SATA drive, which is only supported by linux 2.6 kernels.

I am using kernel 2.6.1, with device-mapper compiled into the kernel.  
Here's the problem:

# /sbin/lvchange -a y vg
/dev/cdrom: open failed: Read-only file system
device-mapper ioctl cmd 0 failed: Invalid argument
0 logical volume(s) in volume group "vg" now active

I don't know what the /dev/cdrom error is related to, I've never seen that
before.   Obviously the device-mapper error is the show-stopper.  Is this a
kernel problem, an LVM2 problem, or something else, and how can I fix it?

If there's no good way to fix it, then how can I go about recovering my
data?  KNOPPIX is still using 2.4 kernels, so it won't even be able to access my
main hard drive, unless there is a KNOPPIX built with 2.6 out there.  Are
there any live CDs that include both SATA and LVM2 support?  If not, is there
any other way to recover the data?  Obviously any help would be greatly
appreciated!

Thanks,

Michaeljohn Clement

-- 
GMX ProMail (250 MB Mailbox, 50 FreeSMS, Virenschutz, 2,99 EUR/Monat...)
jetzt 3 Monate GRATIS + 3x DER SPIEGEL +++ http://www.gmx.net/derspiegel +++
