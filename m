From: FEJF <fejf@gmx.de>
Subject: Re: [linux-lvm] shrink issue
Date: Wed, 17 Oct 2001 23:03:42 +0200
References: <E15twHP-0005Ro-00@hermes.sistina.com> <20011017145327.L7859@turbolinux.com>
In-Reply-To: <20011017145327.L7859@turbolinux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <E15txpF-0008F2-00@hermes.sistina.com>
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

Andreas Dilger, on Mittwoch, 17. Oktober 2001 22:53 wrote:
> On Oct 17, 2001  21:24 +0200, FEJF wrote:
> > is it possible to tell the lvmtools (when shrinking a lvm-volume with 
> > resizereiserfs and lvreduce) which hd should be used for free space and 
which 
> > should stay in the lvm ?
> 
> No.  When you reduce the size of an LV, the free space is made from the end
> of the LV only.  If you want to make a particular PV free, then you need to
> use "pvmove" to free any PEs that are allocated on it.
> 
> Cheers, Andreas

hmm... does "the end" means the last harddrive when counting hda, hdb...etc ?
f.e. if i have a hdb, hdc,hdd in the lvm and want the hdc free - does it help 
to change the hdc to hde an reduce the lvm then ?
fejf

- -- 
Backups are usefull. Most often when you don't have one ;)
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7zfIz7Xtp66ctWuIRAvyuAJ9jZR5LG0pPex9JHc9mw+sxksyj0gCgibGY
LRveTnqkyoCru+MMiv8TpvE=
=lQq8
-----END PGP SIGNATURE-----
