Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.10])
	by int-mx05.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o0I2pS06000899
	for <linux-lvm@redhat.com>; Sun, 17 Jan 2010 21:51:29 -0500
Received: from n5-vm0.bullet.mail.gq1.yahoo.com
	(n5-vm0.bullet.mail.gq1.yahoo.com [67.195.8.62])
	by mx1.redhat.com (8.13.8/8.13.8) with SMTP id o0I2pGax025309
	for <linux-lvm@redhat.com>; Sun, 17 Jan 2010 21:51:17 -0500
Message-ID: <211358.69593.qm@web114111.mail.gq1.yahoo.com>
Date: Sun, 17 Jan 2010 18:51:16 -0800 (PST)
From: J Nb <j_nwb@yahoo.com>
MIME-Version: 1.0
Subject: [linux-lvm] LVM over iscsi  in virtualized environment.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

It seems from the following that if you are careful.. you can use LVM over shared iscsi storage.

http://tldp.org/HOWTO/LVM-HOWTO/sharinglvm1.html

I am planning to setup LVM over iscsi to be used for Virtualized environment.. (e.g. xen ). Each VM will have lvm assigned from a VG that is created using a bunch of luns.

A single LVM will not be used by more than one VM at any time. So I can use any traditional filesystems for the VM. 

I think I can also make sure that only one node makes the changes.. and all other "refresh" it using vgscan. But the problem is that as per the doc, it is recommended that you disable vg / lv on all other nodes before making the change on the master node. But this means that I have to unmount/disable LVs used by virtual machine on other nodes. [ I am stuck here...]

Is there any workaround. Or some sort of co-ordination that can be added to make this topology work ?

I have heard that products like virtual iron, citrix make similar topology available.

Thanks
-nb





      
