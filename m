Return-Path: <fox@theendoftime.net>
Date: Thu, 3 May 2001 06:06:41 -0600 (MDT)
From: <fox@theendoftime.net>
Message-ID: <Pine.LNX.4.31L2.0105030602060.3414-100000@theendoftime.net>
MIME-Version: 1.0
Subject: [linux-lvm] Software RAID on LVM
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi;

I've been on the list for a few days now and I'm starting to get a sense
of what LVM can an cannot do (I come from AIX's LVM and I'm happy to see
Linux is starting to have something similar)

One thing I've not gotten a full sense of is can you have a RAID 1 array
sit ontop of a LVM filesystem?  I understand that LVM does not have any
internal RAID capabilities (that's the sense I've been getting...though I
might be on glue...never count out that possibility with me ;) but might
be possible to have the internal Software RAID in Linux to sit ontop of a
filesystem using the LVM.

Also, what type of filesystem is recommended for use with LVM (and
possibly RAID 1?  I'm quite hopeful for that...)  I'm thinking ReiserFS is
the FS of choice here, but would anyone mind clairifying for me why it
would be better, or which you think would be better?

Thanks for your time to read this newbie LVM post.  =)

Cheers,

Tren.
