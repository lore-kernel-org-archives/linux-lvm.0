From: Alasdair G Kergon <agk@uk.sistina.com>
Subject: Re: [linux-lvm] LV's above 2TB, PV's above 1TB, LBD?
Message-ID: <20021118163728.C5567@uk.sistina.com>
References: <3DD3AEF2.5040900@grc.nasa.gov>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3DD3AEF2.5040900@grc.nasa.gov>; from tkollar@grc.nasa.gov on Thu, Nov 14, 2002 at 09:10:58AM -0500
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
Date: Mon Nov 18 10:38:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Nov 14, 2002 at 09:10:58AM -0500, Tad Kollar wrote:
> lvm> lvextend -l 10980 /dev/vgtest2/lvtest2
>    Extending logical volume lvtest2 to 2.68 TB
>    logical volumes cannot be larger than 4.00 TB
A missing division by 2 when producing the error message:-)
 
> Also, pvcreate treats 1+ TB devices as 2+ TB and rejects them.
Maybe another missing factor of 2 somewhere?
Can you provide some *specific* output demonstrating this problem
(like you did for the first problem)?
 
> Aside from this, now that the 2.5 kernel supports LBD's, can the limit
> on LV's be raised to 16 TB?
For the *new* format of metadata (in beta 4 released today), yes: 
for now, I've knocked out the LV size restriction in CVS.  Further
tweaks to the tools may also be required. Please try it and let us
know whether it works, or what else needs changing.
 
Alasdair
-- 
agk@uk.sistina.com
