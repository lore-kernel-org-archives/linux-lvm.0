Message-ID: <3F660218.5080604@free.fr>
From: Emmanuel Varagnat <emmanuel.varagnat@free.fr>
MIME-Version: 1.0
Subject: Re: [linux-lvm] lvm and a dead disk
References: <16228.26968.804811.803799@gargle.gargle.HOWL>
In-Reply-To: <16228.26968.804811.803799@gargle.gargle.HOWL>
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
Date: Mon Sep 15 13:18:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Peter wrote:

> Hello,
> 
> using lvm under Debian woody with packages 
> lvm-common v1.5.5 and lvm10 v1.04-5 and linux 2.4.21 I once had a
> volume group vg0 with three physical volumes:
> 
> /dev/scsi/host0/bus0/target5/lun0/part1
> /dev/scsi/host0/bus0/target3/lun0/part1
> /dev/scsi/host0/bus0/target4/lun0/part6
> 
> Unfortunately the first disk failed, but while Linux was still up I
> could still access some of the files.  That obviously changed after I
> rebooted the system as the first disk was hopelessly broken and vg0
> could no longer be activated.

If your filesystem was Ext2 you give a try to e2retrieve: 
http://coredump.free.fr/linux/e2retrieve.php

Good luke.

-=( manu )=-
