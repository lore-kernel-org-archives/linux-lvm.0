Date: Sun, 8 Oct 2006 00:38:46 +0100
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20061007233846.GD17654@agk.surrey.redhat.com>
References: <4526D08C.8010303@ce.jp.nec.com> <4526D0F6.7090406@ce.jp.nec.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4526D0F6.7090406@ce.jp.nec.com>
Subject: [linux-lvm] Re: [PATCH LVM2] (2/3) use _for_each_pv() from
	_check_contiguous()
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
Cc: linux-lvm@redhat.com

On Fri, Oct 06, 2006 at 05:56:06PM -0400, Jun'ichi Nomura wrote:
> This patch rewrites _check_contiguous() to use _for_each_pv().
 
I think the existing FIXME got dropped and I suspect there are problems
with multiple levels of recursion.  (h->index++ ?)
 
I'm checking in something based on your patch, but I expect there'll still be
things to fix up.

Alasdair
-- 
agk@redhat.com
