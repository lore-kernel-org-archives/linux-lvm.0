Date: Thu, 13 Mar 2014 23:35:13 -0400
From: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20140314033512.GA9754@redhat.com>
References: <0c0501cf3e39$0e82e0f0$2b88a2d0$@acm.org>
	<20140312233505.GA1660@redhat.com>
	<20140313172025.GA6835@redhat.com>
	<0d2401cf3f2f$13648000$3a2d8000$@acm.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0d2401cf3f2f$13648000$3a2d8000$@acm.org>
Subject: Re: [linux-lvm] thinpool metadata size
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
To: "Paul B. Henson" <henson@acm.org>
Cc: Zdenek Kabelac <zkabelac@redhat.com>, 'LVM general discussion and development' <linux-lvm@redhat.com>

On Thu, Mar 13 2014 at 10:42pm -0400,
Paul B. Henson <henson@acm.org> wrote:

> > From: Mike Snitzer
> > Sent: Thursday, March 13, 2014 10:20 AM
> >
> > Yes, we're still unable to resize after metadata has been completely
> > exhausted:
> [...]
> > Good news is online metadata resize works fine as long as metadata space
> > hasn't been exhausted:
> 
> Hmm, then it seems it would be wise to keep an eye on utilization ;). Looks
> like there are some munin plug-ins for lvm, hopefully one of them already
> has metadata usage support or can be easily extended.

lvm2 should/could monitor for metadata low water mark threshold events,
which the kernel will trigger, much like it does for data low water
mark.

But since the kernel internalizes the metadata low water mark I'm not
sure if lvm2 has taken this on.  Zdenek?
