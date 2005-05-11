Received: from mx2.redhat.com ([10.255.15.25])
	by int-mx2.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j4BHIeP16190
	for <linux-lvm@redhat.com>; Wed, 11 May 2005 13:20:11 -0400
Received: from snefru.openlib.org (netec.wustl.edu [128.252.177.195])
	by mx2.redhat.com (8.12.11/8.12.11) with ESMTP id j4BHj7TM024890
	for <linux-lvm@redhat.com>; Wed, 11 May 2005 13:45:08 -0400
Received: from krichel by snefru.openlib.org with local (Exim 4.50)
	id 1DVupC-00044X-EG
	for linux-lvm@redhat.com; Wed, 11 May 2005 12:16:46 -0500
Date: Wed, 11 May 2005 12:16:46 -0500
From: Thomas Krichel <krichel@openlib.org>
Subject: Re: [linux-lvm] Re: ide / debian
Message-ID: <20050511171646.GA15558@openlib.org>
References: <20050510173249.GJ2445@openlib.org>
	<20050511163957.GA14252@openlib.org>
	<20050511164906.GB16497@null.msp.redhat.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20050511164906.GB16497@null.msp.redhat.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

  AJ Lewis writes

> Look in /etc/lvm/lvm.conf for a filter line - it probably has hdc or cdrom in
> it.  You need to remove this.

fafner:~# grep hdc /etc/lvm/lvm.conf
    # Or maybe all loops and ide drives except hdc:
    # filter =[ "a|loop|", "r|/dev/hdc|", "a|/dev/ide|", "r|.*|" ]
fafner:~# grep cdrom /etc/lvm/lvm.conf
    # Exclude the cdrom drive
    filter = [ "r|/dev/cdrom|" ]
fafner:~# ls -l /dev/cdrom
lrwxrwxrwx  1 root root 8 2005-05-08 21:27 /dev/cdrom -> /dev/hdc

  This is likely to be the cause of the problem! Thank you so much!

  Cheers,

  Thomas Krichel                      mailto:krichel@openlib.org
                                 http://openlib.org/home/krichel
                             RePEc:per:1965-06-05:thomas_krichel
