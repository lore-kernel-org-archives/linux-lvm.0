Return-Path: <gene_yee@hotmail.com>
From: "hail narcissus" <gene_yee@hotmail.com>
Date: Mon, 12 Mar 2001 11:07:22 -0800
Mime-Version: 1.0
Message-ID: <F36jtQUGUzLhG4YalgQ0000abf4@hotmail.com>
Subject: [linux-lvm] e2fsck on logical volume?
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

I asked a similar question a little while back and was told all I can run is 
vgck.  So I just ignored the warning message on bootup:

EXT2-fs warning: mounting unchecked fs, running e2fsck is recommended

Well I've extended my Logical Volume and I was just about done.  Until  I 
tried to run 'ext2resize'.  It gives me a warning message about problems 
with my EXT2 partition and to run e2fsck.

I figure I can do a force with ex2resize or I can run umount my volume and 
run e2fsck.  Me not being all that bold with 500 gigs of data that hasn't 
been backed up, I have done neither.

I would think the best thing would be to umount my volume and run e2fsck, 
but I don't know if that is going to destroy my logical volume or if it is 
all compatible.

Thanks!!
_________________________________________________________________
Get your FREE download of MSN Explorer at http://explorer.msn.com
