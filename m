Message-ID: <3EA42C2E.3090807@mvista.com>
From: Steven Dake <sdake@mvista.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Question about VFS Locking patch, why is a change
 needed?
References: <3E9F4A2C.9090806@mvista.com> <1050930393.13309.9.camel@tiny.suse.com>
In-Reply-To: <1050930393.13309.9.camel@tiny.suse.com>
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
Date: Tue Apr 22 07:12:04 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Chris,

Thanks for the info !

-steve

Chris Mason wrote:

>On Thu, 2003-04-17 at 20:43, Steven Dake wrote:
>  
>
>>Folks,
>>
>>I was analyzing the VFS locking patch and I wanted to know if someone 
>>could explain the purpose of a change in the reiserfs for me:
>>
>>The change is:
>>Index: linus.21/fs/reiserfs/super.c
>>--- linus.21/fs/reiserfs/super.c Fri, 11 Jan 2002 10:14:59 -0500 root 
>>(linux/41_super.c 1.2.2.1.2.1.1.1 644)
>>+++ linus.21(w)/fs/reiserfs/super.c Mon, 28 Jan 2002 13:50:56 -0500 root 
>>(linux/41_super.c 1.2.2.1.2.1.1.1 644)
>>@@ -66,7 +66,7 @@
>>     reiserfs_prepare_for_journal(s, SB_BUFFER_WITH_SB(s), 1);
>>     journal_mark_dirty(&th, s, SB_BUFFER_WITH_SB (s));
>>     reiserfs_block_writes(&th) ;
>>-    journal_end(&th, s, 1) ;
>>+    journal_end_sync(&th, s, 1) ;
>>   }
>>   s->s_dirt = dirty;
>>   unlock_kernel() ;
>>
>>I tried LVM with and without this change even under heavy load and LVM 
>>can still create mountable snapshots of a reiser filesystem without the 
>>change.  Why is it there?
>>    
>>
>
>journal_end will do an asynchronous commit, which means it won't wait
>for the journal to actually finish writing to disk.  journal_end_sync
>will wait until the commit is fully on disk.
>
>In most cases, the reiserfs_block_writes call is sufficient and the
>journal_end_sync change isn't needed, but there are a few corner cases
>depending on the number of log writers where journal_end_sync is
>required.
>
>-chris
>
>
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@sistina.com
>http://lists.sistina.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
>
>
>  
>
