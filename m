Message-Id: <3C334A99.6050601@birddog.com>
From: "Kirby C. Bohling" <kbohling@birddog.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] pvcreate problem
References: <25E4CA13D679FF48BC307694202209710164DE23@nd1-clusa.local.bunnings.com.au>
Content-Transfer-Encoding: 7bit
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
Date: Wed Jan  2 11:59:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

dd if=/dev/zero of=/dev/md0 bs=10k count=1000, should zero out the first 
10 of the device.  With one set of the tools I have, you have to do -ff 
according to the error message.

	Kirby

Colin Coe wrote:

> Hi all, when I try and 'pvcreate /dev/md0' I get the error: "pvcreate --
> device '/dev/md0' has a partition table".  I have tried using the -f and
> --force options without success.
> 
> /dev/md0 used to have an XFS partition on it.
> 
> Any ideas?
> 
> CC
> 
> **************************************************************************
> Bunnings Legal Disclaimer: 
> 
> 1) 	This document is confidential and may contain legally privileged 
> 	information. If you are not the intended recipient you must not 
> 	read, copy, distribute or act in reliance on it.
> 	If you have received this document in error, please telephone
> 	us immediately on (08) 9365-1555. 
> 
> 2)	All e-mails sent to and sent from Bunnings Building Supplies are
> 	scanned for content. Any material deemed to contain inappropriate
> 	subject matter will be reported to the e-mail administrator of
> 	all parties concerned.
> 
> **************************************************************************
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> 


-- 
Real Programmers view electronic multimedia files with a hex editor.
