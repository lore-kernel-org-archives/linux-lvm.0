From: neuron <neuron@hollowtube.mine.nu>
Subject: Re: [linux-lvm] Performance problem.
Message-Id: <20031117191324.2047dbf3.neuron@hollowtube.mine.nu>
In-Reply-To: <3252989968.20031117183528@tnonline.net>
References: <3FB8F8A1.1060004@clin.ucl.ac.be>
	<1069087854.2408.0.camel@localhost.localdomain>
	<20031117181007.00e15a29.neuron@hollowtube.mine.nu>
	<3252989968.20031117183528@tnonline.net>
Mime-Version: 1.0
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
Date: Mon Nov 17 12:15:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

>      Actually.  SMB  never gives optimal transfer speeds. On a HUB you
>      can  expect  not  much more than 6-7MB/S on a 100mbit connection.
>      With  a  Switch  you can get higher, up to 12.5MB/s over FTP (but
>      never with SMB due to protocol overhead etc).

yeah, I thought it was smb at first aswell, but I get the exact same speed over ftp.  And rm'ing a file (on ssh to the server) and playing a mp3 at the same time shouldn't make the mp3 skip 1-3 seconds should it?

And I've had a stable 11mb/sec out of smb before (tweaked).


> Also there is this tool called elvtune. It allowes you to "tune the I/O
> elevator per blockdevice queue basis". See the man pages.
> 
> You could try to lower the read latency for the affected devices (/dev/hda,
> /dev/hdb, etc.)

elvtune shows read_latency of 2048 and write_latency of 8192, that's already quite low isn't it?  If not, have any example values I can test with?

cat .config | grep -i tcq shows 
# CONFIG_BLK_DEV_IDE_TCQ is not set
should I manually set it and compile?  It's not in make_config.

also does anyone have a lvmcreate_initrd script for lvm2?

just did a bonnie++ test on the lvm volume.  Seems VERY slow doesen't it.

Version  1.03       ------Sequential Output------ --Sequential Input- --Random-
                    -Per Chr- --Block-- -Rewrite- -Per Chr- --Block-- --Seeks--
Machine        Size K/sec %CP K/sec %CP K/sec %CP K/sec %CP K/sec %CP  /sec %CP
hollowtube       1G  3787  93 26948  62 10841  14  5885  90 21274  17 175.3   1
                    ------Sequential Create------ --------Random Create--------
                    -Create-- --Read--- -Delete-- -Create-- --Read--- -Delete--
              files  /sec %CP  /sec %CP  /sec %CP  /sec %CP  /sec %CP  /sec %CP
                 16  4991  98 +++++ +++  4135  90  4613  91 +++++ +++  3912  89
hollowtube,1G,3787,93,26948,62,10841,14,5885,90,21274,17,175.3,1,16,4991,98,+++++,+++,4135,90,4613,91,+++++,+++,3912,89
