Message-ID: <3F05CC3D.2000704@idealteknoloji.com>
From: Oguz Yilmaz <oguz@idealteknoloji.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] problem with PV
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
Date: Fri Jul  4 13:50:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Hi,

We have a SAN device. (IBM 400DR - 400GB). This is connected to a SAN 
switch through 2 redundant fiber cables and a Linux box is connected to 
this switch through a fibre channel host bus adapter (qlogic 2310F). We 
have 2 LUNs on SAN device.
LUN1 is connected to Linux as /dev/sdd. Linux recognizes the SAN device 
on boot and connects to /dev/sdd.
/dev/sdd is assigned as a physical volume to LVM. and a volume group is 
created on it.

Because of an environmental problem, systems were crashed today. After 
the crash, systems were booted. However, after the boot LVM 
configuration was lost. pvscan and vgscan gives nothing! /etc/lmvtab 
/etc/lvmtab.d was empty.
1- how can we restore volume groups on /dev/sdd?
2- a "pvcreate /dev/sdd" command was run after the reboot. What do you 
think about the data on /dev/sdd ? What do you think about LVM data on 
/dev/sdd?  If data is lost also, what can we do to recover?
3- If we create a volume group after creating physical volume, can we 
see the data?

thanks,

Oguz Yilmaz
