Subject: Re: [linux-lvm] Problem mit lvm nach dem Reboot.
References: <878zdh5sv8.fsf@cc.prs> <20011108232942.B6587@sky.net>
From: "CC. Spindler" <ccspindler@prs-gmbh.de>
In-Reply-To: <20011108232942.B6587@sky.net>
Message-ID: <87bsic5j43.fsf@cc.prs>
MIME-Version: 1.0
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
Date: Fri Nov  9 04:32:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

Hi,

  thanks for the tips and sorry that it was in German. Once again I
was it bit in a hurry an didn't look for this ML first. :|

The keyboard of Ulrich Wiederhold <U.Wiederhold@gmx.net> wrote:

> Hallo,
> zwei Dinge.
> 1. Upgrade auf 1.0.1-rc4
> 2. Wahrscheinlich mu=DFt Du uuid_fixer auf alle pv=B4s anwenden.
> 3. Das letzte Backup zur=FCckspielen

I got back to one of the backups and that made the trick. Even though
I still couldn't remove two of the old disks (PVs), but it's working
now and no data was lost, so who cares. ;)

> Gru=DF
> Uli

Danke nochmal.

  Cheers=20
    CC.

--=20
----------------------------------------------------------------------
  _|_|  _|_|  The probability of someone watching you is proportional=20
 _|    _|                  to the stupidity of your action.
  _|_|  _|_| _| (P=E8lerin et Voyageur)
