Return-Path: <bartjan@vrielink.net>
Date: Tue, 8 May 2001 20:16:18 +0200 (CEST)
From: Bart-Jan Vrielink <bartjan@vrielink.net>
Subject: Re: [linux-lvm] SCSI/LVM problems after power outage
In-Reply-To: <20010508185954.M5048@hal.mailgate.net>
Message-ID: <Pine.LNX.4.21.0105082011330.1024-100000@vrielink>
MIME-Version: 1.0
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
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com
Cc: Dave Wapstra <dave@xs4all.nl>

On Tue, 8 May 2001, Hugo Lombard wrote:

> On Tue, May 08, 2001 at 06:33:26PM +0200, Dave Wapstra wrote:
> > Hi all,
> > 
> > After a power outage, our ftp server with LVM has not survived very well.
> > 
> > System: UltraSparc II, Linux 2.4(2) + io.path + LVM 0.9.1beta6
> > 
> > All normal ext2 paritions were fsck'd fine, however, the volume is having problems.
> > 
> > The syslog has a lot of SCSI errors:
> > 
> > May  7 19:15:53 ftp kernel: SCSI disk error : host 2 channel 0 id 2 lun 0 return code = 18000002
> 
> second controlelr, id 2..?  you have such a disk?
> 
> > May  7 19:15:53 ftp kernel:  I/O error: dev 08:20, sector 2239227
> 
> $ ls -l /dev/sdb4
> brw-rw----    1 root     disk       8,  20 May  5  1998 /dev/sdb4
> 
> seems to be the culprit, IMHO.

As far as I know kernel messages like these always show the device numbers
in hex. hex 08:20 is major 8, minor 32, so it's /dev/sdc, not /dev/sdb4.

-- 
Tot ziens,

Bart-Jan
