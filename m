Message-ID: <3BBA3323.E271B5A8@legis.state.ak.us>
Date: Tue, 02 Oct 2001 13:35:31 -0800
From: Bill Ellis <bill_ellis@legis.state.ak.us>
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------A86862A27E695A5B6C17C886"
Subject: [linux-lvm] pvcreate fails on a software RAID meta-disk
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
To: linux-lvm@sistina.com

--------------A86862A27E695A5B6C17C886
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hi,

I'm running into a weird problem with pvcreate.  It doesn't seem to want to
let me use a software RAID metadisk as a PV.  Here's what I get:


> root@tik-tok:~# pvcreate /dev/md7
> pvcreate -- ERROR "parameter error" setting up  physical volume "/dev/md7"
>
> root@tik-tok:~# pvcreate -v /dev/md7
> pvcreate -- locking logical volume manager
> pvcreate -- checking physical volume name "/dev/md7"
> pvcreate -- getting physical volume size
> pvcreate -- checking partition type
> pvcreate -- creating new physical volume
> pvcreate -- setting up physical volume for /dev/md7 with 0 sectors
> pvcreate -- ERROR "parameter error" setting up  physical volume "/dev/md7"
>
> root@tik-tok:~# pvcreate --version
> pvcreate: Logical Volume Manager 1.0.1-rc3
> Heinz Mauelshagen, Sistina Software  01/10/2001 (IOP 10)
>

I'm running a 2.4.10 kernel, patched with the lvm 1.0.1rc3 patch...
(and my own quick fix for the '__update_hardsectsize' vs.
'__update_hardblocksize' issue).

So:  this (software RAID metadisks as lvm PVs) *is* supposed to work,
right?

Any ideas as to what I'm doing wrong?

Thanks In Advance,
Bill Ellis


--------------A86862A27E695A5B6C17C886
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: 7bit

<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<html>
Hi,
<p>I'm running into a weird problem with pvcreate.&nbsp; It doesn't seem
to want to let me use a software RAID metadisk as a PV.&nbsp; Here's what
I get:
<br>&nbsp;
<blockquote TYPE=CITE>
<pre>root@tik-tok:~# pvcreate /dev/md7
pvcreate -- ERROR "parameter error" setting up&nbsp; physical volume "/dev/md7"

root@tik-tok:~# pvcreate -v /dev/md7
pvcreate -- locking logical volume manager
pvcreate -- checking physical volume name "/dev/md7"
pvcreate -- getting physical volume size
pvcreate -- checking partition type
pvcreate -- creating new physical volume
pvcreate -- setting up physical volume for /dev/md7 with 0 sectors
pvcreate -- ERROR "parameter error" setting up&nbsp; physical volume "/dev/md7"

root@tik-tok:~# pvcreate --version
pvcreate: Logical Volume Manager 1.0.1-rc3
Heinz Mauelshagen, Sistina Software&nbsp; 01/10/2001 (IOP 10)</pre>
</blockquote>

<p><br>I'm running a 2.4.10 kernel, patched with the lvm 1.0.1rc3 patch...
<br>(and my own quick fix for the '__update_hardsectsize' vs. '__update_hardblocksize'
issue).
<p>So:&nbsp; this (software RAID metadisks as lvm PVs) *is* supposed to
work, right?
<p>Any ideas as to what I'm doing wrong?
<p>Thanks In Advance,
<br>Bill Ellis
<br>&nbsp;</html>

--------------A86862A27E695A5B6C17C886--
