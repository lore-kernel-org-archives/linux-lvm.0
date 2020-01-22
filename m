Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B9C6BF18A1
	for <linux-lvm@redhat.com>; Wed, 22 Jan 2020 13:44:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D71BE185B0D8
	for <linux-lvm@redhat.com>; Wed, 22 Jan 2020 13:44:52 +0000 (UTC)
MIME-Version: 1.0
References: <CAHEKYV7Uvqm2knzb4QsTxtdec2Wi+mnFi2Q6MbP95gseS5V7Ow@mail.gmail.com>
	<a65afa5a-4081-4c48-5da3-47ffe661bb00@redhat.com>
In-Reply-To: <a65afa5a-4081-4c48-5da3-47ffe661bb00@redhat.com>
From: Mauricio Tavares <raubvogel@gmail.com>
Date: Wed, 22 Jan 2020 08:44:35 -0500
Message-ID: <CAHEKYV7TdR152_tarSrWGbBjGv3RZMb-AiHBBqF=kTavF_wi8g@mail.gmail.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Failed merge, still running?
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
To: Zdenek Kabelac <zkabelac@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On Wed, Jan 22, 2020 at 8:12 AM Zdenek Kabelac <zkabelac@redhat.com> wrote:
>
> Dne 22. 01. 20 v 11:58 Mauricio Tavares napsal(a):
> > So after a botched package update I decided to revert to the snapshot
> > I took just before doing the update. After shutting guest down, I
> > started
> >
> > lvconvert --merge vmhost_vg0/desktop_snap_20200121
> >
> > and instead of seeing the usual percentage of how far it has
> > completed, I got nothing. lvs -a -o +devices shows
> >
> >    LV                      VG         Attr       LSize  Pool Origin
> > Data%  Meta%  Move Log Cpy%Sync Convert Devices
> >    desktop                 vmhost_vg0 Owi-a-s--- 20.00g
> >                                       /dev/sdb3(14848)
> >    [desktop_snap_20200121] vmhost_vg0 Swi-a-s--- 10.00g      desktop 100.00
> >
> > I see nothing when I do lsof against both the lv (lsof
> > /dev/vmhost_vg0/desktop) and its snapshot. dmsetup tells me:
> >
> > [root@vmhost ~]# dmsetup info /dev/vmhost_vg0/desktop
> > Name:              vmhost_vg0-desktop
> > State:             ACTIVE
> > Read Ahead:        256
> > Tables present:    LIVE
> > Open count:        0
> > Event number:      0
> > Major, minor:      253, 5
> > Number of targets: 1
> > UUID: LVM-qa4WnlE7w8V7pasHwdNH6bnpz2ajYY1F2ZXwTWzpUE2r6eE2DftMGLHdeATE8XAq
> >
> > [root@vmhost ~]# dmsetup info /dev/vmhost_vg0/desktop_snap_20200121
> > Name:              vmhost_vg0-desktop_snap_20200121
> > State:             ACTIVE
> > Read Ahead:        256
> > Tables present:    LIVE
> > Open count:        0
> > Event number:      0
> > Major, minor:      253, 15
> > Number of targets: 1
> > UUID: LVM-qa4WnlE7w8V7pasHwdNH6bnpz2ajYY1FkyXcvv8ai1Sc0q5zlsXeenYOqCPUXs3M
> >
> > [root@vmhost ~]#
> >
> > Before I blow that lv up, what else should I be checking?
>
>
> Hi
>
>
> Merging can ONLY start when devices are not in-use - so if you've issued merge
> command while devices were still opened - the 'merge' operation has
> been just committed into lvm2 metadata and the actual merge would normally
> happen/start with next activation of the merged LV.
>
      Interesting. I guess when I told guest to shutdown I did not
wait for it to be completely shutdown as far as kvm was concerned; it
might have been doing some housekeeping when I unleashed lvconvert.

> You can invoke it also by issuing 'lvchange --refresh' which may start to
> merging (if the conditions do allow the operation to start).
>
      Thanks! As soon as I ran

lvchange --refresh vmhost_vg0/desktop

I was able to see progress:

[root@vmhost ~]# lvs -a -o +devices
[desktop_snap_20200121] vmhost_vg0 Swi-a-s--- 10.00g      desktop 30.78
[desktop_snap_20200121] vmhost_vg0 Swi-a-s--- 10.00g      desktop 30.76
[...]

After a few more minutes, the vm gues was "rewinded." Now I can run it again.

Thanks again!

> Regard
>
> Zdenek
>
>
