Message-ID: <3EE85615.1090007@maintech.de>
From: Thomas Kleffel <thomas.kleffel@maintech.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] How to grow a PV?
References: <3EE83C19.10805@maintech.de>
In-Reply-To: <3EE83C19.10805@maintech.de>
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
Date: Thu Jun 12 05:31:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Hi again,

after a bit of research I found out, that I resized my PV some time ago 
using the pvresize command, that was available in lvm_1.1-rc2.
At the moment I am using 1.0.7 (gentoo). My problem is now that 
lvm_1.1-rc2 seems to have disappeared. I read that it was buggy, but 
worked for me at least 4 times.
Could someone please tell me, where I could get lvm_1.1?  This would 
save me a lot of work.

Thanks in advance,

Thomas Kleffel


I wrote:

> Hi!
>
> I am running LVM1 ontop of  software-RAID (md). I just added a disk to 
> my raid, so my /dev/md0 is about 120G bigger now.
>
> Now my question is: How can I tell LVM to include these additional 
> space into the PV that's already there (on /dev/md0)?
>
> I  know it has to be possible because I did it several times (my raid 
> has 9 disks now - it hat 4 disks, some time ago) - I just can't 
> rememer :(((
> Could someone please give me a hint?
