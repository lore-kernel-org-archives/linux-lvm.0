Return-Path: <gene_yee@hotmail.com>
From: "hail narcissus" <gene_yee@hotmail.com>
Date: Mon, 12 Mar 2001 13:02:52 -0800
Mime-Version: 1.0
Message-ID: <F797oDaSeXnbnCndg5o000050a8@hotmail.com>
Subject: [linux-lvm] e2fsck error
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

I am trying to resize my ext2 fs but I get an error from ext2resize:

ext2resize: ext2_open: filesystem has errors! e2fsck first!
ext2resize: can't open /dev/junior/site

At this point I do did a 'umount /dev/junior/site'
Then I do a 'e2fsck -fyv /dev/junior/site &'

It returns this:

Pass 1: Checking inodes, blocks, and sizes
Group 3125's block bitmap at 102400000 conflicts with some other fs block.
Relocate? yes

Group 3125's inode bitmap at 102400001 conflicts with some other fs block.
Relocate? yes

It finds other errors which I believe it fixes but not the above error.  If 
I re-run e2fsck then it comes up with the above error again.

Thanks!!
_________________________________________________________________
Get your FREE download of MSN Explorer at http://explorer.msn.com
