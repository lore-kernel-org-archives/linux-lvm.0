Return-Path: <defranco@cup.hp.com>
Message-ID: <3B6D85EB.4AFF6D2D@cup.hp.com>
Date: Sun, 05 Aug 2001 10:44:11 -0700
From: John DeFranco <defranco@cup.hp.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM with multi-path disks?
References: <3B6B30C4.B4427F3D@cup.hp.com> <20010804174049.B564@colombina.comedia.it> <20010805022800.A26419@vestdata.no> <20010805091201.A4490@colombina.comedia.it> <20010805003257.A2728@glines.org> <20010805095811.A4626@colombina.comedia.it>
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi,

So thanks for the replys so far. From some of the
replys I was not completely clear on what my issue.
I'll just cover everything in detail so avoid any
misunderstanding.

I have a fc connected hw raid box. I have three luns
defined in the raid box. It is connected to the host
by an Emulex controller and is using the emulex
lpfcdd light pulse driver. The raid box has two connections
to the host. So I see three luns on scsi2 and three on
scsi3 (as I would expect):

Host: scsi2 Channel: 00 Id: 111 Lun: 00
  Vendor: HP       Model: A6188A           Rev: HP01
  Type:   Direct-Access                    ANSI SCSI
revision: 03
Host: scsi2 Channel: 00 Id: 111 Lun: 01
  Vendor: HP       Model: A6188A           Rev: HP01
  Type:   Direct-Access                    ANSI SCSI
revision: 03
Host: scsi2 Channel: 00 Id: 111 Lun: 02
  Vendor: HP       Model: A6188A           Rev: HP01
  Type:   Direct-Access                    ANSI SCSI
revision: 03
Host: scsi3 Channel: 00 Id: 109 Lun: 00
  Vendor: HP       Model: A6188A           Rev: HP01
  Type:   Direct-Access                    ANSI SCSI
revision: 03
Host: scsi3 Channel: 00 Id: 109 Lun: 01
  Vendor: HP       Model: A6188A           Rev: HP01
  Type:   Direct-Access                    ANSI SCSI
revision: 03
Host: scsi3 Channel: 00 Id: 109 Lun: 02
  Vendor: HP       Model: A6188A           Rev: HP01
  Type:   Direct-Access                    ANSI SCSI
revision: 03
[root@jack scsi]# 

This is a list of the device mapping:

bus       2         lpfc      CLAIMED
channel   2.0                 CLAIMED Id=?
target    2.0.111   tgt       CLAIMED
disk      2.0.111.0 sd        CLAIMED HP A6188A 
/dev/sdc /dev/sg3
disk      2.0.111.1 sd        CLAIMED HP A6188A 
/dev/sdd /dev/sg4
disk      2.0.111.2 sd        CLAIMED HP A6188A 
/dev/sde /dev/sg5
bus       3         lpfc      CLAIMED
channel   3.0                 CLAIMED Id=?
target    3.0.109   tgt       CLAIMED
disk      3.0.109.0 sd        CLAIMED HP A6188A 
/dev/sdf /dev/sg6
disk      3.0.109.1 sd        CLAIMED HP A6188A 
/dev/sdg /dev/sg7
disk      3.0.109.2 sd        CLAIMED HP A6188A 
/dev/sdh /dev/sg8
bus       1         sym53c8xx CLAIMED
[root@jack /root]# 

Disk /dev/sdc (/dev/sdf) is partitioned and part of a
vg. As things are now vgscan will not find the vg. I can
create one and it ok while the system is booted, but as
soon as I reboot I cannot see the vg anymore. I have
attached a vgscan -d output.

I'm not certain exactly how I would use md in this
context, and I'm not sure that I really want to since
I'm using hw raid.

Thanks!

Luca Berra wrote:
> 
> On Sun, Aug 05, 2001 at 12:32:57AM -0700, Mark Glines wrote:
> > On Sun, Aug 05, 2001 at 09:12:01AM +0200, Luca Berra wrote:
> > > there is an (*horrible*) piece of code in pv_read_all_pv.c
> > > that deals with multiple entries for the same PV, so all duplicate
> > > PV are skipped, so the md will be the obly one detected.
> > > what probably happened to John is, that his PV was killed by
> > > this routine (they were duplicate and not md devices)
> >
> > I would only think this is a problem when md isn't being used.  In the
> > above described situation, vgscan would see 2 devices which have md
> > headers (and ignore them), and one LVM signature (and use it)?
> 
> Correct!
> 
> > If the code does what you say, and LVM was using the dual-path SCSI
> > device directly, then it would detect one and ignore the other, and it
> > would still work as if there was only one route to the drive.
> 
> this is also correct, i was just guessing there might be another dragon
> in this code, but we would need an output of vgscan -d from John to check.
> 
> > However, in this case, md is in the middle, and its md's job to handle
> > multi-path.  LVM should be ignoring md's lowlevel volumes anyway, and
> > act solely on the virtual device md exports.  Am I missing something?
> John is not using md yet, you are correct in all you say.
> 
> Regards,
> L.
> --
> Luca Berra -- bluca@comedia.it
>         Communication Media & Services S.r.l.
>  /"\
>  \ /     ASCII RIBBON CAMPAIGN
>   X        AGAINST HTML MAIL
>  / \
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

-- 
==========
Cheers
   -jdf
