From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] vgscan problem
Message-Id: <20020115152649.H11005@sistina.com>
References: <Pine.LNX.4.33.0201062011010.681-100000@Prometheus.schaefer.nu>
MIME-Version: 1.0
In-Reply-To: <Pine.LNX.4.33.0201062011010.681-100000@Prometheus.schaefer.nu>;
    from andrew@schaefer.nu on Sun, Jan 06, 2002 at 08:32:09PM -0500
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
Date: Tue Jan 15 08:30:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Andrew,

so you did pvcreate the second PV and added (vgextend) it to your existing
VG successfully?
What exactly happened before vgscan complained?

You should have a valid LVM metadata backup in /etc/lvmconf/big_space.conf
(or an older copy named /etc/lvmconf/big_space.conf.#.old where # is a number
from 1 up to 9).
To figure out which one is ok you want to for eg. use

vgcfgrestore -n big_space -f /etc/lvmconf/big_space.conf -ll


To restore the metadata run:

pvcreate -ff /dev/BothOfYourPVs
vgcfgrestore -n big_space -f /etc/lvmconf/big_space.conf /dev/Your1stPV
vgcfgrestore -n big_space -f /etc/lvmconf/big_space.conf /dev/Your2ndPV
vgscan

On Sun, Jan 06, 2002 at 08:32:09PM -0500, Andrew Schaefer wrote:
> I just setup LVM with two disks in the volume group big_space.  I started
> out with one disk and then extended it across the other.  It
> formatted, fs extended, and mounted up fine.  I then rebooted, and now I
> get this error from vgscan:
> 
> vgscan -- reading all physical volumes (this may take a while...)
> vgscan -- found inactive volume group "big_space"
> vgscan -- ERROR "pv_read_pe(): read" can't get data of volume group
> "big_space"
> from physical volume(s)
> vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
> vgscan -- WARNING: This program does not do a VGDA backup of your volume
> group
> 
> Any ideas or suggestions?  Unfortunately I threw data onto the volume and
> don't want to loose it.
> 
> Andrew Schaefer
> andrew@schaefer.nu
> http://www.schaefer.nu
> 
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

-- 

Regards,
Heinz    -- The LVM Guy --

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
