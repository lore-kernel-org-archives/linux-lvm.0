Subject: Re: [linux-lvm] Chicken and egg problem..
Message-ID: <1006354219.3bfbbf2b53adf@imp.free.fr>
From: Georges Giralt <georges.giralt@free.fr>
References: <1006347197.3bfba3bd23d95@imp.free.fr> <7510000.1006331425@dizzy>
In-Reply-To: <7510000.1006331425@dizzy>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Date: Wed Nov 21 08:48:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@sistina.com

En r�ponse � Steven Lembark <lembark@wrkhors.com>:

> 
> 
> -- Georges Giralt <georges.giralt@free.fr>
> 
> > Hello !
> > As I've previously said, I plan to make my RedHat 7.1 (kernel 2.4.5)
> a
> > pure LVM  machine.
> > To do so, I've build the 1.0.4 version of LVM into the kernel (with
> the
> > NCR SCSI  driver). As to avoid an initrd. Simple is beautifull...
> >
> > In the sysinit rc script, Redhat has put a vg activation command,
> but....
> > My kernel panics, as it is unable to mount root, as the LVM
> activation
> > commands  are after the root fsck (and mount..)
> >
> > If I put the LVM activation lines early, in the sysinit script,
> these
> > commands  complains beeing not able to access /etc/lvmtab....
> 
> The kernel panic is extactly why you probably wouldn't
> want to use only LVM on the system. Leaving the root
> volume (a.k.a., '/'), primary swap and probably /var on
> the first three partitions of the boot device will make
> your life enormously simpler in the long run.
Yes and no....
I use HP boxes, on which LVM is native.
My computer has been upgraded from RH4.1 to 7.1 with all the steps in beetween.
This is why I would use LVM on my boot disk.
Tired re creating a new / or /var and moving data from one file system to the 
next.
And I always have bootable floppy/CD floating around...
My question was in fact to learn how to make the LVM information static on the 
/etc directory. (if this information is not valid, the system will not boot 
anyway, so it doesn't hurt) Of course, I must rebuild these files if I change 
the volume group holding the / filesystem.... Something which is easyly done on 
an HP machine...
> 
> This is pretty much the only way you'll be able to
> convienently recover from any LVM problems in the future.
> Otherwise you'll need bootable media floating around.
> 
> --
> Steven Lembark                               2930 W. Palmer
> Workhorse Computing                       Chicago, IL 60647
>                                             +1 800 762 1582
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> 
