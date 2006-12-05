Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id kB5DbcCG002532
	for <linux-lvm@redhat.com>; Tue, 5 Dec 2006 08:37:38 -0500
Received: from mout0.freenet.de (mout0.freenet.de [194.97.50.131])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	kB5DbZ0q021382
	for <linux-lvm@redhat.com>; Tue, 5 Dec 2006 08:37:36 -0500
Received: from [194.97.50.135] (helo=mx2.freenet.de)
	by mout0.freenet.de with esmtpa (Exim 4.62)
	(envelope-from <Richard.Kampmann@freenet.de>) id 1GraUJ-00088P-5D
	for linux-lvm@redhat.com; Tue, 05 Dec 2006 14:37:35 +0100
Received: from p54abff71.dip.t-dialin.net ([84.171.255.113]:11232
	helo=mars.rkampmann.local)
	by mx2.freenet.de with esmtpsa (ID Richard.Kampmann@freenet.de)
	(TLSv1:AES256-SHA:256) (port 25) (Exim 4.62 #12) id 1GraUJ-00036f-1G
	for linux-lvm@redhat.com; Tue, 05 Dec 2006 14:37:35 +0100
From: Richard Kampmann <Richard.Kampmann@freenet.de>
Subject: Re: [linux-lvm] LVM problem - how to recover? (solved)
Date: Tue, 5 Dec 2006 14:38:49 +0100
References: <200611282115.15335.Richard.Kampmann@freenet.de>
	<200612031515.40158.krakrjak@volumehost.net>
In-Reply-To: <200612031515.40158.krakrjak@volumehost.net>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
Message-Id: <200612051438.50441.Richard.Kampmann@freenet.de>
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
To: linux-lvm@redhat.com

Hi Zac,

> > Any way to recover the LVs of the old volume group? A vgcfgrestore (YES,
> > there was a vgcfgbackup before!) does not work ... bad luck.
>
> What errors do you get using vgcfgrestore?

thank you for your answer. I got various errors ...

The reason for this was that all hints and todos I found had the wrong syntax 
(maybe old lvm-version ...). The manpage of vgcfgrestore does not tell  
anything helpful.

In the meantime I found the right syntax and with a little trying and 
stumbling I managed to get access to the important LVs on both disks. Most of 
my important data is available - only one filesystem was badly corrupted. 
Maybe a 'reiserfsck --rebuild-tree' helps (runs at the moment).

So my problem seems to be solved - thanks.

Bye

Richard
