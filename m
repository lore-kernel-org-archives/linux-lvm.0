Date: Mon, 24 Sep 2001 13:23:48 +0200 (MET DST)
From: Thomas Svedberg <thsv@math.chalmers.se>
Subject: Re: [linux-lvm] Lost VG after failed pvmove
In-Reply-To: <20010924122705.A30375@sistina.com>
Message-ID: <Pine.SOL.4.30.0109241320540.27866-100000@napier.math.chalmers.se>
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
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: linux-lvm@sistina.com

On Mon, 24 Sep 2001, Heinz J . Mauelshagen wrote:

> you need to vgcfgrestore the metadata backaup to *all* of the PVs which=
 belonged
> to the VG at the time the backup was created.

OK, this was my error, I only used it on the pv I found damaged.

This + using the uuid_fixer made it work again.
Thank you very much for this!

> In regard to the pvmove error: do you have the particular error output =
it gave?

No, all I remember it was a very short or even noninformative message :-<

I will do a backup tonight and then try pvmove again. If I get an error I
will surely let you know!

Thank you again!

/ Thomas
.......................................................................
 Thomas Svedberg
 Department of Mathematics
 Chalmers University of Technology

 Address: SE-412 96 G=F6teborg, SWEDEN
 E-mail : thsv@bigfoot.com, thsv@math.chalmers.se
 Phone  : +46 31 772 5368
 Fax    : +46 31 772 3595
.......................................................................
