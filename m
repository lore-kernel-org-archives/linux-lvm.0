From: Alasdair G Kergon <agk@uk.sistina.com>
Subject: Re: [linux-lvm] Snapshot creating problem
Message-ID: <20030317184624.A15374@uk.sistina.com>
References: <08628CA53C6CBA4ABAFB9E808A5214CB0142B4A2@mercury.infiniconsys.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <08628CA53C6CBA4ABAFB9E808A5214CB0142B4A2@mercury.infiniconsys.com>; from cbarry@infiniconsys.com on Mon, Mar 17, 2003 at 01:20:55PM -0500
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
Date: Mon Mar 17 12:47:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Mar 17, 2003 at 01:20:55PM -0500, Barry, Christopher wrote:
> Any ideas of what I'm doing wrong? An lvs shows it there, but it does not seem to appear in /dev/vg0/ and I cannot mount it.

You don't say what version you are using: see if you can reproduce
the problem using the current CVS LVM2 version.

Look in kernel message log for a (slightly) better error message.

Turn on debugging output (log to file) and see if the last set(s) 
of 'Adding target' lines before you got the error make sense.  

Assuming the problem is still present in CVS, if you'd like me
to look into it, I need a copy of the complete debugging output
and to know exactly which device-mapper patches you applied to 
your kernel.

Alasdair
-- 
agk@uk.sistina.com
