From: Andreas Dilger <adilger@turbolabs.com>
Subject: Re: [linux-lvm] pvcreate error
Message-Id: <20020114132448.T26688@lynx.adilger.int>
References: <5E34D857F6BB704CA3369B7553233A81651ACA@ntsviemxs0152.connect.at-work.ent>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5E34D857F6BB704CA3369B7553233A81651ACA@ntsviemxs0152.connect.at-work.ent>;
    from Ferenc.Csuk@one.at on Mon, Jan 14, 2002 at 08:57:51PM +0100
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
Date: Mon Jan 14 14:25:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: "Csuk, Ferenc" <Ferenc.Csuk@one.at>
Cc: linux-lvm@sistina.com

On Jan 14, 2002  20:57 +0100, Csuk, Ferenc wrote:
> I just installed a new system and I installed the latest 2.4.16 kernel
> and the latest LVM tool 1.0.1-rc4. I established a software RAID-5
> device(md) and wanted to create a logical volume group on it(as I did
> with 2.4.7 kernel on another system). However, when I issued the comman=
d
> I got the following error:
>=20
> # pvcreate -v /dev/md2
> pvcreate -- locking logical volume manager
> > pvcreate -- checking physical volume name "/dev/md2"
> > pvcreate -- getting physical volume size
> > pvcreate -- checking partition type
> > pvcreate -- creating new physical volume
> > pvcreate -- setting up physical volume for /dev/md7 with 0 sectors
                                               ^^^^^^^^      ^^^^^^^^^
> > pvcreate -- ERROR "parameter error" setting up  physical volume
> "/dev/md2"

Something strange going on there.  We have md2 =3D> md7 and zero size.
Maybe the output of "pvcreate -v -d /dev/md2" would help.

> I checked the archives where I saw suggestion to patch the LVM tool, bu=
t
> I don=B4t think that is related to the latest version.

Yes, there were problems with MD devices and LVM, but I don't know when
the fix went in.  Note that there _should_ be a 1.0.1 release of the
tools also.

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/
