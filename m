Subject: Re: [linux-lvm] Long-term snapshots possible?
Mime-Version: 1.0 (Apple Message framework v551)
From: "Dale J. Stephenson" <dalestephenson@mac.com>
Content-Transfer-Encoding: 7bit
In-Reply-To: <200303112228.39201.jhs@openenterprise.biz>
Message-Id: <BD3FEC2C-5409-11D7-959E-0003937830E4@mac.com>
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
Date: Tue Mar 11 15:39:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

On Tuesday, March 11, 2003, at 10:28  AM, Jason Smith wrote:
>
> My problem is, this does not currently look possible without a severe
> performance hit.  If a volume has, for example, five active snapshots,
> then the deltas seem to get written five times, once per snapshot 
> volume.
>
I posted a patch (in January?) to implement chained snapshots with 
LVM1, ensuring that a delta is only copied once, at most.  The downside 
is that the snapshots are no longer independent, and you can't remove a 
recent snapshot without invalidating all the older snapshots.  But it 
is more efficient.

I didn't keep the message, but I believe chained snapshots will be 
implemented in LVM2 sometime this year.

Dale J. Stephenson
dalestephenson@mac.com
