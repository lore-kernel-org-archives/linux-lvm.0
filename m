Subject: Re: [linux-lvm] one PV crashed
References: <878zad8qrx.fsf@papadoc.bayour.com>
    <20020201111151.B15491@sistina.com>
From: Turbo Fredriksson <turbo@bayour.com>
In-Reply-To: <20020201111151.B15491@sistina.com>
Message-Id: <87bsf9mq3r.fsf@papadoc.bayour.com>
MIME-Version: 1.0
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Fri Feb  1 04:52:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

>>>>> "Heinz" == Heinz J Mauelshagen <mauelshagen@sistina.com> writes:

    Heinz> On Fri, Feb 01, 2002 at 11:01:22AM +0100, Turbo Fredriksson
    Heinz> wrote:
    >> I have (had) 6 PV's in my VG. The last one crashed (the whole
    >> disk seems to have broken totaly).
    >> 
    >> It don't seem possible to restore the information (not without
    >> spending $$$ to a data recovery company), so how do I get the
    >> data stored on the OTHER disks?

    Heinz> You don't spend a single dollar :-)

I was referring to restore the lost data on the failed disk ..

    Heinz> There's 2 solutions:

    Heinz> A: --
    Heinz> Buy a replacemeent drive (say /dev/sdg1 ;-) and run

    Heinz> fdisk # to partition it the same way the broken one was
    Heinz> pvcreate /dev/sdg1 vgcfgrestore -f /etc/lvmconf/vg1.conf -n
    Heinz> vg1 /dev/sdg1 vgscan

I'll get a replacement from IBM (the disk is still on warranty), so I'd
go for this...

Since I have data on the vg, will this still let me keep this, or will
it be destroyed when doing the pvcreate/vgcfgrestore?

    Heinz> B: --
    Heinz> If you don't have a replacement drive at hand you can even
    Heinz> be faster by faking one (you must have loop configured in
    Heinz> the kernel and use LVM 1.0.2):

    Heinz> dd if=/dev/zero of=/tmp/my_sdg1.vgda bs=1k count=512
    Heinz> losetup /dev/loop0 /tmp/my_sdg1.vgda pvcreate /dev/loop0
    Heinz> vgcfgrestore -f /etc/lvmconf/vg1.conf -n vg1 /devloop0
    Heinz> vgscan

I'll do this as a temporary solution, while waiting for the replacement.
Knowing IBM, it can take a while :)


Same question here, will the content on the VG be destroyed?

    Heinz> Hope that helps :-)

It does (at least in the sense that I'll won't loose MORE data :) Thanx.

spy NORAD Peking domestic disruption Kennedy subway Ortega president
quiche class struggle [Hello to all my fans in domestic surveillance]
AK-47 CIA Ft. Bragg attack
[See http://www.aclu.org/echelonwatch/index.html for more about this]
