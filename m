Return-Path: <steve.wray@the.net.nz>
From: "Steve Wray" <steve.wray@the.net.nz>
Subject: RE: [linux-lvm] Converting my Root file system to LVM [lastquestion]
Date: Fri, 25 May 2001 10:07:51 +1200
Message-ID: <NBBBKLKHMJHIJLHOGAOJIEODIOAA.steve.wray@the.net.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <990701563.2282.2.camel@localhost>
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

> From: linux-lvm-admin@sistina.com [mailto:linux-lvm-admin@sistina.com]On
> Behalf Of Rupert Heesom
> Sent: Thursday, May 24, 2001 10:53 PM
> To: linux-lvm@sistina.com
> Subject: Re: [linux-lvm] Converting my Root file system to LVM
> [lastquestion]
>
>
> On 24 May 2001 00:41:18 -0600, Andreas Dilger wrote:
> > Steve Wray writes:
> > Actually, I posted a similar question to linux-kernel, but I

This is a mis-quote. I didn't write this.
Just thought I'd make sure the record was straight since this is being
archived!



> > lost in the noise.  Basically, it _is_ possible to have a "finitrd" for
> > just this situation (at least on 2.4).  You unmount all but root, set up
> > a ramfs, and pivot_root into the ramfs.  You can then unmount root (not
> > just a read-only remount), and properly shutdown LVM/RAID/etc.  Haven't
> > tried it myself, but it should work.
