Return-Path: <austin@coremetrics.com>
Message-ID: <85063BBE668FD411944400D0B744267A643391@AUSMAIL>
From: "Gonyou, Austin" <austin@coremetrics.com>
Subject: RE: [linux-lvm] about to give up
Date: Wed, 11 Jul 2001 13:09:53 -0500
MIME-Version: 1.0
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
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

I know it would lose data. But, from the sounds..it sounded as though that
has already happened. 

-- 
Austin Gonyou
Systems Architect, CCNA
Coremetrics, Inc.
Phone: 512-796-9023
email: austin@coremetrics.com 

> -----Original Message-----
> From: lembark@wrkhors.com [mailto:lembark@wrkhors.com]
> Sent: Wednesday, July 11, 2001 12:26 PM
> To: linux-lvm@sistina.com
> Subject: RE: [linux-lvm] about to give up
> 
> 
> 
> 
> -- "Gonyou, Austin" <austin@coremetrics.com> on 07/11/01 
> 10:30:10 -0500
> 
> > perhaps just blowing away your VG, then re-setting the 
> volumes as PVs in
> > that vg, then growing them one at a time?
> 
> blowing off the VG will loose data.
> 
> try:
> 
>     vgexport blah;
>     vgimport blah PV PV PV;
> 
> Export will remove the vg from local disk but leave
> the VG info on the platters.  Import will re-build 
> the VG on the disk.
> 
> sl
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> 
