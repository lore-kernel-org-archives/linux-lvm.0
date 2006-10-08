Date: Sun, 8 Oct 2006 13:06:56 +0100
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20061008120656.GE17654@agk.surrey.redhat.com>
References: <4526D08C.8010303@ce.jp.nec.com> <4526D126.2060004@ce.jp.nec.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4526D126.2060004@ce.jp.nec.com>
Subject: [linux-lvm] Re: [PATCH LVM2] (3/3) add 'cling' allocation policy
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jun'ichi Nomura <j-nomura@ce.jp.nec.com>
Cc: Alasdair Kergon <agk@redhat.com>, linux-lvm@redhat.com

On Fri, Oct 06, 2006 at 05:56:54PM -0400, Jun'ichi Nomura wrote:
> This patch adds 'cling' allocation policy.

Applied.
Needed to reset preferred_count at the top of the outer loop.
(Was no need previously as contiguous had exactly one possible
match so was pointless going round the loop again so it didn't.)

> +				} else if (cling) {
> +					if (prev_lvseg &&
> +					    _check_same_pv(prev_lvseg,
> +							   pva, areas,
> +							   areas_size)) {
> +						prefered_count++;
>  						goto next_pv;
>  					}
>  					continue;

goto next_pv here - pointless repeatedly testing the same PV - if
it didn't match once it won't again

Alasdair
-- 
agk@redhat.com
