Content-Type: text/plain; charset="us-ascii"
From: Adrian Head <ahead@bigpond.net.au>
Subject: Re: [linux-lvm] Do I loose all my data if one disk crashes?
References: <3CD06BAB.7080905@uci.edu>
In-Reply-To: <3CD06BAB.7080905@uci.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <E1732j2-00059D-00@hermes.sistina.com>
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
Date: Wed May  1 17:38:02 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com, Dave Newman <newman@uci.edu>

On Thu, 2 May 2002 08:26, Dave Newman wrote:
> My question is: Do I loose all my data if any of the three disks
> crashes?  And if so, what can I do to improve the "restore-ability" of
> my configuration.

I have not read the LVM instructions so I'm unsure what config you have ended 
up with.

One thing to remember is that LVM does not implement RAID5 only RAID0 and 
linear.  Therefore, if a drive dies you will lose data.

To give the system a little extra survivability (yes you 
_still_need_backups_) you can have LVM ontop of a Linux software RAID5.  This 
will allow one drive to fail but the array will still be accessable.  Of 
course with this config you effectively lose one of your drives because of 
parity information.

-- 
Adrian Head

(Public Key available on request.)
