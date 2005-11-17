Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jAHI7CV31559
	for <linux-lvm@redhat.com>; Thu, 17 Nov 2005 13:07:12 -0500
Received: from cichlid.com (dsl3-63-249-91-37.cruzio.com [63.249.91.37])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id jAHI71Dn010573
	for <linux-lvm@redhat.com>; Thu, 17 Nov 2005 13:07:06 -0500
Received: from cichlid.com (cichlid.com [127.0.0.1])
	by cichlid.com (8.13.1/8.12.5) with ESMTP id jAHI6w8s011293
	for <linux-lvm@redhat.com>; Thu, 17 Nov 2005 10:06:58 -0800
Date: Thu, 17 Nov 2005 10:06:58 -0800
From: Andrew Burgess <aab@cichlid.com>
Message-Id: <200511171806.jAHI6wMg011274@cichlid.com>
References: <1_0511170840028921@cichlid.com>
Subject: [linux-lvm] Re: Not allowed to fill filesystem to 100%??? 
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

>> We have created some 300 GB lvm2 (RH 4.0 AS)  filesystems for our
>> PostgreSQL databases.  However, we tried to copy one of the larger
>> filesystems over to the new lvm filesystem and the copy abended due to
>> being.  The system was reporting that the file system was 100% full
>> with 0 blocks free.  However, a df reported almost 16GB free.
>> 
>If it's an ext2/3 filesystem, the default reserved space is 5%.  Check
>the man pages for mke2fs and tune2fs.

Also, you might have run out of inodes, try "df -i", though that only
happens with lots of little files and databases tend to be the opposite.

HTH
