Return-Path: <austin@coremetrics.com>
Date: Thu, 24 May 2001 13:28:58 -0500 (CDT)
From: Austin Gonyou <austin@coremetrics.com>
Subject: Re: [linux-lvm] Raid5 sync problem
In-Reply-To: <200105241704.f4OH4Rom014186@webber.adilger.int>
Message-ID: <Pine.LNX.4.33.0105241327460.1903-100000@UberGeek.coremetrics.com>
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

Well, as noted, he's got one drive Not in the raid5 right now so his R5 is
running in a degraded state, versus optimal. This will case some pretty
sever slowdows with software level raid5, vs hardware dedicated to the
job.

-- 
Austin Gonyou
Systems Architect, CCNA
Coremetrics, Inc.
Phone: 512-796-9023
email: austin@coremetrics.com

On Thu, 24 May 2001, Andreas Dilger wrote:

> If you have a single huge RAID 5 volume which is always in use while the
> system is running, then you will always get the resync slowdown.  I'm not
> sure why this would cause your whole system to get so slow, unless it is
> something like you are swapping to RAID5, and this kills performance.
