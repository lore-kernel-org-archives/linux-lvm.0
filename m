Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j8HJAjV31965
	for <linux-lvm@redhat.com>; Sat, 17 Sep 2005 15:10:45 -0400
Received: from mail.linbit.com (nudl.linbit.com [212.69.162.21])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j8HJAi9g019664
	for <linux-lvm@redhat.com>; Sat, 17 Sep 2005 15:10:44 -0400
Received: from barkeeper1 (213-229-1-138.sdsl-line.inode.at [213.229.1.138])
	by mail.linbit.com (LINBIT Mail Daemon) with ESMTP id B4C121400A
	for <linux-lvm@redhat.com>; Sat, 17 Sep 2005 21:10:34 +0200 (CEST)
Date: Sat, 17 Sep 2005 21:10:34 +0200
From: Lars Ellenberg <Lars.Ellenberg@linbit.com>
Subject: Re: [linux-lvm] Device mapper problems..
Message-ID: <20050917191034.GD12882@barkeeper1.linbit>
References: <432986DA.50107@gmail.com> <43299B1A.3090200@novell.com>
	<432A0282.5020905@gmail.com>
	<20050916200833.GA2453@barkeeper1.linbit>
	<432C02E2.5090807@gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <432C02E2.5090807@gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

> 
> You are right,  datavg seems OK from the device-mapper point of view.
> But at filesystem level, the filesystem on datavg-snk2lv seems to be
> 4.0 GB but  in fact it is 80 GB. My opinion is at a point in past,
> device-mapper again scramled the major and minor numbers and
> systemvg-usrlv overwrited datavg-snk2lv.

unlikely. it would not have changed the file system layout.

more likely, the mapping is wrong.

what do you find in /etc/lvm/backup and /etc/lvm/archive ?
those are plain text files, which store the mapping at that point in
time. compare it with the current mapping.
maybe there is something obvious in the difference...

btw, what did you find on the 253,5
which was missing from your previous device node list?

> From dmsetup table output, datavg-snk2lv seems OK. How can I recover
> the filesystem on it ? Or more basic question, is it possible to
> recover ???

well, everything is possible :->
its more a question of time and effort...

-- 
: Lars Ellenberg                                  Tel +43-1-8178292-0  :
: LINBIT Information Technologies GmbH            Fax +43-1-8178292-82 :
: Schoenbrunner Str. 244, A-1120 Vienna/Europe   http://www.linbit.com :
