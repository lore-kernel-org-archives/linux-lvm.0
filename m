Return-Path: <stefan.helfert@mpi-hd.mpg.de>
Message-ID: <3ADB3B2A.B28AC133@mpi-hd.mpg.de>
Date: Mon, 16 Apr 2001 20:34:18 +0200
From: Stefan Helfert <stefan.helfert@mpi-hd.mpg.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] disk add means trouble: vgscan -- invalid i/o protocol version 5
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Dear list,

I was running a stable configuration until yesterday:
several SCSI disks with standard partitions, two IDE disks, only one IDE
disk (Maxtor 40Gig /dev/hda) holding a LVM partition. LVM version that
of 
SuSE 7.0, that was lvm-0.8 Build 111 from SuSE.

When I added a 60 GB Maxtor IDE as primary slave, I found that vgscan
only
throws an "invalid i/o protocol" error. Upgrading to a SuSE 7.0 update
lvm did not help. Upgrading to the SuSE 7.1 lvm-0.9.1_beta-3 did not
help
except detailing the error "... protocol version 5".

When detaching the 60 GB disk, everything works again. (The 60 Gig disk 
is empty, it did not hold a partition table -- and it does not work with
a
partition table and some partition either.)

Any ideas ? (The 40Gig disk is in dire need of replacement, and this
configuration should be used over the weekend to move the data).

Let me stress this:
the configuration had been working flawlessly before, and I checked that
/dev/lvm is around.


Stefan

bash-2.04# vgscan -d                                                   
<1> lvm_get_iop_version -- CALLED
<22> lvm_check_special -- CALLED
<22> lvm_check_special -- LEAVING
<1> lvm_get_iop_version -- AFTER ioctl ret: 0 
<1> lvm_get_iop_version -- LEAVING with ret: 5   
vgscan -- invalid i/o protocol version 5
