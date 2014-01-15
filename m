Date: Wed, 15 Jan 2014 15:49:11 +0000
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20140115154911.GB31790@agk-dp.fab.redhat.com>
References: <87zjmxzmga.fsf@red.mvo.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87zjmxzmga.fsf@red.mvo.lan>
Subject: Re: [linux-lvm] Identifying useable block devices
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
To: Marius Vollmer <marius.vollmer@redhat.com>
Cc: linux-lvm@redhat.com

On Wed, Jan 15, 2014 at 10:19:33AM +0200, Marius Vollmer wrote:
> How can a program tell that only /dev/mapper/TEST-thin can really be
> used as a block device, and the rest should be ignored?
 
/dev/mapper is meant only for internal use.

Use /dev/$vg/$lv instead (in the case of LVM).
Internal LVs shouldn't appear there.

Alasdair
