From: Petro <petro@auctionwatch.com>
Subject: Re: [linux-lvm] System Suggestions
Message-Id: <20020307034009.GJ32504@auctionwatch.com>
References: <20020306210600.JKKL21197.imf11bis.bellsouth.net@taz>
    <20020306161130.D855@kluge.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20020306161130.D855@kluge.net>
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
Date: Wed Mar  6 21:40:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Theo Van Dinter <felicity@kluge.net>
Cc: linux-lvm@sistina.com, "Anthony W. Marino" <anthony@awmobjects.com>, linux-xfs@oss.sgi.com, mysql@lists.mysql.com

On Wed, Mar 06, 2002 at 04:11:30PM -0500, Theo Van Dinter wrote:
> On Wed, Mar 06, 2002 at 03:59:50PM -0500, Greg Freemyer wrote:
> > If you do get the 3Ware IDE RAID controller to work with XFS, please let me know.
> Works beautifully.  Have RH7.2, XFS, LVM, and a 3Ware 7410 running the
> box that I'm sending this from. :)
> The Promise RAID cards are cute but crappy from what I've heard.
> The 3ware cards seem to be excellent quality so far, and the driver (as
> far as I can tell) was GPLed and is standard in the 2.4 kernel series
> (well, it's in 2.4.9 anyway...)

    We have 10 of the 3ware cards, and while the drive is GPLd and in
    the kernel, we have not been satisfied with the stability of the
    system 

    We haven't had a chance yet to qual the latest firmware, etc., but
    we went with dumb IDE expansion cards (we're only using 4 ide drives
    per system) and we're getting better speed (RAID0 or 1+0 depending)
    than we were off the 3ware card. 

    We are not using XFS, so no comments there. 

    We're also having some problems with Mysql that people keep pointing
    fingers at LVM for, but at this time we're point right back and
    saying "No!" in a firm voice...


-- 
Share and Enjoy. 
