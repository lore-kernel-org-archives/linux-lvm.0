Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j94ArZV31155
	for <linux-lvm@redhat.com>; Tue, 4 Oct 2005 06:53:35 -0400
Received: from smtp.poczta.interia.pl (smtp2.poczta.interia.pl [213.25.80.232])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j94ArSSL010530
	for <linux-lvm@redhat.com>; Tue, 4 Oct 2005 06:53:28 -0400
Received: from poczta.interia.pl (mi03.poczta.interia.pl [10.217.12.3])
	by smtp.poczta.interia.pl (INTERIA.PL) with ESMTP id F06BCD1397
	for <linux-lvm@redhat.com>; Tue,  4 Oct 2005 12:53:24 +0200 (CEST)
Received: from [192.168.0.114] (unknown [213.17.139.235])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by www.poczta.fm (INTERIA.PL) with ESMTP id 5C3063C368
	for <linux-lvm@redhat.com>; Tue,  4 Oct 2005 12:53:14 +0200 (CEST)
Message-ID: <43425F18.5030506@poczta.fm>
Date: Tue, 04 Oct 2005 12:53:12 +0200
From: Hubert <hubgor@poczta.fm>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM2 lvcreate multi snapshots and dm-devel patches
Content-Transfer-Encoding: 7bit
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

Thank you very much Alasdair :-)

With reference to your messege:
https://www.redhat.com/archives/linux-lvm/2005-October/msg00007.html

"... some LVM2 snapshot operations are incomplete or hang and need prodding
 or finishing with dmsetup (eg with a dmsetup resume or remove).
 This is because the order LVM2 does some operations needs to be changed."

when and how exactly (in detail) should i use dmsetup suspend/resume 
under lvcreate/
lvremove snapshot of lvm2 lgocal volume (especially XFS lv)?

Regards Hubert.
