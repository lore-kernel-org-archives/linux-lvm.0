Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i1MGHai06065
	for <linux-lvm@redhat.com>; Sun, 22 Feb 2004 11:17:36 -0500
Received: from vega.voltaire.com ([212.143.27.73])
	by mx1.redhat.com (8.11.6/8.11.6) with SMTP id i1MGHZb04106
	for <linux-lvm@redhat.com>; Sun, 22 Feb 2004 11:17:35 -0500
Message-ID: <2F75AEE4E86FDE44BF97709D289BAA7C719649@vega.voltaire.com>
From: Dan Bar Dov <danb@voltaire.com>
MIME-Version: 1.0
Subject: [linux-lvm] LVM startup takes too long
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Sun Feb 22 11:16:05 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'linux-lvm@redhat.com'" <linux-lvm@redhat.com>

When I start up our system, I have a startup script that runs pvscan, vgscan
and lvscan, and parses their output.

This takes too long - with a small SAN - 1x6 disks FC jbod + 2 FC RAID
controllers, it takes roughly 45 seconds with pvscan and vgscan about 23
seconds each.

Its pretty obvious that with more storage it will take longer.

Any ideas how can I speed it up? 
(can I run vgscan/pvscan in parallel ?, can I get all the data I need from a
single scan ?)

Thanks
Dan
