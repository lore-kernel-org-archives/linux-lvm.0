Message-ID: <40064F10.8080509@cineca.it>
From: Tommaso Cecchi <t.cecchi@cineca.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] lvm and scsidev
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
Date: Thu Jan 15 03:29:02 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

I'm trying to use lvm-1.0.5-51 on a linux box (SuSE SLES 8)
with the scsidev utility (scsi-1.7_2.31_1.05_0.10-63).

I have a LUN that is seen either as /dev/sdc and as /dev/scsi/sdc2b0t0u3
thanks to the scsidev utility  (I created it running scsidev -fde) and
I would use this second name to be sure it does not change
as I assign or unassign other LUNs

The problem I'm facing is that pvcreate doesn't seem to
get the partition information from the device when I use the "scsidev" name.
Infact, once I created a partition on the device, here is what I get :


tom:~ # pvcreate -v /dev/scsi/sdc2b0t0u3p1
pvcreate -- locking logical volume manager
pvcreate -- checking physical volume name "/dev/scsi/sdc2b0t0u3p1"
pvcreate -- getting physical volume size
pvcreate -- can't open physical volume "/dev/scsi/sdc2b0t0u3p1" to get 
its size

On the other hand if I use the corresponding device I get the
usual message:

node255:~ # pvcreate -v /dev/sdc1

Moreover this problem shows an unpredictable behaviour cause
if I rerun the command after a while:

node255:~ # pvcreate -v /dev/scsi/sdc2b0t0u3p1

it seems to complete correctly.

Nevertheless, even if I succeed in creating a PV over "scsidev devices",
this kind of devices are not very well recognized by lvm, infact running
pvscan or lvmdiskscan they don't appear in the list.
But they are recognized as PV if I run a pvdisplay:

node255:~ # pvdisplay /dev/scsi/sdc2b0t0u3p1
pvdisplay -- "/dev/scsi/sdc2b0t0u3p1" is a new physical volume of 136.49 GB

Finally these PV seems not to be suitable to build a VG, infact:

node255:~ # vgcreate homevg /dev/scsi/sdc2b0t0u3p1 /dev/scsi/sdc2b0t1u2p1
vgcreate -- no valid physical volumes in command line


What I guess is that devices created by scsidev are not visible under 
/proc/partitions
but I'm not sure about that.
Does anybody else can suggest me something?
Thanks

Tommaso


-- 
================================================================
|     Tommaso Cecchi                          CINECA
| System Management Group              Via Magnanelli 6/3 40033 
| e-mail: t.cecchi@cineca.it             Casalecchio di Reno 
| Tel: 051/6171411                         Bologna - ITALY
| Fax 051/6132198                       http://www.cineca.it
================================================================
