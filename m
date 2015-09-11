Received: from localhost (vpn1-5-113.ams2.redhat.com [10.36.5.113])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t8BCp96X009154
	for <linux-lvm@redhat.com>; Fri, 11 Sep 2015 08:51:09 -0400
Date: Fri, 11 Sep 2015 13:51:05 +0100
From: Joe Thornber <thornber@redhat.com>
Message-ID: <20150911125104.GA8027@rh-vpn>
References: <CAAxjCEwMqpAWFc+BBNW6bLUC7mkjkjdvFkRz66WnZEB__qW2dw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAxjCEwMqpAWFc+BBNW6bLUC7mkjkjdvFkRz66WnZEB__qW2dw@mail.gmail.com>
Subject: Re: [linux-lvm] Strange dm-cache activity at startup
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

On Thu, Sep 10, 2015 at 11:30:27AM +0200, Stefan Ring wrote:
> Is this normal/expected? What does it do? Why does it write back huge
> amounts of data to the HDD after each system start?

No, this is not expected.  The most likely cause is your system was
not shutdown cleanly so dm-cache has no choice but to assume all
blocks are dirty and need writing back.  Make sure your volumes are
being deactivated as part of shutdown.

- Joe
