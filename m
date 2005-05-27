Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j4RKsWO10010
	for <linux-lvm@redhat.com>; Fri, 27 May 2005 16:54:32 -0400
Message-ID: <20050527205421.69707.qmail@web54403.mail.yahoo.com>
Date: Fri, 27 May 2005 13:54:21 -0700 (PDT)
From: Manish Chopra <manish486@yahoo.com>
MIME-Version: 1.0
Subject: [linux-lvm] A small query on LVM : Please dont ignore this
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux-LVM@Sistina.com

Dear Mr. Heinz Mauelshagen,

I have a small query for you.

Can we undo the change caused by command pvcreate /dev/hda8 that was a Win 32
FAT partition, in order to get back the lost information ?

Originally this command was intended to be as :

[root@localhost]# pvcreate /dev/hdb8

However, it was a typo mistake that the command got executed on /dev/hda8, and
that was a windows logical partition. The drive can be seen, but does not show
any information stored on it.

--------------------
Error displayed as :

G:\is not accessible

A device attached to the system is not functioning.

---------------------------------------------------

I have gone through all other related commands on LVM, but none seem to help me
in this case.

If you have any workaround on this problem, please suggest me the way to
resolve it, and get the contents of Win32 FAT partition.

Warm regards,

Manish Chopra

(Formerly with IBM, for their technical support center, and currently
researching on technology trends and scenarios changing the IT landscape. Have
also appeared for RHCE exam today, without a pass.)

PS. Please help get the open source stabilized and standardized


		
__________________________________ 
Do you Yahoo!? 
Yahoo! Small Business - Try our new Resources site
http://smallbusiness.yahoo.com/resources/
