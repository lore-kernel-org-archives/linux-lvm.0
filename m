Return-Path: <james@fr.clara.net>
Date: Thu, 22 Feb 2001 14:23:12 +0100 (CET)
From: James <james@fr.clara.net>
Subject: Re: [linux-lvm] online resize of ext2
In-Reply-To: <3A950C2C.9D6E8737@infologic.fr>
Message-ID: <Pine.LNX.4.21.0102221422190.3832-100000@munster.noc.fr.clara.net>
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
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hello

What are the version necessary for this?

kernel = ??
package version = ??

command used = ??

Thanks

James Tapping clara.net


On Thu, 22 Feb 2001, Benoit SERRA wrote:

> 
> 
> Andreas Dilger wrote:
> 
> > Because the code is only used at resize time it does not affect normal
> > operations, so it is OK to put into a production kernel, IMHO (although
> > being the author makes me a bit biased ;-).  Any other ext2online users
> > out there?
> 
> I use it on a test system, and I made a big amount of resize without any
> loss of data.
> Really good.
> Since I didn't have any production system runnig with Linux, I can't say
> if it is stable enough sorry.
> 
> Just after the release of 2.4.0 kernel, I patched it with the patch for
> 2.3.99 kernels and everything worked perfectly.
> 
> I only get a few rejects on Config.in, but I inserted it by hand.
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> 
