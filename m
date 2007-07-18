Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l6J7YLHe004368
	for <linux-lvm@redhat.com>; Thu, 19 Jul 2007 03:34:21 -0400
Received: from lnxc-640.srv.mediaways.net (smtp.compuserve.de [62.52.27.101])
	by mx1.redhat.com (8.13.1/8.13.1) with SMTP id l6J7YELm024708
	for <linux-lvm@redhat.com>; Thu, 19 Jul 2007 03:34:14 -0400
From: Joachim Banzhaf <joachimbanzhaf@compuserve.de>
Subject: Re: [linux-lvm] snapshots can't be deactivated
Date: Wed, 18 Jul 2007 13:37:58 +0200
References: <469CD32D.6040104@idmedia.com>
In-Reply-To: <469CD32D.6040104@idmedia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200707181337.58651.joachimbanzhaf@compuserve.de>
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

Hi Falko,

Am Dienstag, 17. Juli 2007 16:33 schrieb Falko Zurell:

> I don't know why this happens. The script will work perfectly 3 out of 5
> times. But sometimes it comes up with the error above.

Maybe some hotplug script trying to find out what kind of new device that is?

> Are my steps right in principle? Did I forget to do something before or
> after removing?

I am by no means an expert on lvm, so dont take this too seriously: shouldn't 
there be an lvchange -an yourlv before lvremove? Maybe this active status is 
still hanging around somewhere although you can force the remove?

HTH

Joachim Banzhaf
