Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l4T76xdk021554
	for <linux-lvm@redhat.com>; Tue, 29 May 2007 03:06:59 -0400
Received: from carlit.cesca.es (carlit.cesca.es [84.88.0.2])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l4T76vQD019554
	for <linux-lvm@redhat.com>; Tue, 29 May 2007 03:06:57 -0400
Received: from carlit.cesca.es (localhost [127.0.0.1])
	by carlit.cesca.es (Postfix) with ESMTP id 5EE3B32FFA9
	for <linux-lvm@redhat.com>; Tue, 29 May 2007 09:06:51 +0200 (CEST)
Received: from [192.94.163.17] (santalis.cesca.es [192.94.163.17])
	by carlit.cesca.es (Postfix) with ESMTP id 448BE32F6B3
	for <linux-lvm@redhat.com>; Tue, 29 May 2007 09:06:51 +0200 (CEST)
Message-ID: <465BD163.4010904@cesca.es>
Date: Tue, 29 May 2007 09:08:19 +0200
From: Jordi Prats <jprats@cesca.es>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] LVM on a fake disk
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: linux-lvm@redhat.com

Hi all,
How can I define voluem groups and logical volumes using a disk image on 
a file that will be the root filesystem of another machine (not the one 
that is defining them)?

I want to do this to create a Xen guest.

Thanks,
Jordi

-- 
......................................................................
         __
        / /          Jordi Prats
  C E / S / C A      Dept. de Sistemes
      /_/            Centre de Supercomputaci� de Catalunya

  Gran Capit�, 2-4 (Edifici Nexus) � 08034 Barcelona
  T. 93 205 6464 � F.  93 205 6979 � jprats@cesca.es
...................................................................... 
