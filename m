From: Seth Mos <knuffie@xs4all.nl>
Subject: Re: re[2]: [linux-lvm] System Suggestions
In-Reply-To: <20020306210600.JKKL21197.imf11bis.bellsouth.net@taz>
Message-Id: <Pine.BSI.4.10.10203062217030.17216-100000@xs3.xs4all.nl>
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
Date: Wed Mar  6 15:23:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Freemyer <freemyer@NorcrossGroup.com>
Cc: "Anthony W. Marino" <anthony@AWMObjects.com>, Petro <petro@auctionwatch.com>, linux-lvm@sistina.com, linux-xfs@oss.sgi.com, mysql@lists.mysql.com

On Wed, 6 Mar 2002, Greg Freemyer wrote:

> Anthony,
> 
> I'd be careful with the IDE Raid controller.
> 
> We just built a lab machine with a Promise IDE Raid controller and the assumption that we could get it and XFS to co-exist.
> 
> I'm not doing the work, but the engineer that is tells me that the Promise Patch Kit only works with a very limited number of stock Redhat Kernels, and that we are NOT free to add the XFS patch.  Even worse, promise does not supply their patch in source, so we are not free to tweak it ourselves.
> 
> I'm not sure I really believe that, but that is what I'm told.
> 
> If you do get the 3Ware IDE RAID controller to work with XFS, please let me know.

3Ware IDE controllers and XFS are just fine. The driver is available in
source form and can be added to any kernel. The promise raid controllers
are not really nice. They have never ever been open about the hardware
specs of the cards. For some reason they seem to think that their IDE
controllers are something special. Which they are not.

If you are looking into using the 3Ware controllers watch the following:
The 64xx controllers are underpowered and should better not be used in
raid 5 mode.
The 74xx controllers seem to be good and should be fine with raid5 but
note that raid5 will always have slow write speeds.

Software raid can be used if you need a lot of speed _and_ redundancy.

Cheers
Seth
