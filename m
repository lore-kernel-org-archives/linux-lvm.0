Message-Id: <5.1.0.14.2.20001106182701.01f3df50@tuxcat.cetemmsa.es>
From: Joan Manel =?iso-8859-1?Q?L=F3pez?= <joan@cat-linux.com>
Mime-Version: 1.0
Subject: [linux-lvm] core dumped
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
Date: Tue Nov  6 11:31:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hello
I am having a lot of problems using a Redhat 7.1 with kernel 2.4.14 + lvm 
1.0.1-rc4.

When I exec vgscan in my /var/messages a lots of "invalidate: busy buffer" 
strings appears.

Then, I do a "vgchange -ay" and I can create a PV and a VG. But at the 
moment that a exec lvcreate, it fails with a "core dumped".

Here are my logs:

root@Homer sbin]# ./lvcreate -L948M -n test /dev/vol -v
lvcreate -- checking volume group name "/dev/vol"
lvcreate -- checking volume group existence
lvcreate -- checking volume group activity
lvcreate -- checking logical volume path "/dev/vol/test"
lvcreate -- checking stripe count
lvcreate -- checking stripe size
lvcreate -- locking logical volume manager
lvcreate -- getting volume group status from VGDA in kernel
lvcreate -- checking stripe size against volume group physical extent size
lvcreate -- reading volume group data of "vol"
lvcreate -- checking logical volume maximum size
lvcreate -- checking volume group free space
lvcreate -- checking stripe count against physical volume count
lvcreate -- checking for maximum logical volume count
lvcreate -- setting up logical volume
lvcreate -- setting read ahead sectors
lvcreate -- creating logical volume VGDA in kernel
Segmentation fault (core dumped)

vgcreate with -d:

<7777777> lvm_get_device_type called
<7777777> lvm_get_device_type leaving with 0
<666666> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_new -- CALLED
<55555> pv_check_new -- LEAVING with ret: 0
<4444> pv_check_consistency -- LEAVING with ret: 0
<333> lv_check_on_pv -- LEAVING with ret: 1
<22> pv_reserve_pe -- LEAVING with ret: 0
<1> lv_setup_for_create -- pv_reserve_pe returned: 0   pe_last: 237  pe: 0
<1> lv_setup_for_create -- pe: 0
<1> lv_setup_for_create -- LEAVING with ret: 0
lvcreate -- setting read ahead sectors
<1> lvm_dont_interrupt -- CALLED
<1> lvm_dont_interrupt -- LEAVING
lvcreate -- creating logical volume VGDA in kernel
Segmentation fault (core dumped)


What appears at /var/messages:

invalidate: busy buffer
invalidate: busy buffer
invalidate: busy buffer

Who can solve this problem???
What's the best kernel version to use with lvm???

Thanks!

Joan Manel
