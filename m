Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6BEswfj028613
	for <linux-lvm@redhat.com>; Tue, 11 Jul 2006 10:54:58 -0400
Received: from smtp.vzavenue.net (smtp.vzavenue.net [66.171.59.140])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k6BEspW8007420
	for <linux-lvm@redhat.com>; Tue, 11 Jul 2006 10:54:51 -0400
Message-ID: <020001c6a4f9$f7ce9240$2901a8c0@robbie>
From: "Robbie Coss" <robbie@vzavenue.net>
References: <012401c6a45a$c53bcb80$2901a8c0@robbie>
	<32F72C4D4D0EC8458CA5BFD76A6D6C68064E9D35@gimli.xb.local>
Subject: Re: [linux-lvm] LVM2 maximum logical volume size help
Date: Tue, 11 Jul 2006 09:54:52 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Reply-To: Robbie Coss <robbie@vzavenue.net>,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: linux-lvm@redhat.com

Hi Shaun,

"Kernel 2.6 supports ext3 filesystems up to 32TB, according to RH Support."

I was wondering where you got this information. According to their web site:
http://www.redhat.com/rhel/details/limits/
the limit is 8TB.

I opened a support ticket and asked about this and this is what I was told:

Q: "The indicated web page (LVM2 Howto) gives a limit of 8 Exebytes for 
LVM2. However, this web page (http://www.redhat.com/rhel/details/limits/) 
gives a limit of 8TB for the ext3 filesystem. Which limit applies? And if 
the 8TB limit applies, are there other options, for example, other supported 
filesystem types I can use to increase the limit?"

A: "The 8Exa limit is for a LVM2 i.e if the OS supports it. Hence the 2 TB 
limit is applicable on Red Hat Enterprise Linux 4. You can possibly make use 
of some other Filesystem by adding some third party modules, but it will not 
be supported by red hat."

I think he was reading the wrong column (V3 instead of V4), hence the 2TB 
instead of 8TB.
This paper seems to confirm the 8TB limit for the 2.6 kernel:
http://ext2.sourceforge.net/2005-ols/2005-ext3-paper.pdf

"Assuming a 4 KB blocksize, a 32-bit block
number limits the maximum size of the filesystem
to 16 TB. However, because the superblock
format currently stores the number of block
groups as a 16-bit integer, and because (again
on a 4 KB blocksize filesystem) the maximum
number of blocks in a block group is 32,768
(the number of bits in a single 4k block, for
the block allocation bitmap), a combination of
these constraints limits the maximum size of
the filesystem to 8 TB."

Robbie


----- Original Message ----- 
From: "Shaun Mccullagh" <Shaun.Mccullagh@xb.nl>
To: "Robbie Coss" <robbie@vzavenue.net>; "LVM general discussion and 
development" <linux-lvm@redhat.com>
Sent: Tuesday, July 11, 2006 1:22 AM
Subject: RE: [linux-lvm] LVM2 maximum logical volume size help


Kernel 2.6 supports ext3 filesystems up to 32TB, according to RH Support.

Do you want to store a lot of files? or a few thousand in which case look at 
the mkfs.ext3 options to reduce the number of Inodes and speed up fsck after 
a crash.

HTH

Shaun

________________________________

From: linux-lvm-bounces@redhat.com on behalf of Robbie Coss
Sent: Mon 10/07/2006 21:55
To: linux-lvm@redhat.com
Subject: [linux-lvm] LVM2 maximum logical volume size help



Hi,

I am currently running RHEL4 update 3  (kernel 2.6.9-34.0.2.EL), and
using LVM2 and the ext3 filesystem.

I need to know what is the maximum logical volume size I can create. From
the LVM2 Howto, the max size is stated to be 8 exebytes. However, the
Red Hat doc says that the max filesystem size for ext3 is 8 TB.

I am guessing that means I am limited to 8 TB if I want to use ext3 ???

If so, then are there other filesystems I can use to overcome this limit. I
want
to be able to create volumes at least up to 100TB. Is there anything
included
with the Red Hat release that would be a good choice? Or anything free not
included with Red Hat? Or anything commercial?

Thanks in advance for any help or opinions.
Robbie

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/






Op dit e-mailbericht is een disclaimer van toepassing, welke te vinden is op 
http://www.xb.nl/disclaimer.html
