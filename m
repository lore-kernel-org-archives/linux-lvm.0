Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u7RCfsK8003799
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Sat, 27 Aug 2016 08:41:54 -0400
Received: from smtp2.dds.nl (smtp2.dds.nl [83.96.147.103])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 56D9B65CE0
	for <linux-lvm@redhat.com>; Sat, 27 Aug 2016 12:41:51 +0000 (UTC)
Received: from webmail.dds.nl (app1.dds.nl [81.21.136.61])
	by smtp2.dds.nl (Postfix) with ESMTP id A3E7C40A67D8
	for <linux-lvm@redhat.com>; Sat, 27 Aug 2016 14:41:49 +0200 (CEST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Sat, 27 Aug 2016 14:41:50 +0200
From: Xen <list@xenhideout.nl>
Message-ID: <29deacbc0494a2e7034a81f9ce4a85ce@dds.nl>
Subject: [linux-lvm] rudimentary kill script
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
To: Linux lvm <linux-lvm@redhat.com>

Here is a quick way to kill all processes that might have an open file 
on some volume you want to umount and close.

kill_all_dm() {
     hexdev=$(dmsetup info -c -o major,minor $1 --noheadings | tr ':' ' ' 
| { read a b; printf "D0x%02x%02x\n" $a $b; })
     process_list=$(lsof -F cDn0 | tr '\0' '\t' | awk -F '\t' '{ if 
(substr($1,1,1) == "p") P=$1; else print P "\t" $0 }' | grep $hexdev | 
awk '{print $1}' | sed "s/^p//")
     [ -n "$process_list" ] && echo "$process_list" | xargs kill -9
}

It works on logical volumes and device mapper (paths) equally, but you 
must specify the path:

kill_all_dm /dev/linux/root ;-).



Alternatively this will just list all open processes:

find_processes() {
     hexdev=$(dmsetup info -c -o major,minor $1 --noheadings | tr ':' ' ' 
| { read a b; printf "D0x%02x%02x\n" $a $b; })
     process_list=$(lsof -F cDn0 | tr '\0' '\t' | awk -F '\t' '{ if 
(substr($1,1,1) == "p") P=$1; else print P "\t" $0 }' | grep $hexdev | 
awk '{print $1}' | sed "s/^p//")
     [ -n "$process_list" ] && echo "$process_list" | xargs ps
}

find_processes /dev/linux/root
