From: Alasdair G Kergon <agk@uk.sistina.com>
Subject: Re: [linux-lvm] LV Larger than DIsk?
Message-ID: <20021118213141.A6695@uk.sistina.com>
References: <1037638130.15261.5.camel@UberGeek>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1037638130.15261.5.camel@UberGeek>; from austin@coremetrics.com on Mon, Nov 18, 2002 at 10:48:51AM -0600
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
Date: Mon Nov 18 15:32:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Nov 18, 2002 at 10:48:51AM -0600, Austin Gonyou wrote:
> After compiling lvm2 tools, vgscan runs fine, but then vgchange -ay only
> activates 2 of the 5 lv's. I get an error that the LV is too large for
> the allocated PE. 

So I can investigate this, please quote the *specific* output you are
seeing when you get the error.  Also the version numbers e.g. type:
  lvm version
Please maybe also retry with Beta4 released today and see whether or
not the problem is still there.
 
> I've got 2 PVs, one with 3 partitions, then the rest part of the
> /dev/Data volume, and another disk I just added that I simply did
> lvextend to one of the LV's I wanted to increase the size of.

Please also send a copy of the relevant metadata backup/archive files
under /etc/lvm - one from the backup directory (or by running
vgcfgbackup) showing the current metadata, and one from the archive
directory showing the metadata before you made any changes to it.

[You can send these to me directly or post a URL, if you prefer not
to send them to everyone on the list.]
 
Alasdair
-- 
agk@uk.sistina.com
