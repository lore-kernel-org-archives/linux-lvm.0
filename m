Return-Path: <patrick@tykepenguin.cix.co.uk>
Date: Tue, 27 Feb 2001 08:35:28 +0000
From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] LVM and *bad* performance (no striping)
Message-ID: <20010227083528.A503@tykepenguin.com>
References: <m2snl1phy5.fsf@isnogud.escape.de> <20010226203933.B2504@66bassett.freeserve.co.uk>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20010226203933.B2504@66bassett.freeserve.co.uk>; from joe@66bassett.freeserve.co.uk on Mon, Feb 26, 2001 at 08:39:33PM +0000
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

On Mon, Feb 26, 2001 at 08:39:33PM +0000, Joe Thornber wrote:
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

I've always seen bad performance doing dd on LVM volumes but very good
performance in "real world" performance or bonnie++ tests.

Stop worrying about it, how many times do you *need* to dd the start of 
a disk at high speed eh? :-)

patrick
