From: =?iso-8859-1?q?M=E5ns_Rullg=E5rd?= <mru@users.sourceforge.net>
Message-ID: <yw1x7k4ww709.fsf@users.sourceforge.net>
References: <yw1xwucyty8b.fsf@users.sourceforge.net> <20030828132053.C14441@uk.sistina.com>
 <yw1xy8xdlin0.fsf@users.sourceforge.net>
 <20030828213519.D14441@uk.sistina.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Re: Recovering from disk failure
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
Date: Fri Aug 29 15:21:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@sistina.com

Alasdair G Kergon <agk@uk.sistina.com> writes:

> On Thu, Aug 28, 2003 at 08:52:19PM +0200, M?ns Rullg?rd wrote:
>> --partial option, it won't let me see them at all.  
> 
> Should do, if you create /dev/ioerror with dmsetup as a device
> bigger than the device you lost.

I figured it out, but thanks anyway.  It seems to work better make
/dev/ioerror return zeros.  That way I can make a copy of the
filesystem and fsck it.

-- 
M�ns Rullg�rd
mru@users.sf.net
