Return-Path: <vidalrod@informatik.tu-muenchen.de>
Message-ID: <3B0A7045.6393BC58@in.tum.de>
Date: Tue, 22 May 2001 15:57:25 +0200
From: David Vidal Rodriguez <vidalrod@informatik.tu-muenchen.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Problems: reiserfs lvm as /
References: <01051916333601.00791@mama> <3B069CF2.7AAC10DD@ednet.ns.ca> <01051919153100.01524@mama> <01052009011700.00553@mama>
Content-Transfer-Encoding: 7bit
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

> Could anybody tell me which Options are Required
> for Initial Ram Disk (initrd) support ??
>

well,
RAM disk support = y
Initrd = y
ramdisk_size = ....
<filesystem_of_initrd>-support = y

That would be enough....

--
  ------------------------------------------------------------------------
 David Vidal R. (vidalrod <at> in DOT tum DOT de)
