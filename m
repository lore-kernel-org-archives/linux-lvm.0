From: Donald Gordon <don@dis.org.nz>
Subject: Re: [linux-lvm] pvcreate -- device "/dev/hdc" has a partition
 table: force check bypass?
Message-Id: <20030111143959.62a1ac3d.don@dis.org.nz>
In-Reply-To: <20030111135159.6f968ae6.don@dis.org.nz>
References: <20030111135159.6f968ae6.don@dis.org.nz>
Mime-Version: 1.0
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
Date: Fri Jan 10 19:39:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

On Sat, 11 Jan 2003 13:51:59 +1300 Donald Gordon <don@dis.org.nz> wrote:

> Hi
> 
> I'm trying to setup LVM, but have run into trouble:
> 
> unibus:~# blockdev --rereadpt /dev/hdc;dmesg|tail -n 1
>  /dev/ide/host0/bus1/target0/lun0: unknown partition table
> unibus:~# pvcreate /dev/hdc
> pvcreate -- device "/dev/hdc" has a partition table

I solved the problem by mounting devfs (it was compiled into my kernel,
but not used).  The wording about devfs in the LVM HOWTO could do with
some clarification :-)

don
