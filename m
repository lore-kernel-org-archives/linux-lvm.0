From: Ulrich Wiederhold <U.Wiederhold@gmx.net>
Subject: Re: [linux-lvm] XFS with LVM
Message-ID: <20011105132709.C1568@sky.net>
References: <E823FA92099E6C4C854CE791DFA1A3D265BA56@got02.vikingtelecom.com>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <E823FA92099E6C4C854CE791DFA1A3D265BA56@got02.vikingtelecom.com>
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
Date: Mon Nov  5 06:24:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: "Linux LVM Mailinglist (E-mail)" <linux-lvm@sistina.com>

* Turbo Fredriksson <turbo.fredriksson@viking-telecom.com> [011105 10:43]:
> The LVM consists of the following devices:
>=20
> 	Device	Size (MB)	Type
> 	/dev/sdb1	 5.88 GB	0x83
> 	/dev/sdc1	 1008 MB	0x83
> 	/dev/sdd10	 2.37 GB	0x83
> 	/dev/sde1	 8.51 GB	0x83
> 	/dev/sdf1	17.09 GB	0x83
> 	/dev/sdg1	15.55 GB	0x83

Hello,
I am not very good with lvm, but the fs-type on lvm-drives should be
/dev/hda2            22     39761  20028960   8e  Linux LVM
                                              ^^

Isn=B4t it?
Uli

--=20
'The box said, 'Requires Windows 95 or better', so i installed Linux - TKK 5
