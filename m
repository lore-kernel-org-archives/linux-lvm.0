From: Theo Van Dinter <felicity@kluge.net>
Subject: Re: [linux-lvm] System Suggestions
Message-Id: <20020306165708.E855@kluge.net>
References: <20020306210600.JKKL21197.imf11bis.bellsouth.net@taz>
    <20020306161130.D855@kluge.net>
    <auto-000020234823@front1.mail.megapathdsl.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <auto-000020234823@front1.mail.megapathdsl.net>;
    from anthony@AWMObjects.com on Wed, Mar 06, 2002 at 04:45:21PM -0500
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
Date: Wed Mar  6 15:57:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Anthony W. Marino" <anthony@AWMObjects.com>
Cc: linux-lvm@sistina.com, Petro <petro@auctionwatch.com>, linux-xfs@oss.sgi.com

On Wed, Mar 06, 2002 at 04:45:21PM -0500, Anthony W. Marino wrote:
> I should then hope to find all I need in my 2.4.18 kernel to pull this off 
> (3Ware/XFS/LVM)?  What RAID/LVM config do you recommend to minimize write 
> issues with RAID 5?

If you have a vanilla 2.4.18 kernel, you definately won't have XFS built in,
and I don't think you'll have the latest LVM code built-in (although I'm sure
someone will correct me on this if I'm wrong ...)

The kernel and a lot of patches later, and you should be all set. :)

-- 
Randomly Generated Tagline:
"Probability ratio 1:1.  We have achieved normality.  Whatever you can't
 deal with is now therefore your own problem."
         - HitchHiker's Guide to the Galaxy
