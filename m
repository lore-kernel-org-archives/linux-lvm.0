Return-Path: <urs@isnogud.escape.de>
Subject: Re: [linux-lvm] LVM and *bad* performance (no striping)
References: <Pine.LNX.4.33.0102261839460.5502-100000@duckman.distro.conectiva>
From: Urs Thuermann <urs@isnogud.escape.de>
Date: 27 Feb 2001 11:33:23 +0100
In-Reply-To: <Pine.LNX.4.33.0102261839460.5502-100000@duckman.distro.conectiva>; from Rik van Riel on Mon, 26 Feb 2001 18:41:37 -0300 (BRST)
Message-ID: <m2ae782z64.fsf@isnogud.escape.de>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Rik van Riel <riel@conectiva.com.br> writes:

> Maybe dd is reading in 512 byte blocks on /dev/sda5 and
> 4096 bytes on /dev/vg0/test ?

I've checked it.  The man page says if no bs is given, dd defaults to
512 bytes on any device.  I've also checked it with dd|wc.

The performance numbers I've observed seem to dependant on caching.


urs
