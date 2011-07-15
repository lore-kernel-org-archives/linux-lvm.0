Date: Fri, 15 Jul 2011 23:14:02 +0100
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20110715221402.GJ15253@agk-dp.fab.redhat.com>
References: <201107141946.12747.benscott@nwlink.com>
	<20110715113901.GE15253@agk-dp.fab.redhat.com>
	<201107151301.15551.benscott@nwlink.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <201107151301.15551.benscott@nwlink.com>
Subject: Re: [linux-lvm] merging snapshots and lvs bug
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
To: ben <benscott@nwlink.com>
Cc: linux-lvm@redhat.com

On Fri, Jul 15, 2011 at 01:01:15PM -0700, ben wrote:
> It isn't a special case. Invalid snaps use capital 'S' in the first column and 
> so do merging snaps. The invalid snap 'S' dates back to old versions of LVM. 
> Here we have three snaps, the first is invalid, the second is merging and the 
> last is normal:
 
Oh, yes, I see.  Curiously the man page used to mention that and it got
replaced with S for merging.

So do you think we should remove that capitalisation, as per the man page
I quoted?

Alasdair
