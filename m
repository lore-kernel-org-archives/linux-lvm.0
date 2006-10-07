Date: Sat, 7 Oct 2006 11:51:28 +0100
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20061007105128.GY17654@agk.surrey.redhat.com>
References: <4526D08C.8010303@ce.jp.nec.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4526D08C.8010303@ce.jp.nec.com>
Subject: [linux-lvm] Re: [PATCH LVM2] (0/3) 'cling' allocation policy
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

On Fri, Oct 06, 2006 at 05:54:20PM -0400, Jun'ichi Nomura wrote:
>   [lv0_mimage_0] /dev/sdb(0)
>   [lv0_mimage_1] /dev/sdb(2)

> You see /dev/sda is used for both lv0_mimage_0 and lv0_mimage_1.
> If this disk breaks, you lose the whole LV.
 
You still have a full copy of the data on sdb.
It's just that the current implementation isn't clever enough to
piece it back together yet.

Alasdair
-- 
agk@redhat.com
