From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] LVM ate my data!
Message-Id: <20020225192811.A9674@sistina.com>
References: <E16fPYj-0006mn-00@cpca7.uea.ac.uk>
MIME-Version: 1.0
In-Reply-To: <E16fPYj-0006mn-00@cpca7.uea.ac.uk>; from lvm-mail@wbh.org on
    Mon, Feb 25, 2002 at 06:09:09PM +0000
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
Date: Mon Feb 25 12:28:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Feb 25, 2002 at 06:09:09PM +0000, lvm-mail@wbh.org wrote:
> Hiya.
>     I've just upgraded my kernel, and on booting my LVM setup isn't
> recognised. Going back to the old kernel, it still isn't.
> Running vgscan gives:
> vgscan -- reading all physical volumes (this may take a while...)
> vgscan -- found inactive volume group "pvg"
> vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" can't get data of volume group "pvg" from physical volume(s)
> vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" creating "/etc/lvmtab" and "/etc/lvmtab.d"
> 

In case *all* your PVs making up your VG are accessable, your LVM metadata
looks toasted.

> OK, create a new vg and import?

No. 
You need to "pvcreate -ff" your PVs and vgcfgrestore a metadata backup
to all of them.
Before doing so, you can save your actual metadata for recovery in case
something goes badly wrong with:

for d in /dev/hda[34]
do
   dd if=$d of=$(basename $d).vgda bs=1k count=1k
done

So, assuming /dev/hda[34] are all your PVs which belonged to the missing VG
(otherwise add those), figure out the recent metadata backup in /etc/lvmconf.
Say /etc/lvmconf/VG.conf would be the one.

Then run:

pvcreate -yff /dev/hda[34]
vgcfgrestore -n YourVGName /dev/hda3
vgcfgrestore -n YourVGName /dev/hda4
vgscan
vgchange -ay

> vgcreate gives:
> vgcreate -- ERROR: "/etc/lvmtab" doesn't exist; please run vgscan
> and pvscan gives:
> pvscan -- reading all physical volumes (this may take a while...)
> pvscan -- inactive PV "/dev/hda3"  is associated to an unknown VG (run vgscan)
> pvscan -- inactive PV "/dev/hda4"  is associated to an unknown VG (run vgscan)
> pvscan -- total: 2 [16.88 GB] / in use: 2 [16.88 GB] / in no VG: 0 [0]
> 
> Where do I go from here - vgcfgrestore? uuid_fixer? Even something really smelly!

Please upgrade to LVM 1.0.3 and do the pvcreate + vgcfgrestore above.


> Thanks,
>     Bill
> (Sorry if this comes over a bit garbled, I'm posting using lynx, 'coz
> pine's somewhere on /dev/hda4 ...)
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
