Message-ID: <3FC24C0F.7030701@mail.com>
From: guy cadoche <guycadoche@mail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] return from lvm2 to lvm
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Mon Nov 24 17:23:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Hello,
I was using lvm on a 2.4 kernel (gentoo) and it works perfectly.
I install kernel-2.6 and lvm2 : works perfectly.
I want to return to kernel-2.4 and as the patch for device-mapper is not 
include in the kernel core, cannot mount the lvm disk.
it search for device-mapper (modprobe) and not for lvm-mod
I unmerge lvm2 and device-mapper...still the same.
Is there a way to return to use lvm-mod under kernel-2.4.22 ???
(I want to return because vmware-workstation doesn't work under kernel-2.6)
Thank you
Guy 
