Subject: Re: [linux-lvm] one PV crashed
References: <878zad8qrx.fsf@papadoc.bayour.com>
    <20020201111151.B15491@sistina.com> <87bsf1eg6b.fsf@papadoc.bayour.com>
From: Turbo Fredriksson <turbo@bayour.com>
In-Reply-To: <87bsf1eg6b.fsf@papadoc.bayour.com>
Message-Id: <87wuxf6k3a.fsf@papadoc.bayour.com>
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
Date: Fri Feb 15 05:50:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

>>>>> "Turbo" == Turbo Fredriksson <turbo@bayour.com> writes:

    Turbo> Oki, since I had a LVM with broken loop support, I'll try
    Turbo> with a spare disk...

    Turbo> [papadoc.root]# vgcfgrestore -f /etc/lvmconf/vg1.conf -n
    Turbo> vg1 -o /dev/sdg1 /dev/sdh1 vgcfgrestore -- size of physical
    Turbo> volume /dev/sdh1 differs from backup ----- s n i p -----

    Turbo> I'm not sure exactly how big my previous (now crashed) sdg
    Turbo> disk was, or how big the sdg1 partition was...

Oki, I managed to pvcreate my new sdh1, and then a vgcfgrestore.

        vgcfgrestore -f /etc/lvmconf/vg1.conf -n vg1 -o /dev/sdg1 /dev/sdh1

This went ok, but 'pvscan -u' is behaving (?) strangly...

----- s n i p -----
[papadoc.root]# pvscan -u
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- inactive PV "/dev/sdb1 " with UUID "ofZCeT-O16H-Df0h-4KoB-xQhm-lc24-67dZvk"  is associated to an unknown VG (run vgscan)
pvscan -- inactive PV "/dev/sdc1 " with UUID "xN0MF7-xKU0-Uk3L-g8Pw-0YfH-fS3V-zgFA66"  is associated to an unknown VG (run vgscan)
pvscan -- inactive PV "/dev/sdd10" with UUID "5V0XNB-gA87-OU66-1iza-cvsz-xQ2q-6DEbyH"  is associated to an unknown VG (run vgscan)
pvscan -- inactive PV "/dev/sde1 " with UUID "Bdm7PX-50Dq-hC6R-yXmv-DDq1-n6Nx-4ohaKK"  is associated to an unknown VG (run vgscan)
pvscan -- inactive PV "/dev/sdf1 " with UUID "QnqfyA-fOTB-J1Pp-4be5-t6QU-bGjS-i2BKf2"  is associated to an unknown VG (run vgscan)
pvscan -- inactive PV "/dev/sdh1 " with UUID "ZNODti-EFFz-rGID-HYyh-kg7Z-yDCe-LLbXBv" is in no VG  [15.55 GB]
pvscan -- total: 6 [50.39 GB] / in use: 5 [34.84 GB] / in no VG: 1 [15.55 GB]
----- s n i p -----

Running vgscan (as directed) gives me:

----- s n i p -----
[papadoc.root]# vgscan 
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume group
----- s n i p -----

Ideas how to get my VG up and running again?

cryptographic Ft. Bragg NORAD plutonium 747 Legion of Doom Serbian
Saddam Hussein munitions Noriega supercomputer colonel fissionable
smuggle kibo
[See http://www.aclu.org/echelonwatch/index.html for more about this]
