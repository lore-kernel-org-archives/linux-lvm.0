Date: Thu, 16 Feb 2012 11:09:23 -0500
From: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20120216160923.GA16220@redhat.com>
References: <4F3D03AE.2050502@mohawksoft.com>
	<20120216135702.GA6212@redhat.com>
	<4F3D15CC.1080901@mohawksoft.com>
	<20120216154301.GA13948@redhat.com>
	<4F3D28F8.2060009@mohawksoft.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4F3D28F8.2060009@mohawksoft.com>
Subject: Re: [linux-lvm] Snapshots
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
To: Mark Woodward <markw@mohawksoft.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On Thu, Feb 16 2012 at 11:04am -0500,
Mark Woodward <markw@mohawksoft.com> wrote:

> On 02/16/2012 10:43 AM, Mike Snitzer wrote:
> >Please review the upstream Linux>= 3.2 kernel code/docs too, it has
> >more documentation of the underlying capabilities, e.g.:
> >
> >Documentation/device-mapper/thin-provisioning.txt
> >
> >http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=blob;f=Documentation/device-mapper/thin-provisioning.txt
> >
> >(the "Introduction" being the most approachable overview)
> OK, that's where I missed it. I looked at the snapshots description.
> It is now part of thin-provisioning. Got it. Will it be in the 2.6
> kernel or will there need to be an upgrade to 3.x series?

It went upstream in Linux 3.2.  So if using upstream kernels you'll need
Linux >= 3.2. (you'll also need the latest upstream lvm2 code for the
ability to create thinp devices and snapshots of them with lvm2).

But thinp will also be provided in the next RHEL6 release (6.3).

Mike
