Return-Path: <urs@isnogud.escape.de>
Subject: Re: [linux-lvm] LVM and *bad* performance (no striping)
References: <200104111949.f3BJnFHt014761@webber.adilger.int>
From: Urs Thuermann <urs@isnogud.escape.de>
Date: 15 May 2001 13:46:15 +0200
In-Reply-To: <200104111949.f3BJnFHt014761@webber.adilger.int>; from Andreas Dilger on Wed, 11 Apr 2001 13:49:14 -0600 (MDT)
Message-ID: <m2n18eygvs.fsf@isnogud.escape.de>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Andreas Dilger <adilger@turbolinux.com> writes:

> I'm hoping this patch will make it into the stock LVM because it aligns
> all of the large VGDA structs to PAGE_SIZE (at least 4k pages), and the
> PE alignment matches MD RAID device alignment.

Sorry, I hadn't time to test your patch earlier.  I wanted to try it
yesterday but lvm-0.9.1-beta7 with your patch applied doesn't compile.
There are undefined symbols

    $ make
    ...
    gcc  -L../tools/lib -llvm-10  -o vgchange vgchange.o 
    vgchange.o: In function `main':
    /home/urs/tmp/LVM/0.9.1_beta7-dilger/tools/vgchange.c:635: undefined reference to `LVM_PE_ON_DISK_BASE'
    /home/urs/tmp/LVM/0.9.1_beta7-dilger/tools/vgchange.c:638: undefined reference to `LVM_DISK_SIZE'
    
When I have done my performance tests I had a stock linux-2.4.3 and
user space tools from lvm-0.9 running.  I now repeated the tests with
lvm-0.9.1-beta7, both user space tools and kernel (recreated all PVs,
VGs and LVs).  However, the results with these versions are the same.

I also did some tests with another hard disk drive.  My previous tests
were with a IBM DCAS-34330W SCSI-U2W.  I now did some tests with a NEC
DSE2100S SCSI2 drive.  Again, LVM is much slower with the standard
512 byte block size:

    # pvcreate /dev/sdc4
    pvcreate -- physical volume "/dev/sdc4" successfully created
    
    # vgcreate vg1 /dev/sdc4
    vgcreate -- INFO: using default physical extent size 4 MB
    vgcreate -- INFO: maximum logical volume size is 255.99 Gigabyte
    vgcreate -- doing automatic backup of volume group "vg1"
    vgcreate -- volume group "vg1" successfully created and activated
    
    # lvcreate -n test vg1 -l31
    lvcreate -- doing automatic backup of "vg1"
    lvcreate -- logical volume "/dev/vg1/test" successfully created
    
    # time dd if=/dev/sdc4 of=/dev/null
    257040+0 records in
    257040+0 records out
    
    real    0m37.205s
    user    0m0.840s
    sys     0m3.780s
    # time dd if=/dev/vg1/test of=/dev/null
    253952+0 records in
    253952+0 records out
    
    real    2m52.368s
    user    0m1.330s
    sys     0m12.390s
    # time dd if=/dev/vg1/test of=/dev/null bs=8k
    15872+0 records in
    15872+0 records out
    
    real    0m43.501s
    user    0m0.050s
    sys     0m4.600s
    # time dd if=/dev/vg1/test of=/dev/null bs=16k
    7936+0 records in
    7936+0 records out
    
    real    0m40.806s
    user    0m0.070s
    sys     0m4.290s
    # time dd if=/dev/vg1/test of=/dev/null bs=32k
    3968+0 records in
    3968+0 records out
    
    real    0m38.777s
    user    0m0.030s
    sys     0m4.290s
    
What I find surprising is that the system time increases to 12.390s
with LVM compared to 3.780s on /dev/sdc4.  That is approx. 34ms of
overhead per 512-block which I find a lot for the simple mapping of
block numbers.  But this still does not explain the much longer real
elapsed time.

Is there another patch (maybe to produce some debugging output) I
could try to find the reason for this performnace hit?

And am I really the only one who sees this?  I would really be
interested to hear from some more people about performance for their
LVM.


urs
