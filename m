Date: Tue, 29 Aug 2000 19:58:37 +0200
From: Nils Juergens <nils@muon.de>
Subject: Re: [linux-lvm] Strange...
Message-ID: <20000829195837.A277@guldukat.muon>
References: <39AB63C5.C58D15F8@twc.de>
Mime-Version: 1.0
In-Reply-To: <39AB63C5.C58D15F8@twc.de>; from ulf@twc.de on Tue, Aug 29, 2000 at 09:18:29AM +0200
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

On Tue, 29.08.00, Ulf Bartelt <ulf@twc.de> wrote:
> (root@kira:/0)~# umount /home/ftp/install/
> (root@kira:/0)~# umount /home/ftp
> (root@kira:/0)~# e2fsadm -L+1G /dev/vgkira/ftp
> e2fsadm -- ERROR: "/dev/vgkira/ftp" is mounted on "/home/ftp2"
> e2fsadm -- please umount it to resize
> 

Have you tried using "lvextend" by hand? That should work.

In that case you might try ext2resize instead of resize2fs.
You don't even need to supply the exact size of the LV to ext2resize.
"ext2resize <devicename>" will automagically extend the filesystem to
the size of the LV.

cu,

Nils

-- 
 >   Nils Juergens  | nils@muon.de | icq 7090774   <
 >  If we all work hard, we can turn this company  <
 >      around 360 degrees -- gruntbert(LOTD)      <
