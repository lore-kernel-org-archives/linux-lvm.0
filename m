From: jon+lvm@silicide.dk
Subject: Re: [linux-lvm] Mounting one physical disk over network (nfs?)
Message-ID: <20030311073654.GA14278@gw.silicide.dk>
References: <1882079468.20030311000434@tnonline.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1882079468.20030311000434@tnonline.net>
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
Date: Tue Mar 11 01:38:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Mar 11, 2003 at 12:04:34AM +0100, Anders Widman wrote:
> 
>    Is it possible to mount a physical disk with LVM over NFS or Samba?
> 
>    My current setup:
> 
>    10  disks of on LV in one VG. Would it be possible move one disk to
>    another computer and still be able to use it in this same LV/VG?
> 
>    I have been looking at the /etc/lvm/.cache, but it seems as this is
>    automatically generated.
> 
>    All I need is to be able to access the disk to be able to reduce it
>    from the LV/VG.

network block device ?
or loopback a file and use that in the lvm.


JonB
