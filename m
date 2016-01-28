Date: Thu, 28 Jan 2016 09:52:51 -0600
From: David Teigland <teigland@redhat.com>
Message-ID: <20160128155250.GA15124@redhat.com>
References: <20160127152549.GL7782@mastodon>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20160127152549.GL7782@mastodon>
Subject: Re: [linux-lvm] bug in lvmlockd
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
To: Andrey Staselko <andrey@megagroup.ru>
Cc: linux-lvm@redhat.com

On Wed, Jan 27, 2016 at 06:25:49PM +0300, Andrey Staselko wrote:
> If lvm configured with --enable-lockd-dlm and without --enable-lockd-sanlock,
> then "lvmlockd --adopt 1" always produces error "adopt_locks failed, reset host" in adopt_locks().

Thanks, I've fixed that.  (Also, I'm not sure it's mentioned anywhere that
git.kernel.org/torvalds/c/2ab4bd8 is needed for dlm lock adoption to work.)

Dave
