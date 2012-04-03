Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q33DjVYh002791
	for <linux-lvm@redhat.com>; Tue, 3 Apr 2012 09:45:31 -0400
Received: from zimbra.agenda.si (mail.agenda.si [91.233.163.59])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q33DjSp7006149
	for <linux-lvm@redhat.com>; Tue, 3 Apr 2012 09:45:29 -0400
Received: from [172.16.0.214] (barbie.agenda.si [172.16.0.214])
	by zimbra.agenda.si (Postfix) with ESMTPSA id 73D3E12341E9
	for <linux-lvm@redhat.com>; Tue,  3 Apr 2012 15:45:27 +0200 (CEST)
Message-ID: <4F7AFEF7.2060503@agenda.si>
Date: Tue, 03 Apr 2012 15:45:27 +0200
From: Danilo Godec <danilo.godec@agenda.si>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Removing snapshot often fails
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hello,

I have an OpenSuSE 11.4 based Xen server. I use LVM as the 'store' for 
VM 's and I'm trying to make use of snapshots for backup.

However I discovered that often removing a snapshot fails - 
unfortunately it's quite unpredictable, as sometimes it works on next 
try but sometimes it fails 20 times in a row - making it very unpleasant 
for scripting...

Even when it succeeds it give's me a message 'give up on open_count' - 
and I couldn't quite find what it means.

Here's what I've been trying by hand:

> # lvcreate -s /dev/vm_store/test_vm1 -n "backup_test_vm1" -l 100%ORIGIN
>   Logical volume "backup_test_vm1" created
> # lvremove -f /dev/vm_store/backup_test_vm1
>   give up on open_count
>   Logical volume "backup_test_vm1" successfully removed
> # lvcreate -s /dev/vm_store/test_vm1 -n "backup_test_vm1" -l 100%ORIGIN
>   Logical volume "backup_test_vm1" created
> # lvremove -f /dev/vm_store/backup_test_vm1
>   give up on open_count
>   Logical volume "backup_test_vm1" successfully removed
> # lvcreate -s /dev/vm_store/test_vm1 -n "backup_test_vm1" -l 100%ORIGIN
>   Logical volume "backup_test_vm1" created
> # lvremove -f /dev/vm_store/backup_test_vm1
>   Can't remove open logical volume "backup_test_vm1"

Am I doing something wrong?

Is this 'expected' and should I just keep re-trying in a loop until it 
succeeds?

  Thanks, Danilo




-- 
Danilo Godec, sistemska podpora / system administration

Predlog! Obiscite prenovljeno spletno stran www.agenda.si

ODPRTA KODA IN LINUX
STORITVE : POSLOVNE RESITVE : UPRAVLJANJE IT : INFRASTRUKTURA IT : IZOBRAZEVANJE : PROGRAMSKA OPREMA

Visit our updated web page at www.agenda.si

OPEN SOURCE AND LINUX
SERVICES : BUSINESS SOLUTIONS : IT MANAGEMENT : IT INFRASTRUCTURE : TRAINING : SOFTWARE
