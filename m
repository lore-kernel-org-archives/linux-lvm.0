Date: Mon, 14 Feb 2011 14:17:41 +0000
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20110214141741.GA5825@agk-dp.fab.redhat.com>
References: <4D584FA4.3030007@tlinx.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4D584FA4.3030007@tlinx.org>
Subject: Re: [linux-lvm] new exit message on all commands?: Wiping
	internal	VG cache
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

On Sun, Feb 13, 2011 at 01:39:48PM -0800, Linda A. Walsh wrote:
> But now whenever an 'lvm' command (lvs, pvs, 'lvcreate --help', etc...)  
> runs,
> the last line of output is 'wiping internal VG cache'...

Upstream, that only appears with -v and was added in March 2005.
(I might move it to -vv)

Alasdair
