Return-Path: <joe@66bassett.freeserve.co.uk>
Date: Wed, 24 Jan 2001 14:18:16 +0000
From: Joe Thornber <joe@66bassett.freeserve.co.uk>
Subject: Re: [linux-lvm] vgextend segfaults
Message-ID: <20010124141816.A6587@66bassett.freeserve.co.uk>
References: <web-8135952@comned.com>
Mime-Version: 1.0
In-Reply-To: <web-8135952@comned.com>; from wim@comned.com on Wed, Jan 24, 2001 at 03:35:30PM +0100
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

On Wed, Jan 24, 2001 at 03:35:30PM +0100, wim bakker wrote:
> Hai,
> setup: RH7 with all updates applied
> kernel: 2.4.0 and 2.4.1-pre10
> LVM: tried 0.9, 0.9.1-beta1 and 0.9.1-beta2
> with fdisk I created 4 primary partitions on a testdrive all
> 8e.

Use beta2.

Are you patching and rebuilding the LVM kernel driver as well as building
the tools ?

- Joe
