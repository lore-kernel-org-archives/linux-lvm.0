Return-Path: <urs@isnogud.escape.de>
Subject: Re: [linux-lvm] Problem mounting ext2 fs on LVM
References: <m24rxg2lqi.fsf@isnogud.escape.de> <20010227070957.X1611@jadzia.josv.com>
From: Urs Thuermann <urs@isnogud.escape.de>
Date: 27 Feb 2001 17:14:03 +0100
In-Reply-To: <20010227070957.X1611@jadzia.josv.com>; from Jos Visser on Tue, 27 Feb 2001 07:09:57 -0800
Message-ID: <m21ysk2jec.fsf@isnogud.escape.de>
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

Jos Visser <josv@osp.nl> writes:

> I have experienced this problem too. It has got something to do with
> wrongly kept status in the LVM kernel module. If you unload/load
> lvm-mod, everything is back to normal.

I just wanted to follow up my own posting since I have also tried to
unload/load the module and found out it works again.  This might be a
problem however, if you have some essential file systems on LVM so you
can't unload the module.

Has that bug already been found and is it being fixed?


urs
