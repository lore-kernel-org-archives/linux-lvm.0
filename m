From: Theo Van Dinter <felicity@kluge.net>
Subject: Re: [linux-lvm] LVM System
Message-Id: <20020304222144.C24876@kluge.net>
References: <auto-000021223409@front2.mail.megapathdsl.net>
    <auto-000019991746@front1.mail.megapathdsl.net>
    <20020304172754.K18939@kluge.net>
    <auto-000019995456@front1.mail.megapathdsl.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <auto-000019995456@front1.mail.megapathdsl.net>;
    from anthony@AWMObjects.com on Mon, Mar 04, 2002 at 05:39:09PM -0500
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
Date: Mon Mar  4 21:21:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Anthony W. Marino" <anthony@AWMObjects.com>
Cc: linux-lvm@sistina.com

On Mon, Mar 04, 2002 at 05:39:09PM -0500, Anthony W. Marino wrote:
> I don't understand.  Are you saying the all the software I need is contained 
> within my kernel or do I still need to get a driver from 3Ware?
> I'm running SuSE Mantel 2.4.18 which the changes text states it has 
> 2.4.19-pre1 as well as XFS.

When I installed the SGI 1.0.2 kernel on my machine (2.4.9), it already
had the latest (1.02.00.008) 3w-xxxx module in place.  I doubt the SGI
folks added it, so I'm assuming it's a standard module in the 2.4.x
series kernels.

If you want the "manager" software (which really just lets you see
status/configuration), that's a seperate piece you can download.

-- 
Randomly Generated Tagline:
There's often more than one correct thing.
 There's often more than one right thing.
 There's often more than one obvious thing.
              -- Larry Wall in <199806201726.KAA26569@wall.org>
