Return-Path: <austin@coremetrics.com>
Message-ID: <85063BBE668FD411944400D0B744267A643637@AUSMAIL>
From: "Gonyou, Austin" <austin@coremetrics.com>
Subject: RE: [linux-lvm] LVM with multi-path disks?
Date: Tue, 7 Aug 2001 11:30:49 -0500 
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

Tracy,
  Possibly try GFS mounting..and then hosting GFS clienst?

-- 
Austin Gonyou
Systems Architect, CCNA
Coremetrics, Inc.
Phone: 512-796-9023
email: austin@coremetrics.com 

> -----Original Message-----
> From: Tracy R Reed [mailto:treed@ultraviolet.org]
> Sent: Tuesday, August 07, 2001 2:41 AM
> To: linux-lvm@sistina.com
> Subject: Re: [linux-lvm] LVM with multi-path disks?
> 
> 
> On Tue, Aug 07, 2001 at 12:38:26AM -0500, Carlo Marcelo 
> Arenas Belon wrote:
> > ATF is a pretty interesting hack, where you can virtualize 
> the path to the
> > LUNs on a failover configuration, but it is not as good as 
> EMC's PowerPath
> > (bundled with Symmetrix drivers) where you actually can do 
> the same thing
> > and also share bandwith using the different paths at the same time.
> 
> Yes, it is interesting. Although we avoid the Symmetrix line 
> because it's
> even more closed than the Clariion arrays. We are very independent and
> slice and dice harware to our liking. I sometimes think EMC finds us
> frustrating to deal with because we are so independent when 
> they are used
> to holding the customers hand and not letting them touch the 
> box. :) We
> share bandwidth using the different paths at the same time by 
> distributing
> the LUNs equally over the two SP's.
> 
> > i am not sure tough that this would be the right way to go 
> as it is pretty
> > hardware specific and IMHO too low level, the same could be done on
> > software just like the Verita's DMP and probably the actual RedHat's
> > multipath capabilities for md could be just a step on the 
> right direction.
> 
> Yes, it is definitely hardware specific. I was just wondering 
> if anyone
> happened to know of drivers for Linux. We have a ton of money 
> invested in
> many of these arrays and md's multipath won't work for 
> us...unless I can
> somehow bind a LUN to both SP's at the same time but I'm 
> pretty sure that
> is not possible.
> 
> -- 
> Tracy Reed      http://www.ultraviolet.org
> Bill Gates to his broker: "You idiot, I said $150 million on
> **SNAPPLE**!!!"
> 
