Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i5SElo022226
	for <linux-lvm@redhat.com>; Mon, 28 Jun 2004 10:47:50 -0400
Received: from taurus.voltaire.com ([212.143.27.73])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i5SElhXn008563
	for <linux-lvm@redhat.com>; Mon, 28 Jun 2004 10:47:44 -0400
Content-class: urn:content-classes:message
MIME-Version: 1.0
Date: Mon, 28 Jun 2004 17:47:25 +0300
Message-ID: <D4F8F0B3820E754C887699BEF26A89400E4AB3@taurus.voltaire.com>
From: "Dan Bar Dov" <danb@voltaire.com>
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Cannot deactivet LV - why?
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
To: LVM general discussion and development <linux-lvm@redhat.com>

I'm trying to do something thst seems very normal to me

bash-2.05a# lvchange -a n /dev/0/idolv1
lvchange -- operation not permitted for (open) logical volume
"/dev/0/idolv1"


Why is the operation not permitted? The LV is not in use, its not
mounted, there's no process using it.

Any ideas?

Thanks,
Dan
