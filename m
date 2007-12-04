Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id lB495FN0024423
	for <linux-lvm@redhat.com>; Tue, 4 Dec 2007 04:05:15 -0500
Received: from QMTA08.westchester.pa.mail.comcast.net
	(qmta08.westchester.pa.mail.comcast.net [76.96.62.80])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id lB494kB8031194
	for <linux-lvm@redhat.com>; Tue, 4 Dec 2007 04:04:46 -0500
Message-ID: <475517F1.9050000@ucdavis.edu>
Date: Tue, 04 Dec 2007 01:03:45 -0800
From: Brad Sickler <basickler@ucdavis.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] moving a logical volume between servers
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

I'm surprised I couldn't find a good answer to the question before but I 
want to move logical volumes from one computer to another.

A little more detail... I created a bunch of xen images on logical 
volumes. I brought another computer up to split the load of all the 
virtual machines and I want to move some volumes to the new computer. 
When I created them I figured I could just dd them like a partition but 
upon attempting this and booting the transported xen machine/logical 
volume fsck showed some bad errors on the boot partition of the virtual 
machine. The later partitions seemed fine.

I did some testing and found that I got the same error no matter the 
block size. That if I created a new logical volume on the same machine 
as the source and dd'd between them ala
lvcreate -n machine2 -L 20G lvmxen
dd if=/dev/lvmxen/machine of=/dev/lvmxen/machine2
machine2 worked just like machine.
But when I dd'd to a file, moved that file to another computer then dd'd 
back into a new logical volume. I had the errors again.

I have some ideas on how to fix the error inside of the virtual machine 
but they would be painful considering that I have 10 virtual boxes 
running in this configuration.

So, I have a few questions for the lvm guru's.
A. Is it possible to move logical volumes from one computer to another? 
And no, these aren't simple ext3 file systems so I can't just mount it 
and export the files, they contain entire machines. I was hoping for 
something in the nature of lvexport / lvimport but that obviously 
doesn't exist.
B. Why does this occur?... I searched for a while but didn't find 
anything concrete as to why this occurs. I've always thought that a 
block device = a block device. Evidently I was wrong.

Thanks for any help.


Brad Sickler
Bioinformatician, Genome Center
University of California, Davis
