Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l19HeFXO014868
	for <linux-lvm@redhat.com>; Fri, 9 Feb 2007 12:40:16 -0500
Received: from storix.com (mill-adnc_internal-206-71-178-18.adnc.com
	[206.71.178.18] (may be forged))
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l19HeATI021398
	for <linux-lvm@redhat.com>; Fri, 9 Feb 2007 12:40:10 -0500
Received: from [192.168.1.125] (office [65.106.88.139])
	by storix.com (Postfix) with ESMTP id 554FAF98
	for <linux-lvm@redhat.com>; Fri,  9 Feb 2007 09:35:54 -0800 (PST)
Message-ID: <45CCB22D.5000706@bigredradio.com>
Date: Fri, 09 Feb 2007 09:41:01 -0800
From: David Huffman <no_spam@bigredradio.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Max Physical Volumes set too high
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

When running the command:
vgcreate -s 4096k -p 256 -l 255 /dev/vg00 /dev/cciss/c0d0p3

Received the error:
setlocale failed
Number of volumes may not exceed 255

 From my understanding there is not a limitation on the number of 
physical volumes in LVM2. Why would I receive this error if there is no 
Max limit on the number of physical volumes.

LVM version: 2.00.15 (2004-04-19)
Library version: 1.00.19-ioctl (2004-07-03)
Driver version: 4.3.0

Has this been corrected in a later version or do I need to specify the 
MAX PHYSICAL VOLUMES as 0?

I understand that I can just adjust to 255 or less, but this is a script 
that recreates a volume group based on previous settings. The original 
VG had MAX PHYSICAL VOLUMES set to 256, yet I am unable to recreate it 
with the same values.

Thanks
David
