From: Ewen McNeill <lvm@ewen.mcneill.gen.nz>
Subject: Re: [linux-lvm] (no subject) 
In-Reply-To: Message from "Michael Vogt" <MichaelVogt@abcsystems.ch> 
   of "Fri, 02 May 2003 10:51:22 +0200." <772FBCA525B8FB4C9299D8D27FD4A5AA04105A@ABCSYSEXC1.abcsystems.ch> 
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <7949.1052008696.1@basilica.la.naos.co.nz>
Message-Id: <20030504003817.0BB2EAE4F5@basilica.la.naos.co.nz>
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
Date: Sat May 10 08:37:33 2003
List-Id: <linux-lvm.redhat.com>
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

[Resent: first copy had wrong From: address, and doesn't appear to have
 been accepted by the mailing list]

In message <772FBCA525B8FB4C9299D8D27FD4A5AA04105A@ABCSYSEXC1.abcsystems.ch>, "M
ichael Vogt" writes:
>well ewen, what do you mean with types recognised from matching against =
>/proc/devices? it contains the following:  [...]

Based on what I found when looking at LVM and ataraid issues:

The function lvm_get_device_type() in tools/lib/lvm_check_partitioned_dev.c 
(LVM 1.0.7) is used to check that a device being considered for a LVM
physical volume is of an appropriate type.

It does this by comparing the device's number (ie, major/minor) against
the list in /proc/devices, and ensuring that the driver associated with
the major number is one of the ones in its list. 

It has the following device names in its list:

-=- cut here -=-
        { "ide", LVM_DEVICE_TYPE_IDE },   /* IDE disk                        */
        { "sd", LVM_DEVICE_TYPE_SD },     /* SCSI disk                       */
        { "md", LVM_DEVICE_TYPE_MD },     /* Multiple Disk driver (SoftRAID) */
        { "loop", LVM_DEVICE_TYPE_LOOP }, /* Loop device                     */
        { "dasd", LVM_DEVICE_TYPE_DASD }, /* DASD disk (IBM S/390, zSeries)  */
        { "rd", LVM_DEVICE_TYPE_DAC960 }, /* DAC960 (2.2 kernel name)        */
        { "dac960", LVM_DEVICE_TYPE_DAC960 },/* DAC960 (2.4 kernel name)     */
        { "nbd", LVM_DEVICE_TYPE_NBD },   /* Network Block Device            */
        { "ida", LVM_DEVICE_TYPE_COMPAQ_SMART2 },/* Compaq SMART2            */
        { "cciss", LVM_DEVICE_TYPE_COMPAQ_CISS },/* Compaq CISS array        */
        { "ubd", LVM_DEVICE_TYPE_UBD },   /* User-mode virtual block device  */
        { "ataraid", LVM_DEVICE_TYPE_ATARAID }, /* ATA Raid                  */
        { "i2o_block", LVM_DEVICE_TYPE_I2O }, /* i2o disk */
        { NULL, LVM_DEVICE_TYPE_INVALID } /* Device not recognized           */
-=- cut here -=-

If the device you're trying to use doesn't match one of those types,
then LVM will refuse to use it, viz:

>linuxsvm:/usr/src/linux # lvmdiskscan -vd
>lvmdiskscan -- reading all disks / partitions (this may take a while...)
>lvmdiskscan -- filling directory cache...
><1> lvm_dir_cache -- CALLED MICHU
><22> lvm_add_dir_cache -- CALLED with /dev/svmaa=20
><22> lvm_add_dir_cache -- LEAVING with ret: NOT ADDED
><22> lvm_add_dir_cache -- CALLED with /dev/svmab=20
><22> lvm_add_dir_cache -- LEAVING with ret: NOT ADDED
><22> lvm_add_dir_cache -- CALLED with /dev/svmac=20
><22> lvm_add_dir_cache -- LEAVING with ret: NOT ADDED

The "NOT ADDED" there means "didn't recognise /dev/svmac as a type of
device that can have LVM on it".

So at very least you'd need to change that table.  You'll also need to
add to the enumerated type (lvm_device_type_t) in liblvm.h, so that
you have a value to put on the right hand side of that table in
tools/lib/lvm_check_partitioned_dev.c.

And there may well be some other areas that you need to add to as well.

Since LVM 2 apparently supports control with regular expressions that
might be a better choice than trying to hack support into LVM 1.0.7.
(although LVM 2 isn't officially released yet AFAIK).

Ewen
