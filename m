Message-ID: <3D6DEFC8.1050807@dotcom.pl>
From: myciel <myciel@dotcom.pl>
MIME-Version: 1.0
Subject: Re: [linux-lvm] mounting reiserfs snaphost fails
References: <3D6DD029.1010905@dotcom.pl> <3D6DE08B.97898D5D@silicide.dk>
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
Date: Thu Aug 29 04:57:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Jon Bendtsen wrote:

> 
> Did you unmount before taking the snapshot ??
> I found that i had to unmount before doing a snapshot. I'm using EXT3
> though,
> but both are journaling filesystems. I havent tried an ext2 one.
> 
> 
> JonB
> 


You mean unmount original filesystem? but why should I need snapshots
if I could unmount filesystem?

Anyway, now I've found that I can mount reiserfs snapshot
if it was first snapshot created after system boot.


rafal
