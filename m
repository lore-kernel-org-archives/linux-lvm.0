From: Steven Lembark <lembark@wrkhors.com>
Subject: Re: [linux-lvm] Chicken and egg problem..
Message-ID: <7510000.1006331425@dizzy>
In-Reply-To: <1006347197.3bfba3bd23d95@imp.free.fr>
References: <1006347197.3bfba3bd23d95@imp.free.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
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
Date: Wed Nov 21 08:31:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com


-- Georges Giralt <georges.giralt@free.fr>

> Hello !
> As I've previously said, I plan to make my RedHat 7.1 (kernel 2.4.5) a
> pure LVM  machine.
> To do so, I've build the 1.0.4 version of LVM into the kernel (with the
> NCR SCSI  driver). As to avoid an initrd. Simple is beautifull...
>
> In the sysinit rc script, Redhat has put a vg activation command, but....
> My kernel panics, as it is unable to mount root, as the LVM activation
> commands  are after the root fsck (and mount..)
>
> If I put the LVM activation lines early, in the sysinit script, these
> commands  complains beeing not able to access /etc/lvmtab....

The kernel panic is extactly why you probably wouldn't
want to use only LVM on the system. Leaving the root
volume (a.k.a., '/'), primary swap and probably /var on
the first three partitions of the boot device will make
your life enormously simpler in the long run.

This is pretty much the only way you'll be able to
convienently recover from any LVM problems in the future.
Otherwise you'll need bootable media floating around.

--
Steven Lembark                               2930 W. Palmer
Workhorse Computing                       Chicago, IL 60647
                                            +1 800 762 1582
