Message-ID: <089901c2dc2d$0f3dc2a0$070414ac@pin>
From: "Christian Limpach" <chris@pin.lu>
References: <8075D5C3061B9441944E137377645118012E6B@cinshrexc03.shermfin.com>
Subject: Re: [linux-lvm] Recovering from a hard crash
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Date: Mon Feb 24 11:50:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com, ARechenberg@shermanfinancialgroup.com

"Rechenberg, Andrew" <ARechenberg@shermanfinancialgroup.com> wrote:
> Well, unless I'm reading this wrong, it looks as if /dev/md0 and
> /dev/md10 have the same pvdata for some reason.  /dev/md0 is the first
> part of /dev/md10.  Any ideas as to what's going on and how to resolve
> this issue?

md0 is the beginning of md10 and the LVM metadata is located at the start of
the PVs.  This is why vgscan/pvscan sees the same PV on md0 and md10.  I
think (untested...) that the ugly quick fix is to "mv /dev/md0 /dev/notmd0",
this should work because vgscan/pvscan then won't see the device node.  The
less ugly fix is to use LVM2 with a devicename filter which excludes md0.
In the long run (and since this is a test system), I'd suggest that you
recreate your VG from PVs on each /dev/md[0-9] instead of creating and using
/dev/md10.  This also gives you better control of where your
snapshot-copy-on-write-space will be located (best not on the same
disks...).

    christian
