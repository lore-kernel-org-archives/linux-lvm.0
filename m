Return-Path: <root@srv.sistina.com>
Date: Thu, 19 Jul 2001 16:06:07 +0200
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] I/O error: dev 08:11, sector 0
Message-ID: <20010719160607.B29325@sistina.com>
References: <20010719111351.A28183@sistina.com> <20010719091014.A18381@digit-safe.dyndns.org>
Mime-Version: 1.0
In-Reply-To: <20010719091014.A18381@digit-safe.dyndns.org>; from allanwind@mediaone.net on Thu, Jul 19, 2001 at 09:10:14AM -0400
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Allan,

as Patrick pointed out, I got the base wrong.

Are you sure that the drive is dying? 

You might have one of those nasty SCSI cable length/termination/power problems
causing this. Happens quite often after a configuration change on a SCSI bus.

Heinz

On Thu, Jul 19, 2001 at 09:10:14AM -0400, Allan M. Wind wrote:
> On 2001-07-19 11:13:51, Heinz J. Mauelshagen wrote:
> 
> > 08:11 (/dev/sda11) shows that I/O error, you use /dev/sdb, which is 08:16
> > for your VG -> no problem for LVM.
> > If there's a file system on /dev/sda11 *and* just the first sector is not
> > accessable, you can still happily access the filesystem, because it doesn't use
> > that sector at all.
> > But you should check and probably replace your sda drive to avoid
> > trouble in the future.
> 
> Hmm... I do not have a /dev/sda11, only sda1 & sda2 (root and swap
> respectively).  However, I was aware that my sdc drive was dying
> (the drive was scsi id 8 / sdb when this was logged):
> 
> Jul 14 09:33:58 digit-safe kernel: scsi0: ERROR on channel 0, id 8, lun 0, CDB: Read (10) 00 00 09 c9 48 00 00 18 00 
> Jul 14 09:33:58 digit-safe kernel: Info fld=0x9c952, Current sd08:12: sense key Medium Error
> Jul 14 09:33:58 digit-safe kernel: Additional sense indicates Data synchronization mark error
> Jul 14 09:33:58 digit-safe kernel:  I/O error: dev 08:12, sector 577872
> 
> 
> /Allan
> -- 
> Allan M. Wind			email: allanwind@mediaone.net
> P.O. Box 2022			finger: awind@digit-safe.dyndns.org (GPG/PGP)
> Woburn, MA 01888-0022
> USA

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
