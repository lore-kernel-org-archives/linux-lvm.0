From: Wolfgang Weisselberg <weissel@netcologne.de>
Subject: Re: [linux-lvm] EXT2 to EXT3 LVM volume on Redhat
Message-ID: <20020605020412.GF19844@tiger.bigcats.invalid>
References: <006001c20c05$0a41cf10$0300000a@STATION>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <006001c20c05$0a41cf10$0300000a@STATION>
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
Date: Tue Jun  4 21:04:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi, Aslak!

Aslak Sommerfelt Skretting (aslak@skretting.org) wrote 51 lines:

> would disable the fsck's that occur now and then (and takes an insane amount
> of time on a 650gb filesystem), and are no longer necessary since the
> filesystem is EXT3.

Well, no.  Journalling can not even check for errors and
problems due to: 
- program errors in 
  - ext2/ext3 
  - the buffer cache
  - the VFS
- cable problems and connection problems
- harddisk firmware problems 
- the harddisk firmware reordering data without being allowed
  or returning 'OK, all data written' without that being true
- harddisk physical errors/marginal harddisk
- headcrashes
- controller hardware troubles
- controller firmware troubles
- marginal power block, brownouts, spikes, interference
- main memory corruption (you don't have ECC RAM, do you?  And
  even that will not protect you against all multibit errors),
  maybe due to cosmic rays or other radiation, marginal power,
  marginal chips, bad luck, unwise chosen parameters for memory
  refreshes (blame the BIOS!) ...
- Data corruption on the printed board circuit track, inside
  the CPU, in the 1st/2nd/3rd level cache, etc, due to bad
  luck/heat/marginal hardware/powerspikes, interferences,
  whatever.

Journalling only helps against "not cleanly umounting your
partitions forces a *long* fsck", because it guarantees (modulo
hardware/firmware errors and software bugs) that it can return
the metadata (and in some cases, the data) to a known good status
-- which is all that fsck does.

You really want backups.  Neither Journalling nor Raid will
protect you against program errors, nor human errors.  Slip of
finger with rm, typo like "... > important_file", the wrong mouse
click -- you surely can think of more.

-Wolfgang
