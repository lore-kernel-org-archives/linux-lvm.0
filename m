Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id kBSJUEqj022563
	for <linux-lvm@redhat.com>; Thu, 28 Dec 2006 14:30:15 -0500
Received: from wx-out-0506.google.com (wx-out-0506.google.com [66.249.82.224])
	by mx2.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	kBSJUEF2016324
	for <linux-lvm@redhat.com>; Thu, 28 Dec 2006 14:30:14 -0500
Received: by wx-out-0506.google.com with SMTP id s11so5765425wxc
	for <linux-lvm@redhat.com>; Thu, 28 Dec 2006 11:30:13 -0800 (PST)
Message-ID: <859a78260612281130m761fce9rf32240b523471608@mail.gmail.com>
Date: Thu, 28 Dec 2006 13:30:13 -0600
From: "Matt P" <slarty.tj@gmail.com>
Subject: Re: [linux-lvm] Mirror between different SAN fabrics
In-Reply-To: <45940A96.5040006@nrel.colostate.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <2421805.1167306770765.JavaMail.mailer@post.ch>
	<45940A96.5040006@nrel.colostate.edu>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

This is basically the "messy" way I mentioned in my reply above. I
found if you pvcreate the  LV device, you end up mangling the lvm data
(this probably comes as little surprise) and it breaks down after
that. So, I ended up using losetup and an "image file", one for/on
each fabric. Then did pvcreate on each loop device, and made a new VG
containing both PVs and created the LV with mirroring.... It
worked.... I did no performance, stability, or failure testing...


On 12/28/06, Ty! Boyack <ty@nrel.colostate.edu> wrote:
> I'm wondering how well a "stacked" lvm approach would work for this.
> Could you take LVM and make a two VGs called "Fabric1VG" and
> "Fabric2VG", where you put all of the "fabric 1 paths" to your PVs into
> Fabric1VG, and all your "fabric 2 paths" to your PVs into Fabric2VG.
> Then form volumes in each of those (it would be your responsibility to
> ensure that you have equal volumes in each fabric group).  So you would
> have Fabric1VG/LVa and Fabric2VG/LVa as "equivilant" devices, going
> across your different fabric paths.  Then you could create a new VG
> called MirrorVG and put both Fabric1VG/LVa and Fabric2VG/LVa into
> MirrorVG as PVs.  Then I think you should be able to create a new
> mirrored LV from MirrorVG which would mirror across your two fabrics.
> This should move all of your management into LVM2, which is cluster
> aware, but it 1) makes management a bit messy (but it is all quite
> scriptable), and 2) adds a wierd LVM 2-layer setup.
>
> Anyone know if this 2-layer LVM approach would kill performance (any
> more than a two layer approach of lvm->mdadm or mdadm->lvm)?
>
> Hmm... Thinking about this further, I've been thinking of this 2-layer
> approach for striping and mirroring, but it looks like it might be more
> problematic for your case, where you really want multipath and
> mirroring.  I'm not sure how to ensure that Fabric1VG/LVa and
> Fabric2VG/LVa are placed on the same PV blocks as the other one.  When
> you create Fabric1VG/LVa it might end up on disks 0,1, and 2, but
> Fabric2VG/LVa might end up on disks 1, 2, and 3 (but by different
> paths).  Anyone know any way to ensure that block placement is
> identical?  Is the block allocation algorithm predictable and repeatable
> so that if you have two VGs with equal PVs in each, and you create LVs
> in the same order in each, they get the same PV mapping?  Or is there a
> built-in randomness?  You would likely be assured of the same failures,
> since a bad block on fabric 1 should also be a bad block on fabric 2,
> and a failed PV would fail in both LVs...  Might work, if the placement
> routines are predictably defined.
>
> -Ty!
>
>
>
>
> mathias.herzog@postfinance.ch wrote:
> > [...]
> >
> >> At that stage the md stuff is only ever accessed on a single
> >> node, and there's no problem.
> >>
> >
> > I will use GFS Filesystem with all cluster nodes up and running at the
> > same time, sharing their disks.
> > So my problem with the lvm2 mirroring feature still exists. Think I have
> > to use the expensive and not easy configurable Continuous Access
> > Solution to mirror directly on SAN fabric level...
> >
> > Mathias
> >
> > Sicherheitshinweis:
> > Dieses E-Mail von PostFinance ist signiert. Weitere Informationen finden Sie unter:
> > https://www.postfinance.ch/e-signature.
> > Geben Sie Ihre Sicherheitselemente niemals Dritten bekannt.
> > ------------------------------------------------------------------------
> >
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@redhat.com
> > https://www.redhat.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
>
> --
> -===========================-
>   Ty! Boyack
>   NREL Unix Network Manager
>   ty@nrel.colostate.edu
>   (970) 491-1186
> -===========================-
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
