Date: Sat, 7 Oct 2006 11:39:16 +0100
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20061007103916.GX17654@agk.surrey.redhat.com>
References: <4526D00E.5070309@ce.jp.nec.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4526D00E.5070309@ce.jp.nec.com>
Subject: [linux-lvm] Re: [PATCH LVM2] fix description of lvcreate
	--regionsize
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

On Fri, Oct 06, 2006 at 05:52:14PM -0400, Jun'ichi Nomura wrote:
> This patch fixes man page to describe it as "MB".

Applied.

> I'm not sure which one is better.
> If someone needs to choose region size smaller than 1MB, you can do it:
> # lvcreate --config "activation {mirror_region_size=4}" -m1 -L100M vg

Or simply lvcreate -R4k :-)

MB is just the default assumed if no units are supplied.

Alasdair
-- 
agk@redhat.com
