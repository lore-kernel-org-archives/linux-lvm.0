Return-Path: <mason@suse.com>
Date: Sat, 28 Apr 2001 17:00:41 -0400
From: Chris Mason <mason@suse.com>
Message-ID: <507580000.988491641@tiny>
In-Reply-To: <01042810385300.12469@oscar>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Subject: [linux-lvm] Re: VFS locking patch fails on 2.4.4
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
To: Ed Tomlinson <tomlins@cam.org>, linux-lvm@sistina.com


On Saturday, April 28, 2001 10:38:53 AM -0400 Ed Tomlinson
<tomlins@cam.org> wrote:

> Hi,
> 
> The VFS locking patch fails on 2.4.4
> 
> oscar% cat ../LVM/linux-2.4.2-VFS-lock.patch | patch -p1
> patching file drivers/md/lvm.c
> Hunk #1 succeeded at 207 with fuzz 1 (offset 48 lines).
> patching file fs/buffer.c
> Hunk #1 succeeded at 331 (offset 17 lines).
> patching file fs/super.c
> patching file include/linux/fs.h
> Hunk #1 FAILED at 1093.
> 1 out of 1 hunk FAILED -- saving rejects to file include/linux/fs.h.rej
> patching file kernel/ksyms.c
> Hunk #1 succeeded at 177 (offset 2 lines).
> 
> This worked with 2.4.4-pre8.  This is not too important (yet) since 
> reiserfs snapshots also have problems.  They do not work with pre8.
> I get the same messages as previously reported (using debian sid).

Viro fixed some races in buffer.c.  I'm updating the vfs locking patch now.

(just fyi so the the lvm guys don't duplicate effort ;-)

-chris
