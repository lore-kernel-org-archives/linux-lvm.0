Message-Id: <200204261339.g3QDd2s03213@mailhost.aerov.jussieu.fr>
From: Estienne Bloch <Estienne.Bloch@aerov.jussieu.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] lvcreate's man error (minor)
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
Date: Fri Apr 26 08:38:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Linux-LVM@Sistina.com

Hello,

 I'm a french user of a Mandrake 8.2 distribution. I notice a little error in 
the man of lvcreate command. So, here is what I suggest.

 Original man

 -p, --permission r/w
	Set access permissions to read only or read and write.
	Default is read and write.

 May be

 -p, --permission r/rw
	Set access permissions to read only or read and write.
	Default is read and write.

 Because if I use

# lvcreate -L 4064m -n fpodlv -p w fpodvg

 I obtain

lvcreate -- ERROR option p argument "w"

 And if I try

# lvcreate -h

 I obtain (extract)

[-p|--permission {r|rw}]

 I've got another question. I precise I'm not a realy experienced user under 
Linux but I try to make a solution to backup systems with a easy to use 
interface called "fpod". This project drives me to use the LVM facilities.
I intended to create a big LV on a RAID array of 500 GB. Further this space 
could be extended to much more RAID array in the same LV. I notice in the 
vgcreate's man a kernel limit to 2 TB per block device.

 But, when I test the LVM tools, I obtain a maximum logical volume size of 
1.00 Terabyte after the command :

# vgcreate -s 32m fpodvg /dev/scsi/host0/bus0/target1/lun0/part1

 If I try :

# vgcreate -s 16m fpodvg /dev/scsi/host0/bus0/target1/lun0/part1

 I obtain

vgcreate -- INFO: maximum logical volume size is 1023.97 Gigabyte

So, my question is : does 2 TB in place of 2 TeraByte or 2 TeraBlock ?

LV' = 16 MByte x 65536 = 1 TeraByte = 2 TeraBlock (if 1 Block = 512 KByte)
LV" = 32 MByte x 65536 = 2 TeraByte = 4 TeraBlock (out of range)

Thanks for your attention.

Good day,

Estienne Bloch.

ien2lest@aerov.jussieu.fr
