Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i3QIvUv09742
	for <linux-lvm@redhat.com>; Mon, 26 Apr 2004 14:57:30 -0400
Received: from smtp.doruk.net.tr (smtp.doruk.net.tr [212.58.5.248])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i3QIvS99024630
	for <linux-lvm@redhat.com>; Mon, 26 Apr 2004 14:57:29 -0400
Received: from VAHOXP (vahric.doruk.net.tr [212.58.13.17])
	by smtp.doruk.net.tr (8.12.8/8.12.8) with ESMTP id i3QJ3HTk030443
	for <linux-lvm@redhat.com>; Mon, 26 Apr 2004 22:03:17 +0300
Message-Id: <200404261903.i3QJ3HTk030443@smtp.doruk.net.tr>
From: "Vahric MUHTARYAN" <vahric@doruk.net.tr>
Date: Mon, 26 Apr 2004 21:59:54 +0300
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] About extending partiton with lvm+ext3
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
To: 'LVM general discussion and development' <linux-lvm@redhat.com>

Hi Everybody , 

I'm reading lvm-how to and I wonder those any tools like e2fsadm ,
ext2resize ?!! in Redhat ... Because I want to exten ext3 

Does command for only ext2 ?! 

# export E2FSADM_RESIZE_CMD=ext2resize
# e2fsadm /dev/ops/batch -L+500M

Thanks Everybody ... 
Vahric 
