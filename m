Message-ID: <3D98D656.2070904@free.fr>
From: Emmanuel Varagnat <emmanuel.varagnat@free.fr>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Disk crash , LVM and ext2... (bis)
References: <3D90EBDA.5070605@free.fr> <20020925071843.GI1291@tykepenguin.com> <3D91674F.3040601@free.fr> <20020925075113.GK1291@tykepenguin.com>
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
Date: Mon Sep 30 17:55:04 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Patrick Caulfield wrote:
> Don't forget, you'll need the "device-mapper" kernel patches too. They work best
> with 2.4.19 kernels, there were VM problems with 2.4.18 ones.
> 

I played a bit with that, and it looks like when device-mapper can't 
access a zone it returns zeros.
What I did, is to create an LV over 4 or 5 partitions, format it, zeroed 
the first partition, do a 'vgscan -P' and try to read the block device 
(LV raw data).
I supposed that this is the device-mapper that hide the missing 
informations by returning zeros. Is there a way to know (via ioctl for 
example) that a data is not available ?
For my program, I need to know, what is readable and what is not readable.

I will also try evms, as E.Tews sugested.

Thanks

-=( manu )=-

PS: I do not have backup of my data because this is personal data (at 
home) and I thought it could be useful, as well as fun, to write this tool.
PPS: I first named this tool e2forensic, but my english isn't so good so 
could someone tell me if it make sense ?
PPPS: thank you for reading the message until there :o)
