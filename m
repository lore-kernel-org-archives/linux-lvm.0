Message-ID: <4C750003.1090303@redhat.com>
Date: Wed, 25 Aug 2010 13:35:31 +0200
From: Milan Broz <mbroz@redhat.com>
MIME-Version: 1.0
References: <loom.20100825T121646-219@post.gmane.org>
In-Reply-To: <loom.20100825T121646-219@post.gmane.org>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Internal error: Maps lock
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Alexander Skwar <alexanders.mailinglists+nospam@gmail.com>

On 08/25/2010 12:21 PM, Alexander Skwar wrote:
> Hello again.
> 
> I'm now running into another problem:
> 
> + /sbin/lvm lvcreate --permission r --snapshot /dev/Sys/Home --name
> Home-Backup_Snapshot --extents 15%ORIGIN
>   Internal error: Maps lock 14004224 < unlock 14266368
>   Logical volume "Home-Backup_Snapshot" created
> 
> What does this "Internal error" mean? Did it actually cause any harm?

No, you can ignore it.

And update kernel to next minor release (2.6.35.3 in your case) which fixes it.

It is side effect of security fix in kernel, see this commit which fixed it
http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commit;h=d7824370e26325c881b665350ce64fb0a4fde24a

Milan
