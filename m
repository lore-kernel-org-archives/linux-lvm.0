Subject: Re: [linux-lvm] determining lv from mount point 
In-Reply-To: Your message of "Tue, 23 Sep 2003 16:20:41 EDT."
             <2D4B6CD74137D4119A1100104BC6BCBF0BC585C9@dubntex006.qwest.net> 
From: Galen Seitz <galens@seitzassoc.com>
Message-Id: <20030923203707.4AD088F03@tinman.seitzassoc.com>
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
Date: Tue Sep 23 15:38:02 2003
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Montgomery, Kendal L <kendal.montgomery@qwest.com> wrote:

> The df command will already do that.  For instance, on my machine, if I do:
> 
> [klmontg@klmontg klmontg]$ df /opt
> Filesystem           1K-blocks      Used Available Use% Mounted on
> /dev/vg01/opt          4194172   1610880   2583292  39% /opt
> 
> It gives me the filesystem, etc.

Unfortunately, this doesn't help when trying to distinguish between
regular and lvm filesystems.  On my system, / and /boot are on regular
partitions.

bash-2.05b$ df /boot
Filesystem           1K-blocks      Used Available Use% Mounted on
/dev/sda1                99134     13828     80187  15% /boot
bash-2.05b$ df /usr
Filesystem           1K-blocks      Used Available Use% Mounted on
/dev/Volume00/LV_usr   4031680   2151280   1675600  57% /usr

I'd like to distinguish between these two without hardcoding knowledge
of device or volume names into my script.  One thing I have considered
is doing an ls -l on the device name and checking for the lvm major.
Of course, then I would have to hardcode the lvm major into my script.
I just figured someone must have a better way to do this.

thanks,
galen
