From: Alasdair G Kergon <agk@uk.sistina.com>
Subject: Re: [linux-lvm] LVM2 snapshot creation problem
Message-ID: <20030109000506.L28021@uk.sistina.com>
References: <3E1CB9E4.1030704@email.arizona.edu>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3E1CB9E4.1030704@email.arizona.edu>; from windhamg@email.arizona.edu on Wed, Jan 08, 2003 at 04:53:08PM -0700
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
Date: Wed Jan  8 18:04:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Jan 08, 2003 at 04:53:08PM -0700, Gary Windham wrote:
> My problem is that I have not been able to create LV snapshots under 
> LVM2.  Here's an example (command and output follow):

(Assuming you've checked that device-mapper snapshot support 
is compiled/loaded into the kernel)

Please turn on full debugging and look for the last few sets 
of lines starting with 'Adding target' and 'dm'.  [Lines
starting with other things are probably irrelevant here.]

Also check for kernel log messages from device-mapper 
(e.g. /var/log/whatever).

See example.conf for details of how to log to a file, or run
with -vvv flags.  If you prefer you could send us (dm@uk.sistina.com)
the whole (compressed) log file for the command and we'll take a 
look.

Alasdair
-- 
agk@uk.sistina.com
