Date: Fri, 27 Mar 2020 20:53:29 +0000
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20200327205329.GA29554@agk-dp.fab.redhat.com>
References: <20200326233144.GM17504@agk-dp.fab.redhat.com>
	<20200327195006.GE6382@bdmcc-us.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200327195006.GE6382@bdmcc-us.com>
Subject: Re: [linux-lvm] storage-logger: Recording changes to the
	udev	database
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
To: Brian McCullough <bdmc@bdmcc-us.com>
Cc: dm-devel@redhat.com, linux-lvm@redhat.com

On Fri, Mar 27, 2020 at 03:50:06PM -0400, Brian McCullough wrote:
> In your instructions, you say to put the "working" script in /usr/sbin,
> while in the udev rule, it is in /sbin/

In Fedora they are the same.

> I tried adding and removing a USB-connected drive, but did not see any
> response in the journal.  Should I have seen something, or are those not
> seen?

You should test the script in isolation in case there are any other 
differences on Debian.  Change the top line to '...bash -x' so you
can watch it, set some environment variables (like ACTION=add) and 
run it directly.

Alasdair
