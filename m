Received: from mx2.redhat.com (ext-mx01.extmail.prod.ext.rdu2.redhat.com
	[10.11.55.1])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t85Bv0eD013516
	for <linux-lvm@redhat.com>; Sat, 5 Sep 2015 07:57:00 -0400
Received: from cdw.me.uk (cdw.me.uk [91.203.57.136])
	by mx2.redhat.com (8.14.4/8.14.4) with ESMTP id t85Buv8a003621
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Sat, 5 Sep 2015 07:56:58 -0400
From: Chris Webb <chris@arachsys.com>
Content-Transfer-Encoding: 7bit
Date: Sat, 5 Sep 2015 12:56:41 +0100
Message-Id: <C3D2E832-AC9D-40DA-9DB9-D70B4F716894@arachsys.com>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
Subject: [linux-lvm] devices.filter changed behaviour in 80ac8f37d6
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
Content-Type: text/plain; charset="us-ascii"; delsp="yes"; format="flowed"
To: linux-lvm@redhat.com
Cc: Richard Davies <richard.davies@elastichosts.com>

Our hosts use local md arrays as LVM2 PVs in a very straightforward way.  
They also have lots of slower iscsi devices which LVM shouldn't scan or  
touch, so we use a simple filter in lvm.conf:

     devices {
       filter = [ "a|^/dev/md.*|", "r|.*|" ]
     }

Upon upgrading from lvm-2.02.106 to 2.02.129, commands like lvdisplay and  
lvs dramatically slowed down. Investigating, we found the filter wasn't  
excluding the unwanted devices anymore: they were being scanned despite  
being explicitly excluded.

A simple way to reproduce this in a VM is

     # cat /etc/lvm/lvm.conf
     devices {
       filter = [ "r|.*|" ]
     }
     # lvm-2.02.129 pvscan -vv 2>&1 | grep /dev/
           /dev/md0: size is 0 sectors
           /dev/vda: size is 2147483648 sectors
           /dev/vda: size is 2147483648 sectors
     # lvm-2.02.106 pvscan -vv 2>&1 | grep /dev/
     #

If I replace filter with global_filter, both versions behave identically:

     # cat /etc/lvm/lvm.conf
     devices {
       global_filter = [ "r|.*|" ]
     }
     # lvm-2.02.129 pvscan -vv 2>&1 | grep /dev/
     # lvm-2.02.106 pvscan -vv 2>&1 | grep /dev/
     #

Deleting /etc/lvm/cache before running each pvscan doesn't affect the result.

A quick git bisect finds the behaviour changed with the following:

commit 80ac8f37d6ac5f8c5228678d4ee07187b5d4db7b
Author: Peter Rajnoha <prajnoha@redhat.com>
Date:   Thu Sep 11 09:30:03 2014 +0200

     filters: fix incorrect filter indexing in composite filter array
 
     Caused by recent changes - a7be3b12dfe7388d1648595e6cc4c7a1379bb8a7.
     If global filter was not defined, then part of the code
     creating composite filter (the cmd->lvmetad_filter) incorrectly
     increased index value even if this global filter was not created
     as part of the composite filter. This caused a gap with "NULL"
     value in the composite filter array which ended up with the rest
     of the filters after the gap to be ignored and also it caused a mem
     leak when destroying the composite filter.


Presumably this change in the behaviour of devices.filter is an  
unintentional consequence rather than deliberate? Our use is copied  
more-or-less directly from the example in conf/example.conf.

Best wishes,

Chris.
