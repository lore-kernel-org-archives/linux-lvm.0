Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t342FMR2011347
	for <linux-lvm@redhat.com>; Fri, 3 Apr 2015 22:15:22 -0400
Received: from smtp-relay1.uniserve.net (smtp-relay1.uniserve.net
	[216.210.109.131])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t342FLAh007737
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Fri, 3 Apr 2015 22:15:21 -0400
Received: from webapp1.uniserve.ca ([204.239.42.114])
	by smtp-relay1.uniserve.net with esmtp (Exim 4.72)
	(envelope-from <geek@uniserve.com>) id 1YeDL0-0003SG-38
	for linux-lvm@redhat.com; Fri, 03 Apr 2015 18:57:30 -0700
Message-ID: <20150403185730.16103jv6yj064wsq@webmail.uniserve.com>
Date: Fri, 03 Apr 2015 18:57:30 -0700
From: Dave Stevens <geek@uniserve.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] seems as if iy should be simple but I'm stuck
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
Content-Type: text/plain; charset="us-ascii"; delsp="Yes"; format="flowed"
To: linux-lvm@redhat.com

I've recovered two drives from a failed raid-10 array and now have a  
working degraded array from which I'd like to retrieve data. After  
assembling the array I ran fdisk and saw an LVM setup, with  
VolGroup00. Running lvscan shows the xen virtual machine names and  
disk allocations as they should be. I almost never do anything with  
lvm so I thought I'd make a directory and mount the logical volume on  
it to check out the data. When I mount /dev/VolGroup00/lvname I am  
told I need to specify a filesystem type. But specifying either ext3  
or lvms gives errors. I don't see what I need to do. Anyone?

The idea is to move the xen virtual machine to another working  
centos-xen machine, start it and do data recovery. I can supply more  
details but don't know what is relevant.

Dave


-- 
"As long as politics is the shadow cast on society by big business,
the attenuation of the shadow will not change the substance."

-- John Dewey
