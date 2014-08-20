Date: Wed, 20 Aug 2014 16:50:10 +0100
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20140820155010.GC23914@agk-dp.fab.redhat.com>
References: <15785B7E063D464C86DD482FCAE4EBA501AA8A21A0F1@XCH11.scidom.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <15785B7E063D464C86DD482FCAE4EBA501AA8A21A0F1@XCH11.scidom.de>
Subject: Re: [linux-lvm] problem with lvcreate and redirection
	of	stdout/stderr
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
To: "Lentes, Bernd" <bernd.lentes@helmholtz-muenchen.de>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On Wed, Aug 20, 2014 at 05:27:52PM +0200, Lentes, Bernd wrote:
> lvcreate -v -L 45G -n lv_root_snapshot -s vg1/lv_root >> /var/log/update.log 2>&1
 
> lvcreate    Suspending vg1-lv_root (252:0) with filesystem sync with device flush

/var/log is presumably part of a filesystem on the same LV that is getting its I/O
paused for a brief moment while the snapshot is taken.

1) Run lvm dumpconfig log/activation  to double-check this is not set to 1.

2) What filesystem is this and precisely what kernel?  (cat /proc/mounts)

3) Try to obtain a stack trace at the point where this locks up e.g.  
echo t > /proc/sysrq-trigger followed by dmesg (or divert your logging
of kernel messages to a different filesystem outside the snapshot).

Alasdair
