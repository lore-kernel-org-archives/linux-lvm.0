From: Ulrich Wiederhold <U.Wiederhold@gmx.net>
Subject: Re: [linux-lvm] Problems after upgrading LVM
Message-ID: <20011206100443.GA7973@sky.net>
References: <1007411943.2423.2.camel@ultra> <20011203130616.E20168@auctionwatch.com> <1007456242.666.2.camel@ultra> <1007626843.693.0.camel@ultra>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1007626843.693.0.camel@ultra>
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
Date: Thu Dec  6 04:00:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

Hello,
try to use uuid_fixer on every pv you have in your vg.
Then do a "vgcfgrestore -n your_vgname -l" and if this works a=20
"vgcfgrestore -n vg_name /dev/hdXX (for each pertitions in the VG)".
Run vgscan again, then vgchange -ay. I think this should work.
I prefered it to run vgcfgbackup after it=B4s done.
Btw, this was discussed the last mouth several time on this list,
searching in the archive would have been helped you. :)
Regards
Uli


* Klaus Agnoletti <ultra@mailme.dk> [011206 09:20]:
> I got my problem solved.
> It seems like I can't restore a vg created with an older version of LVM
> than the one I am currently using.
> This means that VGs in my stup created with LVM 0.9 can't be restored
> after upgrading to 1.0.1.
> Is this a bug ? (I would say yes) - if not, what is the correct
> procedure to get your VG up and running after an update ?
>=20
> I tried doing a=20
> vgcfgrestore -n vg_name /dev/hdXX (for each pertitions in the VG)
> vgchange -ay
>=20
> And after that just a regular mount.
>=20
> After this discovery, my setup is debian linux with kernel 2.4.16 (which
> has lvm 1.0.1rc4) and the tools for lvm 0.9 which I originally created
> the vg with) - to me this sounds rather weird.
>=20
> What did I miss ?
>=20
>=20
> Thanks,
>=20
> Klaus Pedersen
>=20
>=20
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
--=20
'The box said, 'Requires Windows 95 or better', so i installed Linux - TKK 5
