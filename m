Return-Path: <lists@ida.xs4all.nl>
Message-ID: <3A9AC4B7.FFA4C0B4@ida.xs4all.nl>
Date: Mon, 26 Feb 2001 22:03:51 +0100
From: Jorg de Jong <lists@ida.xs4all.nl>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM and *bad* performance (no striping)
References: <m2snl1phy5.fsf@isnogud.escape.de> <20010226203933.B2504@66bassett.freeserve.co.uk>
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

Joe Thornber wrote:
> 
> On Mon, Feb 26, 2001 at 04:44:34PM +0100, Urs Thuermann wrote:
> > I tried to use LVM today using Linux 2.4.2 and it mostly works like I
> > expected.  But the performance is unacceptably bad:
> 
> Every now and then someone posts to the list claiming LVM performance
> is really bad.  We go off and try it and find the overhead is
> typically less than 1%.
> 
> Normally people are trying to stripe to two partitions on the same
> device, but you aren't.
> 
> Is any one else on the list seeing a similar performance hit ?
> 
> - Joe

here are my stats... (be your owen judge....)

Jorg

[root] /root > time dd if=/dev/hde of=/dev/null count=100000
100000+0 records in
100000+0 records out
0.200u 1.050s 0:03.95 31.6%	0+0k 0+0io 116pf+0w

[root] /root > time dd if=/dev/vg00/vm of=/dev/null count=100000
100000+0 records in
100000+0 records out
0.160u 0.860s 0:02.92 34.9%	0+0k 0+0io 116pf+0w
