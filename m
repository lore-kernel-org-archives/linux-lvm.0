Return-Path: <unseen@sover.net>
Date: Mon, 26 Feb 2001 15:38:45 -0500 (EST)
From: Jason Walker <unseen@sover.net>
Subject: Re: [linux-lvm] XFS & 2.4.2
In-Reply-To: <005101c0a073$730d2b60$0f01a8c0@myplace.net>
Message-ID: <Pine.LNX.4.10.10102261534200.27416-100000@surreal.localdomain>
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

I have been running XFS and reiser on LVM for oh....4 days now :)

I am running the CVS kernel (2.4.2-XFS) from SGI, and LVM tools version
0.9.  I have only had one problem, and that was copying large amounts of
data to the LVM off my old hard drive.  My box would lock up after about
1/2 through it. I couldn't determine the cause of this.  I moved several
partition jsut fine to LVM, several GB each time, but that one fought me.
In addition, I didn't know if it was LVM, 2.4.2, XFS or reiser (I have a
reiser volume on LVM, I *thought* I heard there were issues with that.  not
sure)  That is my expirience.  other than that, I have had no problems.  I
hope your transition goes smoothly.

RegEx

On Mon, 26 Feb 2001, B. ten Berge wrote:

> Hi,
> 
> Anybody knows if you need some patch to use LVM 0.9.1 beta 5a on kernel
> 2.4.2 to run XFS from SGI ? I'm about to try but was curious...
> 
> Thanks,
> Bas
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> 
