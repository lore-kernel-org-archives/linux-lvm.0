Return-Path: <terjekv@ifi.uio.no>
Subject: Re: [linux-lvm] lowest spec LVM run on ?
References: <5.0.2.1.0.20010429184602.00ac9e88@mail.hole.org>
From: Terje Kvernes <terjekv@math.uio.no>
Date: 29 Apr 2001 21:10:23 +0200
In-Reply-To: Kirth's message of "Sun, 29 Apr 2001 18:47:48 +0100"
Message-ID: <wxxd79vldy8.fsf@thrir.ifi.uio.no>
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

Kirth <kirth@hole.org> writes:

> I'm just wondering whats the lowest spec machine that anyone has an
> LVM running (stable) on ? The reason is, I have just built another
> one, but it's on a p100 with 16megs of ram, I tried to reiserfs the
> drive but that crashed the kernel (still no idea why, same kernel as
> my p133 with 128megs... which works fine). I have made the fs just
> ext2 for now (this is all testing NOT live).

  I'm running LVM + reiserfs on a P90 (with the bug :) that has
  32MB worth of RAM. it works flawlessly. well, as flawlessly as stuff
  cna work with 2.4, updatedb and lack of RAM, but still. :)

-- 
Terje
