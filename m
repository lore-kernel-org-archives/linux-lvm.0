Return-Path: <carenas@chasqui.lared.net.pe>
Date: Tue, 7 Aug 2001 00:38:26 -0500 (PET)
From: Carlo Marcelo Arenas Belon <carenas@chasqui.lared.net.pe>
Subject: Re: [linux-lvm] LVM with multi-path disks?
In-Reply-To: <20010807072327.A10691@vestdata.no>
Message-ID: <Pine.LNX.4.33.0108070024270.18365-100000@chasqui.LaRed.net.pe>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

<SNIP>
> > arrays with dual RAID controllers in them. When one RAID controller fails
> > something special has to be done to transfer the LUNs from the dead
> > controller over to the live one. They call this "ATF" or "Automatic
> > Transparent Failover" and they don't seem to ship it for Linux. Only NT
> > and Solaris. I've tried talking them into considering it but not had any
> > success.
>
> Pardon me for finding it amusing they call it Automatic Transparent
> Failover when it apperently is neither automatic nor transparent :-)

well that is actually donde trasnparently by the driver, and not only when
one controller fails, but when there is a signal that there could be a
problem with the SP (Store Processor that connects to the disks) or even
with the SPS (battery that feeds the SP)

ATF is a pretty interesting hack, where you can virtualize the path to the
LUNs on a failover configuration, but it is not as good as EMC's PowerPath
(bundled with Symmetrix drivers) where you actually can do the same thing
and also share bandwith using the different paths at the same time.

i am not sure tough that this would be the right way to go as it is pretty
hardware specific and IMHO too low level, the same could be done on
software just like the Verita's DMP and probably the actual RedHat's
multipath capabilities for md could be just a step on the right direction.

just my 2c

Carlo
