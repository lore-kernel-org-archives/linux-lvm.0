From: "carlos xavier" <cbastos@connection.com.br>
Subject: Re: [linux-lvm] lvm 1.0.1-rc4 and vgcreate error
Message-Id: <3c45bd7c.4041.0@connection.com.br>
MIME-Version: 1.0
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
Date: Wed Jan 16 11:57:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; 
To: linux-lvm@sistina.com

Heins,

I'm sorry, I made a mistake when I was posting the message, what I did
was pvcreate /dev/sda1 and /dev/sdb1.
Actually, I even pvcreated /dev/hda10 and /dev/hda11 and tryed do run
vgcreate lvmdisk2 /dev/hda10 /dev/hda11 but the result was the same.

Regards,

Carlos


     > Carlos,

     > you say you pvcreated /dev/sda[12] successfully, but run
     > "vgcreate lvmdisk /dev/sda1 /dev/sdb1" which makes vgcreate complain
like
     > you reported below unless /dev/sdb1 is a valid PV too.

     > On Tue, Jan 15, 2002 at 10:08:37PM -0200, carlos xavier wrote:
     >> Hi there,
     >> 
     >> I'm trying to get LVM working on Linux but is being very frustrating
to me.
     >> 
     >> I'm running kernel version 2.4.14 and the disks where I'm tryng to do
LVM are
     >> 
     >> QUANTUM Model: ATLAS10K2-TY367 (scsi)
     >> I've already tried these versions of LVM: lvm_0.6, lvm_1.0.1 and
     >> lvm_1.0.1-rc4. All of them give some trouble, but the main problem is
that I
     >> 
     >> can't create the volume group.
     >> I followed the howto and partitioned the disks and changed the type
to 8e, I
     >> 
     >> was able to run pvcreate on the two disks /dev/sda1 and /dev/sda2, but
when
     >> I
     >> tried to create the volume group I'm getting the following error
     >> 
     >> # vgcreate lvmdisk /dev/sda1 /dev/sdb1
     >> vgcreate -- ERROR "pv_read(): PV identifier invalid" reading physical

     >>volumes
<pre>
################################
Connection Web Mail
http://www.connection.com.br
Visite http://www.achando.com.br
################################
</pre>
