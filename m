Message-ID: <3E6EBB51.4090805@cox.net>
From: "Kevin P. Fleming" <kpfleming@cox.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Core questions from a LVM neophyte...
References: <NDBBJIIIAKLGEPBFEKBGAEJJGDAA.afrancke@cisco.com>
In-Reply-To: <NDBBJIIIAKLGEPBFEKBGAEJJGDAA.afrancke@cisco.com>
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
Date: Tue Mar 11 22:45:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Andy Francke wrote:
>>I'm up Andy - after a bunch of hacking/compiling/hacking cycles.
>>(conflicts with ext3).
>>
>>Thanks so much for your help!
>>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
> 
> Glad it worked out. I hope that one day this will all be much, much easier -
> guess that's life on the bleeding edge.
> 
> Andy

And on the real bleeding edge, with 2.5.X this is all very much easier. 
LVM2's device-mapper and XFS are in the stock kernel, and are simple to 
configure in and use. I converted my primary server a little over a week 
ago and have only had some minor issues to deal with. Not for everyone, 
certainly, but it does make the whole MD/LVM/XFS situation far easier to 
deal with.
