Received: from homer.msp.redhat.com (homer.msp.redhat.com [172.16.30.9])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i2QMY4j03070
	for <linux-lvm@redhat.com>; Fri, 26 Mar 2004 17:34:04 -0500
Received: (from agk@localhost)
	by homer.msp.redhat.com (8.11.6/8.11.6) id i2QMY3131446
	for linux-lvm@redhat.com; Fri, 26 Mar 2004 16:34:03 -0600
Date: Fri, 26 Mar 2004 16:34:03 -0600
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] LVM2 scalability within volume group
Message-ID: <20040326163403.F17377@homer.msp.redhat.com>
References: <20040317173637.GA2126@osdl.org>
	<20040317120005.C31599@homer.msp.redhat.com>
	<20040322224145.GA26571@osdl.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20040322224145.GA26571@osdl.org>;
	from dmo@osdl.org on Mon, Mar 22, 2004 at 02:41:45PM -0800
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Mon, Mar 22, 2004 at 02:41:45PM -0800, Dave Olien wrote:
> While this is a big improvement, 15 second still seems a long time
> for adding that 200th PV.  Likewise 29 seconds to activate the VG
> is much better.  But can these be made faster?

Yes, I've a list of performance enhancements waiting to be made - they
aren't top priority yet though.
 
> Can these user-level commands be made smarter in this regard?

Yes.  
  (a) Additional internal state can be written to the cache file.
      [The index of which PVs are in which VGs; the index of which
       UUIDs were found on which devices.]
  (b) Some disk reads are still duplicated and can be cached safely.

> Is this something that using the lvm(8) shell would help?  

Yes, this is equivalent to point (a).
Either pipe the commands through it, or try linking against
the library I checked into CVS today.  
(configure --enable-cmdlib;  brief docn in lvm2cmd.h)

Quick example prog below.

Alasdair



#include "lvm2cmd.h"
 
/* All output gets passed to this function line-by-line */
void test_log_fn(int level, const char *file, int line, const char *format)
{
	/* Extract and process output here instead of printing it */

        if (level != 4)
                return;
 
        printf("%s\n", format);
        return;
}
 
int main(int argc, char **argv)
{
        void *handle;
        int r;
 
        lvm2_log_fn(test_log_fn);
 
        handle = lvm2_init();
 
        lvm2_log_level(handle, 1);
        r = lvm2_run(handle, "vgs --noheadings vg1");

	/* More commands here */
 
        lvm2_exit(handle);
 
        return r;
}
 
