Return-Path: <austin@coremetrics.com>
Message-ID: <85063BBE668FD411944400D0B744267A643394@AUSMAIL>
From: "Gonyou, Austin" <austin@coremetrics.com>
Subject: RE: [linux-lvm] about to give up
Date: Wed, 11 Jul 2001 14:40:17 -0500
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

Since you cat access /etc..you have no way of getting to /etc/lvmtab.d or
/etc/lvmtab. If you could get to either of those, I believe it would work. 

-- 
Austin Gonyou
Systems Architect, CCNA
Coremetrics, Inc.
Phone: 512-796-9023
email: austin@coremetrics.com 

> -----Original Message-----
> From: Eli Criffield [mailto:eli@zendo.net]
> Sent: Wednesday, July 11, 2001 2:38 PM
> To: linux-lvm@sistina.com
> Subject: Re: [linux-lvm] about to give up
> 
> 
> nope 
> ERROR: physical volume "/dev/hda3" doesn't belong to an 
> exported volume
> group
> 
> eli
> 
> On Wed, Jul 11, 2001 at 02:20:51PM -0500, lembark@wrkhors.com wrote:
> > 
> > 
> > -- Eli Criffield <eli@zendo.net> on 07/11/01 13:41:23 -0500
> > 
> > >> try:
> > >> 
> > >>     vgexport blah;
> > >>     vgimport blah PV PV PV;
> > >> 
> > > 
> > > I can't export it because it doesn't know it exists 
> because vgscan can't
> > > find it.
> > 
> > Peachy.  Now just try vgimporting it.  The PV's themselves
> > may have sufficient metadata to get away with it.
> > 
> > sl
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> 
