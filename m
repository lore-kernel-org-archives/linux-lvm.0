Message-Id: <25E4CA13D679FF48BC307694202209710164DE23@nd1-clusa.local.bunnings.com.au>
From: Colin Coe <CCoe@bunnings.com.au>
MIME-Version: 1.0
Subject: [linux-lvm] pvcreate problem
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
Date: Wed Jan  2 02:13:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

Hi all, when I try and 'pvcreate /dev/md0' I get the error: "pvcreate --
device '/dev/md0' has a partition table".  I have tried using the -f and
--force options without success.

/dev/md0 used to have an XFS partition on it.

Any ideas?

CC

**************************************************************************
Bunnings Legal Disclaimer: 

1) 	This document is confidential and may contain legally privileged 
	information. If you are not the intended recipient you must not 
	read, copy, distribute or act in reliance on it.
	If you have received this document in error, please telephone
	us immediately on (08) 9365-1555. 

2)	All e-mails sent to and sent from Bunnings Building Supplies are
	scanned for content. Any material deemed to contain inappropriate
	subject matter will be reported to the e-mail administrator of
	all parties concerned.

**************************************************************************
