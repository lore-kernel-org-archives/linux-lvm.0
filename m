Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j5KGYqu04964
	for <linux-lvm@redhat.com>; Mon, 20 Jun 2005 12:34:52 -0400
Received: from redshift.com (mail-pop.redshift.com [216.228.2.14])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j5KGYmt6009873
	for <linux-lvm@redhat.com>; Mon, 20 Jun 2005 12:34:48 -0400
Message-ID: <42B6EF41.2060302@redshift.com>
Date: Mon, 20 Jun 2005 09:30:57 -0700
From: Sam Rogers <srogers@redshift.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] LVM2 Volume and Volume group naming nomenclature
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


Ok, I am not try to start a flame war here, but I run dab smack into a 
walk that shouldn't be there. I have managed HPUX for many years which 
is the inspiration for Linux's LVM, and yes I know H.P. did not invent 
LVM. And for the most part you guys have done a pretty good job. I know 
it is a lot of hard work that has gone into this software.

But there is a major problem. LVM2 will not (from what I can see) 
recognize volume group names like VG00. I do not understand? Why type 
Volgroup00 when VG00 is quicker. In the HPUX version you can name the 
volume group and logical volume anything you want. I don't see why we 
can't do the same. It took me over a year to figure why LVM2 was not 
working in an install until I gave up naming the volume group and let it 
default to Volgroup00.

I commend all the programmers for this project, but respectfully ask 
that you change/modify and or add the logical and volume naming feature 
to this great product.

Regards,

    Sam Rogers.

P.S.
   If this is already in development then please disregard this message.
