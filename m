From: Andreas Dilger <adilger@clusterfs.com>
Subject: Re: [linux-lvm] Re: LVM ext3 support
Message-ID: <20031017125308.C17778@schatzie.adilger.int>
References: <3F903230.9070608@siue.edu> <yw1xptgvk92l.fsf@users.sourceforge.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <yw1xptgvk92l.fsf@users.sourceforge.net>; from mru@users.sourceforge.net on Fri, Oct 17, 2003 at 08:33:54PM +0200
Content-Transfer-Encoding: quoted-printable
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
Date: Fri Oct 17 15:02:16 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

On Oct 17, 2003  20:33 +0200, M=E5ns Rullg=E5rd wrote:
> anthony mayes <anmayes@siue.edu> writes:
> > I am running Redhat 9 with kernel 2.4.20-20.9.  I am getting the
> > following errors when trying to mount an LVM snapshot:
> >
> > EXT3-fs: INFO: recovery required on readonly filesystem.
> > EXT3-fs: write access unavailable, cannot proceed.
> >
> > I saw a thread on redhat.com that said a kernel patch is needed.  My
>=20
> BS.  You are trying to mount a non-clean filesystem on a read-only
> LV.  I don't know why your LV is read-only.  You should find out why
> it is, make it writable, and run fsck on it.  After that, you should
> be able to mount it.

M=E5ns, I think you need to read the question more clearly before answeri=
ng.
This is a snapshot LV, so it is always read-only.  The ext3 filesystem is
"unclean" because it was snapshotted without the VFS lockfs patch in plac=
e,
so the ext3 filesystem doesn't know it needs to flush the journal.

Anthony, the patch you are looking for is in the LVM CVS at sistina.

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/
