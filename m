From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] Sharing LVM's via NFS on Redhat 8.0
Message-ID: <20030221082208.GA1810@tykepenguin.com>
References: <F66Jmn8eeGbdBmM9SJL000066dc@hotmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <F66Jmn8eeGbdBmM9SJL000066dc@hotmail.com>
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
Date: Fri Feb 21 02:22:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Feb 18, 2003 at 12:27:49AM +0000, DJ TweeQ wrote:
> 
> Phone rings and i forget to complete my previous post :)
> 
> Regarding Sharing LVM LV's via NFS on Redhat 8.0...ie. mounting an LV from 
> another machine while already having a LV on the same machine. Is it ok or 
> not ok? I was talking to a buddy and he doesn't think it's a problem or an 
> issue but...
> 
> the current documentation on Sistina's site states that sharing LV's is 
> dangerous unless it's a SCSI or Fibre Storage Device?...and not only that 
> ...adminisitration can only be done on one node? (is it really possible to 
> create/resize lv's from one node/machine to another (that has an LV or was 
> it meant to mean that it's only possible on cluster aware network storage 
> devices)??? ....
> 

Sharing over NFS is fine. What you are doing with NFS is sharing the filesystem.
The dangerous behaviour mentioned is when you are sharing the actual block
device that is the LV. A subtle but very important distinction.

This is safe:

+----+   NFS   +---------+
|    |---------|  Box B  |
|boxA|         |         | 
+----+         +---------+ 
                    | SCSI/IDE/FC
                    |
		  ^^^^^^^
		  |disks|
		  |     |
		  |     |
		  |     |
		  ^^^^^^^
		  
		  
This is dangerous:

+----+         +----+
|    |         |    |
|boxA|         |boxB| 
+----+         +----+ 
      \	      / 
       ^^^^^^^
       |disks|
       |     |
       |     |
       |     |
       ^^^^^^^
  


patrick
