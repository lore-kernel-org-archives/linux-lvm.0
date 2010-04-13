Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.9])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o3DFPgUr003921
	for <linux-lvm@redhat.com>; Tue, 13 Apr 2010 11:25:42 -0400
Received: from mail.bbaw.de (mail.bbaw.de [194.95.188.6])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o3DFPR4i001480
	for <linux-lvm@redhat.com>; Tue, 13 Apr 2010 11:25:27 -0400
Received: from mailhub.bbaw.de (unknown [192.168.4.1])
	by mail.bbaw.de (Postfix) with ESMTP id 760624A8062
	for <linux-lvm@redhat.com>; Tue, 13 Apr 2010 17:25:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by mailhub.bbaw.de (Postfix) with ESMTP id 268D2937FA
	for <linux-lvm@redhat.com>; Tue, 13 Apr 2010 17:25:25 +0200 (CEST)
Received: from taeuber.bbaw.de (taeuber.bbaw.de [192.168.1.148])
	by mailhub.bbaw.de (Postfix) with SMTP id 108B6937AD
	for <linux-lvm@redhat.com>; Tue, 13 Apr 2010 17:25:25 +0200 (CEST)
Date: Tue, 13 Apr 2010 17:25:25 +0200
From: Lars =?UTF-8?B?VMOkdWJlcg==?= <taeuber@bbaw.de>
Message-Id: <20100413172525.4dd52d68.taeuber@bbaw.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] dos partition table on LV
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

Hi there,

is a possibility to get the linux kernel respect a dos partition table on a LV?
I tried loopback and the LV directly, but I couldn't get it working.

I know this might be a strange wish but I need this to backup partitions of a LV that is used as disk for a virtual machine over network.

Thanks
Lars
