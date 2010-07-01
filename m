Date: Thu, 1 Jul 2010 11:52:07 +0100
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20100701105207.GB23989@agk-dp.fab.redhat.com>
References: <AANLkTimqXPM9Ue86ubgdXiT5ujbzk6CX4Ts5uGRoB0q-@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <AANLkTimqXPM9Ue86ubgdXiT5ujbzk6CX4Ts5uGRoB0q-@mail.gmail.com>
Subject: Re: [linux-lvm] dmeventd man page doesn't get installed with	proper
	Makefile target
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
To: Eric =?iso-8859-1?Q?B=E9langer?= <snowmaniscool@gmail.com>
Cc: linux-lvm@redhat.com

On Wed, Jun 30, 2010 at 09:57:30PM -0400, Eric B=EF=BF=BDlanger wrote:
>  The dmeventd man page gets installed when the install_lvm2 target is
> used. Is there any reason behind this behavior or is it just an
> oversight? =20

That man page was added recently and that's a mistake.

Alasdair
