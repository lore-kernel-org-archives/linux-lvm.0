From: wbh <W.B.Hill@uea.ac.uk>
Subject: Re: [linux-lvm] LVM ate my data!
In-Reply-To: <20020225192811.A9674@sistina.com>
Message-Id: <Pine.OSF.4.05.10202251852210.18015-100000@cpca7.uea.ac.uk>
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
Date: Mon Feb 25 13:14:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, 25 Feb 2002, Heinz J . Mauelshagen wrote:

> In case *all* your PVs making up your VG are accessable, your LVM metadata
> looks toasted.

The bootup should just run "vgchange -ay", ah well!

> You need to "pvcreate -ff" your PVs and vgcfgrestore a metadata backup
> to all of them.
> Before doing so, you can save your actual metadata for recovery in case
> something goes badly wrong with:

OK, metadata saved.

> So, assuming /dev/hda[34] are all your PVs which belonged to the missing VG
> (otherwise add those), figure out the recent metadata backup in /etc/lvmconf.
> Say /etc/lvmconf/VG.conf would be the one.
> 
> Then run:
Using the 1.0.3 versions...

> pvcreate -yff /dev/hda[34]

pvcreate -- WARNING: forcing physical volume creation on "/dev/hda3" of
volume group "pvg"
pvcreate -- physical volume "/dev/hda3" successfully created
pvcreate -- WARNING: forcing physical volume creation on "/dev/hda4" of
volume group "pvg"
pvcreate -- physical volume "/dev/hda4" successfully created

> vgcfgrestore -n YourVGName /dev/hda3
vgcfgrestore -- INFO: using backup file "/etc/lvmconf/pvg.conf"
vgcfgrestore -- ERROR: different structure size stored in
"/etc/lvmconf/pvg.conf" than expected in file vg_cfgrestore.c [line 139]
vgcfgrestore -- ERROR "vg_cfgrestore(): read" restoring volume group "pvg"

Hmm. Same for ./vgcfgrestore -f /etc/lvmconf/pvg.conf*

> vgcfgrestore -n YourVGName /dev/hda4
> vgscan
> vgchange -ay
> 
> Please upgrade to LVM 1.0.3 and do the pvcreate + vgcfgrestore above.

Got 1.0.3 Should I try the vgcfgresore with the old tools (v0.9)???

BTW, thanks very much for getting back so rapidly!

Thanks,
    Bill
