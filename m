Message-ID: <3F79B046000182D2@mail-2.tiscali.it>
From: "Giuseppe Bongiorni" <pbongiorni@tiscali.it>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] boot failure with LVM/SuSE 8.1
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
Date: Mon Oct 13 10:14:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi all

probably my is an older question, but I am not able to make working the
following configuration.

I have 750 Mb of IDE HDD space and 2 primary partition already defined (f=
or
Windows ad Compaq diags). I have partitioned the above space as 
follows:


50 Mb for a Primary partition mounted as /boot and formatted with Ext2;

700 Mb used for an Extended partition used as follows:

150 Mb for " swap "
550 Mb dedicated to an LVM volume mounted as " / " and formatted with Rei=
serFS.

The idea is to expand this LVM volume with a big external USB disk as a
next step.

The installation proceed until YAST2 try to write boot manager.
At this point it receive an error that explain "LILO is not able to write=

boot sector".
The installation abends at this point.

I have tried to use the "trick" described in the SuSE LVM whitepaper but
without positive results.

Can any of You help me to solve this problem?

Thanks in advance

Best regards

Giuseppe BONGiORNI

pbongiorni@tiscali.it











__________________________________________________________________
Tiscali ADSL e' SENZA CANONE, paghi solo quello che consumi!
Abbonati subito, Gratis per te un anno di Supermail e tanti servizi in pi=
u'!
http://point.tiscali.it/adsl/index.shtml
