Return-Path: <tomlins@cam.org>
From: Ed Tomlinson <tomlins@cam.org>
Date: Thu, 22 Mar 2001 14:46:31 -0500
MIME-Version: 1.0
Message-Id: <01032214463100.00819@oscar>
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] [catch22] lvm vs reiserfs
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

I decided to really try out some of the features built into 2.4.  Using a 
2.4.2-ac20 kernel I my root on /dev/lv/root as a reiserfs filesystem.  So
far so good.  Now I want to back it up.  So I created a snapshot with
lvcreate -L 50 -s -n snap /dev/lv/root.  This works too.  Problem happens
when I want to mount /dev/lv/snap to back it up logically.  At this point
reiserfs wants to replay its journal....  Of course it cannot (snapshot=ro).

How can this be resolved?  Is there a way to sync root just after the lvm
data gets updated in /etc but before the snapshot starts?  How else might
this be fixed (is it fixed already somewhere)?

TIA
Ed Tomlinson
