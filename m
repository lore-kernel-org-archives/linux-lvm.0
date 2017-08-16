Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9CD4F7E0A0
	for <linux-lvm@redhat.com>; Wed, 16 Aug 2017 07:22:02 +0000 (UTC)
Received: from cpsmtpb-ews02.kpnxchange.com (cpsmtpb-ews02.kpnxchange.com
	[213.75.39.5]) by mx1.redhat.com (Postfix) with ESMTP id 602C375701
	for <linux-lvm@redhat.com>; Wed, 16 Aug 2017 07:21:59 +0000 (UTC)
Content-Transfer-Encoding: 7bit
Content-Language: en-US
From: Herman Rohenkohl <H.Rohenkohl@hetnet.nl>
Message-ID: <35b24052-4798-41bb-4692-aaaedb1a4087@hetnet.nl>
Date: Wed, 16 Aug 2017 09:08:41 +0200
MIME-Version: 1.0
Subject: [linux-lvm] recursion in lvol prepared as physical partittion
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com



1) create vg test
2) create lvol test/virtual_device
3) pvcreate test/virtual_device
4) (with trickery) install debian with VG's in virtual_device (that was 
the plan)
5) reboot system

On reboot dmsetup/lvm, ultimately will find the intended partition/lvm 
setup.If you wait long enough!. Credit to the guys who wrote this code 
as stack depth limit errors/warnings don't seem to break anything. 
However on a Ryzen 1700 system with only SSD's, only the call of nature 
for a pee, saved me from the misconception that a kernel lockup ocurred.

With virtualization, to prepare a bare metal boot in a disk-image should 
be a no brainer. What should it look like to boot 'hdimage containers' 
on bare metal:

vmlinuz ro root=WHATEVER hdimage=/dev/$(VGa)/$(virtual 
device),/dev/$(VGb)/$(virtual device) hdimage=$("hey kernel, register my 
partitions")
