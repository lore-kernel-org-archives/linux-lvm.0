From: Cameron Hutchison <camh@xdna.net>
Subject: Re: [linux-lvm] restoring filesystem state using snapshot
Message-ID: <20040108233118.GA3279@imladris>
References: <BAY9-F24lkA9e8UVHod0001148a@hotmail.com> <200401082225.i08MPmp29862@ecstasy.winternet.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200401082225.i08MPmp29862@ecstasy.winternet.com>
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
Date: Fri Jan  9 09:57:02 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Once upon a time Ken Fuchs said...
> 
> >i want to restore the filesystem state using only the snapshot taken by LVM 
> >ie without taking a full backup.
> 
> Will copying the contents of the snapshot over the original logical
> volume do what you want?  If so, this can be done as follows:
> 
> # mount /dev/vg/snapshot /snap
> # mount /dev/vg/original /orig
> # (cd /snap; tar cf - .) | (cd /orig; tar xvf -)

rsync would probably be a better option - it will copy far less and will
remove any files added after the snapshot was taken (if invoked
appropriately). /orig should end up as a replica of /snap.
