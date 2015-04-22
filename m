Date: Wed, 22 Apr 2015 10:25:15 -0400
From: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20150422142515.GA4468@redhat.com>
References: <loom.20150421T105704-216@post.gmane.org>
	<55376E51.2040400@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <55376E51.2040400@redhat.com>
Subject: Re: [linux-lvm] persistent value of tunables for dmsetup
	--target=cache ?
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
To: nikhil <nkshirsagar@gmail.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On Wed, Apr 22 2015 at  5:48am -0400,
Zdenek Kabelac <zkabelac@redhat.com> wrote:

> Dne 21.4.2015 v 10:58 nikhil napsal(a):
> >Hello,
> >
> >how do I ensure that the tunable (for eg. dmsetup message vg02-jetcache_lv 0
> >write_promote_adjustment 0) will remain the same value even after reboot?
> >
> >Seems like the tunables values reset to earlier values upon reboot of the
> >machine.
> >
> >Help! :)
> 
> 
> By using them, when you create/load  dm table for your cache target.

Best to use lvm2 to create/configure/tune dm-cache.  Otherwise, if
you're just using the dmsetup interface directly you won't have your
tunings persist.
