Return-Path: <jdomingo@internautas.org>
Date: Sun, 29 Apr 2001 20:22:33 +0000
From: =?us-ascii?Q?Jos=E9_Luis_Domingo_L=F3pez?= <jdomingo@internautas.org>
Subject: Re: [linux-lvm] lowest spec LVM run on ?
Message-ID: <20010429202233.A2856@dardhal.mired.net>
References: <5.0.2.1.0.20010429184602.00ac9e88@mail.hole.org>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5.0.2.1.0.20010429184602.00ac9e88@mail.hole.org>; from kirth@hole.org on Sun, Apr 29, 2001 at 06:47:48PM +0100
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
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@sistina.com

On Sunday, 29 April 2001, at 18:47:48 +0100,
Kirth wrote:

> Hi,
> 
> 	I'm just wondering whats the lowest spec machine that anyone has an LVM 
> running (stable) on ?
> 	The reason is, I have just built another one, but it's on a p100 with 
> 16megs of ram, I tried to reiserfs
>
I had similar problems with previous versions of LVM on a Pentium75 with
16 MB RAM. But, AFAIK, kernel crashes when using reiserfs and LVM don't
relate to machines with limited hardware.

I've been using LVM on the aforementioned hardware, with testing purposes,
and have seen no problems so far with ext2.

Greetings.

-- 
Jos� Luis Domingo L�pez
Linux Registered User #189436     Debian GNU/Linux Potato (P166 64 MB RAM)
 
jdomingo EN internautas PUNTO org  => � Spam ? Atente a las consecuencias
jdomingo AT internautas DOT   org  => Spam at your own risk
