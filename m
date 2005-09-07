Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j879arV29462
	for <linux-lvm@redhat.com>; Wed, 7 Sep 2005 05:36:53 -0400
Received: from smtp.poczta.interia.pl (smtp2.poczta.interia.pl [213.25.80.232])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j879akBd023398
	for <linux-lvm@redhat.com>; Wed, 7 Sep 2005 05:36:46 -0400
Received: from poczta.interia.pl (mi04.poczta.interia.pl [10.217.12.4])
	by smtp.poczta.interia.pl (INTERIA.PL) with ESMTP id CAC2D372CB4
	for <linux-lvm@redhat.com>; Wed,  7 Sep 2005 11:36:42 +0200 (CEST)
Received: from [192.168.0.21] (unknown [213.17.139.235])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by www.poczta.fm (INTERIA.PL) with ESMTP id 8C511142B3F
	for <linux-lvm@redhat.com>; Wed,  7 Sep 2005 11:36:39 +0200 (CEST)
Message-ID: <431EB49F.7020503@poczta.fm>
Date: Wed, 07 Sep 2005 11:36:31 +0200
From: Hubert <hubgor@poczta.fm>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Progress on LVM2 snapshots - kernel 2.6.x
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

Hello,

Could you please answer me what is latest status of  LVM2 
lvcreate/lvremove snapshots with kernel 2.6.x series ?
Why if i'm under copying some data from remote host to smb share on my
server with lvm2 logical volume and 1 or 2 snashots which is/are filled
> 1% and at the same time lvremove snapshot then it cause "segmentation 
fault" and after that all read/write commands to that lv e.g. cp hangs up ?

With reference to:
"
In the meantime, you can apply the snapshot patches in the -udm
tree and use 'dmsetup' manually to activate and deactivate snapshots
when lvm2 fails.

Patches 8 and 9 at:

ftp://sources.redhat.com/pub/dm/patches/2.6-unstable/2.6.12-rc2/2.6.12-rc2-udm1/ 


(Further patches are needed, but those two plus correct dmsetup use
should avoid machine lockups.)

Alasdair
"
what does it mean "correct use of dmsetup tool" and when it should be
used: before and after lvcreate or lvremove snapshot or with both ?

Thanks all for any response,
Best regards,

Hubert
hubgor@poczta.fm



----------------------------------------------------------------------
Jedyny taki czat... >>> http://link.interia.pl/f18b0
