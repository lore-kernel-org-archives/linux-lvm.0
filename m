Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k4IKIToe006761
	for <linux-lvm@redhat.com>; Thu, 18 May 2006 16:18:29 -0400
Received: from smtp.andrew.cmu.edu (smtp.andrew.cmu.edu [128.2.10.82])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k4IKIQCD013461
	for <linux-lvm@redhat.com>; Thu, 18 May 2006 16:18:26 -0400
Message-ID: <446CD6C1.6030705@cmu.edu>
Date: Thu, 18 May 2006 16:19:13 -0400
From: George Nychis <gnychis@cmu.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] dm-mod unresolved external with 2.4.32
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
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org
Cc: linux-lvm@redhat.com

Hi,

I was wondering if anyone has gotten LVM2 support with the 2.4.32 kernel?

I downloaded device-mapper.1.01.05 and applied the 2.4.28-pre4-devmapper
and 2.4.22-VFS-lock patches to my 2.4.32 kernel, which seemed to be
successful

I then added module support for device mapper in the kernel, and did
make dep && make bzImage modules modules_install && make install

So then i reboot and I see "dm-mod.o: -1 Unresolved external symbol"

I had no errors or warnings building my modules

Any ideas how i can find out what the external symbol is, or does anyone
see anything I'm missing?

Thanks!
George
