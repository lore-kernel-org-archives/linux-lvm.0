Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i22FCW823733
	for <linux-lvm@redhat.com>; Tue, 2 Mar 2004 10:12:32 -0500
From: Steven Lembark <lembark@wrkhors.com>
Message-ID: <2443240000.1078240962@[192.168.200.4]>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Subject: [linux-lvm] Bug in 1.0.8
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
Date: Tue Mar  2 10:11:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

LVM-1.0.8 was installed with prefix of /lvm, can't find
pieces of itself. Seems that the --prefix should've udpated
a #define somewhere...

# /lvm/sbin/e2fsadm -L4G /dev/vg00/lvol2
e2fsck 1.32 (09-Nov-2002)
Pass 1: Checking inodes, blocks, and sizes
Pass 2: Checking directory structure
Pass 3: Checking directory connectivity
Pass 4: Checking reference counts
Pass 5: Checking group summary information
/dev/vg00/lvol2: 13147/262144 files (4.8% non-contiguous), 454358/524288 
blocks
e2fsadm -- Sorry: 'lvextend' not found in any of /sbin /usr/sbin 
/usr/local/sbin /bin /usr/bin
e2fsadm -- ERROR: can't extend logical volume


--
Steven Lembark                               2930 W. Palmer
Workhorse Computing                       Chicago, IL 60647
                                            +1 888 359 3508
