From: Alasdair G Kergon <agk@uk.sistina.com>
Subject: Re: [linux-lvm] Snapshot creating problem
Message-ID: <20030317192234.B15374@uk.sistina.com>
References: <08628CA53C6CBA4ABAFB9E808A5214CB0142B4A9@mercury.infiniconsys.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <08628CA53C6CBA4ABAFB9E808A5214CB0142B4A9@mercury.infiniconsys.com>; from cbarry@infiniconsys.com on Mon, Mar 17, 2003 at 02:00:36PM -0500
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
Date: Mon Mar 17 13:23:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Mar 17, 2003 at 02:00:36PM -0500, Barry, Christopher wrote:
> Mar 17 12:47:16 debian kernel: device-mapper: internal error adding target to table

That's a (known) misleading error message - it's no longer necessarily
an error internal to the kernel, but can be caused by invalid 
parameters being supplied to a device-mapper target.

> To give you more info I need some instructions on how to get you the debug output.
See previous messages on this list, WHATS_NEW file, example.conf, 
lvm.conf man page etc.

e.g. Use a config file containing:

  log {
        file='/tmp/lvm2.log'
        level=7
        overwrite=0
  }

And remember to say exactly which kernel patches you applied.
[The device-mapper version number is not sufficient because 
people have produced patches that don't update it.]

For example, a set of patches before Xmas had a bug that is 
known to stop all snapshots from working.
To see if you have that logic bug, check dm-snapshot.c
a little after line 400 - it should have:
  if (persistent != 'P' && persistent != 'N') {
                        ^^
        ti->error = "Persistent flag is not P or N";

Alasdair
-- 
agk@uk.sistina.com
