Date: Mon, 6 Mar 2017 11:39:00 -0600
From: David Teigland <teigland@redhat.com>
Message-ID: <20170306173900.GA16362@redhat.com>
References: <87a0048c-d443-bbda-5b27-ab7332278061@yahoo.co.uk>
	<483e1a7a-45c8-6a03-af3e-d54ecb8b3945@redhat.com>
	<e8a18733-6531-a785-4f43-614b5fb3c5af@yahoo.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e8a18733-6531-a785-4f43-614b5fb3c5af@yahoo.co.uk>
Subject: Re: [linux-lvm] lvextend does not change/fix stripes & stripesize
 for the whole LV?
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
To: lejeczek <peljasz@yahoo.co.uk>
Cc: linux-lvm@redhat.com

On Mon, Mar 06, 2017 at 10:56:49AM +0000, lejeczek wrote:
> may I share a comment - inasmuch as man pages for lvm are really good, there
> are places where some bits are missing.

> Would be great to have man pages completed with these missing bits. It's
> rhel 7.3, lvm2-2.02.166-1.el7_3.2.x86_64

The lvm man pages have just been reworked in the upstream git, and any
feedback would be welcome (they are still being polished).  They are now
generated, along with the command help output, from a formal set of
"command definitions".  This defines commands recognized by lvm, their
syntax, accepted options, and is the source man/help are generated from.
The code, help output and man pages will always be in sync because it is
all from one place.

Dave
