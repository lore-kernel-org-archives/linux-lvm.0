Return-Path: <tomlins@cam.org>
From: Ed Tomlinson <tomlins@cam.org>
Date: Fri, 13 Apr 2001 13:29:58 -0400
MIME-Version: 1.0
Message-Id: <01041313295800.02991@oscar>
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] mounting reiserfs snapshot fails
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
To: reiserfs-list@namesys.com
Cc: linux-lvm@sistina.com

Hi,

Using debian sid, 2.4.3-ac5, lvm 0.91 beta7, with the vfs locking
patch applied I get:

oscar# mount /dev/lv/snap /snap -t reiserfs -oro
mount: wrong fs type, bad option, bad superblock on /dev/lv/snap,
       or too many mounted file systems

When trying to mount the snap shot.  It was created with: 
lvcreate -L 1G -s -n snap /dev/lv/root /dev/hdg1
without problems

Ideas?
Ed Tomlinson
