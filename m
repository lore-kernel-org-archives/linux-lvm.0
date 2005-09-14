Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j8E3c7V19309
	for <linux-lvm@redhat.com>; Tue, 13 Sep 2005 23:38:08 -0400
Received: from zproxy.gmail.com (zproxy.gmail.com [64.233.162.199])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j8E3bxmT027924
	for <linux-lvm@redhat.com>; Tue, 13 Sep 2005 23:38:00 -0400
Received: by zproxy.gmail.com with SMTP id m7so129488nzf
	for <linux-lvm@redhat.com>; Tue, 13 Sep 2005 20:37:54 -0700 (PDT)
Message-ID: <cd21de0e0509132037cb02ad@mail.gmail.com>
Date: Tue, 13 Sep 2005 20:37:54 -0700
From: Jonathan Morace <jmorace@gmail.com>
Subject: Re: [linux-lvm] Resizing the root LVM partition
In-Reply-To: <20050913145858.GO11956@null.msp.redhat.com>
Mime-Version: 1.0
Content-Disposition: inline
References: <cd21de0e05091214103bfe89ac@mail.gmail.com>
	<20050913145858.GO11956@null.msp.redhat.com>
Content-Transfer-Encoding: 8bit
Reply-To: jonathan@awaken.com,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <http://redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

> > On Mon, Sep 12, 2005 at 02:10:20PM -0700, Jonathan Morace wrote:
> > I'm having a problem adding disks to my root partition, which is using
> > LVM.  The quick summary is that I think I need to run resize2fs on the
> > root partition, but I can't figure out how to unmount the root
> > partition to do so.
> >
> > The longer version of the story...  I'm running Fedora Core 2, and
> > when I installed I had the root partition configured to be on two
> > disks using LVM.  I added two more disks to the computer and followed
> > the howto to initialize the disks, add the physical volumes to the
> > volume group, and extend the logical volume.  When I run "lvdisplay" I
> > see my logical volume is the correct size, but "df" only shows the
> > original size.  I'm assuming this is because I haven't done a
> > "resize2fs".  The reason I haven't is because I can't figure out how
> > to unmount the root filesystem in order to do this.  If I boot with
> > linux rescue, I can choose not to mount the filesystems, but then the
> > LVM devices don't exist.  I read somewhere that running "lvm vgscan -v
> > --mknodes" should do the trick, but as far as I could tell, no devices
> > were created.
> >
> > Any ideas on how I can get the root partition resized to include the new disks?
> 
> On 9/13/05, AJ Lewis <alewis@redhat.com> wrote:
> Run 'lvm vgchange -ay' after the vgscan command and your devices should be
> there.

Thank you very much, that was exactly what I needed.  For anyone else
trying to figure this out...

1. Boot from Fedora install cd (type "linux rescue" from the boot promp)
2. When asked whether you want to find Fedora installations, choose "Skip".
3. Run "lvm vgscan -v --mknodes"
4. Run "lvm vgchange -ay"
5. Run "efsck -f /dev/Volume00/LogVol00" (resize2fs prompted me to do
this first)
6. Run "resize2fs /dev/Volume00/LogVol00"
7. Reboot, and everything is good.

Thanks,

Jonathan
