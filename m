Return-Path: <Dominique.Larchey-Wendling@loria.fr>
Message-ID: <3AEF2F97.E70A8CA7@loria.fr>
Date: Tue, 01 May 2001 23:50:15 +0200
From: Dominique LARCHEY-WENDLING <Dominique.Larchey-Wendling@loria.fr>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM & high system load
References: <200105011618.KAA01133@lynx.turbolabs.com>
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

Andreas Dilger wrote:

> There is one other person that has reported very slow LVM performance.
> However, there is no obvious reason why they have performance issues,
> and others are unable to reproduce this problem.
> 
> Can you please try the following and report results:
> 
> time dd if=/dev/mmedia/music of=/dev/null bs=512
> time dd if=/dev/mmedia/music of=/dev/null bs=65536
> time dd if=/dev/hda1 of=/dev/null bs=512
> time dd if=/dev/hda1 of=/dev/null bs=65536

Here are the tests I have done ...  I use the command line

dd if=/dev/sda of=/dev/null bs=1k count=500k

to fill up the buffer cache before any timing measure.
I point out that /dev/mmedia/music resides on /dev/hda5

time dd if=/dev/mmedia/music of=/dev/null bs=512
count=200000               0m37.113s
time dd if=/dev/hda5 of=/dev/null bs=512
count=200000                       0m35.437s

Ok I am ridiculous ... this has nothing to do with LVM.
It has to do with DMA set off by default by linux 2.4.
This is the reason of poor IO perf. and CPU eating.
(as you might have understood, I usually do not use IDE drives)

After DMA is set on,

time dd if=/dev/mmedia/music of=/dev/null bs=512
count=200000               0m12.934s
time dd if=/dev/hda5 of=/dev/null bs=512
count=200000                       0m12.110s

Sorry for anoying you with my stupidity ...

Perhaps poor perf. for the other person is also DMA related ?-)

Thanks anyway

DL

-- 
Dominique Larchey
LORIA, Nancy, France
Tel. (Work) +33 (0) 3 83 59 20 13
