Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j317C4O17055
	for <linux-lvm@redhat.com>; Fri, 1 Apr 2005 02:12:04 -0500
Message-ID: <424CF437.1050607@cs.wisc.edu>
Date: Fri, 01 Apr 2005 01:11:51 -0600
From: Vivek Shrivastava <viveks@cs.wisc.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Relationship between Device Mapper and LVM2
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
To: dm@uk.sistina.com, linux-LVM@sistina.com

Dear Sir,
        We are trying to do some work on LVM2, by trying to make it more 
dynamic and suitable for virtual machines. We have a very fundamental 
doubt as follows:

Is LVM2 based on top of "device mapper" and uses "device mapper" as the 
underlying layer of support for writing /reading on the disk. Or Device 
mapper is placed between the kernel and the LVM2. Aslo if possible 
please tell us the entry point of kernel into the device mapper.

Any suggestions on this topic will be highly appreciated.

Thanks,
Vivek
