Message-ID: <OFD5F31608.F9CF6213-ON85256E5C.005E60DA@db.com>
From: "Shan Jing" <shan.jing@db.com>
Date: Fri, 19 Mar 2004 12:21:51 -0500
MIME-Version: 1.0
Subject: [linux-lvm] How to associate two paths for each EMC device?
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: linux-lvm-bounces@redhat.com


I have 22  EMC symmetrix disks on two HBA links.  At this moment, there is no working copy of EMC powerpath or HP Securepath available for my kernel (2.4.21-112-itanium2-smp); therefore, I have to use the luns directly with lvm without any DMP software in the middle.

Without DMP software, there are two set of 22 luns, each representing one HBA path.  See blow.

Question,
What is the best way to associate two paths for each real disk?

eg, I have the following 44 luns, what's the best way to identiy the pairs that represent the two paths of the same disk?  Thanks!

lvmdiskscan -- /dev/sdag   [      42.15 GB] free whole disk
lvmdiskscan -- /dev/sdah   [      42.15 GB] free whole disk
lvmdiskscan -- /dev/sdai   [      42.15 GB] free whole disk
lvmdiskscan -- /dev/sdaj   [      42.15 GB] free whole disk
lvmdiskscan -- /dev/sdak   [      42.15 GB] free whole disk
lvmdiskscan -- /dev/sdal1  [      42.15 GB] free whole disk
lvmdiskscan -- /dev/sdam1  [      42.15 GB] free whole disk
lvmdiskscan -- /dev/sdan   [      42.15 GB] free whole disk
lvmdiskscan -- /dev/sdao   [      42.15 GB] free whole disk
lvmdiskscan -- /dev/sdap   [      42.15 GB] free whole disk
lvmdiskscan -- /dev/sdaq   [      42.15 GB] free whole disk
lvmdiskscan -- /dev/sdar   [      42.15 GB] free whole disk
lvmdiskscan -- /dev/sdas   [      42.15 GB] free whole disk
lvmdiskscan -- /dev/sdat   [      42.15 GB] free whole disk
lvmdiskscan -- /dev/sdau1  [      42.15 GB] free whole disk
lvmdiskscan -- /dev/sdq    [      42.15 GB] free whole disk
lvmdiskscan -- /dev/sdr    [      42.15 GB] free whole disk
lvmdiskscan -- /dev/sds    [      42.15 GB] free whole disk
lvmdiskscan -- /dev/sdt    [      42.15 GB] free whole disk
lvmdiskscan -- /dev/sdu    [      42.15 GB] free whole disk
lvmdiskscan -- /dev/sdv    [      42.15 GB] free whole disk
lvmdiskscan -- /dev/sdw    [      42.15 GB] free whole disk
lvmdiskscan -- /dev/sdx1   [      42.15 GB] free whole disk
lvmdiskscan -- /dev/sdz    [      42.15 GB] free whole disk
lvmdiskscan -- /dev/sdaa   [      42.15 GB] free whole disk
lvmdiskscan -- /dev/sdab   [      42.15 GB] free whole disk
lvmdiskscan -- /dev/sdac   [      42.15 GB] free whole disk
lvmdiskscan -- /dev/sdad   [      42.15 GB] free whole disk
lvmdiskscan -- /dev/sdae   [      42.15 GB] free whole disk
lvmdiskscan -- /dev/sdaf   [      42.15 GB] free whole disk
lvmdiskscan -- /dev/sdc    [      42.15 GB] free whole disk
lvmdiskscan -- /dev/sdd    [      42.15 GB] free whole disk
lvmdiskscan -- /dev/sde    [      42.15 GB] free whole disk
lvmdiskscan -- /dev/sdf    [      42.15 GB] free whole disk
lvmdiskscan -- /dev/sdg    [      42.15 GB] free whole disk
lvmdiskscan -- /dev/sdh    [      42.15 GB] free whole disk
lvmdiskscan -- /dev/sdi    [      42.15 GB] free whole disk
lvmdiskscan -- /dev/sdj1   [      42.15 GB] free whole disk


Regards,
Shan Jing

Unix Group - Americas
Deutsche Bank
2 Gatehall Drive, 3rd Floor
Parsippany, New Jersey, USA
shan.jing@db.com
973.682.3463




--

This e-mail may contain confidential and/or privileged information. If you are not the intended recipient (or have received this e-mail in error) please notify the sender immediately and destroy this e-mail. Any unauthorized copying, disclosure or distribution of the material in this e-mail is strictly forbidden.
