Subject: Re: [linux-lvm] Re: which filesystem to use on slackware
From: David Johnston <david@littlebald.com>
In-Reply-To: <20040110163438.62742.qmail@web80405.mail.yahoo.com>
References: <20040110163438.62742.qmail@web80405.mail.yahoo.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <1073769268.8271.3.camel@grandmother.littlebald.com>
Mime-Version: 1.0
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
Date: Sat Jan 10 16:15:02 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

On Sat, 2004-01-10 at 11:34, Chris Conn wrote:
> --- M=E5ns_Rullg=E5rd <mru@kth.se> wrote:
> > Francis SOUYRI <francis.souyri@wanadoo.fr> writes:
> >=20
> > > Hi Chris,
> > >     I think the performances are not the main things in your case,
> > >     you need to see the "managment" capabilities of each filesystems,
> > >     If you want to learn more about the LVM probably you test the mov=
e
> > >     of a logical volume, the extend, reduce of a logical volume and..=
.
> > >
> Can I use ext3 and reiserfs on the same box? I've set up my
> second disk to use reiserfs but my main disk is ext2, thought
> about converting it to ext3 since that would be easier than
> re-installing... but I'm not sure if this is a good idea. It
> make more sense to just re-install slack on my main disk with
> reiserfs.

Chris, there's no reason you can't run Reiserfs, ext2, ext3, xfs, and
jfs on the same box.  You can only use one on a given logical volume
(aka partition), but you can, for example, use ext3 for /, ext2 for
/usr, Reiserfs for /var, xfs for /opt, and jfs for /home.  I wouldn't do
this on a heavily loaded production server, but on a test system there's
no reason at all you can't do this.
--=20
David Johnston <david@littlebald.com>
Little Bald Consulting, LLC
