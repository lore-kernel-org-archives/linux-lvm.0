Content-Type: text/plain; charset="us-ascii"
From: Adrian Head <ahead@bigpond.net.au>
Subject: Re: [linux-lvm] Re: Unable to get XFS, ext3, reiserfs & LVM to
    coexist happily
References: <200201020451.g024pPg00867@oss.sgi.com>
    <E16Md6L-0007pY-00@hermes.sistina.com> <20020104163939.C12868@lynx.no>
In-Reply-To: <20020104163939.C12868@lynx.no>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <E16MhbU-00042E-00@hermes.sistina.com>
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
Date: Fri Jan  4 21:35:01 2002
List-Id: <linux-lvm.redhat.com>
To: Andreas Dilger <adilger@turbolabs.com>
Cc: Eric Sandeen <sandeen@sgi.com>, Linux XFS Mailing List <linux-xfs@oss.sgi.com>, linux-lvm@sistina.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Andreas or any other LVM gurus,

This is related to but not imeadiately concerned with the problem we have 
been discussing.

When lvcreate dies when creating an XFS snapshot it doesn't finish the 
snapshot creation and although lvdisplay shows that the XFS lv has an active 
snapshot (shows even its name) lvdisplay tells me that the snapshot doesn't 
exist and therefore, cannot be removed.  

During the reboot the machine fails to run through the startup scripts and 
dies somewhere within mount.  

I have found that kernels without the lvm-1.0.1 upgrade patch are able to 
carry on and even fix the half created snapshot whereas kernels with the 
lvm-1.0.1 upgrade patch are unable to deal with the problem snapshot and just 
die.

Are you aware of what this might be?

And if this is going to be the default behaviour in future versions of LVM 
how would I recover using a lvm-1.0.1 patched kernel?

Just interested

Thanks

- -- 
Adrian Head

(Public Key available on request.)
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE8NnUR8ZJI8OvSkAcRAnegAJ9rayag2AQ7AMKufbL0d7PlxB3jxwCdGaQz
UKinrM4ZVskDCt13J+3HAs0=
=UDmt
-----END PGP SIGNATURE-----
