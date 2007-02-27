Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l1RFtHx3020485
	for <linux-lvm@redhat.com>; Tue, 27 Feb 2007 10:55:17 -0500
Received: from rsmtp1.corp.ukl.yahoo.com (rsmtp1.corp.ukl.yahoo.com
	[217.12.15.81])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l1RFtFxj031296
	for <linux-lvm@redhat.com>; Tue, 27 Feb 2007 10:55:15 -0500
Received: from [192.168.1.125] (callisto.gre.kelkoo.net [192.168.1.125])
	(authenticated bits=0)
	by rsmtp1.corp.ukl.yahoo.com (8.13.8/8.13.6/y.rout) with ESMTP id
	l1RFt0aa038277
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Tue, 27 Feb 2007 15:55:02 GMT
Message-ID: <45E45454.6000402@yahoo-inc.com>
Date: Tue, 27 Feb 2007 16:55:00 +0100
From: Guilio Iannazzo <iannazg@yahoo-inc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] lvextend problem
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Hi,
about the *environment* :
[root@priscilla var]# cat /proc/version
Linux version 2.4.21-20.ELsmp (bhcompile@tweety.build.redhat.com) (gcc 
version 3.2.3 20030502 (Red Hat Linux 3.2.3-42)) #1 SMP Wed Aug 18 
20:46:40 EDT 2004

The *problem* :
I extended a logical volume following the procedure

umount -l /dev/Volume00/var

lvextend -L+5G /dev/Volume00/var
e2fsck -f /dev/Volume00/var
mount -l /dev/Volume00/var

The ouput of e2fsck was as following : 

[root@priscilla var]# e2fsck -f /dev/Volume00/var
e2fsck 1.32 (09-Nov-2002)
Pass 1: Checking inodes, blocks, and sizes
Duplicate blocks found... invoking duplicate block passes.
Pass 1B: Rescan for duplicate/bad blocks
Duplicate/bad block(s) in inode 40962: 164114 164115 164117
Duplicate/bad block(s) in inode 122885: 491781
Pass 1C: Scan directories for inodes with dup blocks.
Pass 1D: Reconciling duplicate blocks
(There are 2 inodes containing duplicate/bad blocks.)

File /run/utmp (inode #40962, mod time Tue Feb 27 10:20:28 2007)
  has 3 duplicate block(s), shared with 1 file(s):
        <filesystem metadata>
Clone duplicate/bad blocks<y>? yes

File /log/audit.d/bin.1 (inode #122885, mod time Tue Feb 27 14:01:00 2007)
  has 1 duplicate block(s), shared with 1 file(s):
        <filesystem metadata>
Clone duplicate/bad blocks<y>? yes

Pass 2: Checking directory structure
Pass 3: Checking directory connectivity
Pass 4: Checking reference counts
Pass 5: Checking group summary information

/dev/Volume00/var: ***** FILE SYSTEM WAS MODIFIED *****
/dev/Volume00/var: 553/1572864 files (14.8% non-contiguous), 
706071/6291456 blocks

Now, once the filesystem mounted, I've lost all the data I had on /var 
(which I didn't back up, I know I know it's extremely stupid, luckily 
enough this is not a production machine).
For example

[root@priscilla var]# ll /var/
total 0

however

[root@priscilla var]# mkdir /var/log
mkdir: cannot create directory `/var/log': File exists

??
What happened ? How to get all the data back ?
Thank you

Giulio
