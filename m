From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] kernel: zam-7001: io error in reiserfs_find_entry (2)
Message-Id: <20020111104922.GC1274@tykepenguin.com>
References: <23380.1010745737@joergli.cocolab.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <23380.1010745737@joergli.cocolab.de>
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
Date: Fri Jan 11 04:50:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Jan 11, 2002 at 11:42:17AM +0100, J?rgen Vollmer wrote:
> 
> Hi,
> 
> this is an addition to my previous mail.
> 
> after the problem occured, I tried to umount the snapshot:
> 
> 	joergli: umount -v /lvm-snapshot
> but I get only
> 	umount: /lvm-snapshot: device is busy
> 
> 	joergli: fuser -a -v /lvm-snapshot
> 	  USER        PID ACCESS COMMAND
> 	  /lvm-snapshot        root     kernel mount  /lvm-snapshot
> 
> So I'm not able to remove the snapshot. Any idea?

Yes, that's 'cos reiser has oopsed and left the filesystem open :-(

patrick
