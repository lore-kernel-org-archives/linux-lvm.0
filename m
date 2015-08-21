Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t7LCMm98005173
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Fri, 21 Aug 2015 08:22:48 -0400
Received: from nm2-vm6.access.bullet.mail.bf1.yahoo.com
	(nm2-vm6.access.bullet.mail.bf1.yahoo.com [216.109.114.93])
	by mx1.redhat.com (Postfix) with ESMTPS id 94B9514AA4
	for <linux-lvm@redhat.com>; Fri, 21 Aug 2015 12:22:47 +0000 (UTC)
Message-ID: <1440159766.24848.YahooMailBasic@web181505.mail.ne1.yahoo.com>
Date: Fri, 21 Aug 2015 05:22:46 -0700
From: matthew patton <pattonme@yahoo.com>
In-Reply-To: <mr6ji3$nsn$1@ger.gmane.org>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Uncache a LV when a cache PV is gone, bug ?
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>


> > [root@storage ~]# /usr/sbin/cache_check
> >
> > and it waits indefinitely.

> > If a replace the /usr/sbin/cache_check with a shell script that returns 0 or 1
> > vgreduce just errors out. It seems that there is no way to uncache the
> > LV without replacing the missing PV (which could pose a problem in production use).
 
> It's unhandled yet scenario.

Huh? It's a bloody OBVIOUS scenario and frankly the most important one! How does something this fundamental get 'missed'?
