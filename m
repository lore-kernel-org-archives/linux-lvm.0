Message-ID: <2691.24.123.20.245.1052430913.squirrel@www.randyperkins.com>
Subject: Re: [linux-lvm] hard drive crash info please
From: "Randy Perkins" <randyperkins@randyperkins.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Date: Thu May  8 16:54:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

> hi
>
> you need lvm2 to  activate a partial volume group. if you have a
> backup  of your vgcfg  then you may restore your config to a new
> harddisk with  the lvm1 tools.
> i had no actual vgcfgbackup so i needed to upgrade to lvm2 to activate
>  the partial vg and make a backup of all partitions that were not
> affected by the crashed harddisk. then i used the vgcfgbackup on the
> partial vg and edited the meadata from the backup (lvm2 saves the
> backup
>  data in human readable form) that all missing segments are put on the
>
> replacement disc. after i restored the backup everything worked again
> and i lost only the data which was on the bad disk.

hello
thanks for your reply
I am going to reread the how-to and man pages so i can
get refreshed on what i am doing.

Is the vgcfg the file that is located in /etc/lvmconf/my_vg.conf ??
If this file is the vgcfg, how current does it need to be ??

at this point you guys have given me hope that i can restore
at least some of my data, and the good news is that the files
I really need are the smaller files.

thanks again
randy
