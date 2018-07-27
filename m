Date: Fri, 27 Jul 2018 11:39:54 -0700
From: Marc MERLIN <marc@merlins.org>
Message-ID: <20180727183954.GJ23157@merlins.org>
References: <20180726004154.xcdjyqv7tkdfpvca@merlins.org>
	<20180726072440.372sthb6accswcr4@merlins.org>
	<85e59b54-fb8f-67a9-13cc-6466f097f06a@redhat.com>
	<20180726154951.jupwdd3rzqznwcks@merlins.org>
	<ff569799-46a4-402c-02fc-fb3cc87df586@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ff569799-46a4-402c-02fc-fb3cc87df586@redhat.com>
Subject: Re: [linux-lvm] Can't create thin lv
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
To: Zdenek Kabelac <zkabelac@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On Fri, Jul 27, 2018 at 02:43:21PM +0200, Zdenek Kabelac wrote:
> >It's looking better now:
> >gargamel:~# lvcreate -L 14.50TiB -Zn -T vgds2/thinpool2
> >   Using default stripesize 64.00 KiB.
> >   Thin pool volume with chunk size 8.00 MiB can address at most <1.98 PiB 
> >   of data.
> >   semid 1376260: semop failed for cookie 0xd4d162f: incorrect semaphore 
> >   state
> >   Failed to set a proper state for notification semaphore identified by 
> >   cookie value 223155759 (0xd4d162f) to initialize waiting for incoming 
> >   notifications.
> >   Logical volume "thinpool2" created.
> >   semid 1441796: semop failed for cookie 0xd4dad79: incorrect semaphore 
> >   state
> >   Failed to set a proper state for notification semaphore identified by 
> >   cookie value 223194489 (0xd4dad79) to initialize waiting for incoming 
> >   notifications.
> 
> 
> Hi
> 
> These messages are informing you that your udev system and SysV semaphores 
> support do not work properly together at all.
> 
> In practice lvm2 detected semaphores are useless on your system and 
> fallback to actually ignore them to not stay blocked endlessly  waiting on 
> udev work to get finished.
> 
> So I'm unsure what are you trying to reach - are you building your own 
> linux-from-scratch system -  I doubt that any widely usable modern distro 
> has such broken SysV support built-in in their mainstream kernel.
> 
> IMHO if you are trying to build your own linux system yourself and you do 
> not need udev otherwise at all - you could probably better build lvm2 
> without udev_sync support - so you will not see those ugly error messages 
> with every creation command you will run.

I running debian/testing on a 32 bit server.
The only thing is that I don't run 'dist-upgrade" regularly due to the
amount of stuff that changes and breaks for no reason, usually at times I
don't have time to deal with it.

So, my udev was out of date for lvm2 and there was a missing package
dependency on minimum version required. However, what I pasted above was
with the latest udev version intesting, so there may be other missing
dependencies or problems.
I don't have systemd on that system, still regular init.

I have sysvinit 2.88dsf-59.2 . Is that too old and causing issues too?

Thanks,
Marc
-- 
"A mouse is a device used to point at the xterm you want to type in" - A.S.R.
Microsoft is to operating systems ....
                                      .... what McDonalds is to gourmet cooking
Home page: http://marc.merlins.org/  
