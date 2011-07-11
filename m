Date: Mon, 11 Jul 2011 03:16:31 +0100
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20110711021630.GC7857@agk-dp.fab.redhat.com>
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

The canonical name to use is /dev/<vgname>/<lvname>.
That's been inherited from the original LVM1 code and has never changed.
That's the only form of the name to use to maintain compatibility.

Other forms - dm-N and /dev/mapper/X-Y are internal and the format of
those is not guaranteed: indeed there'll probably be some further
changes soon to workaround some other completely arbitrary udev
restrictions we don't cope with yet.

Different versions of df and mount haven't always retained this 
preferred form for their output.

Alasdair
