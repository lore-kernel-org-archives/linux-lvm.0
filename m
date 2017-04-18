Date: Tue, 18 Apr 2017 11:00:15 -0500
From: David Teigland <teigland@redhat.com>
Message-ID: <20170418160015.GA4820@redhat.com>
References: <CABGge9ziQcu5a++kTJ-mOFEZet=W6YtuPMb4fxJGMmHRqu3Fbg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABGge9ziQcu5a++kTJ-mOFEZet=W6YtuPMb4fxJGMmHRqu3Fbg@mail.gmail.com>
Subject: Re: [linux-lvm] ubuntu xenial + lvmlockd
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
To: Charles Koprowski <cko@audaxis.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On Thu, Apr 13, 2017 at 06:14:54PM +0200, Charles Koprowski wrote:
> Hi all,
> 
> I'm trying to set up a shared VG between 2 ubuntu servers (xenial) using
> lvmlockd for locking.
> 
> Unfortunately, even if the default config (lvm.conf) mentions the
> possibillity to use lvmlockd (use_lvmlockd = 1), I cannot find any trace of
> the daemon lvmlockd or lvmlockctl tool in ubuntu.
> 
> Does anyone already done this before ?
> 
> Do I have to build lvm from source in order to use lvmlockd ?

I'd guess that lvm was not built with lvmlockd support, in which case you
would need to rebuild it with one or both of --enable-lockd-sanlock,
--enable-lockd-dlm (and I'm going to rename those options to be "lvmlockd"
in a minute.)

Dave
