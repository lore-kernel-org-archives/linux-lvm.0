Message-ID: <00a701c3ad31$9cbbc520$e10aa8c0@zaphod>
From: "Michael Paesold" <mpaesold@gmx.at>
References: <3FB8F8A1.1060004@clin.ucl.ac.be><1069087854.2408.0.camel@localhost.localdomain> <20031117175823.2b7bb2b0.neuron@hollowtube.mine.nu>
Subject: Re: [linux-lvm] Performance problem.
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Date: Mon Nov 17 11:40:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

TCQ = tagged command queuing - for ide?

However, please report about success.

Also there is this tool called elvtune. It allowes you to "tune the I/O
elevator per blockdevice queue basis". See the man pages.

You could try to lower the read latency for the affected devices (/dev/hda,
/dev/hdb, etc.)

Regards,
Michael Paesold

neuron wrote:

> That's actually a very good idea, /me 's gonna test that before 2.6.
>
> > Thought about trying TCQ for the IDE disks?
> >
> > On Mon, 2003-11-17 at 10:34, Jean-louis MATTON wrote:
> > > what is your hardware config, mainly for disks ?
> > > in the if I use LVM on top of ide disks some big file transfert, like
> > > ftp tar ..., the system hang  during the file manipulation.
> > > when moving the same config on SCSI disk I never see this situation.
> > >
> > > My config is soft raid1 + lvm + ext3 fs
> > >
> > > JL
