Message-ID: <20040127184357.A24222@cs.mcgill.ca>
From: Navindra Umanee <navindra@cs.mcgill.ca>
Subject: Re: [linux-lvm] Re: LVM2 + Linux 2.6.1 questions
References: <web-216233373@mail01.infosat.net> <yw1xektm3edc.fsf@ford.guide> <20040127001252.A21930@cs.mcgill.ca> <yw1xu12hzu07.fsf@ford.guide>
Mime-Version: 1.0
In-Reply-To: =?iso-8859-1?Q?=3Cyw1xu12hzu07=2Efsf=40ford=2Eguide=3E=3B_from_M=E5ns_Ru?=
 =?iso-8859-1?Q?llg=E5rd_on_Tue=2C_Jan_27=2C_2004_at_09:16:24AM_+0100?=
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
Date: Tue Jan 27 18:45:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

M=E5ns Rullg=E5rd <mru@kth.se> wrote:
> Same version here.  It struck me that my /etc/mtab is a symlink to
> /proc/mounts.  Maybe that makes a difference.

That works better, thanks!  I hope it works across boots.  Now it
doesn't have the ugly devfs names instead of the short names either.

There is some anomaly with how the root filesystem is listed though
(it's there twice).  Oh well can't be too picky.

Cheers,
Navin.
