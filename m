Subject: Re: [linux-lvm] Re: Error on unmounting XFS LVM snapshot
From: Greg Freemyer <freemyer-ml@NorcrossGroup.com>
In-Reply-To: <3F9FE42D.6070306@amazinginternet.com>
References: <2D92FEBFD3BE1346A6C397223A8DD3FC092442@THOR.goeci.com>
	 <3F9FE42D.6070306@amazinginternet.com>
Message-Id: <1067475054.17678.32.camel@david.internal.NorcrossGroup.com>
Mime-Version: 1.0
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
Date: Wed Oct 29 19:00:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

> I did see this this today which appears to be the same issue:
> 
> http://www.kerneltraffic.org/kernel-traffic/kt20031027_238.html#4
> 
>  From Marcelo Tosatti[1]: "It seems its not safe to create snapshots of 
> journalled fs'es without this patch[2]."
> 
> Looks like the patch will show up in mainline in the 2.4.24-pre series.
> 
> [1] http://marc.theaimsgroup.com/?l=linux-kernel&m=106642797513724&w=2
> [2] http://marc.theaimsgroup.com/?l=linux-kernel&m=106623350522639&q=p3
> 
> Regards,
> Ronny

Is the above talking about the VFS_LOCK patch, or is there another patch
that should be applied?

Greg
-- 
Greg Freemyer
