Date: Tue, 19 Dec 2017 08:51:47 +0000
From: Joe Thornber <thornber@redhat.com>
Message-ID: <20171219085146.izrga5qczi7vdn26@reti>
References: <72381975.739900.1513623186634.ref@mail.yahoo.com>
	<72381975.739900.1513623186634@mail.yahoo.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <72381975.739900.1513623186634@mail.yahoo.com>
Subject: Re: [linux-lvm] lvm filter regex format
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: matthew patton <pattonme@yahoo.com>, LVM general discussion and development <linux-lvm@redhat.com>

On Mon, Dec 18, 2017 at 06:53:06PM +0000, matthew patton wrote:
> > =EF=BF=BD  https://github.com/jthornber/lvm2-ejt/blob/master/libdm/rege=
x/parse_rx.h
> =20
> not to be ungrateful but why on earth would one NOT use the glibc standar=
d regex library? Nobody cares about pointless optimization. Surprises like =
"well, we only implemented most of the spec" are what drives people nuts!

It was written about 17 years ago, and the optimisation was not pointless a=
t that time.

- Joe
