Return-Path: <mason@suse.com>
Date: Fri, 23 Feb 2001 16:56:12 -0500
From: Chris Mason <mason@suse.com>
Subject: Re: [linux-lvm] oops on 2.4.2 with lvm-0.9beta5 and Reiserfs 3.6.25
Message-ID: <726380000.982965372@tiny>
In-Reply-To: <14998.55834.382892.124432@eagle.mh.lucent.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
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


On Friday, February 23, 2001 04:46:02 PM -0500 lvm@winux.com wrote:

> Chris Mason writes:
>> This oops shows that somebody logged the super block without preparing
>> it. Could you please run this data through ksymoops so I can track down
>> the caller?
> 
> # dmesg | ksymoops -v /usr/src/linux/vmlinux -m /boot/System.map 

Hmmm, probably not the right system.map.  I think I see the bug though,
please try this patch:

--- linux/fs/reiserfs/super.c.1	Fri Feb 23 16:30:55 2001
+++ linux/fs/reiserfs/super.c	Fri Feb 23 16:31:39 2001
@@ -68,6 +68,7 @@
   lock_kernel() ;
   if (!(s->s_flags & MS_RDONLY)) {
     journal_begin(&th, s, 1) ;
+    reiserfs_prepare_for_journal(s, SB_BUFFER_WITH_SB(s), 1) ;
     journal_mark_dirty(&th, s, SB_BUFFER_WITH_SB (s));
     reiserfs_block_writes(&th) ;
     journal_end(&th, s, 1) ;
