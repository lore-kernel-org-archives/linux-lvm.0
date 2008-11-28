Date: Fri, 28 Nov 2008 23:48:22 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] building debug versions of lvm cli utilities
Message-ID: <20081128234822.GD13235@agk.fab.redhat.com>
References: <501191.93298.qm@web38305.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <501191.93298.qm@web38305.mail.mud.yahoo.com>
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
To: beachhangar@yahoo.com
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On Fri, Nov 28, 2008 at 03:42:33PM -0800, Michael Jensen wrote:
> I would like to know what the general procedure would be to create gdb
> (debug) versions of several LVM utilities - pvscan, pvdisplay.  =EF=BF=BD
> I am using RH 4.7 and have the sources.

Install the pre-built debuginfo packages.

To work from source it's: configure --enable-debug

Alasdair
--=20
agk@redhat.com
