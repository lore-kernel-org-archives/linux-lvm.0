From: =?iso-8859-1?Q?Ragnar_Kj=F8rstad?= <lvm@ragnark.vestdata.no>
Subject: Re: Re[2]: [linux-lvm] pvmove with Bad bocks
Message-ID: <20011021224416.B23544@vestdata.no>
References: <55159047260.20011020155124@gmx.de> <20011021140746.B15468@vestdata.no> <20011021155622.A9367@btconnect.com> <7632207772.20011021193259@gmx.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7632207772.20011021193259@gmx.de>; from stonki@gmx.de on Sun, Oct 21, 2001 at 07:32:59PM +0200
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
Date: Sun Oct 21 15:42:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

On Sun, Oct 21, 2001 at 07:32:59PM +0200, Stonki wrote:
> pvmove -- starting to move extents away from physical volume "/dev/hdf1=
"
> pvmove -- checking for enough free physical extents in "Stonki2"
> pvmove -- /dev/hdf1 [PE 3319 [LV_Stonki2 [LE 27209]] -> /dev/hdc1 [PE 3=
319] [1/9911]
> pvmove -- ERROR reading input physical volume "/dev/hdf1" (still 393216=
 bytes to read)
>=20
> pvmove -- ERROR "pv_move_pe(): read input PV" pv_move_pe
>=20
> pvmove -- ERROR "pv_move_pe(): read input PV" moving physical extents

Do you have kernel messages with ide or scsi errors in
/var/log/messages?

I think there are two potential causes of pvmove erroring out - one is a
bug related to the last allocaten extent, and one is actual disk error.
I fail to see why reducing the size will solve any problems if the cause
is a bad disk - I think you need the patch I mentioned earlier, or a
simular fix.



--=20
Ragnar Kj=F8rstad
Big Storage
