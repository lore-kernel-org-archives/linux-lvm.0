Date: Mon, 11 Jul 2011 03:58:11 +0100
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20110711025811.GF7857@agk-dp.fab.redhat.com>
References: <4E1A526F.9090700@tlinx.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4E1A526F.9090700@tlinx.org>
Subject: Re: [linux-lvm] Inconsistent naming...?
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
To: "Linda A. Walsh" <lvm@tlinx.org>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On Sun, Jul 10, 2011 at 06:31:27PM -0700, Linda A. Walsh wrote:
> Notice the device name.   notice how the single dashes are now displayed
> as two dashes?!?!

Roughly: a dash is the separator we chose, and we double it to escape a
real dash.  But we still need to extend our escaping mechanism to handle
characters that udev states it doesn't support in primary device names
but which the old /dev did used to support (and so we still do).

Alasdair
