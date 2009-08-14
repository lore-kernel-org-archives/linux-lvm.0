Date: Fri, 14 Aug 2009 09:24:07 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Clarifications wanted about locking process
Message-ID: <20090814082407.GY7033@agk-dp.fab.redhat.com>
References: <7fcd249b0908131713x6aeddd5bm8975df94d3c3a39a@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <7fcd249b0908131713x6aeddd5bm8975df94d3c3a39a@mail.gmail.com>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: LVM general discussion and development <linux-lvm@redhat.com>

On Thu, Aug 13, 2009 at 08:13:39PM -0400, Eric B=EF=BF=BDlanger wrote:
> Since I updated from lvm2 2.02.48 to 2.02.51, I'm getting this message
> on boot-up:
> Write locks are prohibited with --ignorelockingfailure.
> Unable to obtain global lock.
=20
Sounds like a bug.

> I found that it comes from the: "/sbin/lvm vgscan
> --ignorelockingfailure --mknodes" command in /etc/rc.sysinit.  I was
> getting the same message from "/sbin/lvm vgchange
> --ignorelockingfailure -a y" when using the 2.02.49 (or 2.02.50?)
> versions.

Alasdair
