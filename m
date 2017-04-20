Date: Thu, 20 Apr 2017 10:40:48 -0500
From: David Teigland <teigland@redhat.com>
Message-ID: <20170420154048.GA29033@redhat.com>
References: <CABGge9ziQcu5a++kTJ-mOFEZet=W6YtuPMb4fxJGMmHRqu3Fbg@mail.gmail.com>
	<20170418160015.GA4820@redhat.com>
	<CABGge9yUfY02boFs8btDkRpFitwm6ZSAv8YpCRGPOwoV8pLyUQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABGge9yUfY02boFs8btDkRpFitwm6ZSAv8YpCRGPOwoV8pLyUQ@mail.gmail.com>
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

On Thu, Apr 20, 2017 at 11:26:18AM +0200, Charles Koprowski wrote:
> Would you consider the use of lvmlockd + sanlock as "production ready" ?

I believe it will work better than clvmd.  There is one main thing, unique
to using sanlock, that you should verify in your environment.
lvmlockd+sanlock is sensitive to spikes in i/o delays.  If sanlock sees
several consecutive large i/o delays (> 10 sec each), e.g. during heavy
use from applications, or during path switching, this can trigger spurious
failure detection.  (This is analogous to network delays when using
network-based solutions.)

(We can increase i/o timeouts to compensate if really necessary.)

> My goal here is to replace an existing cluster of 5 nodes using clvmd + dlm
> + corosync to access a shared VG of 6 TB containing around 300 LVs.
> 
> The current solution is working fine but I find using dlm + corosync "just"
> for locking a bit overkill.

I agree.

Dave
