From: Alasdair G Kergon <agk@uk.sistina.com>
Subject: Re: [linux-lvm] Endless loop running vgscan
Message-ID: <20031229210910.Q21022@uk.sistina.com>
References: <3FE4DE2E.2030705@hasw.net> <20031221233848.M21022@uk.sistina.com> <3FE7483D.90107@hasw.net> <20031229144051.P21022@uk.sistina.com> <3FF05BB2.4070709@hasw.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3FF05BB2.4070709@hasw.net>; from se.witt@gmx.net on Mon, Dec 29, 2003 at 05:52:02PM +0100
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
Date: Mon Dec 29 15:10:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Dec 29, 2003 at 05:52:02PM +0100, Sebastian Witt wrote:
> I have no md's. My LVM VG consists of four PVs, hd[e-h]1.

If you send me (not the mailing list) the debug output file (truncated 
after it's started looping and then compress it) from vgscan I'll try to
see what's happening (later this week).
'pvs -v' output may also be useful.
[See WHATS_NEW file for how to edit lvm.conf to get a debug log file]
 
Alasdair
