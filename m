Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6HHYXvu031080
	for <linux-lvm@redhat.com>; Mon, 17 Jul 2006 13:34:33 -0400
Received: from shell.wgops.com (postfix@free.wgops.com [69.51.116.66])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k6HHYQO9012672
	for <linux-lvm@redhat.com>; Mon, 17 Jul 2006 13:34:26 -0400
Received: from [10.1.2.206] (localhost [127.0.0.1])
	by shell.wgops.com (Postfix) with ESMTP id 9068825528
	for <linux-lvm@redhat.com>; Mon, 17 Jul 2006 11:34:03 -0600 (MDT)
Date: Mon, 17 Jul 2006 11:34:03 -0600
From: Michael Loftis <mloftis@wgops.com>
Subject: Re: AW: [linux-lvm] SAN setup with host mirrored disks
Message-ID: <F35681F3D3000136E018B70E@dhcp-2-206.wgops.com>
In-Reply-To: <7CA7BBF7F95AA245ACAB8E28A6285EB905191DA7@s01edv50.warema.de>
References: <7CA7BBF7F95AA245ACAB8E28A6285EB905191DA7@s01edv50.warema.de>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>



--On July 17, 2006 8:11:17 AM +0200 "Fiederling, Daniel"=20
<daniel.fiederling@warema.de> wrote:

> Hi,
>
> thank you all for your answers. I currently test a setup with md for
> failover. To clarify: we have two Clariions in two different locations
> that are used for failover. Of course on each Clariion the disks are set
> up as raid 5. My question was about setting up a mirror that "copies" the
> data on each Clariion.
>
> Currently I use OpenSuSE 10.1 as distribution so unfortunately I can't
> use PowerPath because I only get rpms for sles or rhel that can't be
> installed. I know it's the wrong place for this question but: had someone
> success on installing PowerPath on non supported systems?

Yeah, don't bother.  It's a kernel module.  No source.  I've tried to get=20
them to do the sane thing (wrapper .c with binary lib, like nvidia) so they=
=20
could support other than the specific binary kernels in RedHat but they=20
either refused or didn't get it.  When they say Linux they don't mean=20
Linux, they mean RedHat.  YMMV but for us RedHat has been nothing but weird=
=20
problems.  Unless you're willing to install and run a RedHat kernel you're =

SOL.

>
> Kelly, I installed a package called multipath-tools version 0.4.6 which
> contains multipath and multipathd by Christophe Varoqui. Is that the mpio
> package you mentioned? Why do I have to expect io errors when using md?
> What is special about the Clariion setup? I would expect that the san
> disks are only "normal" scsi disks for linux...
>
> Ciao
> Daniel
>
>
>
> -----Urspr=C3=BCngliche Nachricht-----
> Von: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com]
> Im Auftrag von Kelly Sauke Gesendet: Donnerstag, 13. Juli 2006 20:04
> An: LVM general discussion and development
> Betreff: Re: [linux-lvm] SAN setup with host mirrored disks
>
> Do the Raiding on the Clariion.  Then use either PowerPath or mpio (on
> RHEL 4 U3 or newer) to do your failover.  If you use md for your
> failover layer you may get IO errors on the non-active paths.  You need
> something that is aware of the clariion setup and that would be
> PowerPath or the shipped mpio.
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>



--
"Genius might be described as a supreme capacity for getting its possessors
into trouble of all kinds."
-- Samuel Butler
