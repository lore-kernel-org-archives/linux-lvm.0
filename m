From: "carlos xavier" <cbastos@connection.com.br>
Message-Id: <3c44c485.4dcb.0@connection.com.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] lvm 1.0.1-rc4 and vgcreate error
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
Date: Tue Jan 15 18:14:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; 
To: linux-lvm@sistina.com

Hi there,

I'm trying to get LVM working on Linux but is being very frustrating to me.

I'm running kernel version 2.4.14 and the disks where I'm tryng to do LVM are

QUANTUM Model: ATLAS10K2-TY367 (scsi)
I've already tried these versions of LVM: lvm_0.6, lvm_1.0.1 and
lvm_1.0.1-rc4. All of them give some trouble, but the main problem is that I

can't create the volume group.
I followed the howto and partitioned the disks and changed the type to 8e, I

was able to run pvcreate on the two disks /dev/sda1 and /dev/sda2, but when
I
tried to create the volume group I'm getting the following error

# vgcreate lvmdisk /dev/sda1 /dev/sdb1
vgcreate -- ERROR "pv_read(): PV identifier invalid" reading physical volumes


With the version lvm_1.0.1 I was able to create it and mount, but when I
rebooted the computer I couldn't mount it again, the volume wasn't detected

and the data tha I put on it was lost.

I did a trace of the command and I can see that it opens the files
/etc/lvmtab,
/etc/lvmtab.d
/dev/lvm
/etc/lvmtab
/proc/partitions and
/proc/devices
in that order, and after that it gives me the error.

Am I missing something?
Could Somebody tell me how can I get over this trouble?

Regards.

Xavier
<pre>
################################
Connection Web Mail
http://www.connection.com.br
Visite http://www.achando.com.br
################################
</pre>
