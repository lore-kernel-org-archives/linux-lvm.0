Return-Path: <gobo@gimle.nu>
Message-ID: <20010207172506.7555.qmail@fraggle.cs.uit.no>
From: gobo@gimle.nu
Subject: Re: [linux-lvm] Help! Problems finding VG after reboot. 
In-Reply-To: Your message of "Tue, 06 Feb 2001 14:39:02 CST."
             <20010206143902.C5041@sistina.com> 
Mime-Version: 1.0
Date: Wed, 07 Feb 2001 18:25:06 +0100
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

> Hmm...This appears to be different from the bug posted with the subject
> "0.9.1 vgscan doesn't detect upgraded vg's" today.  Can you confirm this?

Having read through the thread you mention it seems that my problem is a 
bit different, although it might have the same source.

I tried viewing the output of pvdata as shown in that thread, and I think 
that might be the source of my problems. At least if all the UUIDs are 
supposed to be equal.

I have attached the results from that to this mail along with the results form running vgcfgrestore -ll. Please note that the pvdata outputs are taken after I had tried running vgcfgrestore on all the partitions.

I hope someone has a way/hack to get this VG back online. I would really appreciate getting my files back.

BTW: You're doing a great job people. Now if we can just stamp out the bugs this is going to be one of the most useful features in the kernel.

FrankRL
