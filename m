Return-Path: <sar@viastore.de>
Date: Wed, 20 Dec 2000 19:10:14 +0100 (MEZ)
From: Thorsten Sauter <sar@viastore.de>
Subject: Re: [linux-lvm] Can I use LVM with ReiserFS?
In-Reply-To: <a05001923b66697749fe8@[129.98.91.150]>
Message-Id: <6f82d452d8fd8870aa5e3beee04560773a40f615@viastore.de>
Mime-Version: 1.0
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
To: Maurice Volaski <mvolaski@aecom.yu.edu>
Cc: linux-lvm@sistina.com

Hello,

im using lvm-0.9 with kernel 2.2.17 and reiserfs on two volume groups. One
for the operation system (incl. boot) and one for the home directories.

On all physical volumes is the reiserfs the filesystem that i'm using.
This installation works now for over 2 month and it works fine.

So, reiserfs and lvm is wounderful... use it!

Bye
Thorsten

On Wed, 20 Dec 2000, Maurice Volaski wrote:

> I'm getting ready to install a server that will use hardware RAID 5 
> and I want to make a hardware RAID volume, put ReiserFS on it and 
> initially make it appear as /home to my users. Then at some point 
> later, I want to take another hardware RAID volume, put ReiserFS on 
> it and add it to the existing /home so that users all of a sudden see 
> a huge increase in the size of /home. Can this be done or will my use 
> of ReiserFS make it a problem?
> -- 
> 
> Maurice Volaski, mvolaski@aecom.yu.edu
> Computing Support, Rose F. Kennedy Center
> Albert Einstein College of Medicine of Yeshiva University
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> 
