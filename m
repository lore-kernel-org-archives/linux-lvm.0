Message-ID: <3F675CDB.80002@tupshin.com>
From: Tupshin Harper <tupshin@tupshin.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] pvscan showing 0 free on all PV's.
References: <3F676739.13431.C25AFD2@localhost>
In-Reply-To: <3F676739.13431.C25AFD2@localhost>
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
Date: Tue Sep 16 13:57:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Rene Olsen wrote:

>Now, why in the world does it show 0 free on all the PV's when a df told me that there 
>were at least 260GB free on the lvm.
>
>Am I doing something wrong or ?
>
>Any help will be most appreciated.
>
>Best regards.
>
>Rene
>  
>
df shows how much free space there is on the *filesystem*. Even if the 
filesystem isn't full, it can occupy the entire lvm, which occupies the 
entire volume group. If you have only one filesystem on the lvm, then 
you may or may not have a problem, depending on what filesystem you are 
using. If you are using ext2 or ext3, then you can probably do an 
ext2resize to shrink it, followed by an lvreduce to reduce the size of 
the partition that the filesystem lives on, but *DANGER* *DANGER* 
*DANGER*. Reducing the size of an existing filesystem is inherently 
dangerous, so back up, tread with caution, and don't blame me when a 
meteorite flattens your house.

If you are using reiserfs, jfs, or xfs, you are probably out of luck, as 
these filesystems don't currently support reduction.

-Tupshin
