From: Stuart Levy <slevy@ncsa.uiuc.edu>
Message-Id: <200203070415.WAA16951@niri.ncsa.uiuc.edu>
Subject: Re: [linux-lvm] System Suggestions
References: <20020306210600.JKKL21197.imf11bis.bellsouth.net@taz>
    <20020306161130.D855@kluge.net>
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
Date: Wed Mar  6 22:15:02 2002
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Petro <petro@auctionwatch.com>
Cc: linux-xfs@oss.sgi.com, linux-lvm@sistina.com

<petro@auctionwatch.com> wrote:

>   We have 10 of the 3ware cards, and while the drive is GPLd and in
>   the kernel, we have not been satisfied with the stability of the
>   system 

A 3ware 7850 here  (8 drive hw RAID5) performed erratically
until I got their latest .016 driver, which seems to be in
the 2.4.18 kernel too.  The earlier .010 driver in 2.4.<=17
would sometimes get into a low-performance (~15MB/sec) mode,
but the .016 driver has been doing very well.  3ware tech support
have been very responsive too.  Based on a few weeks' experience,
I'd recommend them.

   Stuart Levy, slevy@ncsa.uiuc.edu
