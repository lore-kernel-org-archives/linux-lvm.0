Received: from localhost (vpn1-7-34.ams2.redhat.com [10.36.7.34])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s8A9dNeE009009
	for <linux-lvm@redhat.com>; Wed, 10 Sep 2014 05:39:24 -0400
Date: Wed, 10 Sep 2014 10:39:23 +0100
From: Joe Thornber <thornber@redhat.com>
Message-ID: <20140910093922.GA4722@debian>
References: <5410138C.9010603@cemery.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5410138C.9010603@cemery.org.uk>
Subject: Re: [linux-lvm] Replace small drive with bigger, using LVM?
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

On Wed, Sep 10, 2014 at 10:02:04AM +0100, Craig wrote:
> So I'd love to do something like
> * dd /dev/sda1 to /dev/sdb1 or something like that and have my /boot
> volume set up

Use pvmove to move everything across to the new disk.
