Return-Path: <terjekv@ifi.uio.no>
Subject: Re: [linux-lvm] NFS
References: <200102271700.f1RH0iE27053@webber.adilger.net> <m2ofvko5og.fsf@isnogud.escape.de> <20010302054830.A29723@omnifarious.mn.org>
From: Terje Kvernes <terjekv@math.uio.no>
Date: 02 Mar 2001 18:16:31 +0100
In-Reply-To: "Eric M. Hopper"'s message of "Fri, 2 Mar 2001 05:48:30 -0600"
Message-ID: <wxxr90gytu8.fsf@einn.ifi.uio.no>
MIME-Version: 1.0
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

"Eric M. Hopper" <hopper@omnifarious.mn.org> writes:

> Reiserfs needs to generate some kind of 'position' cookie that can
> be used to refind the spot in the directory that NFS was scanning. I
> think the position cookie has to increase as more entries are read,
> but I'm not sure. NFS is stateless, so this position cookie has to
> work for some indeterminate amount of time.

  now this... I'm not saying anything about the way it's been done...
  but I am exporting three reiserfs-filesystems (all inside a VG by
  the way :) to my local network. the _only_ issue I have had now and
  then are stale NFS-messages. but I've had those on a ext2-system as
  well. I think it's an issue with a loaded and _slow_ IDE disk. or at
  least so it seems.
 
> Have fun (if at all possible),

  oh, we do try. :)

-- 
Terje
