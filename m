Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i1J76Xi19657
	for <linux-lvm@redhat.com>; Thu, 19 Feb 2004 02:06:33 -0500
From: "Lu Jian" <jian_lu@usish.com>
Message-ID: <003301c3f6b6$c914f320$3e38a8c0@usish.com.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Segmentation fault of LVM2
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
Date: Thu Feb 19 09:54:48 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi all,

When I use lvm commands, there is always "Segmentation fault" appears.
I tried to use GDB to trace the pvcreate command, found when it run at 
locking.c:: _block_signals(int flags); the error:
"Program received signal SIGSEGV, Segmentation fault" happened.

I have modified below files before 'make install' to remove compile
errors:
usr/include/signal.h:151:typedef __sighandler_t sig_t; /*add this line*/

usr/include/sys/select.h:38://typedef __sigset_t sigset_t; /*remove this
line*/

My platform is Redhat 9.0, and the kernel is 2.4.21 with
device-mapper1.0.

Do these modifications cause  the segmentation fault?  How can I solve
it?
Thank you very much!

-Lu, Jian
