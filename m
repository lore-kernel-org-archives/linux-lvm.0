Return-Path: <ragnark@stine.vestdata.no>
Date: Wed, 18 Jul 2001 21:23:01 +0200
From: =?iso-8859-1?Q?Ragnar_Kj=F8rstad?= <lvm@ragnark.vestdata.no>
Subject: Re: [linux-lvm] HUGE LVM log file...
Message-ID: <20010718212300.E26849@vestdata.no>
References: <85063BBE668FD411944400D0B744267A643448@AUSMAIL> <85063BBE668FD411944400D0B744267A643448@AUSMAIL> <20010718092201.C382@btconnect.com> <5.0.2.1.2.20010718104547.00a40ec0@193.0.0.208> <20010718103321.A540@btconnect.com>
Mime-Version: 1.0
In-Reply-To: <20010718103321.A540@btconnect.com>; from Joe Thornber on Wed, Jul 18, 2001 at 10:33:21AM +0100
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

On Wed, Jul 18, 2001 at 10:33:21AM +0100, Joe Thornber wrote:
> This comment is interesting:
> 
> "Seagate uses horizontal mapping with this drive, so that it reaches
> maximum performance at the beginning of the medium, decreasing at the
> end of the medium."
> 
> So obviously this varies from drive to drive.

You can use zcav from the bonnie++ package
(http://www.coker.com.au/bonnie++) to find the transfer-rates for your
drive. I believe finding seek times is a little more tricky since it
depends on where you're seeking from and that will depend on your
application.



-- 
Ragnar Kjorstad
Big Storage
