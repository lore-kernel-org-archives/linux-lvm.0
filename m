Return-Path: <dice@mfa.kfki.hu>
Date: Sat, 28 Apr 2001 11:40:26 +0200 (CEST)
From: Gergely Tamas <dice@mfa.kfki.hu>
Subject: Re: [linux-lvm] LVM 0.9.1beta7 and 2.4.4 (get_hardblocksize removed)
In-Reply-To: <002501c0cfc5$e5ab7560$56dc10c3@tal.org>
Message-ID: <Pine.LNX.4.32.0104281139480.21920-100000@falka.mfa.kfki.hu>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kaj-Michael Lang <milang@tal.org>
Cc: linux-lvm@sistina.com

Hi!

I've posted a patch a few minutes ago.

It fixes this issue.

Gergely

On Sat, 28 Apr 2001, Kaj-Michael Lang wrote:

> Looks like the function:
> get_hardblocksize(kdev_t dev)
>
> has been removed in 2.4.4. And LVM uses it in two places.
> Can someone fix it ?
