Message-ID: <20010827161137.97280.qmail@web14406.mail.yahoo.com>
Date: Mon, 27 Aug 2001 09:11:37 -0700 (PDT)
From: Aman Shahi <shahi_aman@yahoo.com>
MIME-Version: 1.0
Subject: [linux-lvm] Re: Problem mounting snapshot with reiserfs
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

>> You need to use the linux-2.4.x-VFS-lock.patch 
>> against the kernel to enable snapshotting to work 
>> with LVM and reiserfs.

Thanx AJ.
Sorry my fault, I assumed without checking whether I
need to apply the VFS Lock patch for 2.4.8 or not. I 
applied the patch, and it works fine.

Aman Shahi.

__________________________________________________
Do You Yahoo!?
Make international calls for as low as $.04/minute with Yahoo! Messenger
http://phonecard.yahoo.com/
