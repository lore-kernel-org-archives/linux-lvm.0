Message-ID: <3DE8D816.E84D4D82@adelphia.net>
From: toby <tkb9@adelphia.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] lvcreate distributed extent option
References: <615A249B783CD41192F400D0B747AC860898265A@hesse.bbn.hp.com>
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
Date: Sat Nov 30 09:24:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

"ZECHA,HOLGER (HP-Germany,ex1)" wrote:
> 
> Hello,
> 
> what do you mean with
> > How about striping with the strip size equal to that of a logical extent?
> 
> Can you give an example for the lvcreate command.
> 
> The reason to do this is to distribute the disk I/O accross all disks. the
> logical extent 1 is on disk1, logical extent 2 on disk 2 and so on.
> This means during read of logical extent 1, the heade of the second disk can
> already be moved to prepare to read logical extent 2.
> 
> This allows us to do more I/O's per second
> 
> Holger
> 


Once you create a striped lv, you cannot extend it by adding more disks. Current
lvm version anyway.

I wanted mine to be more flexible, so I first made a software raid set then made
the pv on top of the raid. That was in Jan this year. Last week I doubled the
size by adding another software raid set. I expanded two of the ext3 formatted
lvs in the process.

Perhaps not the fastest system in terms of throughput, but quite convenient to
resize.


-tkb
