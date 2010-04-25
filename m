Received: from dhcp209-236.gsslab.pnq.redhat.com
	(dhcp209-236.gsslab.pnq.redhat.com [10.65.209.236])
	by int-mx03.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o3PCXqb6022097
	for <linux-lvm@redhat.com>; Sun, 25 Apr 2010 08:33:53 -0400
Message-ID: <4BD43734.9030302@redhat.com>
Date: Sun, 25 Apr 2010 18:06:04 +0530
From: Sunil Gupta <sugupta@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] mpath_prio_weighted usage
Reply-To: sugupta@redhat.com,
	LVM general discussion and development <linux-lvm@redhat.com>
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
To: linux-lvm@redhat.com

Hello,

I have a customer who wants to know the usage of prio_callout 
mpath_prio_weighted . From the usage it shows

Usage: mpath_prio_weighted <hbtl|devname> <regex1> <prio1> [<regex2> 
<prio2>] ...
Warning: This priority callout is based on a path's device name or its
H:T:B:L. Both of these can change when the node is rebooted, and can
differ from node to node. (i.e. there is no guarantee that sda will point
to the same device after a reboot) If you use this callout, it may be
necessary to manually edit /etc/multipath.conf after any reboot.


please describe the <regex1> <prio1> part of the command.

I tried a comand and it succeeded but not sure what it will do.

# mpath_prio_weighted sdb  sdb* 4
4


Thanks in advance

Regards,
Sunil
