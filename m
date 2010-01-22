Date: Thu, 21 Jan 2010 20:37:35 -0500
From: tytso@mit.edu
Message-ID: <20100122013735.GB21263@thunk.org>
References: <4B5785A5.2010505@redhat.com>
	<F348497E-C9B1-49D3-920B-5AF98CBDDD98@sun.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <F348497E-C9B1-49D3-920B-5AF98CBDDD98@sun.com>
Subject: Re: [linux-lvm] [PATCH] default max mount count to unused
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
To: Andreas Dilger <adilger@sun.com>
Cc: Eric Sandeen <sandeen@redhat.com>, ext4 development <linux-ext4@vger.kernel.org>, Alasdair G Kergon <agk@redhat.com>, Bill Nottingham <notting@redhat.com>, LVM Mailing List <linux-lvm@redhat.com>

On Thu, Jan 21, 2010 at 05:22:55PM -0700, Andreas Dilger wrote:
> 
> Alasdair, any chance you can include this script into the LVM package?
> 
> Ted, this should really be added to e2fsprogs, and the e2croncheck
> script removed.  The existing e2croncheck script is broken in a
> number of ways (e.g. the force check timestamp 19000101 is invalid,
> the email reporting doesn't work because "$RPT-EMAIL" is never set)
> and is less functional in other ways (it doesn't remove stale
> snapshots in case of an interrupted script, it doesn't check
> multiple LVs, etc).

Sure, I'd be happy to include this to e2fsprogs.  I'm not sure which
distro package should be installing it, but we can leave that up to
the distro maintainers.

					- Ted
