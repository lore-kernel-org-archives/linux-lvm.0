Return-Path: <julien@atix.de>
Message-ID: <3B67C4E5.3FADCA6B@atix.de>
Date: Wed, 01 Aug 2001 10:59:17 +0200
From: Julien Baboud <julien@atix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] pb mounting reiserfs snapshot LV
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

hi,

 i recently have recompiled a 2.4.5 linux kernel with the lvm 0.9.1
beta8 tools into it (ie not as a module),
 and have applied the patches that enables taking ReiserFS Snapshot.

 I've encountered a problem :

 when i create a LV with a reiser FS on it, and then take a snapshot of
this LV, i'm not able to mount the Snap;
 but if i mount the LV to be snaped before taking a snapshot of it, all
is right, i can mount the Snap.

 This pb doesn't appear with ext2 FS.
 Is it a bug a the lvm/reiser tools ? Have some people yet have the same
pb as me ?

 tanx.

 julien,
 4 Atix.
