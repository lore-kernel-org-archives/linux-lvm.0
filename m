MIME-Version: 1.0
References: <CABZYMH498m-hNpkbAagiNPmFjFLrMZZZncx6S1ksupRVnPtYqw@mail.gmail.com>
	<20180925164405.GA10635@redhat.com>
In-Reply-To: <20180925164405.GA10635@redhat.com>
From: Damon Wang <damon.devops@gmail.com>
Date: Thu, 27 Sep 2018 22:12:44 +0800
Message-ID: <CABZYMH57cROshtj0YMJ8PNU0Udw7qe0d7evuhc3-aXMYYEit3A@mail.gmail.com>
Subject: Re: [linux-lvm] [lvmlockd] recovery lvmlockd after kill_vg
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Teigland <teigland@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Thank you for your reply, I have another question under such circumstances.

I usually run "vgck" to check weather vg is good, but sometimes it
seems it stuck, and leave a VGLK on sanlock. (I'm sure io error will
cause it, but sometimes not because io error)
Then i'll try use sanlock client release -r xxx to release it, but it
also sometimes not work.(be stuck)
Then I may lvmlockctl -r to drop vg lockspace, but it still may stuck,
and I'm io is ok when it stuck

This usually happens on multipath storage, I consider multipath will
queue some io is blamed, but not sure.

Any idea?

Thanks for your reply again

Damon
On Wed, Sep 26, 2018 at 12:44 AM David Teigland <teigland@redhat.com> wrote:
>
> On Tue, Sep 25, 2018 at 06:18:53PM +0800, Damon Wang wrote:
> > Hi,
> >
> >   AFAIK once sanlock can not access lease storage, it will run
> > "kill_vg" to lvmlockd, and the standard process should be deactivate
> > logical volumes and drop vg locks.
> >
> >   But sometimes the storage will recovery after kill_vg(and before we
> > deactivate or drop lock), and then it will prints "storage failed for
> > sanlock leases" on lvm commands like this:
> >
> > [root@dev1-2 ~]# vgck 71b1110c97bd48aaa25366e2dc11f65f
> >   WARNING: Not using lvmetad because config setting use_lvmetad=0.
> >   WARNING: To avoid corruption, rescan devices to make changes visible
> > (pvscan --cache).
> >   VG 71b1110c97bd48aaa25366e2dc11f65f lock skipped: storage failed for
> > sanlock leases
> >   Reading VG 71b1110c97bd48aaa25366e2dc11f65f without a lock.
> >
> >   so what should I do to recovery this, (better) without affect
> > volumes in using?
> >
> >   I find a way but it seems very tricky: save "lvmlockctl -i" output,
> > run lvmlockctl -r vg and then activate volumes as the previous output.
> >
> >   Do we have an "official" way to handle this? Since it is pretty
> > common that when I find lvmlockd failed, the storage has already
> > recovered.
>
> Hi, to figure out that workaround, you've probably already read the
> section of the lvmlockd man page: "sanlock lease storage failure", which
> gives some background about what's happening and why.  What the man page
> is missing is some help about false failure detections like you're seeing.
>
> It sounds like io delays from your storage are a little longer than
> sanlock is allowing for.  With the default 10 sec io timeout, sanlock will
> initiate recovery (kill_vg in lvmlockd) after 80 seconds of no successful
> io from the storage.  After this, it decides the storage has failed.  If
> it's not failed, just slow, then the proper way to handle that is to
> increase the timeouts.  (Or perhaps try to configure the storage to avoid
> such lengthy delays.)  Once a failure is detected and recovery is begun,
> there's not an official way to back out of it.
>
> You can increase the sanlock io timeout with lvmlockd -o <seconds>.
> sanlock multiplies that by 8 to get the total length of time before
> starting recovery.  I'd look at how long your temporary storage outages
> last and set io_timeout so that 8*io_timeout will cover it.
>
> Dave
