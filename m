From: lvm-mail@wbh.org
Message-Id: <E16fPYj-0006mn-00@cpca7.uea.ac.uk>
Subject: [linux-lvm] LVM ate my data!
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
Date: Mon Feb 25 12:09:01 2002
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hiya.
    I've just upgraded my kernel, and on booting my LVM setup isn't
recognised. Going back to the old kernel, it still isn't.
Running vgscan gives:
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- found inactive volume group "pvg"
vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" can't get data of volume group "pvg" from physical volume(s)
vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" creating "/etc/lvmtab" and "/etc/lvmtab.d"

OK, create a new vg and import?
vgcreate gives:
vgcreate -- ERROR: "/etc/lvmtab" doesn't exist; please run vgscan
and pvscan gives:
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- inactive PV "/dev/hda3"  is associated to an unknown VG (run vgscan)
pvscan -- inactive PV "/dev/hda4"  is associated to an unknown VG (run vgscan)
pvscan -- total: 2 [16.88 GB] / in use: 2 [16.88 GB] / in no VG: 0 [0]

Where do I go from here - vgcfgrestore? uuid_fixer? Even something really smelly!
Thanks,
    Bill
(Sorry if this comes over a bit garbled, I'm posting using lynx, 'coz
pine's somewhere on /dev/hda4 ...)
