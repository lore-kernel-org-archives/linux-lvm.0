Return-Path: <austin@coremetrics.com>
Message-ID: <85063BBE668FD411944400D0B744267A643517@AUSMAIL>
From: "Gonyou, Austin" <austin@coremetrics.com>
Date: Wed, 25 Jul 2001 16:57:06 -0500
MIME-Version: 1.0
Subject: [linux-lvm] Upgrade to 0.9.1b8 went ok but....
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
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

The Devices won't mount for some reason. Here is the ouput I get from trying
to mount an XFS LVM Volume:

-----snip-----
[root@BurnBox /root]# mount -t xfs /dev/web/webvol1 /web/            
mount: wrong fs type, bad option, bad superblock on /dev/web/webvol1,
       or too many mounted file systems                              
[root@BurnBox /root]# xfs_check /dev/web/webvol1                     
xfs_check: unexpected XFS SB magic number 0x484d0200                 
bad superblock magic number 484d0200, giving up                      
[root@BurnBox /root]#                                                
-----snip-----

If I run xfs_repair, it can't find the superblock either. 

-- 
Austin Gonyou
Systems Architect, CCNA
Coremetrics, Inc.
Phone: 512-796-9023
email: austin@coremetrics.com 
