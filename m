From: Ronny Adsetts <ronny.adsetts@amazinginternet.com>
Message-ID: <bnr101$6qv$1@sea.gmane.org>
References: <2D92FEBFD3BE1346A6C397223A8DD3FC092442@THOR.goeci.com>	 <3F9FE42D.6070306@amazinginternet.com> <1067475054.17678.32.camel@david.internal.NorcrossGroup.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <1067475054.17678.32.camel@david.internal.NorcrossGroup.com>
Subject: [linux-lvm] Re: Error on unmounting XFS LVM snapshot
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
Date: Thu Oct 30 08:00:09 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Greg Freemyer said the following on 30/10/03 00:50:

>>I did see this this today which appears to be the same issue:
>>
>>http://www.kerneltraffic.org/kernel-traffic/kt20031027_238.html#4
>>
>> From Marcelo Tosatti[1]: "It seems its not safe to create snapshots of 
>>journalled fs'es without this patch[2]."
>>
>>Looks like the patch will show up in mainline in the 2.4.24-pre series.
>>
>>[1] http://marc.theaimsgroup.com/?l=linux-kernel&m=106642797513724&w=2
>>[2] http://marc.theaimsgroup.com/?l=linux-kernel&m=106623350522639&q=p3
>>
> 
> Is the above talking about the VFS_LOCK patch, or is there another patch
> that should be applied?

It appears to be the VFS lock patch, but I'm no kernel guru...

Regards,
Ronny
