Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j87EkDV16715
	for <linux-lvm@redhat.com>; Wed, 7 Sep 2005 10:46:13 -0400
Received: from web52915.mail.yahoo.com (web52915.mail.yahoo.com
	[206.190.49.25])
	by mx1.redhat.com (8.12.11/8.12.11) with SMTP id j87Ek6DZ023843
	for <linux-lvm@redhat.com>; Wed, 7 Sep 2005 10:46:06 -0400
Message-ID: <20050907144600.42410.qmail@web52915.mail.yahoo.com>
Date: Wed, 7 Sep 2005 07:46:00 -0700 (PDT)
From: Rik Herrin <rikherrin@yahoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] VGDA Question
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
To: linux-lvm@redhat.com

Hi,
 According to the LVM man page, the VGDA (Volume Group
Descriptor Area) holds the metadata responsible for
keeping information about the LVs.  However, it is
contained in the PVs.  Why does the VGDA contain both
LV descriptors and PE descriptors?  Shouldn't it just
have PE descriptors and leave the LV descriptors to
the volume group?  Also, when booting, what makes the
kernel know that there are VGs and LVs?  Does it look
at the type of the partition and if it detects that
it's a PV, extract the VGDA to help it build this
information?  If this is so, how does it deal with
entire harddisks.  For example, if I run the command:
pvcreate /dev/sdd
how would the kernel know that this is a PV?. 
Finally, where exactly is the VGDA information held?. 
Thanks for your time.


	
		
______________________________________________________
Click here to donate to the Hurricane Katrina relief effort.
http://store.yahoo.com/redcross-donate3/
