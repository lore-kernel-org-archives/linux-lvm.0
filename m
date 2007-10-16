Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l9GEL7NO012047
	for <linux-lvm@redhat.com>; Tue, 16 Oct 2007 10:21:07 -0400
Received: from carlit.cesca.es (carlit.cesca.es [84.88.0.2])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id l9GEL1eD008091
	for <linux-lvm@redhat.com>; Tue, 16 Oct 2007 10:21:01 -0400
Received: from carlit.cesca.es (localhost [127.0.0.1])
	by carlit.cesca.es (Postfix) with ESMTP id 0A549331D70
	for <linux-lvm@redhat.com>; Tue, 16 Oct 2007 16:20:55 +0200 (CEST)
Received: from [192.94.163.17] (santalis.cesca.es [192.94.163.17])
	by carlit.cesca.es (Postfix) with ESMTP id B3D69331D1E
	for <linux-lvm@redhat.com>; Tue, 16 Oct 2007 16:20:54 +0200 (CEST)
Message-ID: <4714C8C6.7060204@cesca.es>
Date: Tue, 16 Oct 2007 16:20:54 +0200
From: Jordi Prats <jprats@cesca.es>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] cluster LVM
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

Hi all,
I've been googling for a while but I found nothing about the current 
limitations of CLVM. Someone told me that you must use just one logical 
volume for each volume group. Is that true?

Anyone could tell me witch are and if exists any risks of loosing data 
by using CLVM given certain configuration? There's anything that it's 
not safe to use, like snapshots, pvmove...?

Many thanks,
Jordi
