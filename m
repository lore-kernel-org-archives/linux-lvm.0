From: FEJF <fejf@gmx.de>
Subject: Re: [linux-lvm] pv_move_pe() error again :/
Date: Fri, 7 Sep 2001 13:45:22 +0200
References: <E15f13v-0003bs-00@hermes.sistina.com> <E15f8l7-0008Di-00@hermes.sistina.com> <20010907124649.B31313@sistina.com>
In-Reply-To: <20010907124649.B31313@sistina.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <E15fK3i-0005bl-00@hermes.sistina.com>
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Heinz J . Mauelshagen, on Freitag, 7. September 2001 12:46 wrote:
[cut]
> Well, assuming your disk has a flaw, the only way to work around your
> problem is patching pv_move_pe() in order to ignore read errors (this takes
> place around line 520 in LVM 1.0) which will cause a copy of the data to
> some other device with probably flaky data in it.

search a bit through the file... but i actually don't know what to change 
there... would a single 
   ret:=1;
just before
   pe_moved += ret;
help ? 

> In case you've got some filesystem data in there, fsck will complain
> accordingly and some file or metadata of the filesystem will be gone which
> will cause more or less filesystem data loss.

loose some bytes is nothing against the whole lvm... ;)
fejf

- -- 
Backups are usefull. Most often when you don't have one ;)
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7mLNS7Xtp66ctWuIRAgRGAKDL9Us+S5NUHUhOhymfTidbzJYOTwCgg9ti
WFlbMA5xs29zsHYyOLiA0EM=
=uSq4
-----END PGP SIGNATURE-----
