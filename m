Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j8JCKPV32465
	for <linux-lvm@redhat.com>; Mon, 19 Sep 2005 08:20:25 -0400
Received: from www.geoinf.fu-berlin.de (www.geoinf.fu-berlin.de [160.45.89.23])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j8JCKOJr002195
	for <linux-lvm@redhat.com>; Mon, 19 Sep 2005 08:20:25 -0400
Received: from [160.45.89.15] (callisto.geoinf.fu-berlin.de [160.45.89.15])
	by www.geoinf.fu-berlin.de (Postfix) with ESMTP id 0A6DAA1E03
	for <linux-lvm@redhat.com>; Mon, 19 Sep 2005 14:15:20 +0200 (CEST)
Message-ID: <432EABC8.1080603@alice-it.net>
Date: Mon, 19 Sep 2005 14:15:04 +0200
From: Sebastian <sebastian@alice-it.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] EMERGENCY: killing pvmove
References: <432EA763.9020501@alice-it.net>
	<20050919120539.GI18976@agk.surrey.redhat.com>
In-Reply-To: <20050919120539.GI18976@agk.surrey.redhat.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Thanks for your fast answer!

Alasdair G Kergon wrote:

>pvmove --abort
>
[root@mex root]# pvmove --abort
pvmove: unrecognized option `--abort'

pvmove [-A|--autobackup {y|n}] [-d/--debug]
[-f|--force]
[-i|--ignore_read_errors]
[-h|--help]
[-t|--test]
[-v[v]|--verbose [--verbose]]
[--version]
[{-n|--name} LogicalVolume[:LogicalExtent[-LogicalExtent]...]]
SourcePhysicalVolume[:PhysicalExtent[-PhysicalExtent]...]}
[DestinationPhysicalVolume[:PhysicalExtent[-PhysicalExtent]...]...]

[root@mex root]#

Is it because I'm using lvm1 ???
