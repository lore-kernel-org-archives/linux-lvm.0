From: Marc Neitzner <Marc.Neitzner@t-online.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <16iI7N-0CNkY4C@fwd06.sul.t-online.com>
Subject: [linux-lvm] lvmcreate_initrd
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
Date: Tue Mar  5 10:48:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Linux-LVM@Sistina.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hallo,

ich nutze LVM seit kurzem mit grosser Begeisterung. Da es bei der Migration
auf einen neuen Kernel zu Problemen bei den Modulabh"angigkeiten kommen
kann, sollte man lvmcreate_initrd meiner Meinung nach die System.map 
dediziert "ubergeben k"onnen:

47a48
> #   03/0572002 - Added support for using a given System.map
50d50
<
63a64
>       echo "      -F|--smap     specify the System.map to use"
128a130
>    -F|--smap) SMAP=$2; shift;;
342c344,349
<    depmod -a $VERSION
- ---
>    if [ -n "$SMAP" ]; then
>       depmod -a $VERSION -F $SMAP
>    else
>       depmod -a $VERSION
>    fi
>

mfg

	Marc Neitzner

- -- 
_______________________________________________________

Marc Neitzner

Phone: +49 (0)5101/586540
Fax: +49 (0)5101/586542

mailto:Marc.Neitzner@highwire.de

PGP: http://www.highwire.de/pgp/marc_neitzner_pub.asc
_______________________________________________________



-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE8hPXXUMYdbdfKeLoRAnoBAJ9NrA8W9nabc6Kz79xfRbzrD3++eACeNk/M
Rgwa5sYcUfKPxz1Jp3rYvz8=
=cS9R
-----END PGP SIGNATURE-----
