Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i1O295i21437
	for <linux-lvm@redhat.com>; Mon, 23 Feb 2004 21:09:05 -0500
Received: from web41503.mail.yahoo.com (web41503.mail.yahoo.com [66.218.93.86])
	by mx1.redhat.com (8.11.6/8.11.6) with SMTP id i1O294b25142
	for <linux-lvm@redhat.com>; Mon, 23 Feb 2004 21:09:04 -0500
Message-ID: <20040224020859.43153.qmail@web41503.mail.yahoo.com>
From: Rajesh Saxena <rs_404@yahoo.ca>
MIME-Version: 1.0
Subject: [linux-lvm] LVM + reiserfsck
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
Date: Mon Feb 23 21:07:25 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Hello list I am wondering if someone could help me with a quick 
question. I am using SUSE 9 + LVM1 + Linux Software RAID and last but
not least Reiser filesystem. Recently I had problem with recovery from
LVM volumes where /usr/lib is deleted =(


Here is my set up with two 80G drives:

1st 2G parititon on drive 1
                           \
                            = /dev/md0 formatted as Reiser for /      
                           / 
1st 2G partition on drive 2


2nd 2G parititon on drive 1
                           \
                            = /dev/md1 formatted as Reiser for swap    
 
                           / 
2nd 2G partition on drive 2


Last big parititon on drive 1
                             \
                              = /dev/md2 for LVM
                             / 
Last big partition on drive 2

All RAID arrays as RAID1 mirrors and LVM volumes as Reiser. After 
several test reboots the OS did not boot and complained to run 
reiserfsck. I did reiserfsck --check for all partitions and only
ones which complained was /dev/system/usr. It asks for --rebuild-tree
so I did and then rebooted. Now all of /usr/lib was deleted and 
sshd would not start. My question: what did I do wrong? I ask this
question here because lots of people seem to use Reiser and LVM
together. Please offer some advice. Thank you!!

RS

______________________________________________________________________ 
Post your free ad now! http://personals.yahoo.ca
