From: James Hawtin <oolon@ankh.org>
Subject: Re: [linux-lvm] using 160GB IDE drives under linux with LVM.
In-Reply-To: <wxx3d0d2czp.fsf@nommo.uio.no>
Message-Id: <Pine.LNX.4.10.10202072207550.12213-100000@pzat.meep.org>
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
Date: Thu Feb  7 16:14:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com


On 7 Feb 2002, Terje Kvernes wrote:

>   the box currently runs vanilla 2.4.16, only patched with LVM-1.0.1
>   from 26/11.  patches or anything people want to toss at this will be
>   highly appreciated.  we have two of these beasts from Maxtor, and
>   stand to loose about 60GiB of space, which isn't all that neat.
> 

Whats your Extent size? if its the default 4MB that allows you to address
256GB in that volume group.... Please do a vgdisplay -v

You only use that disk for linux? do you need it to be partitioned at all?
Do you want the whole of the disk to be available under LVM?  You could do
your pvcreate on the whole device that would get arround partition table
addressing problems.

James
