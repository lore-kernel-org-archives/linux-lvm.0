Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i9PGakr25968
	for <linux-lvm@redhat.com>; Mon, 25 Oct 2004 12:36:46 -0400
Received: from mail.intellij.net (mail.intellij.net [213.182.181.98])
	by mx1.redhat.com (8.12.11/8.12.11) with SMTP id i9PGadlZ013503
	for <linux-lvm@redhat.com>; Mon, 25 Oct 2004 12:36:45 -0400
Message-Id: <200410251636.i9PGadlZ013503@mx1.redhat.com>
From: <sergey@17234.copi.ru>
Sender: "Sergey Zhukov" <Sergey.Zhukov@jetbrains.com>
Date: Mon, 25 Oct 2004 20:36:38 +0400
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] How to restore PV header ?
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
To: linux-lvm@redhat.com

Hello, Everybody !

I've deleted header of PV by mistake...
/dev/sda3 - is partition for PV and I've executed "disk /dev/sda3", created partitions and written it back. I know, I'm stupid.
:-(
I've made a mistake and instead 3-rd physical HDD that I was need to partitioning I've created partition on the first HDD in 3-rd
partition...
pvdispaly no tells "no PV" about /dev/sda3

Currently server is working and I think it will be work until reboot. I have correct structures under "/proc/lvm"

Could somebody tell me, is there some way to restore PV header before reboot ? System is RHEL 3.

Thanks a lot to everybody in advance !

Thanks,
Sergey 
