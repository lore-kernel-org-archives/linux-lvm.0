From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Sharing Logical Volumes via NFS on Redhat 8.0
Message-ID: <20030218082739.GE26590@percy.comedia.it>
References: <F42fiyTqv4jvQUMRlap0003beef@hotmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <F42fiyTqv4jvQUMRlap0003beef@hotmail.com>
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
Date: Tue Feb 18 02:28:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Feb 18, 2003 at 03:04:48AM +0000, DJ TweeQ wrote:
>(repost):
>
>Regarding Sharing LVM LV's via NFS on Redhat 8.0...ie. mounting an LV from 
>another machine while already having a LV on the same machine. Is it ok or 
>not ok? I was talking to a buddy and he doesn't think it's a problem or an 
>issue but...

you are making a lot of confusion.
with nfs/samba you share a filesystem regardless of where it is located.
(i consider 'share' to be a horrible term for exporting/mounting a
remote filesystem)

yes you can do that.

>the current documentation on Sistina's site states that sharing LV's is 
>dangerous unless it's a SCSI or Fibre Storage Device?...and not only that 
>...adminisitration can only be done on one node? (is it really possible to 
>create/resize lv's from one node/machine to another (that has an LV or was 
>it meant to mean that it's only possible on cluster aware network storage 
>devices)??? ....

that part does not refer to nfs/samba it says that if you want to
connect two different computers to the same hard disk .....

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
