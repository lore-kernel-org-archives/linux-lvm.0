Message-ID: <3D91674F.3040601@free.fr>
From: Emmanuel Varagnat <emmanuel.varagnat@free.fr>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Disk crash , LVM and ext2... (bis)
References: <3D90EBDA.5070605@free.fr> <20020925071843.GI1291@tykepenguin.com>
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
Date: Wed Sep 25 02:43:09 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Patrick Caulfield wrote:
>
> LVM1 can't retrieve data from a VG with a crashed PV (That's what your backups
> are for).
> 
> LVM2 can if you active the VG with the -P (--partial) flag. LVM2 can read LVM2
> metadata.

This system was on a Slackware 8.0, with a 2.4.18 kernel and LVM 
compiled by myself (can't remember the version).

I'm gonna take a look a this.
Thanks.


-=( manu )=-
