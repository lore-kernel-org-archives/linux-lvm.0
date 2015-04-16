Received: from [10.36.7.158] (vpn1-7-158.ams2.redhat.com [10.36.7.158])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t3GGcS83025411
	for <linux-lvm@redhat.com>; Thu, 16 Apr 2015 12:38:29 -0400
Message-ID: <552FE583.3000400@redhat.com>
Date: Thu, 16 Apr 2015 18:38:27 +0200
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <552F6A01.7080003@strath.ac.uk>
In-Reply-To: <552F6A01.7080003@strath.ac.uk>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] lvm thinpool metadata spare resizing
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Dne 16.4.2015 v 09:51 Ian Gordon napsal(a):
>
> Hello,
>
> When I manually resized my thinpool's metdata lv with
>
> lvextend -L +200M vg/tp_tmeta
>
> it did not resize the lvol0_pmspare metadata spare lv.
> Is this a problem for automatic recovery (or am I worrying too much)?
>
> I can't manually resize the metadata spare lv because I get an error
> "Can't resize internal logical volume lvol0_pmspare". Is there a way of
> recreating the metadata spare lv?
>


Yep please open bugzilla for this case.

Zdenek
