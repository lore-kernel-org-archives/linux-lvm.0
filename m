From: Spam <spam@tnonline.net>
Message-ID: <641831202.20031208172455@tnonline.net>
Subject: Re: [linux-lvm] EXT3 vs Reiserfs
In-Reply-To: <3FD4A42E.3070609@stercomm.com>
References: <CEADF0D83077F7458B763904E47AA709287BA7@exchange.neokimia.com>
 <3FD4A42E.3070609@stercomm.com>
MIME-Version: 1.0
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
Date: Mon Dec  8 10:25:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Chris Cox <linux-lvm@sistina.com>


> Yanick Quirion wrote:
>> Hi all,
>> 
>> Could you please tell what is the best filesystem for linux between ext3 and reiserfs?
>> 
>> I know that ext3 can handle ACLs and not online fs extend, and
>> reiserfs do not seems to support ACLs (I found some patches for
>> kernel 2.4.21, but there are errors when I apply them to the kernel
>> sources), but can be extend while it's online.
>> 
>> I'm just asking for your personal opinion and knowledge with them.
>> 

> If you are using SUSE, then use reiserfs.  It has ACLs and is mostly patched.

> If you are using RH, then use ext3.  RH in the past has been known to have
> a broken reiserfs (not known for keeping it patched).

> In my performance benchmarks, I found reiserfs to be somewhere between jfs and ext3, where
> ext3 was the fastest, but reiserfs doing exceptionally well on random file creates
> and deletes.  Thought ext3 beats reiserfs in many of our tests, it was not by
> an overwhelming margin.  We were very surprised by the lack of performance of JFS.. though
> it did have the lowest CPU utilization of the 3.

> We run SUSE primarily... therefore we use reiserfs (mostly with LVMs).
> RH is sorta new to the LVM thing... so although we use ext3 on our RH systems,
> most of them do not use LVM.  We have over 7TB of data that uses LVM with
> reiserfs... we're quite pleased with the performance and capability.

> We love the ability to do resize_reiserfs while the filesystem is mounted.
> Constantly amazes the "Unix" purists.

Not  to  mention  that  the reiserfsck is one of the best fsck tools I
have  used.  This needs to be in consideration to, I think. Having not
tested JFS I will not reserve myself for that =)
