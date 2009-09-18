Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.9])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n8IJK7Hl027318
	for <linux-lvm@redhat.com>; Fri, 18 Sep 2009 15:20:07 -0400
Received: from destar.net (mail.destar.net [12.12.38.18])
	by mx1.redhat.com (8.13.8/8.13.8) with SMTP id n8IJJsW3028909
	for <linux-lvm@redhat.com>; Fri, 18 Sep 2009 15:19:55 -0400
Message-ID: <20090918111953.192836xilg10rvqc@www.destar.net>
Date: Fri, 18 Sep 2009 11:19:53 -0800
From: jonr@destar.net
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Striping an LVM
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
Content-Type: text/plain; charset="us-ascii"; delsp="Yes"; format="flowed"
To: linux-lvm@redhat.com

Hello List,

I am reading about striping with LVM's across multiple disks. My  
question is why would I want to do this when I could set it up with  
raid0? Also, if I striped across three drives with my LV wouldn't I  
then run the risk of losing all data if one of the three drives failed?

Have I missed something?

Jon
