From: "CC. Spindler" <ccspindler@prs-gmbh.de>
Message-ID: <878zdh5sv8.fsf@cc.prs>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] Problem mit lvm nach dem Reboot.
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
Date: Thu Nov  8 06:49:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: Heinz Mauelshagen <Linux-LVM@sistina.com>

Eine verregneten Gru=DF aus Karlsruhe!

Hallo Herr Mauelshagen

 Ich habe  ein f=FCr  mich gr=F6=DFeres  Problem mit lvm.   Ich habe  aus 10
Platten  nach un  nach ein  logisches Volume  gebildet. Dann  habe ich
versucht mit  pvmove zwei  Platten zu verschieben  und mit  vgsplit zu
entfernen.   Leider hat  es aber  nicht geklappt.   Dann habe  ich mit
pvchange die beiden Platten  deaktiviert und konnte mit resize2fs etc.
die Gr=F6=DFe  anpassen. Und  die Daten waren  bis auf wenige  Fehler noch
vorhanden.=20

  Nach dem  ich nun  einen Reboot durch  gef=FChrt habe, geht  nix mehr.
vgchange meint, da=DF es keine VGs finden kann. Und vgscan ergibt
folgende Ausgabe:

----------------------------------------------------------------------
host:/etc# vgscan=20
vgscan
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- found inactive volume group "pool"
vgscan -- only found 12353 of 12675 LEs for LV /dev/pool/pool_lv (0)
vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" can't get da=
ta of volume group "pool" from physical volume(s)
vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" creating "/e=
tc/lvmtab" and "/etc/lvmtab.d"
----------------------------------------------------------------------

Ich benutze:=20

  - den 2.4.9 Kernel mit lvm version 0.9.1_beta2
  - Debian testing
  - und die Debian packete von ihrem ftp-Server:
=20=20=20=20=20=20=20
       liblvm-iop10_0.9.1.beta7-1_i386.deb
       lvm-base_1.1-1_i386.deb
       lvm-iop10_0.9.1.beta7-1_i386.deb


Wenn  sie mir  irgendwie weiter  helfen k=F6nnen,  wie ich  die Daten/LV
wieder  bekommen kann, wenn  auch nur  in Teilen,  dann w=E4re  ich sehr
dankbar. Vielleicht  k=F6nnen sie mir auch  genau sagen, wie  ich das LV
splitten  kann.  Ich  hatte  jedes  mal beim  Aufruf  von pvmove  eine
Fehlermeldung  bekommen  (die genaue  Meldung  habe  ich leider  nicht
mehr).  Sie lautete  in etwa:  noch 65536  nicht gelesen.  Und deshalb
funktionierte auch vgsplit nicht.


  Vielen Dank im voraus f=FCr ihre Hilfe.

  CC. Spindler

--=20
--- ___  ___ ---------------------------------------------------------
   / __|/ __|                      "This may sound weird, but it's OK,
  | |__| |__   _                    because it is weird."=20=20=20=20=20=20=
=20=20=20=20=20=20=20
   \___|\___| |_|                                         (Larry Wall)
